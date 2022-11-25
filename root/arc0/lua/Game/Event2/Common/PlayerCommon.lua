import("PhotoMgr")
import("Player")
import("HUD")
import("Sound")
import("Area")
import("Time")
import("Camera")
import("DeltaTimer")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Table/PlayerAbilityTable.lua")
dofile("/Game/Event2/Common/SystemScriptCommon2.lua")
__catwarp = false
function Fn_getPlayer()
  return Player:getPuppet()
end
function Fn_loadPlayerMotion(A0_0)
  if Fn_getGameObject("father2") then
    Fn_getGameObject("father2"):sendEvent("_loadEventMotion", A0_0)
    while Fn_getGameObject("father2"):sendEvent("_isLoadEventMotion") do
      wait()
    end
  end
end
function Fn_playPlayerMotionWait(A0_1, A1_2, A2_3, A3_4)
  local L4_5, L5_6
  L4_5 = Fn_getGameObject
  L5_6 = "father2"
  L4_5 = L4_5(L5_6)
  if L4_5 then
    L5_6 = Player
    L5_6 = L5_6.isStayMode
    L5_6 = L5_6(L5_6)
    if L5_6 == false then
      print(" < plr com > \227\130\164\227\131\153\227\131\179\227\131\136\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\229\134\141\231\148\159\229\137\141\227\129\171\229\188\183\229\136\182\231\154\132\227\129\171stay\227\129\171\227\129\151\227\129\190\227\129\153")
      Player:setStay(true, true)
    end
    if L4_5:sendEvent("_playEventMotion", A0_1, A1_2, A2_3, A3_4) then
      repeat
        wait()
      until Player:getPuppet():isPoseAnimEnd()
    else
      print("\229\134\141\231\148\159\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159 : " .. A0_1)
    end
    if L5_6 == false then
      print(" < plr com > \227\130\164\227\131\153\227\131\179\227\131\136\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\229\134\141\231\148\159\227\129\140\231\181\130\227\130\143\227\129\163\227\129\159\227\129\174\227\129\167\229\188\183\229\136\182\231\154\132\227\129\171stay\227\129\171\227\129\151\227\129\159\227\129\174\227\130\146\232\167\163\233\153\164\227\129\151\227\129\190\227\129\153")
      Player:setStay(L5_6)
    end
  end
end
function Fn_playPlayerMotion(A0_7, A1_8, A2_9, A3_10)
  if Fn_getGameObject("father2") then
    Fn_getGameObject("father2"):sendEvent("_playEventMotion", A0_7, A1_8, A2_9, A3_10)
  end
end
function Fn_isPlayerMotionEnd(A0_11)
  if Fn_getGameObject("father2") then
    return Fn_getGameObject("father2"):sendEvent("_isPlayEventMotion", A0_11)
  end
  return false
end
function Fn_recoverEnergyFully()
  if Fn_getGameObject("father2") then
    Fn_getGameObject("father2"):sendEvent("_recoverEnergyFully")
  end
