import("Player")
import("Mob")
dofile("/Game/Event2/Table/NpcTable.lua")
__npc_list = {}
__npc_task = {}
__npc_sandbox_handle = nil
__npc_sandbox_name = ""
__npc_randam_type = {}
function debugPrintNpc(A0_0)
  print(" [ npc com ] " .. g_own:getName() .. " : " .. A0_0)
end
function copyTable(A0_1)
  local L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L1_2 = {}
  for L5_6, L6_7 in L2_3(L3_4) do
    if type(L6_7) == "table" then
      L1_2[L5_6] = copyTable(L6_7)
    else
      L1_2[L5_6] = L6_7
    end
  end
  return L1_2
end
function setAttachSandbox(A0_8)
  if type(A0_8) == "string" then
    __npc_sandbox_handle = Fn_getGameObject(A0_8)
    __npc_sandbox_name = A0_8
  else
    __npc_sandbox_handle = A0_8
    __npc_sandbox_name = A0_8:getName()
  end
end
function findUpArea(A0_9)
  while A0_9 do
    A0_9 = A0_9:getParent()
    if A0_9 and A0_9:getTypeName() == "Area" then
      return A0_9
    end
  end
  return nil
end
function Fn_setupNpc(A0_10, A1_11)
  local L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25, L16_26, L17_27, L18_28, L19_29, L20_30, L21_31, L22_32, L23_33
  L2_12 = {}
  L3_13 = {}
  L4_14 = nil
  for L8_18, L9_19 in L5_15(L6_16) do
    L10_20 = __npc_sandbox_handle
    L10_20 = L10_20 or g_own
    L11_21 = L9_19.attach
    if L11_21 == false then
      L10_20 = g_own
    end
    L11_21 = Fn_findNpc
    L12_22 = L9_19.name
    L11_21 = L11_21(L12_22)
    if L11_21 ~= nil then
      if L11_21 ~= nil then
        L13_23 = L11_21
        L12_22 = L11_21.isStopped
        L12_22 = L12_22(L13_23)
      end
    else
      if L12_22 then
        L13_23 = L10_20
        L12_22 = L10_20.createGameObject2
        L14_24 = "NpcGenerator"
        L12_22 = L12_22(L13_23, L14_24)
        L13_23 = Vector
        L14_24 = 0
        L15_25 = 0
        L16_26 = 0
        L13_23 = L13_23(L14_24, L15_25, L16_26)
        L14_24 = Quaternion
        L15_25 = 0
        L16_26 = 0
        L17_27 = 0
        L18_28 = 1
        L14_24 = L14_24(L15_25, L16_26, L17_27, L18_28)
        L15_25 = nil
        L16_26 = L9_19.node
        if L16_26 ~= nil then
          L16_26 = findGameObject2
          L17_27 = "Node"
          L18_28 = L9_19.node
          L16_26 = L16_26(L17_27, L18_28)
          if L16_26 ~= nil then
            L17_27 = findUpArea
            L18_28 = L16_26
            L17_27 = L17_27(L18_28)
            L15_25 = L17_27
            L18_28 = L16_26
            L17_27 = L16_26.getWorldTransform
            L18_28 = L17_27(L18_28)
            L14_24 = L18_28
            L13_23 = L17_27
          end
        else
          L16_26 = L9_19.pos
          if L16_26 ~= nil then
            L16_26 = L9_19.rot
            if L16_26 ~= nil then
              L13_23 = L9_19.pos
              L14_24 = L9_19.rot
            end
          end
        end
        L16_26 = true
        L17_27 = L9_19.use_gravity
        if L17_27 ~= nil then
          L16_26 = L9_19.use_gravity
        end
        L17_27, L18_28 = nil, nil
        if L4_14 == nil then
          L19_29 = L9_19.type
          if L19_29 == "sis01" then
            L19_29 = GameDatabase
            L20_30 = L19_29
            L19_29 = L19_29.get
            L21_31 = ggd
            L21_31 = L21_31.Savedata__EventManageFlags__CurrentMissionName
            L19_29 = L19_29(L20_30, L21_31)
            L20_30 = string
            L20_30 = L20_30.match
            L21_31 = L19_29
            L22_32 = "%l+"
            L20_30 = L20_30(L21_31, L22_32)
            L21_31 = string
            L21_31 = L21_31.match
            L22_32 = L19_29
            L23_33 = "(.-)_()"
            L21_31 = L21_31(L22_32, L23_33)
            L22_32 = GameDatabase
            L23_33 = L22_32
            L22_32 = L22_32.get
            L22_32 = L22_32(L23_33, ggd.Savedata__EventManageFlags__CurrentEpisodeNum)
            if L20_30 == "sm" or L21_31 ~= "ep04" and L22_32 < 12 then
              L23_33 = debugPrintNpc
              L23_33("create sis doll")
              L23_33 = "cisisdoll01_base"
              L4_14 = L10_20:createGameObject2("Puppet")
              L4_14:setName(L9_19.name .. "_doll")
              L4_14:loadModel(L23_33)
              L4_14:loadBaseSkeleton(L23_33, L23_33)
              L17_27 = L4_14
              L18_28 = "doll"
            end
          end
        end
        L19_29 = L9_19.type
        L20_30 = L9_19.color_variation
        L20_30 = L20_30 or 0
        L21_31 = L9_19.hair_variation
        L21_31 = L21_31 or 0
        L22_32 = L9_19.face_tex_name
        L23_33 = __npc_randam_list
        L23_33 = L23_33[L19_29]
        if L23_33 then
          L23_33 = RandI
          L23_33 = L23_33(1, #__npc_randam_list[L19_29])
          L19_29 = __npc_randam_list[L19_29][L23_33]
          L20_30 = RandI(1, 3)
          L21_31 = RandI(0, 1)
          L22_32 = RandI(0, 3)
          if L22_32 == 0 then
            L22_32 = L19_29 .. "_face_a"
          elseif L22_32 == 1 then
            L22_32 = L19_29 .. "_face_b"
          elseif L22_32 == 2 then
            L22_32 = L19_29 .. "_face_c"
          else
            L22_32 = L19_29 .. "_face_d"
          end
          debugPrintNpc(L9_19.name .. " >> type : " .. L19_29 .. ", color : " .. tostring(L20_30) .. ", hair : " .. tostring(L21_31) .. ", face : " .. L22_32)
        end
        L23_33 = {}
        L23_33.labelName = L19_29
        L23_33.npcName = L9_19.name
        L23_33.position = L13_23
        L23_33.rotation = L14_24
        L23_33.animName = L9_19.anim_name or "stay"
        L23_33.useGravity = L16_26
        L23_33.useFall = L9_19.use_fall or false
        L23_33.disableCollision = L9_19.disable_collision or false
        L23_33.colorVariation = L20_30
        L23_33.hairVariation = L21_31
        L23_33.faceTexName = L22_32
        L23_33.mobToNpc = L9_19.mob_to_npc or false
        L23_33.prop = L17_27
        L23_33.propType = L18_28
        L12_22:setName(L23_33.npcName)
        L12_22:setCreateParam(L23_33)
        if event_name and L10_20:getName() == "npcManager" then
          L10_20:sendEvent("setNpcName", string.match(event_name, "(.-)_()") or event_name, L9_19.name, L19_29, L9_19.mission)
          if L9_19.not_mob then
            L10_20:sendEvent("reserveNotMob", string.match(event_name, "(.-)_()") or event_name, L9_19.name)
          end
        end
        L15_25 = L15_25 or L12_22:findArea(L13_23)
        if L15_25 ~= nil then
          L15_25:appendChild(L12_22)
        end
        L12_22:setWorldTransform(L13_23, L14_24)
        L12_22:setForceMove()
        if L9_19.start == true then
          L3_13[L9_19.name] = L12_22
        end
        if L9_19.active == false then
          L12_22:setActive(false)
        end
        __npc_list[L9_19.name] = L12_22
        L2_12[L9_19.name] = L12_22
        __npc_randam_type[L9_19.name] = L19_29
        debugPrintNpc(L23_33.npcName .. " \227\130\146 " .. L10_20:getName() .. " \227\129\171 " .. L23_33.animName .. " \227\129\167\228\189\156\230\136\144")
    end
    else
      L12_22 = event_name
      if L12_22 then
        L13_23 = L10_20
        L12_22 = L10_20.getName
        L12_22 = L12_22(L13_23)
        if L12_22 == "npcManager" then
          L12_22 = L9_19.not_mob
          if L12_22 then
            L13_23 = L10_20
            L12_22 = L10_20.sendEvent
            L14_24 = "reserveNotMob"
            L15_25 = string
            L15_25 = L15_25.match
            L16_26 = event_name
            L17_27 = "(.-)_()"
            L15_25 = L15_25(L16_26, L17_27)
            L15_25 = L15_25 or event_name
            L16_26 = L9_19.name
            L12_22(L13_23, L14_24, L15_25, L16_26)
          end
        end
      end
      L12_22 = L9_19.reset
      if L12_22 ~= false then
        L12_22 = findGameObject2
        L13_23 = "Node"
        L14_24 = L9_19.node
        L12_22 = L12_22(L13_23, L14_24)
        if L12_22 ~= nil then
          L14_24 = L11_21
          L13_23 = L11_21.isRunning
          L13_23 = L13_23(L14_24)
          if L13_23 then
            L13_23 = debugPrintNpc
            L15_25 = L11_21
            L14_24 = L11_21.getName
            L14_24 = L14_24(L15_25)
            L15_25 = " \227\130\146 "
            L17_27 = L12_22
            L16_26 = L12_22.getName
            L16_26 = L16_26(L17_27)
            L17_27 = " \227\129\171warp\227\129\151\227\129\190\227\129\153 "
            L18_28 = tostring
            L20_30 = L12_22
            L19_29 = L12_22.getWorldPos
            L23_33 = L19_29(L20_30)
            L18_28 = L18_28(L19_29, L20_30, L21_31, L22_32, L23_33, L19_29(L20_30))
            L19_29 = " anim : "
            L20_30 = tostring
            L21_31 = L9_19.anim_name
            L21_31 = L21_31 or "stay"
            L20_30 = L20_30(L21_31)
            L14_24 = L14_24 .. L15_25 .. L16_26 .. L17_27 .. L18_28 .. L19_29 .. L20_30
            L13_23(L14_24)
            L14_24 = L11_21
            L13_23 = L11_21.warp
            L15_25 = L12_22
            L16_26 = L9_19.anim_name
            L16_26 = L16_26 or "stay"
            L13_23(L14_24, L15_25, L16_26)
          end
        end
      end
      L12_22 = L9_19.active
      if L12_22 == false then
        L13_23 = L11_21
        L12_22 = L11_21.setActive
        L14_24 = false
        L12_22(L13_23, L14_24)
      else
        L13_23 = L11_21
        L12_22 = L11_21.setActive
        L14_24 = true
        L12_22(L13_23, L14_24)
      end
      L12_22 = L9_19.name
      L2_12[L12_22] = L11_21
    end
    L10_20 = nil
  end
  if not A1_11 then
    L5_15()
    L5_15()
    if L5_15 then
      L5_15(L6_16, L7_17)
      repeat
        L5_15()
      until L5_15
    end
    L6_16.degree_h = 12
    L6_16.degree_v = 90
    L6_16.in_length = 5
    L6_16.out_length = 7
    L6_16.valid = true
    L6_16.onlyFace = true
    L6_16.target = nil
    L6_16.targetJoint = "bn_head"
    L6_16.watchTarget = true
    L6_16.forceTarget = true
    while true do
      for L10_20, L11_21 in L7_17(L8_18) do
        L13_23 = L11_21
        L12_22 = L11_21.isReady
        L12_22 = L12_22(L13_23)
        if L12_22 then
          L13_23 = L11_21
          L12_22 = L11_21.try_start
          L12_22(L13_23)
          repeat
            L12_22 = wait
            L12_22()
            L13_23 = L11_21
            L12_22 = L11_21.isStarted
            L12_22 = L12_22(L13_23)
          until L12_22
        end
      end
      if not (L5_15 >= L7_17) then
        L7_17()
      end
    end
    L3_13 = L7_17
    if L4_14 then
      L7_17(L8_18)
    end
  end
  return L2_12
end
function Fn_findNpc(A0_34)
  local L1_35
  L1_35 = nil
  if A0_34 ~= nil then
    if type(A0_34) == "string" then
      if __npc_list[A0_34] ~= nil then
        L1_35 = __npc_list[A0_34]
      end
      if L1_35 == nil and __npc_sandbox_handle ~= nil then
        L1_35 = __npc_sandbox_handle:findGameObject2("NpcGenerator", A0_34)
        if L1_35 then
          __npc_list[A0_34] = L1_35
        end
      end
      if L1_35 == nil then
        L1_35 = findGameObject2("NpcGenerator", A0_34)
        if L1_35 then
          __npc_list[A0_34] = L1_35
        end
      end
    elseif A0_34:getTypeName() == "NpcGenerator" then
      L1_35 = A0_34
    end
  end
  return L1_35
end
function Fn_findNpcPuppet(A0_36)
  local L1_37, L2_38
  L1_37 = Fn_findNpc
  L2_38 = A0_36
  L1_37 = L1_37(L2_38)
  if L1_37 ~= nil then
    L2_38 = L1_37.getPuppet
    L2_38 = L2_38(L1_37)
    if L2_38 == nil and __npc_sandbox_handle ~= nil then
      L2_38 = __npc_sandbox_handle:findGameObject2("Puppet", A0_36)
    end
    if L2_38 == nil then
      L2_38 = findGameObject2("Puppet", A0_36)
    end
    return L2_38
  end
  L2_38 = nil
  return L2_38
end
function Fn_killNpcTask(A0_39)
  if __npc_task[A0_39] ~= nil and __npc_task[A0_39]:isRunning() == true then
    __npc_task[A0_39]:abort()
  end
  __npc_task[A0_39] = nil
end
function Fn_isValidNpc(A0_40, A1_41, A2_42)
  local L3_43, L4_44, L5_45
  if A1_41 == nil then
    A1_41 = 20
  end
  if A2_42 == nil then
    A2_42 = 70
  end
  L3_43 = true
  L4_44 = Fn_findNpc
  L5_45 = A0_40
  L4_44 = L4_44(L5_45)
  if L4_44 == nil then
    L3_43 = false
  else
    L5_45 = L4_44.getPuppet
    L5_45 = L5_45(L4_44)
    if A2_42 < Fn_getDistanceToPlayer(L5_45) then
      L3_43 = false
    elseif A1_41 < Fn_getDistanceToPlayer(L5_45) and Fn_isInSightTarget(L5_45, 1) == false then
      L3_43 = false
    end
  end
  return L3_43
end
function Fn_disappearNpc(A0_46, A1_47)
  local L2_48, L3_49
  L2_48 = Fn_findNpc
  L3_49 = A0_46
  L2_48 = L2_48(L3_49)
  if L2_48 ~= nil then
    L3_49 = L2_48.getName
    L3_49 = L3_49(L2_48)
    Fn_killNpcTask(L3_49)
    __npc_list[L3_49] = nil
    if L2_48:getBrain() and L2_48:getBrain():isStopped() == false and A1_47 then
      debugPrintNpc(L3_49 .. " \227\130\146 disappear")
      L2_48:disappear(A1_47)
    else
      debugPrintNpc(L3_49 .. " \227\130\146 kill")
      L2_48:kill()
    end
  end
end
function Fn_appendNpcArea(A0_50, A1_51)
  local L2_52, L3_53
  L2_52 = Fn_findNpc
  L3_53 = A0_50
  L2_52 = L2_52(L3_53)
  if L2_52 ~= nil then
    L3_53 = A1_51
    if type(L3_53) == "string" then
      L3_53 = findGameObject2("Node", L3_53)
    end
    if L3_53 ~= nil then
      while L3_53 do
        L3_53 = L3_53:getParent()
        if L3_53 and L3_53:getTypeName() == "Area" then
          L3_53:appendChild(L2_52, true)
          break
        end
        wait()
      end
    end
  end
end
function Fn_setNpcVisible(A0_54, A1_55)
  if Fn_findNpc(A0_54) ~= nil then
    Fn_findNpc(A0_54):getPuppet():setVisible(A1_55)
  end
end
function Fn_setNpcAlpha(A0_56, A1_57, A2_58)
  local L3_59, L4_60, L5_61
  L3_59 = Fn_findNpc
  L4_60 = A0_56
  L3_59 = L3_59(L4_60)
  if L3_59 ~= nil then
    if A2_58 == nil then
      A2_58 = 1
    end
    L5_61 = L3_59
    L4_60 = L3_59.getPuppet
    L4_60 = L4_60(L5_61)
    if A1_57 then
      L5_61 = L4_60.setAlpha
      L5_61(L4_60, 1)
    else
      L5_61 = A2_58 / 10
      for _FORV_9_ = 1, 9 do
        L4_60:setAlpha(1 - _FORV_9_ / 10)
        waitSeconds(L5_61)
      end
    end
    L5_61 = L4_60.setActive
    L5_61(L4_60, A1_57)
  end
end
function Fn_setNpcActive(A0_62, A1_63)
  if Fn_findNpc(A0_62) ~= nil then
    Fn_findNpc(A0_62):setActive(A1_63)
  end
end
function Fn_setGrabNpc(A0_64, A1_65, A2_66)
  if Fn_findNpc(A0_64) ~= nil then
    if A1_65 == nil then
      A1_65 = true
    end
    if A2_66 == nil then
      A2_66 = true
    end
    Fn_findNpc(A0_64):setIgnoreGrab(A1_65)
    Fn_findNpc(A0_64):setGrabReleasePermission(A2_66)
  end
end
function Fn_setGrabReleaseNpc(A0_67)
  if Fn_findNpc(A0_67) ~= nil and Fn_findNpc(A0_67):isGrabbed() then
    Fn_findNpc(A0_67):setGrabReleaseForce(true)
    Fn_findNpc(A0_67):setIgnoreGrab(true)
    Fn_findNpc(A0_67):setGrabReleasePermission(true)
  end
end
function Fn_warpNpc(A0_68, A1_69, A2_70)
  local L3_71, L4_72
  L3_71 = Fn_findNpc
  L4_72 = A0_68
  L3_71 = L3_71(L4_72)
  L4_72 = A1_69
  if type(L4_72) == "string" then
    L4_72 = findGameObject2("Node", L4_72)
  end
  if L3_71 ~= nil then
    L3_71:warp(L4_72, A2_70)
    debugPrintNpc("warp node name : " .. tostring(L4_72:getName()) .. "  world Pos : " .. tostring(L4_72:getWorldPos()))
  end
end
function Fn_turnNpc(A0_73, A1_74, A2_75, A3_76, A4_77)
  local L5_78, L6_79
  A3_76 = true
  L5_78 = Fn_findNpc
  L6_79 = A0_73
  L5_78 = L5_78(L6_79)
  L6_79 = L5_78.resetSightParam
  L6_79(L5_78)
  L6_79 = {}
  L6_79.degree_h = 12
  L6_79.degree_v = 90
  L6_79.in_length = 5
  L6_79.out_length = 7
  L6_79.valid = true
  L6_79.target = A1_74
  L6_79.forceTarget = true
  L6_79.targetJoint = "bn_head"
  L6_79.watchTarget = true
  if A3_76 then
    if A2_75 then
      A2_75.force = true
    else
    end
  end
  if L5_78 ~= nil then
    if A4_77 ~= true then
      L5_78:setSightParam(L6_79)
      waitSeconds(0.4)
    end
    if not L5_78:isInSight() or A3_76 then
      pos = A1_74
      if A1_74 == nil then
        pos = Player:getPuppet()
      end
      L5_78:turn(pos, A2_75)
      if A4_77 ~= true then
        L5_78:setSightParam({valid = false})
      end
      for _FORV_10_ = 0, 150 do
        if L5_78:isRunning() and L5_78:getBrain() and L5_78:getBrain():isStopped() == false and not L5_78:isTurnEnd() then
        else
          break
        end
        wait()
      end
    end
  end
end
function Fn_setTurnParamNpc(A0_80, A1_81)
  if Fn_findNpc(A0_80) ~= nil then
    if A1_81 ~= nil then
      Fn_findNpc(A0_80):setTurnParam(A1_81)
    else
      Fn_findNpc(A0_80):resetTurnParam()
    end
  end
end
function Fn_watchNpc(A0_82, A1_83)
  local L2_84, L3_85
  L2_84 = Fn_findNpc
  L3_85 = A0_82
  L2_84 = L2_84(L3_85)
  if L2_84 ~= nil then
    L3_85 = {}
    L3_85.valid = A1_83
    L2_84:setSightParam(L3_85)
  end
end
function Fn_playMotionNpc(A0_86, A1_87, A2_88, A3_89)
  if Fn_findNpc(A0_86) ~= nil then
    Fn_findNpc(A0_86):playMotion(A1_87, A3_89)
    if A2_88 ~= false then
      wait()
      while not Fn_findNpc(A0_86):isMotionEnd() do
        wait()
      end
    end
  end
end
function Fn_playLoopMotionRand(A0_90, A1_91, A2_92, A3_93)
  local L4_94, L5_95, L6_96, L7_97, L8_98, L9_99
  L4_94 = Fn_findNpc
  L5_95 = A0_90
  L4_94 = L4_94(L5_95)
  if L4_94 == nil then
    return
  end
  L6_96 = L4_94
  L5_95 = L4_94.getPuppet
  L5_95 = L5_95(L6_96)
  L6_96 = #A1_91
  L8_98 = L4_94
  L7_97 = L4_94.playMotion
  L9_99 = RandI
  L9_99 = L9_99(1, L6_96)
  L9_99 = A1_91[L9_99]
  L7_97(L8_98, L9_99, {animBlendDuration = 0.4})
  L7_97 = RandI
  L8_98 = A2_92 * 30
  L9_99 = A3_93 * 30
  L7_97 = L7_97(L8_98, L9_99)
  L8_98 = false
  L9_99 = 0
  return (invokeTask(function()
    repeat
      while L4_94:isMotionEnd() ~= true do
        for _FORV_4_ = 1, L6_96 do
          if L5_95:isPoseAnimPlaying(A1_91[_FORV_4_]) == true then
            break
          end
        end
        L9_99 = _FOR_ + 1
        wait()
      end
      if true == false and L8_98 == false then
        L9_99 = 0
        L8_98 = true
      end
      if L7_97 < L9_99 then
        L4_94:playMotion(A1_91[RandI(1, L6_96)], {animBlendDuration = 0.4})
        L9_99 = 0
        L8_98 = false
      end
      L9_99 = L9_99 + 1
      wait()
    until false
  end))
end
function Fn_playLoopMotionInsert(A0_100, A1_101, A2_102, A3_103, A4_104)
  local L5_105, L6_106, L7_107
  L5_105 = Fn_findNpc
  L6_106 = A0_100
  L5_105 = L5_105(L6_106)
  if L5_105 == nil then
    return
  end
  L7_107 = L5_105
  L6_106 = L5_105.getPuppet
  L6_106 = L6_106(L7_107)
  L7_107 = #A2_102
  L5_105:playMotion(A1_101, {animBlendDuration = 0.4})
  return (invokeTask(function()
    repeat
      waitSeconds(RandF(A3_103, A4_104))
      if L6_106:isPoseAnimPlaying(A1_101) == true then
        repeat
          wait()
        until L5_105:isMotionEnd()
        L5_105:playMotion(A2_102[RandI(1, L7_107)], {animBlendDuration = 0.4})
        repeat
          wait()
        until L5_105:isMotionEnd()
        L5_105:playMotion(A1_101, {animBlendDuration = 0.4})
      end
    until false
  end))
end
function Fn_repeatPlayMotion(A0_108, A1_109, A2_110, A3_111, A4_112)
  local L5_113, L6_114, L7_115
  L5_113 = Fn_findNpc
  L6_114 = A0_108
  L5_113 = L5_113(L6_114)
  if L5_113 == nil then
    return
  end
  L6_114 = 0
  L7_115 = 0
  if A2_110 ~= nil and type(A2_110) == "table" then
    L7_115 = #A2_110
  end
  return (invokeTask(function()
    local L0_116
    L0_116 = RandF
    L0_116 = L0_116(A3_111, A4_112)
    repeat
      L5_113:playMotion(A1_109)
      repeat
        wait()
      until L5_113:isMotionEnd()
      if L0_116 < L6_114 and L7_115 > 0 then
        L5_113:playMotion(A2_110[RandI(1, L7_115)], {animBlendDuration = 0.3})
        repeat
          wait()
        until L5_113:isMotionEnd()
        L6_114 = 0
        L0_116 = RandF(A3_111, A4_112)
      end
    until false
  end))
end
function Fn_isPlayingMotion(A0_117, A1_118)
  local L2_119, L3_120, L4_121, L5_122, L6_123, L7_124, L8_125, L9_126
  L2_119 = Fn_findNpc
  L3_120 = A0_117
  L2_119 = L2_119(L3_120)
  if L2_119 == nil then
    return
  end
  L4_121 = L2_119
  L3_120 = L2_119.getPuppet
  L3_120 = L3_120(L4_121)
  L4_121 = false
  for L8_125, L9_126 in L5_122(L6_123) do
    if L3_120:isPoseAnimPlaying(L9_126) == true then
      L4_121 = true
      break
    end
  end
  return L4_121
end
function Fn_moveNpc(A0_127, A1_128, A2_129, A3_130)
  local L4_131, L5_132
  L4_131 = Fn_findNpc
  L5_132 = A0_127
  L4_131 = L4_131(L5_132)
  L5_132 = L4_131.getName
  L5_132 = L5_132(L4_131)
  Fn_killNpcTask(L5_132)
  __npc_task[L5_132] = invokeTask(function()
    local L0_133, L1_134, L2_135, L3_136, L4_137, L5_138, L6_139
    L0_133 = L4_131
    if L0_133 ~= nil then
      L0_133 = true
      L1_134 = A2_129
      if L1_134 then
        L1_134 = A2_129.recast
        if L1_134 ~= nil then
          L0_133 = A2_129.recast
        end
      end
      L1_134 = ""
      L2_135 = A2_129
      if L2_135 then
        L2_135 = A2_129.navimesh
        if L2_135 ~= nil then
          L1_134 = A2_129.navimesh
        end
      end
      L2_135 = A2_129
      if L2_135 then
        L2_135 = A2_129.no_stay
      else
        L2_135 = L2_135 or false
      end
      L3_136 = {}
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_walk
      else
        L4_137 = L4_137 or "walk"
      end
      L3_136.anim_walk = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_walk_b
      else
        L4_137 = L4_137 or "walk_b"
      end
      L3_136.anim_walk_b = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_run
      else
        L4_137 = L4_137 or "run"
      end
      L3_136.anim_run = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_walk_speed
      else
        L4_137 = L4_137 or 1
      end
      L3_136.anim_walk_speed = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_walk_b_speed
      else
        L4_137 = L4_137 or 1
      end
      L3_136.anim_walk_b_speed = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_run_speed
      else
        L4_137 = L4_137 or 1
      end
      L3_136.anim_run_speed = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.anim_speed_over
      else
        L4_137 = L4_137 or false
      end
      L3_136.anim_speed_over = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.arrivedLength
      else
        L4_137 = L4_137 or 1
      end
      L3_136.arrivedLength = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.runLength
      else
        L4_137 = L4_137 or 30
      end
      L3_136.runLength = L4_137
      L3_136.navimesh = L1_134
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.noTurn
      else
        L4_137 = L4_137 or false
      end
      L3_136.noTurn = L4_137
      L3_136.recast = L0_133
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.loop
      else
        L4_137 = L4_137 or false
      end
      L3_136.loop = L4_137
      L4_137 = A2_129
      if L4_137 then
        L4_137 = A2_129.rotRate
      else
        L4_137 = L4_137 or -1
      end
      L3_136.rotRate = L4_137
      L4_137 = print
      L5_138 = "move npc = "
      L6_139 = L4_131
      L6_139 = L6_139.getName
      L6_139 = L6_139(L6_139)
      L5_138 = L5_138 .. L6_139
      L4_137(L5_138)
      L4_137 = L4_131
      L5_138 = L4_137
      L4_137 = L4_137.setMoveOption
      L6_139 = L3_136
      L4_137(L5_138, L6_139)
      L4_137 = {}
      L5_138 = type
      L6_139 = A1_128
      L5_138 = L5_138(L6_139)
      if L5_138 == "table" then
        L6_139 = copyTable
        L6_139 = L6_139(A1_128)
        L4_137 = L6_139
        L6_139 = {}
        for _FORV_10_, _FORV_11_ in pairs(L4_137) do
          if _FORV_11_.pos == nil then
            L6_139[_FORV_10_] = {pos = _FORV_11_}
          else
            L6_139[_FORV_10_] = _FORV_11_
          end
        end
        if #L6_139 > 0 then
          L4_137 = copyTable(L6_139)
        end
      else
        L6_139 = {
          {pos = A1_128}
        }
        L4_137 = L6_139
      end
      L6_139 = L4_131
      L6_139 = L6_139.move
      L6_139(L6_139, L4_137, A3_130)
      L6_139 = false
      if L4_131:isRunning() and L4_131:getBrain() and L4_131:getBrain():isStopped() == false then
        while not L4_131:isMoveEnd() do
          else
            L6_139 = true
            break
          end
          wait()
        end
      if not L6_139 and not L2_135 then
        L4_131:playMotion("stay")
        wait()
      end
      __npc_task[L5_132] = nil
    end
  end)
  wait()
  return (invokeTask(function()
    local L0_140, L1_141, L2_142, L3_143, L4_144, L5_145, L6_146
    L0_140 = L4_131
    if L0_140 ~= nil then
      L0_140 = true
      L1_141 = A2_129
      if L1_141 then
        L1_141 = A2_129.recast
        if L1_141 ~= nil then
          L0_140 = A2_129.recast
        end
      end
      L1_141 = ""
      L2_142 = A2_129
      if L2_142 then
        L2_142 = A2_129.navimesh
        if L2_142 ~= nil then
          L1_141 = A2_129.navimesh
        end
      end
      L2_142 = A2_129
      if L2_142 then
        L2_142 = A2_129.no_stay
      else
        L2_142 = L2_142 or false
      end
      L3_143 = {}
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_walk
      else
        L4_144 = L4_144 or "walk"
      end
      L3_143.anim_walk = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_walk_b
      else
        L4_144 = L4_144 or "walk_b"
      end
      L3_143.anim_walk_b = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_run
      else
        L4_144 = L4_144 or "run"
      end
      L3_143.anim_run = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_walk_speed
      else
        L4_144 = L4_144 or 1
      end
      L3_143.anim_walk_speed = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_walk_b_speed
      else
        L4_144 = L4_144 or 1
      end
      L3_143.anim_walk_b_speed = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_run_speed
      else
        L4_144 = L4_144 or 1
      end
      L3_143.anim_run_speed = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.anim_speed_over
      else
        L4_144 = L4_144 or false
      end
      L3_143.anim_speed_over = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.arrivedLength
      else
        L4_144 = L4_144 or 1
      end
      L3_143.arrivedLength = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.runLength
      else
        L4_144 = L4_144 or 30
      end
      L3_143.runLength = L4_144
      L3_143.navimesh = L1_141
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.noTurn
      else
        L4_144 = L4_144 or false
      end
      L3_143.noTurn = L4_144
      L3_143.recast = L0_140
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.loop
      else
        L4_144 = L4_144 or false
      end
      L3_143.loop = L4_144
      L4_144 = A2_129
      if L4_144 then
        L4_144 = A2_129.rotRate
      else
        L4_144 = L4_144 or -1
      end
      L3_143.rotRate = L4_144
      L4_144 = print
      L5_145 = "move npc = "
      L6_146 = L4_131
      L6_146 = L6_146.getName
      L6_146 = L6_146(L6_146)
      L5_145 = L5_145 .. L6_146
      L4_144(L5_145)
      L4_144 = L4_131
      L5_145 = L4_144
      L4_144 = L4_144.setMoveOption
      L6_146 = L3_143
      L4_144(L5_145, L6_146)
      L4_144 = {}
      L5_145 = type
      L6_146 = A1_128
      L5_145 = L5_145(L6_146)
      if L5_145 == "table" then
        L6_146 = copyTable
        L6_146 = L6_146(A1_128)
        L4_144 = L6_146
        L6_146 = {}
        for _FORV_10_, _FORV_11_ in pairs(L4_144) do
          if _FORV_11_.pos == nil then
            L6_146[_FORV_10_] = {pos = _FORV_11_}
          else
            L6_146[_FORV_10_] = _FORV_11_
          end
        end
        if #L6_146 > 0 then
          L4_144 = copyTable(L6_146)
        end
      else
        L6_146 = {
          {pos = A1_128}
        }
        L4_144 = L6_146
      end
      L6_146 = L4_131
      L6_146 = L6_146.move
      L6_146(L6_146, L4_144, A3_130)
      L6_146 = false
      if L4_131:isRunning() and L4_131:getBrain() and L4_131:getBrain():isStopped() == false then
        while not L4_131:isMoveEnd() do
          else
            L6_146 = true
            break
          end
          wait()
        end
      if not L6_146 and not L2_142 then
        L4_131:playMotion("stay")
        wait()
      end
      __npc_task[L5_132] = nil
    end
  end))
end
function Fn_fly(A0_147, A1_148, A2_149)
  if Fn_findNpc(A0_147) ~= nil then
    Fn_findNpc(A0_147):fly(A1_148, A2_149)
    repeat
      wait()
    until Fn_findNpc(A0_147):isFlyEnd()
  end
end
function Fn_guideNpc(A0_150, A1_151, A2_152, A3_153, A4_154)
  local L5_155, L6_156, L7_157
  L5_155 = Fn_findNpc
  L6_156 = A0_150
  L5_155 = L5_155(L6_156)
  if L5_155 ~= nil then
    L6_156 = Fn_watchNpc
    L7_157 = L5_155
    L6_156(L7_157, true)
    L6_156 = Fn_turnNpc
    L7_157 = L5_155
    L6_156(L7_157)
    if A4_154 ~= nil then
      L6_156 = A4_154
      L6_156()
    end
    if A2_152 == true then
      L7_157 = L5_155
      L6_156 = L5_155.playMotion
      L6_156(L7_157, "reply_yes")
      L6_156 = wait
      L6_156()
      while true do
        L7_157 = L5_155
        L6_156 = L5_155.isMotionEnd
        L6_156 = L6_156(L7_157)
        if not L6_156 then
          L6_156 = wait
          L6_156()
        end
      end
      L7_157 = A1_151
      L6_156 = A1_151.getWorldPos
      L6_156 = L6_156(L7_157)
      L7_157 = Fn_turnNpc
      L7_157(A0_150, L6_156)
      L7_157 = {}
      L7_157.anim_in = "inform_in"
      L7_157.anim_lp = "inform_lp"
      L7_157.anim_out = "inform_ed"
      L7_157.anim_stay = "stay"
      L5_155:inform(A1_151, L7_157)
      waitSeconds(1.5)
      if A3_153 ~= nil then
        invokeTask(function()
          A3_153()
        end)
      end
      waitSeconds(1.5)
      L5_155:informEnd()
      while not L5_155:isInformEnd() do
        wait()
      end
    else
      L7_157 = L5_155
      L6_156 = L5_155.playMotion
      L6_156(L7_157, "reply_no")
      L6_156 = wait
      L6_156()
      while true do
        L7_157 = L5_155
        L6_156 = L5_155.isMotionEnd
        L6_156 = L6_156(L7_157)
        if not L6_156 then
          L6_156 = wait
          L6_156()
        end
      end
    end
    L7_157 = L5_155
    L6_156 = L5_155.playMotion
    L6_156(L7_157, "stay")
    L6_156 = waitSeconds
    L7_157 = 0.5
    L6_156(L7_157)
    L6_156 = Fn_watchNpc
    L7_157 = L5_155
    L6_156(L7_157, false)
    L7_157 = L5_155
    L6_156 = L5_155.resetDirection
    L6_156(L7_157)
  end
  L5_155 = nil
end
function Fn_loadNpcEventMotion(A0_158, A1_159)
  local L2_160, L3_161, L4_162, L5_163, L6_164, L7_165
  L2_160 = Fn_findNpcPuppet
  L2_160 = L2_160(L3_161)
  for L6_164, L7_165 in L3_161(L4_162) do
    L2_160:loadPoseAnimation(L7_165, L7_165)
  end
  while true do
    if L3_161 then
      L3_161()
    end
  end
end
function Fn_playNpcEventMotion(A0_166, A1_167, A2_168, A3_169, A4_170, A5_171, A6_172)
  local L7_173
  L7_173 = {}
  L7_173.isRepeat = false
  L7_173.animBlendDuration = 0
  L7_173.animStartFrame = 0
  L7_173.isRepeat = A2_168 or L7_173.isRepeat
  L7_173.animBlendDuration = A3_169 or L7_173.animBlendDuration
  L7_173.animStartFrame = A5_171 or L7_173.animStartFrame
  if A6_172 ~= nil then
    L7_173.isStop = A6_172
  end
  Fn_findNpc(A0_166):playMotion(A1_167, L7_173)
  if A4_170 ~= false then
    repeat
      wait()
    until Fn_findNpc(A0_166):isMotionEnd()
  end
end
function Fn_PlacementEnabledMob(A0_174, A1_175, A2_176)
  local L3_177, L4_178
  L3_177 = Mob
  L4_178 = L3_177
  L3_177 = L3_177.getHatReqIdxOfPlacement
  L3_177 = L3_177(L4_178, A0_174, A1_175)
  if L3_177 ~= nil then
    L4_178 = Mob
    L4_178 = L4_178.setHatReqIdxEnabled
    L4_178(L4_178, A0_174, L3_177, A2_176)
    if A2_176 == false then
      L4_178 = Mob
      L4_178 = L4_178.collectPawnIdsWithHatReqIdx
      L4_178 = L4_178(L4_178, A0_174, L3_177)
      if L4_178 ~= nil then
        Mob:killPawns(A0_174, L4_178)
      end
    end
  end
end
function Fn_changeNpcToMob(A0_179)
  if Fn_findNpc(A0_179) ~= nil then
    Fn_findNpc(A0_179):changeMob()
    __npc_list[A0_179] = nil
    __npc_task[A0_179] = nil
  end
end
function _setSwitchMob(A0_180, A1_181)
  local L2_182
  L2_182 = {}
  L2_182.divisionMask = Mob.Division.kHuman
  L2_182.selection = Mob.SwitchSelection.kNpc
  L2_182.method = Mob.SwitchMethod.kPlayerRange
  L2_182.playerRangeDistance = 2
  L2_182.playerRangeDegree = 180
  L2_182.keepInCameraSec = 1
  if A1_181 then
    L2_182.divisionMask = A1_181.grigo and Mob.Division.kGrigo or Mob.Division.kHuman
    L2_182.selection = A1_181.enemy and Mob.SwitchSelection.kEnemy or Mob.SwitchSelection.kNpc
    L2_182.playerRangeDistance = A1_181.range or 2
    L2_182.playerRangeDegree = A1_181.degree or 180
    L2_182.keepInCameraSec = A1_181.time or 1
    if A1_181.enemy then
      L2_182.divisionMask = bit32.bor(Mob.Division.kGrigo, Mob.Division.kHuman)
    end
    if A1_181.grab then
      L2_182.method = Mob.SwitchMethod.kAfterGrabbed
    elseif A1_181.gesture then
      L2_182.method = Mob.SwitchMethod.kAfterNavigation
    end
  end
  Mob:setSwitchOutEnv(A0_180, L2_182)
  Mob:letStateMode(Mob.StateMode.kSwitchOut, true)
end
__change_mob_cnt = 1
__change_mob_obj = nil
function Fn_createChangeMobToNpc(A0_183, A1_184)
  if __change_mob_obj == nil then
    __change_mob_obj = createGameObject2("ChangeMobToNpc")
    __change_mob_obj:setName("toNpcObj")
    __change_mob_obj:try_init()
    __change_mob_obj:waitForReady()
    __change_mob_obj:try_start()
    __change_mob_obj:setEventListener("mobToNpc", function(A0_185)
      local L1_186, L2_187, L3_188, L4_189
      L1_186 = "mtn_"
      L2_187 = A0_185.label
      L3_188 = "_"
      L4_189 = string
      L4_189 = L4_189.format
      L4_189 = L4_189("%02d", __change_mob_cnt)
      L1_186 = L1_186 .. L2_187 .. L3_188 .. L4_189
      L2_187 = A1_184
      if L2_187 then
        L2_187 = A1_184.attach
      else
        L2_187 = L2_187 or false
      end
      L3_188 = {}
      L3_188.name = L1_186
      L3_188.attach = L2_187
      L3_188.start = true
      L3_188.mob_to_npc = true
      L4_189 = A0_185.label
      L3_188.type = L4_189
      L4_189 = A0_185.pos
      L3_188.pos = L4_189
      L4_189 = A0_185.rot
      L3_188.rot = L4_189
      L4_189 = A0_185.color
      L3_188.color_variation = L4_189
      L4_189 = A0_185.hair
      L3_188.hair_variation = L4_189
      L4_189 = A0_185.face
      L3_188.face_tex_name = L4_189
      L4_189 = Fn_setupNpc
      L4_189 = L4_189({L3_188}, true)
      L4_189[L1_186]:try_init()
      invokeTask(function()
        L4_189[L1_186]:waitForReady()
        L4_189[L1_186]:try_start()
        if A0_183 ~= nil then
          table.insert(A0_183, {
            name = L1_186,
            handle = L4_189[L1_186],
            pawnId = A0_185.pawnId
          })
        end
      end)
      A0_185.npcgen = L4_189[L1_186]
      __change_mob_cnt = __change_mob_cnt + 1
      return A0_185
    end)
  else
    print("mob\227\130\146npc\227\129\171\229\136\135\227\130\138\230\155\191\227\129\136\227\130\139\227\130\170\227\131\150\227\130\184\227\130\167\227\130\175\227\131\136\227\129\175\231\148\159\230\136\144\227\129\151\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\232\168\173\229\174\154\227\129\160\227\129\145\229\164\137\230\155\180\227\129\151\227\129\190\227\129\153\227\128\130")
  end
  if A1_184 then
    A1_184.enemy = false
  end
  _setSwitchMob(__change_mob_obj, A1_184)
end
function Fn_createChangeMobToEnemy(A0_190, A1_191)
  local L2_192, L3_193
  L2_192 = findGameObject2
  L3_193 = "EnemyGenerator"
  L2_192 = L2_192(L3_193, A0_190)
  if L2_192 then
    L3_193 = {}
    L3_193.enemy = true
    L3_193.grigo = true
    if A1_191 then
      L3_193 = A1_191
      L3_193.enemy = true
      L3_193.grigo = true
    end
    _setSwitchMob(L2_192, L3_193)
  else
    L3_193 = print
    L3_193("\227\130\168\227\131\141\227\131\159\227\131\188\227\130\184\227\130\167\227\131\141\227\131\172\227\131\188\227\130\191\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\174\227\129\167\229\136\135\227\130\138\230\155\191\227\129\136\227\130\137\227\130\140\227\129\190\227\129\155\227\130\147")
  end
end
function Fn_killChangeMob()
  if __change_mob_obj then
    __change_mob_obj:try_term()
    __change_mob_obj = nil
  end
  Mob:letStateMode(Mob.StateMode.kSwitchOut, false)
end
Fn_killChangeMobToNpc = Fn_killChangeMob
function Fn_disappearMobToNpc(A0_194, A1_195)
  local L2_196
  L2_196 = Fn_findNpc
  L2_196 = L2_196(A0_194)
  if L2_196 ~= nil then
    Fn_disappearNpc(A0_194, A1_195)
    if __change_mob_obj then
      __change_mob_obj:delete(L2_196)
    end
    L2_196 = nil
  end
end
function Fn_termNpcProps(A0_197)
  local L1_198
  L1_198 = findGameObjects
  L1_198 = L1_198("GimmickBg", A0_197)
  for _FORV_5_, _FORV_6_ in pairs(L1_198) do
    if _FORV_6_:getParent() == nil then
      _FORV_6_:try_term()
    elseif _FORV_6_:getParent():getTypeName() == "Area" or _FORV_6_:getParent():getTypeName() == "EventData" then
      _FORV_6_:try_term()
    end
  end
  L1_198 = nil
end
function Fn_setSisDoll(A0_199)
  local L1_200, L2_201, L3_202
  L2_201 = A0_199
  L1_200 = A0_199.getName
  L1_200 = L1_200(L2_201)
  L2_201 = "cisisdoll01_base"
  L3_202 = createGameObject2
  L3_202 = L3_202("Puppet")
  L3_202:setName(L1_200 .. "_doll")
  L3_202:loadModel(L2_201)
  L3_202:loadBaseSkeleton(L2_201, L2_201)
  if A0_199:isStarted() then
    L3_202:try_init()
    L3_202:waitForReady()
    L3_202:try_start()
    A0_199:setProp("doll", L3_202)
  else
    invokeTask(function()
      while true do
        if A0_199:isStarted() then
          L3_202:try_init()
          L3_202:waitForReady()
          L3_202:try_start()
          A0_199:setProp("doll", L3_202)
          break
        end
        wait()
      end
    end)
  end
end
function Fn_setSisDollActive(A0_203, A1_204)
  local L2_205, L3_206
  L3_206 = A0_203
  L2_205 = A0_203.getName
  L2_205 = L2_205(L3_206)
  L3_206 = "_doll"
  L2_205 = L2_205 .. L3_206
  L3_206 = findGameObject2
  L3_206 = L3_206("Puppet", L2_205)
  if L3_206 == nil then
    L3_206 = __npc_sandbox_handle:findGameObject2("Puppet", L2_205)
  end
  if L3_206 then
    L3_206:setActive(A1_204)
    print("\229\164\169\228\189\191\228\186\186\229\189\162\227\129\174\229\136\135\227\130\138\230\155\191\227\129\136")
  else
    print("\229\164\169\228\189\191\228\186\186\229\189\162\227\129\175\229\173\152\229\156\168\227\129\151\227\129\190\227\129\155\227\130\147")
  end
end
function Fn_getRandamNpcType(A0_207)
  local L1_208
  L1_208 = __npc_randam_type
  L1_208 = L1_208[A0_207]
  if L1_208 == nil and __npc_sandbox_handle:getName() == "npcManager" then
    L1_208 = __npc_sandbox_handle:sendEvent("getNpcType", string.match(event_name, "(.-)_()") or event_name, A0_207)
  end
  return L1_208
end
function Fn_setSelfSandBoxNpcActive(A0_209)
  for _FORV_4_, _FORV_5_ in pairs(__npc_list) do
    _FORV_5_:setActive(A0_209)
  end
end
