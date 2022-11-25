dofile("/Game/Event2/Common/SuppoterCommon.lua")
_MARKER_WAIT_AFTER_MISSION_VIEW = 1.3
_CAPTION_WAIT_AFTER_MARKER = 2.5
_CAPTION_WAIT_AFTER_MISSION_VIEW = 3.8
_LOOKTO_RESET_DURATION = 2
_LOOKTO_DISABLESTICK_DURATION = 3
_GEM = {
  SMALL = 1,
  MIDDLE = 2,
  LARGE = 3,
  ENERGY = 4,
  VITAL = 5,
  SPECIAL = 6
}
_crowMotions = {
  idle_loop_00 = "cro01_idle_loop_00",
  stay_00 = "cro01_stay_00",
  stay_01 = "cro01_stay_01",
  throw_c = "cro01_throw_c_00"
}
typedef_CrowClass = {}
function typedef_CrowClass.new(A0_0)
  local L1_1
  L1_1 = Fn_loadSupporterEventMotion
  L1_1(A0_0, _crowMotions)
  L1_1 = {}
  L1_1.Puppet = A0_0
  L1_1.Brain = A0_0:getBrain()
  L1_1.MovePointTbl = {}
  function L1_1.warpToNode(A0_2, A1_3)
    local L2_4
    L2_4 = nil
    if type(A0_2) == "string" then
      L2_4 = findGameObject2("Node", A0_2)
    else
      L2_4 = A0_2
    end
    L1_1.Brain:warpToNode(L2_4, A1_3)
  end
  function L1_1.setWorldTransform(A0_5, A1_6, A2_7)
    if A2_7 == nil then
      if L1_1.Brain:isAir() == true then
        A2_7 = "idle_in_air_loop"
      else
        A2_7 = "idle_on_ground_loop"
      end
    end
    L1_1.Brain:warp(A0_5, A1_6, A2_7)
  end
  function L1_1.startWarpAction(A0_8)
    L1_1.Brain:startWarpAction(A0_8)
  end
  function L1_1.isWarpActionEnd()
    L1_1.Brain:isWarpActionEnd()
  end
  function L1_1.setIdling(A0_9)
    L1_1.Brain:setIdling(A0_9)
  end
  function L1_1.isIdling()
    return L1_1.Brain:isIdling()
  end
  function L1_1.playAnim(A0_10, A1_11, A2_12)
    L1_1.Brain:playAnim(A0_10, A1_11, A2_12)
  end
  function L1_1.isAnimEnd()
    return L1_1.Brain:isAnimEnd()
  end
  function L1_1.stopAnim(A0_13)
    L1_1.Brain:stopAnim(A0_13)
  end
  function L1_1.setMovePoints(A0_14)
    L1_1.Brain:setMovePoints(A0_14)
  end
  function L1_1.addMovePoint(A0_15, A1_16, A2_17)
    L1_1.Brain:addMovePoint(A0_15, A1_16, A2_17)
  end
  function L1_1.clearMovePoint()
    L1_1.Brain:clearMovePoint()
  end
  function L1_1.startMove()
    L1_1.Brain:startMovePoint()
  end
  function L1_1.isMoveEnd()
    return L1_1.Brain:isMovePointEnd()
  end
  function L1_1.setAbility(A0_18, A1_19)
    L1_1.Brain:setAbility(A0_18, A1_19)
  end
  function L1_1.setThreatObjectAttackType(A0_20)
    L1_1.Brain:setThreatObjectAttackType(A0_20)
  end
  function L1_1.setThreatObjectAttackParams(A0_21)
    L1_1.Brain:setThreatObjectAttackParams(A0_21)
  end
  function L1_1.setThreatObject(A0_22)
    return L1_1.Brain:setThreatObject(A0_22)
  end
  function L1_1.setThreatObjects(A0_23)
    return L1_1.Brain:setThreatObjects(A0_23)
  end
  function L1_1.clearThreatObject()
    L1_1.Brain:clearThreatObject()
  end
  function L1_1.getCurrentThreatObject()
    return L1_1.Brain:getCurrentThreatObject()
  end
  return L1_1
end
function waitSkyStable()
  repeat
    wait()
  until Area:isSkyStable()
end
function playerTurn(A0_24)
  local L1_25
  L1_25 = 0.5
  if A0_24 ~= nil then
    Player:setLookAtIk(true, L1_25, A0_24:getWorldPos())
    waitSeconds(L1_25)
    Player:setLookAtIk(false, L1_25, A0_24:getWorldPos())
  else
    Player:setLookAtIk(false, L1_25, Vector(0, 0, 0))
  end
end
function lookAtObject(A0_26, A1_27, A2_28)
  invokeTask(function()
    local L0_29, L1_30, L2_31
    L0_29 = {}
    L0_29.r_stick = true
    L0_29.l_stick = false
    L0_29.v_infinite = false
    L0_29.g_infinite = false
    L0_29.s_infinite = false
    L1_30 = Fn_lockPlayerAbility
    L2_31 = nil
    L1_30(L2_31, L0_29)
    L1_30 = Fn_lookAtObject
    L2_31 = A0_26
    L1_30 = L1_30(L2_31, 0)
    L2_31 = waitSeconds
    L2_31(A2_28)
    L2_31 = L1_30.abort
    L2_31(L1_30)
    L2_31 = {}
    L2_31.r_stick = true
    L2_31.l_stick = true
    L2_31.v_infinite = false
    L2_31.g_infinite = false
    L2_31.s_infinite = false
    Fn_unLockPlayerAbility(nil, L2_31)
  end)
  waitSeconds(A1_27)
end
function ep11GetObjHdlPosRot(A0_32, A1_33)
  local L2_34, L3_35, L4_36, L5_37, L6_38
  L2_34 = findGameObject2
  L3_35 = A0_32
  L4_36 = A1_33
  L2_34 = L2_34(L3_35, L4_36)
  L4_36 = L2_34
  L3_35 = L2_34.getWorldTransform
  L4_36 = L3_35(L4_36)
  L5_37 = L2_34
  L6_38 = L3_35
  return L5_37, L6_38, L4_36
end
function ep11GetLocatorPos(A0_39)
  return findGameObject2("Node", A0_39):getWorldPos()
end
function getNearPos(A0_40, A1_41)
  return Fn_getPlayerWorldPos() + NormalizeVector(A0_40:getWorldPos() - Fn_getPlayerWorldPos()) * A1_41
end
function createGem(A0_42, A1_43)
  local L2_44
  L2_44 = createGameObject2
  L2_44 = L2_44("Gem")
  L2_44:setGemModelNo(A1_43)
  L2_44:setWorldPos(A0_42)
  L2_44:setLifeTime(30)
  L2_44:setVisibleBlockHalfSize(150)
  Fn_findAreaHandle("ji_c_root"):appendChild(L2_44)
  L2_44:try_init()
  L2_44:waitForReady()
  L2_44:try_start()
end
function emergency_catwarp_start()
  local L0_45
  L0_45 = false
  if not Fn_getPlayer() then
    return
  end
  if Player:isEnableCheckInWall() == false then
    Player:setEnableCheckInWall(true)
  end
  return invokeTask(function()
    while true do
      if Player:isInWall() and L0_45 == false and HUD:faderAlpha() == 0 then
        L0_45 = true
        print("\227\130\129\227\130\138\232\190\188\227\129\191\227\130\146\230\164\156\229\135\186\227\129\151\227\129\159\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\151\227\129\190\227\129\153\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
        Fn_catWarp()
        L0_45 = false
      end
      wait()
    end
  end)
end