end
function Fn_resetPcPos(A0_12, A1_13)
  local L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20
  L2_14 = HUD
  L3_15 = L2_14
  L2_14 = L2_14.isPhotoMode
  L2_14 = L2_14(L3_15)
  if not L2_14 then
    L2_14 = HUD
    L3_15 = L2_14
    L2_14 = L2_14.isPhotoModePlayingAnim
    L2_14 = L2_14(L3_15)
  elseif L2_14 then
    L2_14 = HUD
    L3_15 = L2_14
    L2_14 = L2_14.setPhotoMode
    L4_16 = false
    L2_14(L3_15, L4_16)
  end
  L2_14 = PhotoMgr
  L3_15 = L2_14
  L2_14 = L2_14.DeleteAllItem
  L2_14(L3_15)
  L2_14 = nil
  L3_15 = A0_12
  L4_16 = type
  L5_17 = A0_12
  L4_16 = L4_16(L5_17)
  if L4_16 == "string" then
    L4_16 = findGameObject2
    L5_17 = "Node"
    L6_18 = A0_12
    L4_16 = L4_16(L5_17, L6_18)
    L2_14 = L4_16
  else
    L2_14 = A0_12
    if A0_12 then
      L5_17 = A0_12
      L4_16 = A0_12.getName
      L4_16 = L4_16(L5_17)
      L3_15 = L4_16
    end
  end
  if L2_14 ~= nil then
    L4_16 = Player
    L5_17 = L4_16
    L4_16 = L4_16.getPuppet
    L4_16 = L4_16(L5_17)
    L6_18 = L2_14
    L5_17 = L2_14.getWorldPos
    L5_17 = L5_17(L6_18)
    L7_19 = L4_16
    L6_18 = L4_16.getWorldPos
    L6_18 = L6_18(L7_19)
    L8_20 = L5_17
    L7_19 = L5_17.DistanceTo
    L7_19 = L7_19(L8_20, L6_18)
    if L7_19 > 30 then
      L7_19 = Area
      L8_20 = L7_19
      L7_19 = L7_19.setEnableLoading
      L7_19(L8_20, false)
    end
    L8_20 = L4_16
    L7_19 = L4_16.setCollidable
    L7_19(L8_20, false)
    L7_19 = print
    L8_20 = " < plr com > stop area"
    L7_19(L8_20)
    L7_19 = Time
    L8_20 = L7_19
    L7_19 = L7_19.setInGameDeltaSec
    L7_19(L8_20, 0)
    L7_19 = wait
    L7_19()
    L7_19 = Area
    L8_20 = L7_19
    L7_19 = L7_19.setAnimMoveDriftEnable
    L7_19(L8_20, false, false, false)
    L7_19 = GameDatabase
    L8_20 = L7_19
    L7_19 = L7_19.set
    L7_19(L8_20, ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, false)
    L8_20 = L2_14
    L7_19 = L2_14.setForceMove
    L7_19(L8_20)
    L7_19 = wait
    L7_19()
    L8_20 = L2_14
    L7_19 = L2_14.getWorldTransform
    L8_20 = L7_19(L8_20)
    if A1_13 == nil then
      Player:reset(Player.kReset_Standing, L7_19, L8_20)
    else
      Player:reset(A1_13, L7_19, L8_20)
    end
    wait()
    print(" < plr com > warp node > " .. tostring(L3_15))
    print(" < plr com > pc pos > " .. tostring(L7_19))
    print(" < plr com > pc rot > " .. tostring(L8_20))
    Area:setEnableLoading(true)
    L4_16:setCollidable(true)
    Time:resetInGameDeltaSec()
    wait()
    print(" < plr com > area loading...")
    _accessIndicatorBegin()
    while Area:isLoading() do
      wait()
    end
    _accessIndicatorEnd()
    print(" < plr com > area load finish!!")
    if GameDatabase:get(ggd.Debug__AreaDrift) == true and GameDatabase:get(ggd.GlobalSystemFlags__AreaDrift) == true then
      Area:setAnimMoveDriftEnable(true, true, true)
      GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, true)
      print(" < plr com > move area")
      wait()
    end
  elseif L3_15 then
    L4_16 = print
    L5_17 = " < plr com > Fn_resetPcPos\239\188\154"
    L6_18 = L3_15
    L7_19 = "\227\129\174\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
    L5_17 = L5_17 .. L6_18 .. L7_19
    L4_16(L5_17)
  else
    L4_16 = print
    L5_17 = " < plr com > Fn_resetPcPos\239\188\154\231\172\172\228\184\128\229\188\149\230\149\176\227\129\171\230\157\165\227\129\166\227\129\132\227\130\139\229\128\164\232\135\170\228\189\147\227\129\140nil\227\129\167\227\129\153"
    L4_16(L5_17)
  end
