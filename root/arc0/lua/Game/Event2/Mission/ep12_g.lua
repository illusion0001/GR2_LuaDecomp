dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_trap_break = false
_puppet_crow = nil
_brain_crow = nil
_trap_hdl = nil
function Initialize()
  Player:setAttrTune(Player.kAttrTune_Jupiter)
  GameDatabase:set(ggd.GlobalSystemFlags__GaugeCoercion, true)
  Fn_sendEventComSb("statusChengeEp12", "aisle")
  Fn_sendEventComSb("requestHandle", "GimmickBg", "bg2_ciheavyarmor01"):setActive(false)
end
function Ingame()
  Fn_setCatWarp(false)
  repeat
    wait()
  until Fn_sendEventComSb("requestCrowSet")
  _puppet_crow = Fn_sendEventComSb("requestCrowPuppet")
  _brain_crow = Fn_sendEventComSb("requestCrowBrain")
  _brain_crow:setAbility(Supporter.Ability.Parallel.Jupiter, false)
  _brain_crow:setIdling(true)
  Fn_coercionPoseNomal()
  Fn_missionStart()
  Fn_kaiwaDemoView("ep12_00205k")
  Fn_sendEventComSb("closeShutter")
  waitSeconds(1)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_shutter_altar"):getWorldPos())
  Camera:lookTo(findGameObject2("Node", "locator2_shutter_altar"):getWorldPos(), 2, 2)
  waitSeconds(3)
  Player:setLookAtIk(false, 1, findGameObject2("Node", "locator2_shutter_altar"):getWorldPos())
  Fn_captionViewWait("ep12_02005")
  Fn_captionView("ep12_02006")
  waitSeconds(1.5)
  Fn_resetCoercionPose()
  Fn_userCtrlOn()
  Player:setStay(false)
  invokeTask(function()
    Fn_sendEventComSb("aisleMissionView")
  end)
  _trap_hdl = Fn_sendEventComSb("requestHandle", "GimmickBg", "bg2_trapfloor_rubble")
  invokeTask(function()
    _trap_hdl:setEventListener("judge", function(A0_0, A1_1, A2_2, A3_3)
      local L4_4
      L4_4 = print
      L4_4("judge:" .. A1_1 .. "=" .. damage)
      L4_4 = A3_3.getName
      L4_4 = L4_4(A3_3)
      if L4_4 ~= nil and L4_4 == "player" and _floor_sensor_in then
        print("  sender:" .. L4_4)
        if A1_1 == "secondary_damage" then
          return 2
        elseif Player:getAction() ~= Player.kAction_Float then
          return 2
        else
          return 1
        end
      end
      return 1
    end)
  end)
  repeat
    wait()
  until _trap_hdl:isBroken()
  _brain_crow:setIdling(false)
  Fn_userCtrlAllOff()
  Player:setAction(Player.kAction_GravFall, true)
  waitSeconds(0.3)
  Sound:playSE("pc1_018", 1, Fn_getPlayer())
  waitSeconds(3)
  Fn_kaiwaDemoView("ep12_00210k")
  waitSeconds(1)
  Player:setAction(Player.kAction_GravFall, false)
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_trapfloor_01_OnEnter(A0_5)
  print("\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159")
  _floor_sensor_in = true
end
function pccubesensor2_trapfloor_01_OnLeave(A0_6)
  print("\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129")
  _floor_sensor_in = false
end
function Finalize()
  local L0_7, L1_8
end
