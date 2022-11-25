import("common")
import("Sound")
import("HUD")
import("Player")
dofile("/Game/Misc/node_util.lua")
function debugPrintCom(A0_0)
  print(" [ com all ] " .. A0_0)
end
function Fn_getGameObject(A0_1)
  return g_own:getGameObject(A0_1)
end
function Fn_pcSensorOff(A0_2)
  if type(A0_2) == "string" then
    findGameObject2("PlayerSensor", A0_2):setActive(false)
    debugPrintCom(A0_2 .. "\227\130\146off\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_2:setActive(false)
    debugPrintCom(A0_2:getName() .. "\227\130\146off\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_pcSensorOn(A0_3)
  if type(A0_3) == "string" then
    findGameObject2("PlayerSensor", A0_3):setActive(true)
    debugPrintCom(A0_3 .. "\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_3:setActive(true)
    debugPrintCom(A0_3:getName() .. "\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_sensorOff(A0_4)
  if type(A0_4) == "string" then
    findGameObject2("Sensor", A0_4):setActive(false)
    debugPrintCom(A0_4 .. "\227\130\146off\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_4:setActive(false)
    debugPrintCom(A0_4:getName() .. "\227\130\146off\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_sensorOn(A0_5)
  if type(A0_5) == "string" then
    findGameObject2("Sensor", A0_5):setActive(true)
    debugPrintCom(A0_5 .. "\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_5:setActive(true)
    debugPrintCom(A0_5:getName() .. "\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_vctrlOff(A0_6)
  if type(A0_6) == "string" then
    findGameObject2("ViewControl", A0_6):setActive(false)
    debugPrintCom(A0_6 .. "\227\130\146off\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_6:setActive(false)
    debugPrintCom(A0_6:getName() .. "\227\130\146off\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_vctrlOn(A0_7)
  if type(A0_7) == "string" then
    findGameObject2("ViewControl", A0_7):setActive(true)
    debugPrintCom(A0_7 .. "\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  else
    A0_7:setActive(true)
    debugPrintCom(A0_7:getName() .. "\227\130\146on\227\129\171\227\129\151\227\129\190\227\129\151\227\129\159")
  end
end
function Fn_setBgmPoint(A0_8, A1_9, A2_10)
  local L3_11, L4_12
  L3_11 = Fn_getGameObject
  L4_12 = "soundManager"
  L3_11 = L3_11(L4_12)
  if L3_11 then
    L4_12 = event_name
    if A2_10 then
      L4_12 = A2_10
    end
    if L4_12 == nil then
      L4_12 = g_own:getName()
    end
    if A0_8 == "battle" then
      L3_11:sendEvent("request", L4_12, "battle", "battle")
    elseif A0_8 == "sdemo" then
      L3_11:sendEvent("request", L4_12, "sdemo", "sdemo")
    elseif A0_8 == "city_block" then
      L3_11:sendEvent("request", L4_12, "city_block", A1_9)
    elseif A0_8 == "event" then
      L3_11:sendEvent("request", L4_12, "event", A1_9)
    end
  end
end
function Fn_attachJoint(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18
  L5_18 = A0_13
  L4_17 = A0_13.leaveFromParent
  L4_17(L5_18, true)
  L5_18 = A1_14
  L4_17 = A1_14.getJointWorldTransform
  L5_18 = L4_17(L5_18, A2_15)
  if A3_16 ~= nil then
    A0_13:setIsolateFlags(nil, true)
    A0_13:setWorldTransform(L4_17)
  else
    A0_13:setWorldTransform(L4_17, L5_18)
  end
  A0_13:setForceMove()
  A1_14:appendChildToJoint(A0_13, A2_15, true)
end
function Fn_isEyeSight(A0_19)
  local L1_20, L2_21, L3_22, L4_23, L5_24, L6_25, L7_26, L8_27, L9_28, L10_29, L11_30
  if A0_19 then
    L1_20 = Vector
    L2_21 = 0
    L3_22 = 0
    L4_23 = 0
    L1_20 = L1_20(L2_21, L3_22, L4_23)
    L2_21 = Quaternion
    L3_22 = 0
    L4_23 = 0
    L5_24 = 0
    L6_25 = 1
    L2_21 = L2_21(L3_22, L4_23, L5_24, L6_25)
    L3_22 = Vector
    L4_23 = 0
    L5_24 = 0
    L6_25 = 0
    L3_22 = L3_22(L4_23, L5_24, L6_25)
    L4_23 = Quaternion
    L5_24 = 0
    L6_25 = 0
    L7_26 = 0
    L8_27 = 1
    L4_23 = L4_23(L5_24, L6_25, L7_26, L8_27)
    L5_24 = A0_19.base_ofs
    if not L5_24 then
      L5_24 = Vector
      L6_25 = 0
      L7_26 = 0
      L8_27 = 0
      L5_24 = L5_24(L6_25, L7_26, L8_27)
    end
    L6_25 = A0_19.target_ofs
    if not L6_25 then
      L6_25 = Vector
      L7_26 = 0
      L8_27 = 0
      L9_28 = 0
      L6_25 = L6_25(L7_26, L8_27, L9_28)
    end
    L7_26 = A0_19.angle
    L7_26 = L7_26 or 45
    L8_27 = A0_19.dist
    L8_27 = L8_27 or 10
    L9_28 = A0_19.base
    if not L9_28 then
      L9_28 = Player
      L10_29 = L9_28
      L9_28 = L9_28.getPuppet
      L9_28 = L9_28(L10_29)
    end
    L10_29 = A0_19.target
    L11_30 = A0_19.size
    L11_30 = L11_30 or 1
    if type(L9_28) == "string" then
      L9_28 = findGameObject2("Node", L9_28)
    end
    if type(L10_29) == "string" then
      L10_29 = findGameObject2("Node", L10_29)
    end
    if A0_19.base_joint then
      L1_20, L2_21 = L9_28:getJointWorldTransform(A0_19.base_joint)
    else
      L1_20, L2_21 = L9_28:getWorldTransform()
    end
    L1_20 = L1_20 + L5_24
    if A0_19.target_joint then
      L3_22, L4_23 = L10_29:getJointWorldTransform(A0_19.target_joint)
    else
      L3_22, L4_23 = L10_29:getWorldTransform()
    end
    L3_22 = L3_22 + L6_25
    Query:setEyeSightTransform(L1_20, L2_21)
    Query:setEyeSightAngle(Deg2Rad(L7_26))
    Query:setEyeSightRange(L8_27)
    DebugDraw:drawLines({L1_20, L3_22})
    if L7_26 < 90 then
      if Query:checkEyeSightSphere(L3_22, L11_30) then
        Query:debugDrawEyeSight({
          r = 0,
          g = 1,
          b = 0
        })
        return Query:raycastEyeSight(L3_22) == nil
      else
        Query:debugDrawEyeSight({
          r = 1,
          g = 0,
          b = 0
        })
      end
    elseif L8_27 > L1_20:DistanceTo(L3_22) then
      return Query:raycastEyeSight(L3_22) == nil
    end
  end
  L1_20 = false
  return L1_20
end
function Fn_isBlindArea(A0_31)
  local L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42
  if A0_31 then
    L1_32 = Vector
    L2_33 = 0
    L3_34 = 0
    L4_35 = 0
    L1_32 = L1_32(L2_33, L3_34, L4_35)
    L2_33 = Quaternion
    L3_34 = 0
    L4_35 = 0
    L5_36 = 0
    L6_37 = 1
    L2_33 = L2_33(L3_34, L4_35, L5_36, L6_37)
    L3_34 = Vector
    L4_35 = 0
    L5_36 = 0
    L6_37 = 0
    L3_34 = L3_34(L4_35, L5_36, L6_37)
    L4_35 = Quaternion
    L5_36 = 0
    L6_37 = 0
    L7_38 = 0
    L8_39 = 1
    L4_35 = L4_35(L5_36, L6_37, L7_38, L8_39)
    L5_36 = A0_31.base_ofs
    if not L5_36 then
      L5_36 = Vector
      L6_37 = 0
      L7_38 = 0
      L8_39 = 0
      L5_36 = L5_36(L6_37, L7_38, L8_39)
    end
    L6_37 = A0_31.target_ofs
    if not L6_37 then
      L6_37 = Vector
      L7_38 = 0
      L8_39 = 0
      L9_40 = 0
      L6_37 = L6_37(L7_38, L8_39, L9_40)
    end
    L7_38 = A0_31.angle
    L7_38 = L7_38 or 45
    L8_39 = A0_31.dist
    L8_39 = L8_39 or 10
    L9_40 = A0_31.base
    if not L9_40 then
      L9_40 = Player
      L10_41 = L9_40
      L9_40 = L9_40.getPuppet
      L9_40 = L9_40(L10_41)
    end
    L10_41 = A0_31.target
    L11_42 = A0_31.size
    L11_42 = L11_42 or 1
    if type(L9_40) == "string" then
      L9_40 = findGameObject2("Node", L9_40)
    end
    if type(L10_41) == "string" then
      L10_41 = findGameObject2("Node", L10_41)
    end
    if A0_31.base_joint then
      L1_32, L2_33 = L9_40:getJointWorldTransform(A0_31.base_joint)
    else
      L1_32, L2_33 = L9_40:getWorldTransform()
    end
    L1_32 = L1_32 + L5_36
    if A0_31.target_joint then
      L3_34, L4_35 = L10_41:getJointWorldTransform(A0_31.target_joint)
    else
      L3_34, L4_35 = L10_41:getWorldTransform()
    end
    L3_34 = L3_34 + L6_37
    L2_33 = L2_33 * XYZRotQuatD(0, 180, 0)
    Query:setEyeSightTransform(L1_32, L2_33)
    Query:setEyeSightAngle(Deg2Rad(L7_38))
    Query:setEyeSightRange(L8_39)
    DebugDraw:drawLines({L1_32, L3_34})
    if L7_38 < 90 then
      if Query:checkEyeSightSphere(L3_34, L11_42) then
        Query:debugDrawEyeSight({
          r = 0,
          g = 1,
          b = 0
        })
        return Query:raycastEyeSight(L3_34) == nil
      else
        Query:debugDrawEyeSight({
          r = 1,
          g = 0,
          b = 0
        })
      end
    elseif L8_39 > L1_32:DistanceTo(L3_34) then
      return Query:raycastEyeSight(L3_34) == nil
    end
  end
  L1_32 = false
  return L1_32
end
function Fn_loadEventData(A0_43, A1_44, A2_45)
  local L3_46, L4_47, L5_48, L6_49, L7_50, L8_51, L9_52, L10_53, L11_54, L12_55, L13_56
  L3_46 = {}
  L4_47 = loadFileAsset
  L5_48 = "evb"
  L4_47 = L4_47(L5_48, L6_49)
  L5_48 = L4_47.wait
  L5_48(L6_49)
  L5_48 = L4_47.getRoot
  L5_48 = L5_48(L6_49)
  if A1_44 == nil then
    if L7_50 ~= nil then
      if L7_50 < L8_51 then
      end
    end
    L11_54 = nil
    L12_55 = L5_48
    L3_46[1] = L8_51
  else
    if L7_50 == "string" then
    end
    for L11_54, L12_55 in L8_51(L9_52) do
      L13_56 = L5_48.findBundle
      L13_56 = L13_56(L5_48, L12_55)
      if L13_56 ~= nil then
        L3_46[L7_50] = EventData:create(L12_55, nil, L13_56)
      end
    end
  end
  if L3_46 ~= nil and A2_45 == true then
    for L9_52, L10_53 in L6_49(L7_50) do
      L12_55 = L10_53
      L11_54 = L10_53.try_init
      L11_54(L12_55)
      L12_55 = L10_53
      L11_54 = L10_53.waitForReady
      L11_54(L12_55)
      L12_55 = L10_53
      L11_54 = L10_53.try_start
      L11_54(L12_55)
    end
  end
  return L3_46
end
function Fn_scriptGameOver(A0_57)
  if A0_57 then
    GameDatabase:set(ggd.GlobalSystemFlags__GameOverNoTime, true)
  end
  GameDatabase:set(ggd.GlobalSystemFlags__GameOver, true)
end
function Fn_setGimmickBgDamageFunc(A0_58, A1_59)
  local L2_60
  L2_60 = A0_58
  if type(L2_60) == "string" or A0_58:getTypeName() ~= "GimmickBg" then
    L2_60 = findGameObject2("GimmickBg", A0_58)
  end
  if L2_60 then
    L2_60:setEventListener("damage", A1_59)
    L2_60:setEventListener("dynamic", function(A0_61)
      local L1_62, L2_63
      L2_63 = A0_61
      L1_62 = A0_61.setEventListener
      L1_62(L2_63, "damage", nil)
      L2_63 = A0_61
      L1_62 = A0_61.getDynamicObject
      L1_62 = L1_62(L2_63)
      function L2_63(A0_64, A1_65)
        A1_59(A0_64, A1_65)
      end
      L1_62:setName("dyn_" .. A0_61:getName())
      L1_62:setEventListener("damage", L2_63)
    end)
  end
end
function _createBgObject(A0_66, A1_67, A2_68, A3_69, A4_70, A5_71)
  local L6_72, L7_73
  L6_72 = createGameObject2
  L7_73 = A0_66
  L6_72 = L6_72(L7_73)
  L7_73 = L6_72.setName
  L7_73(L6_72, A2_68)
  if A0_66 == "GimmickBg" then
    L7_73 = L6_72.setDrawModelName
    L7_73(L6_72, A3_69)
    L7_73 = type
    L7_73 = L7_73(A4_70)
    if L7_73 == "string" then
      L7_73 = L6_72.setAttributeName
      L7_73(L6_72, A4_70)
    else
      L7_73 = L6_72.setAttributeName
      L7_73(L6_72, A3_69)
    end
  else
    L7_73 = L6_72.setModelName
    L7_73(L6_72, A3_69)
  end
  if A0_66 ~= "Debris" then
    if A5_71 == nil then
      L7_73 = L6_72.setCollisionName
      L7_73(L6_72, A3_69)
    else
      L7_73 = L6_72.setCollisionName
      L7_73(L6_72, A5_71)
    end
  end
  L7_73 = A1_67
  if type(A1_67) == "string" then
    L7_73 = findGameObject2("Node", A1_67)
  end
  if L7_73 then
    if findUpArea(L7_73) then
      findUpArea(L7_73):appendChild(L6_72)
    end
    L6_72:setWorldTransform(L7_73:getWorldTransform())
    L6_72:setForceMove()
  end
  return L6_72
end
function Fn_createGimmickBg(A0_74, A1_75, A2_76, A3_77, A4_78, A5_79)
  if A3_77 ~= false then
    _createBgObject("GimmickBg", A0_74, A1_75, A2_76, A4_78):try_init()
    _createBgObject("GimmickBg", A0_74, A1_75, A2_76, A4_78):waitForReady()
    _createBgObject("GimmickBg", A0_74, A1_75, A2_76, A4_78):try_start()
  end
  debugPrintCom("GimmickBg:" .. A1_75 .. "\227\130\146\228\189\156\230\136\144\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
  return (_createBgObject("GimmickBg", A0_74, A1_75, A2_76, A4_78))
end
function Fn_createTerrainBg(A0_80, A1_81, A2_82, A3_83)
  if A3_83 ~= false then
    _createBgObject("TerrainBg", A0_80, A1_81, A2_82):try_init()
    _createBgObject("TerrainBg", A0_80, A1_81, A2_82):waitForReady()
    _createBgObject("TerrainBg", A0_80, A1_81, A2_82):try_start()
  end
  debugPrintCom("TerrainBg:" .. A1_81 .. "\227\130\146\228\189\156\230\136\144\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
  return (_createBgObject("TerrainBg", A0_80, A1_81, A2_82))
end
function Fn_createEffect(A0_84, A1_85, A2_86, A3_87, A4_88, A5_89)
  local L6_90
  L6_90 = createGameObject2
  L6_90 = L6_90("Effect")
  L6_90:setName(A0_84)
  L6_90:setModelName(A1_85)
  if type(A2_86) == "string" then
    if findGameObject2("Node", A2_86) then
      findGameObject2("Node", A2_86):appendChild(L6_90)
      if A4_88 then
        L6_90:setPos(A4_88)
      end
    end
  elseif type(A2_86) == "table" then
    if A2_86.x then
      L6_90:setPos(A2_86)
    elseif A2_86.obj and A2_86.joint then
      if type(A2_86.obj) == "string" then
        if findGameObject2("Node", A2_86.obj) then
          findGameObject2("Node", A2_86.obj):appendChildToJoint(L6_90, A2_86.joint)
        end
      else
        A2_86.obj:appendChildToJoint(L6_90, A2_86.joint)
      end
    end
  else
    A2_86:appendChild(L6_90)
    if A4_88 then
      L6_90:setPos(A4_88)
    end
  end
  if A5_89 ~= false then
    L6_90:try_init()
    L6_90:waitForReady()
    if A5_89 ~= "initonly" then
      L6_90:try_start()
      L6_90:play()
    end
    if A3_87 == true then
      L6_90:setLoop(true)
    end
  end
  return L6_90
end
function Fn_startEffect(A0_91, A1_92, A2_93, A3_94)
  if type(A1_92) == "string" then
    if findGameObject2("Node", A1_92) then
      findGameObject2("Node", A1_92):appendChild(A0_91)
      if A3_94 then
        A0_91:setPos(A3_94)
      end
    end
  elseif type(A1_92) == "table" then
    if A1_92.x then
      A0_91:setPos(A1_92)
    elseif A1_92.obj and A1_92.joint then
      if type(A1_92.obj) == "string" then
        if findGameObject2("Node", A1_92.obj) then
          findGameObject2("Node", A1_92.obj):appendChildToJoint(A0_91, A1_92.joint)
        end
      else
        A1_92.obj:appendChildToJoint(A0_91, A1_92.joint)
      end
    end
  elseif A1_92 then
    A1_92:appendChild(A0_91)
    if A3_94 then
      A0_91:setPos(A3_94)
    end
  end
  if start ~= false then
    A0_91:try_start()
    A0_91:play()
    if A2_93 == true then
      A0_91:setLoop(true)
    end
  end
  return
end
function Fn_finishedTremEffect(A0_95, A1_96)
  local L2_97, L3_98
  L2_97 = A0_95
  L3_98 = type
  L3_98 = L3_98(L2_97)
  if L3_98 ~= "string" then
    L3_98 = A0_95.getTypeName
    L3_98 = L3_98(A0_95)
  elseif L3_98 ~= "Effect" then
    L3_98 = findGameObject2
    L3_98 = L3_98("Effect", A0_95)
    L2_97 = L3_98
  end
  L3_98 = 60
  if A1_96 ~= nil then
    L3_98 = A1_96
  end
  return invokeTask(function()
    while L3_98 > 0 and (A1_96 ~= nil or L2_97:isEnd() ~= false) do
      L3_98 = L3_98 - 0.1
      waitSeconds(0.1)
    end
    if L2_97 ~= nil then
      L2_97:try_term()
    end
  end)
end
function Fn_createDebris(A0_99, A1_100, A2_101, A3_102)
  if A3_102 ~= false then
    _createBgObject("Debris", A0_99, A1_100, A2_101):try_init()
    _createBgObject("Debris", A0_99, A1_100, A2_101):waitForReady()
    _createBgObject("Debris", A0_99, A1_100, A2_101):try_start()
  end
  debugPrintCom("Debris:" .. A1_100 .. "\227\130\146\228\189\156\230\136\144\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
  return (_createBgObject("Debris", A0_99, A1_100, A2_101))
end
function Fn_setFreeTimeAllMarkerActive(A0_103)
  local L1_104, L2_105
  L1_104 = GameDatabase
  L2_105 = L1_104
  L1_104 = L1_104.get
  L1_104 = L1_104(L2_105, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if L1_104 == "eventheader" then
    L1_104 = Fn_getGameObject
    L2_105 = "mother2"
    L1_104 = L1_104(L2_105)
    L2_105 = L1_104.findGameObject2
    L2_105 = L2_105(L1_104, "Sandbox2", "eventheader")
    if L2_105 then
      L2_105:sendEvent("Fn_setSelfSandBoxMarker", A0_103)
    end
    L2_105 = L1_104:findGameObject2("Sandbox2", "bgManager")
    if L2_105 and L2_105:sendEvent("getBgsetHandle") then
      L2_105:sendEvent("getBgsetHandle"):sendEvent("Fn_setSelfSandBoxMarker", A0_103)
    end
    L2_105 = L1_104:findGameObject2("Sandbox2", "infoActorManager")
    if L2_105 then
      L2_105:sendEvent("requestMarkerActive", A0_103)
    end
  end
end
function Fn_setFreeTimeAllNpcActive(A0_106)
  local L1_107, L2_108
  L1_107 = GameDatabase
  L2_108 = L1_107
  L1_107 = L1_107.get
  L1_107 = L1_107(L2_108, ggd.Savedata__EventManageFlags__CurrentMissionName)
  if L1_107 == "eventheader" then
    L1_107 = Fn_getGameObject
    L2_108 = "mother2"
    L1_107 = L1_107(L2_108)
    L2_108 = L1_107.findGameObject2
    L2_108 = L2_108(L1_107, "Sandbox2", "npcManager")
    if L2_108 then
      L2_108:sendEvent("setAllNpcActive", A0_106)
    end
    L2_108 = L1_107:findGameObject2("Sandbox2", "infoActorManager")
    if L2_108 then
      L2_108:sendEvent("requestPauseActive", A0_106)
      L2_108:sendEvent("requestNpcActive", A0_106)
    end
  end
end
function Fn_setFreeTimeAllGhosActive(A0_109)
  if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName) == "eventheader" then
    if Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "eventheader") then
      Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "eventheader"):sendEvent("setTreasureGhostActive", A0_109)
      Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "eventheader"):sendEvent("setShowGhostActive", A0_109)
    end
    if Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "photoGhostManager") then
      Fn_getGameObject("mother2"):findGameObject2("Sandbox2", "photoGhostManager"):sendEvent("setPhotoGhostActive", A0_109)
    end
  end
end