end
function Fn_setPcPosRot(A0_21, A1_22, A2_23)
  if HUD:isPhotoMode() or HUD:isPhotoModePlayingAnim() then
    HUD:setPhotoMode(false)
  end
  PhotoMgr:DeleteAllItem()
  Area:setAnimMoveDriftEnable(false, false, false)
  GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, false)
  Time:setInGameDeltaSec(0)
  wait()
  if A2_23 == nil then
    Player:reset(Player.kReset_Standing, A0_21, A1_22)
  else
    Player:reset(A2_23, A0_21, A1_22)
  end
  wait()
  Time:resetInGameDeltaSec()
  wait()
  if GameDatabase:get(ggd.Debug__AreaDrift) and GameDatabase:get(ggd.GlobalSystemFlags__AreaDrift) then
    Area:setAnimMoveDriftEnable(true, true, true)
    GameDatabase:set(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable, true)
  end
end
function Fn_getPcPosRot()
  return Player:getPuppet():getTransform()
end
function Fn_getPlayerWorldPos()
  return Player:getPuppet():getWorldPos()
end
function Fn_getPlayerWorldRot()
  return Player:getPuppet():getWorldRot()
end
function Fn_getPlayerWorldTransform()
  return Player:getPuppet():getWorldTransform()
end
function Fn_getDistanceToPlayer(A0_24)
  local L1_25, L2_26
  L1_25 = Player
  L2_26 = L1_25
  L1_25 = L1_25.getPuppet
  L1_25 = L1_25(L2_26)
  L2_26 = L1_25
  L1_25 = L1_25.getWorldPos
  L1_25 = L1_25(L2_26)
  L2_26 = L1_25
  if type(A0_24) == "string" then
    if findGameObject2("Node", A0_24) then
      L2_26 = findGameObject2("Node", A0_24):getWorldPos()
    end
  elseif type(A0_24) == "table" then
    L2_26 = A0_24
  elseif type(A0_24) == "userdata" then
    L2_26 = A0_24:getWorldPos()
  end
  return L1_25:DistanceTo(L2_26)
end
function Fn_getDistanceToPlayerXZ(A0_27)
  local L1_28, L2_29
  L1_28 = Player
  L2_29 = L1_28
  L1_28 = L1_28.getPuppet
  L1_28 = L1_28(L2_29)
  L2_29 = L1_28
  L1_28 = L1_28.getWorldPos
  L1_28 = L1_28(L2_29)
  L2_29 = L1_28
  if type(A0_27) == "string" then
    if findGameObject2("Node", A0_27) then
      L2_29 = findGameObject2("Node", A0_27):getWorldPos()
    end
  elseif type(A0_27) == "table" then
    L2_29 = A0_27
  elseif type(A0_27) == "userdata" then
    L2_29 = A0_27:getWorldPos()
  end
  L1_28.y = 0
  L2_29.y = 0
  return L1_28:DistanceTo(L2_29)
end
function Fn_appendToPlayer(A0_30, A1_31)
  Player:getPuppet():appendChild(A0_30, A1_31)
end
function Fn_appendToPlayerJoint(A0_32, A1_33, A2_34)
  Player:getPuppet():appendChildToJoint(A0_32, A1_33, A2_34)
end
function Fn_lockPlayerAbility(A0_35, A1_36)
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setPlayerOpt", false, nil, false)
    Fn_getGameObject("father2"):sendEvent("_lockPlayerAbility", A0_35, A1_36)
  end
end
function Fn_unLockPlayerAbility(A0_37, A1_38)
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setPlayerOpt", false, nil, false)
    Fn_getGameObject("father2"):sendEvent("_unLockPlayerAbility", A0_37, A1_38)
  end
end
function Fn_userCtrlOn()
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setPlayerOpt", false, true, false)
    Fn_getGameObject("father2"):sendEvent("_setPlayerAbility", true)
  end
end
function Fn_userCtrlOff(A0_39)
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setPlayerOpt", false, false, false)
    Fn_getGameObject("father2"):sendEvent("_setPlayerAbility", false, A0_39)
  end
end
function Fn_userCtrlOffTuto(A0_40)
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setPlayerOpt", false, false, true)
    Fn_getGameObject("father2"):sendEvent("_setPlayerAbility", false, A0_40)
  end
end
function Fn_userCtrlAllOff(A0_41)
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setPlayerOpt", true, nil, false)
    Fn_getGameObject("father2"):sendEvent("_setPlayerAbility", false, A0_41)
  end
end
function Fn_userCtrlGravityOff()
  Player:setControl(Player.kControl_All, true)
  Player:setAbility({
    Player.kAbility_Grab,
    Player.kAbility_Throw,
    Player.kAbility_GravityKick,
    Player.kAbility_Slider,
    Player.kAbility_GravityShift,
    Player.kAbility_SpAttack,
    Player.kAbility_AttrTuneSwitch
  }, false)
  if GameDatabase:get(ggd.GlobalSystemFlags__Gauge) then
    HUD:grgDispReq_FadeOut()
    HUD:spgDispReq_FadeOut()
  end
end
function Fn_setNoDamageMode(A0_42, A1_43)
  if Fn_getGameObject("father2") and father2:isRunning() then
    Fn_getGameObject("father2"):sendEvent("_setNoDamegeMode", A0_42, A1_43)
  end
end
function Fn_isNormalStyle()
  return Player:getAttrTune() == Player.kAttrTune_Normal
end
function Fn_isJupiterStyle()
  return Player:getAttrTune() == Player.kAttrTune_Jupiter
end
function Fn_isLunarStyle()
  return Player:getAttrTune() == Player.kAttrTune_Mars
end
function Fn_setCatWarp(A0_44)
  GameDatabase:set(ggd.Savedata__EventManageFlags__OutrangeLock, (not A0_44 or not true) and true)
end
function Fn_catWarpIn()
  local L0_45, L1_46, L2_47
  L0_45 = print
  L1_46 = " < plr com > \227\131\141\227\130\179\227\131\175\227\131\188\227\131\151 in"
  L0_45(L1_46)
  L0_45 = "cat_call"
  L1_46 = "cat_warp1"
  __catwarp = true
  L2_47 = GameDatabase
  L2_47 = L2_47.set
  L2_47(L2_47, ggd.GlobalSystemFlags__CatWarpRunning, true)
  L2_47 = GameDatabase
  L2_47 = L2_47.get
  L2_47 = L2_47(L2_47, ggd.Savedata__Player__Costume)
  if string.find(L2_47, "cro") then
    L0_45 = "xii_call"
    L1_46 = "xii_warp1"
  end
  Sound:pulse(L0_45)
  waitSeconds(0.4)
  Sound:pulse(L1_46)
  Sound:pulse("pc_blackhole_start")
  Player:setAction(Player.kAction_CatWarpIn)
  waitSeconds(0.6)
  HUD:blackout(1)
  while not HUD:faderStability() do
    wait()
  end
  __catwarpOut = false
end
function Fn_catWarpOut(A0_48, A1_49)
  local L2_50, L3_51
  L2_50 = print
  L3_51 = " < plr com > \227\131\141\227\130\179\227\131\175\227\131\188\227\131\151 out"
  L2_50(L3_51)
  if A1_49 then
    L2_50 = Player
    L3_51 = L2_50
    L2_50 = L2_50.setEnergy
    L2_50(L3_51, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity), true)
  end
  if A0_48 then
    L2_50 = Player
    L3_51 = L2_50
    L2_50 = L2_50.setEnergyInfinite
    L2_50(L3_51, Player.kEnergy_Gravity, true)
    L2_50 = GameDatabase
    L3_51 = L2_50
    L2_50 = L2_50.set
    L2_50(L3_51, ggd.GlobalSystemFlags__GravityGageWait, true)
  end
  L2_50 = HUD
  L3_51 = L2_50
  L2_50 = L2_50.fadein
  L2_50(L3_51, 1)
  L2_50 = waitSeconds
  L3_51 = 0.35
  L2_50(L3_51)
  if A0_48 then
    L2_50 = invokeTask
    function L3_51()
      waitSeconds(A0_48)
      Player:setEnergyInfinite(Player.kEnergy_Gravity, false)
      GameDatabase:set(ggd.GlobalSystemFlags__GravityGageWait, false)
    end
    L2_50(L3_51)
  end
  while true do
    L2_50 = Player
    L3_51 = L2_50
    L2_50 = L2_50.setAction
    L2_50 = L2_50(L3_51, Player.kAction_CatWarpOut)
    if L2_50 == false then
      L2_50 = wait
      L2_50()
    end
  end
  L2_50 = "cat_warp2"
  L3_51 = GameDatabase
  L3_51 = L3_51.get
  L3_51 = L3_51(L3_51, ggd.Savedata__Player__Costume)
  if string.find(L3_51, "cro") then
    L2_50 = "xii_warp2"
  end
  Sound:pulse(L2_50)
  Sound:pulse("pc_blackhole_start")
  __catwarp = false
  GameDatabase:set(ggd.GlobalSystemFlags__CatWarpRunning, false)
end
function _findCatWarpNode(A0_52)
  local L1_53, L2_54, L3_55
  L1_53 = findGameObject2
  L2_54 = "Node"
  L3_55 = A0_52
  L1_53 = L1_53(L2_54, L3_55)
  if L1_53 == nil then
    L2_54 = print
    L3_55 = " < plr com > "
    L3_55 = L3_55 .. g_own:getName() .. "\239\188\154" .. A0_52 .. "\227\129\174\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147"
    L2_54(L3_55)
    L2_54 = Fn_getGameObject
    L3_55 = "mother2"
    L2_54 = L2_54(L3_55)
    L3_55 = L2_54.findGameObject2
    L3_55 = L3_55(L2_54, "Sandbox2", GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName))
    if L3_55 ~= nil then
      L1_53 = L3_55:findGameObject2("Node", A0_52)
      print(" < plr com > " .. L3_55:getName() .. " \227\129\171\227\129\175 " .. A0_52 .. "\227\129\174\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147")
    else
      print(" < plr com > " .. tostring(GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName)) .. " \227\129\174\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\129\175\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147")
    end
    if L1_53 == nil then
      L3_55 = L2_54:findGameObject2("Sandbox2", GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentCommonSb))
      if L3_55 then
        L1_53 = L3_55:findGameObject2("Node", A0_52)
        print(" < plr com > " .. L3_55:getName() .. " \227\129\171\227\129\175 " .. A0_52 .. "\227\129\174\227\131\142\227\131\188\227\131\137\227\129\140\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147")
      else
        print(" < plr com > " .. tostring(GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentCommonSb)) .. " \227\129\174\227\130\181\227\131\179\227\131\137\227\131\156\227\131\131\227\130\175\227\130\185\227\129\175\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147")
      end
    end
    if L1_53 == nil then
      L1_53 = GameDatabase:get(ggd.Savedata__EventManageFlags__EventCheckPoint)
    end
    L2_54, L3_55 = nil, nil
  end
  return L1_53
end
function Fn_catWarpCheckPoint()
  local L0_56
  L0_56 = print
  L0_56(" < plr com > \227\131\141\227\130\179\227\131\175\227\131\188\227\131\151 player warp")
  L0_56 = GameDatabase
  L0_56 = L0_56.get
  L0_56 = L0_56(L0_56, ggd.Savedata__EventManageFlags__EventCheckPoint)
  if L0_56 == "None" or L0_56 == "" or L0_56 == nil then
    L0_56 = _findCatWarpNode(GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeCheckPoint))
  elseif GameDatabase:get(ggd.Savedata__EventManageFlags__OutrangeLock) == false then
    L0_56 = _findCatWarpNode(L0_56)
  end
  Fn_resetPcPos(L0_56)
  L0_56 = nil
end
function Fn_catWarp(A0_57, A1_58, A2_59)
  if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpRunning) then
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\184\173\227\129\171\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\130\146\230\164\156\231\159\165\227\129\151\227\129\159\227\129\159\227\130\129\227\130\132\227\130\129\227\129\190\227\129\153")
    return
  end
  print(" < plr com > ----------------------------------")
  print(" < plr com > \227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\233\150\139\229\167\139")
  if not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) and not GameDatabase:get(ggd.GlobalSystemFlags__GameOverFlow) then
    if GameDatabase:get(ggd.GlobalSystemFlags__CatWarpEnable) then
      if Player:getPuppet():getActive() then
        HUD:setUserControlLock(true)
        Fn_getGameObject("mother2"):sendEvent("requestEnemyManager", {target_select_off = true})
        Fn_userCtrlAllOff()
        Fn_catWarpIn()
        Fn_catWarpCheckPoint()
        if A2_59 then
          A2_59()
        end
        Fn_catWarpOut(A0_57, A1_58)
        while not HUD:faderStability() do
          wait()
        end
        wait(15)
        Fn_userCtrlOn()
        Fn_getGameObject("mother2"):sendEvent("requestEnemyManager", {target_select_on = true})
      else
        print(" < plr com > pc\227\129\174active \227\129\140 false \227\129\170\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
      end
    else
      print(" < plr com > GlobalSystemFlags__CatWarpEnable \227\129\140 false \227\129\170\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  else
    print(" < plr com > game over \227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
  end
  HUD:setUserControlLock(false)
  print(" < plr com > \227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\231\181\130\228\186\134")
  print(" < plr com > ----------------------------------")
end
function Fn_setCatWarpCheckPoint(A0_60)
  local L1_61
  L1_61 = A0_60
  if A0_60 == nil then
    L1_61 = "None"
  end
  GameDatabase:set(ggd.Savedata__EventManageFlags__EventCheckPoint, L1_61)
end
function Fn_getCatWarpCheckPoint()
  return GameDatabase:get(ggd.Savedata__EventManageFlags__EventCheckPoint)
end
function Fn_setCatActive(A0_62, A1_63)
  if Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2") and Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):isRunning() and Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat") then
    if A0_62 == false then
      if type(A1_63) == "table" then
        Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat"):setWorldPos(A1_63)
        Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat"):setForceMove()
      end
      Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat"):getBrain():reset()
    end
    Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat"):getBrain():setActive(A0_62)
    Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat"):setActive(A0_62)
    Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):sendEvent("_setCatActive", A0_62)
  end
end
function Fn_getCatPuppet()
  if Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2") and Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):isRunning() then
    return Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):findGameObject2("Puppet", "_puppet_supporter_cat")
  end
  return nil
end
function Fn_getCatBrain()
  local L0_64
  L0_64 = nil
  if Fn_getCatPuppet() ~= nil then
    L0_64 = Fn_getCatPuppet():getBrain()
  end
  return L0_64
end
function Fn_setXiiActive(A0_65, A1_66)
  if Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2") and Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):isRunning() then
    if A0_65 then
      if A1_66 then
        Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):sendEvent("warpXii", {
          x = A1_66.x,
          y = A1_66.y,
          z = A1_66.z
        })
      else
        Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):sendEvent("warpXii")
      end
    else
      Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):sendEvent("_termRaven")
    end
  end
end
function Fn_warpXii(A0_67, A1_68)
  if Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2") and Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):isRunning() then
    Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "father2"):sendEvent("warpXii", {
      x = A0_67.x,
      y = A0_67.y,
      z = A0_67.z
    }, {
      x = A1_68.x,
      y = A1_68.y,
      z = A1_68.z,
      w = A1_68.w
    })
  end
end
function Fn_setKittenActive(A0_69)
  Fn_getPlayer():setCollidable(A0_69)
  Player:getPuppet():setVisible(A0_69)
end
function Fn_setKittenAndCatActive(A0_70)
  Fn_setKittenActive(A0_70)
  Fn_setCatActive(A0_70)
end
function Fn_coercionPoseNomal()
  Player:setSituation(Player.kSituation_Normal, true, 0, false, false)
end
function Fn_coercionPoseBattle()
  Player:setSituation(Player.kSituation_InCombat, true, 0, false, false)
end
function Fn_resetCoercionPose()
  Player:setSituation(Player.kSituation_Normal, false, 6.25, true, true)
end
function Fn_coercionGravityRevert()
  return invokeTask(function()
    local L0_71
    L0_71 = Player
    L0_71 = L0_71.getAbility
    L0_71 = L0_71(L0_71, Player.kAbility_GravityRevert)
    Player:setAbility(Player.kAbility_GravityRevert, true)
    Player:setGravityControlMode(false)
    while Player:isGravityControlMode() do
      if Player:getAbility(Player.kAbility_GravityRevert) == false then
        Player:setAbility(Player.kAbility_GravityRevert, true)
      end
      Player:setGravityControlMode(false)
      wait()
    end
    Player:setAbility(Player.kAbility_GravityRevert, L0_71)
  end)
end
function Fn_coercionGravityShift()
  invokeTask(function()
    local L0_72
    L0_72 = Player
    L0_72 = L0_72.getAbility
    L0_72 = L0_72(L0_72, Player.kAbility_GravityShift)
    Player:setAbility(Player.kAbility_GravityShift, true)
    Player:setGravityControlMode(true)
    while not Player:isGravityControlMode() do
      if Player:getAbility(Player.kAbility_GravityShift) == false then
        Player:setAbility(Player.kAbility_GravityShift, true)
      end
      Player:setGravityControlMode(true)
      wait()
    end
    Player:setAbility(Player.kAbility_GravityShift, L0_72)
  end)
end
function Fn_isPlayerReyCheck(A0_73, A1_74)
  local L2_75, L3_76, L4_77, L5_78
  if A1_74 == nil then
    A1_74 = 30
  end
  L2_75 = Fn_getPcPosRot
  L3_76 = L2_75()
  L4_77 = L2_75.y
  L4_77 = L4_77 + 1.5
  L2_75.y = L4_77
  L4_77 = false
  L5_78 = Query
  L5_78 = L5_78.setEyeSightTransform
  L5_78(L5_78, L2_75, L3_76)
  L5_78 = Query
  L5_78 = L5_78.setEyeSightAngle
  L5_78(L5_78, Deg2Rad(360))
  L5_78 = Query
  L5_78 = L5_78.setEyeSightRange
  L5_78(L5_78, search_range)
  L5_78 = A0_73.getWorldPos
  L5_78 = L5_78(A0_73)
  if Query:raycastEyeSight(L5_78) == nil then
    L4_77 = true
  end
  return L4_77
end
function Fn_unlockPlayerLevelCap(A0_79)
  local L1_80
  L1_80 = ggd
  L1_80 = L1_80["Savedata__Player__LevelCap__" .. A0_79]
  if L1_80 then
    GameDatabase:set(L1_80, 99)
  end
end
function Fn_setFeline(A0_81, A1_82, A2_83, A3_84)
  Player:setFeline(A0_81, A1_82)
  if A2_83 ~= nil then
    Player:setEnergyInfinite(Player.kEnergy_FelineMP, A2_83)
  end
  if A3_84 ~= nil then
    if A3_84 then
      Fn_unLockPlayerAbility({
        Player.kAbility_FelineStart,
        Player.kAbility_FelineEnd
      })
    else
      Fn_lockPlayerAbility({
        Player.kAbility_FelineStart,
        Player.kAbility_FelineEnd
      })
    end
  end
end
function Fn_playerTurn(A0_85, A1_86, A2_87)
  local L3_88, L4_89
  if A0_85 ~= nil then
    L3_88 = 1
    if A2_87 ~= nil then
      L3_88 = A2_87
    end
    L4_89 = A0_85.getWorldPos
    L4_89 = L4_89(A0_85)
    if A1_86 ~= nil then
      L4_89.y = L4_89.y + A1_86
    end
    Player:setLookAtIk(true, L3_88, L4_89)
  end
end
function Fn_playerTurnEnd(A0_90)
  local L1_91, L3_92, L4_93, L5_94
  L1_91 = 1
  if A0_90 ~= nil then
    L1_91 = A0_90
  end
  L3_92 = Player
  L4_93 = L3_92
  L3_92 = L3_92.setLookAtIk
  L5_94 = false
  L3_92(L4_93, L5_94, L1_91, Vector(0, 0, 0))
end
function Fn_getAreaAnimMoveDriftEnable()
  local L0_95
  L0_95 = true
  if not Area:getMoveEnable() or not GameDatabase:get(ggd.GlobalSystemFlags__areaAnimMoveDriftEnable) then
    L0_95 = false
  end
  return L0_95
end
