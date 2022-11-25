import("Wind")
import("Camera")
dofile("/Game/Event2/Table/GmTable.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
GmBoss = {}
_playerEffect = nil
_isAttackMotion = false
_isGameOver = false
function GmBoss.create(A0_0, A1_1)
  local L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26
  L2_2 = {}
  L2_2.base = nil
  L3_3 = {}
  L2_2.chara = L3_3
  L3_3 = {}
  L2_2.part = L3_3
  L3_3 = {}
  L4_4 = {}
  L4_4.node = nil
  L4_4.eff = nil
  L4_4.eff2 = nil
  L4_4.se = nil
  L4_4.task = nil
  L3_3.absorption = L4_4
  L2_2.script = L3_3
  L3_3 = {}
  L3_3.f = "gmarmf01"
  L3_3.l = "gmarml01"
  L3_3.r = "gmarmr01"
  L3_3.b = "gmbody01"
  L2_2.labels = L3_3
  L3_3 = createGameObject2
  L4_4 = "Node"
  L3_3 = L3_3(L4_4)
  L2_2.base = L3_3
  L3_3 = L2_2.base
  L4_4 = L3_3
  L3_3 = L3_3.setName
  L3_3(L4_4, L5_5)
  L3_3 = Area
  L4_4 = L3_3
  L3_3 = L3_3.getWorldRoot
  L3_3 = L3_3(L4_4)
  if L3_3 then
    L4_4 = L3_3.appendChild
    L4_4(L5_5, L6_6)
  end
  if A0_0 then
    L4_4 = L2_2.base
    L4_4 = L4_4.setWorldTransform
    L8_8 = A0_0
    L26_26 = L6_6(L7_7)
    L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L6_6(L7_7))
  end
  L3_3 = nil
  L4_4 = {}
  for L8_8, L9_9 in L5_5(L6_6) do
    L12_12.name = L8_8
    L12_12.type = L8_8
    L12_12.node = L13_13
    L12_12.attach = false
    L12_12.use_gravity = false
    L12_12.disable_collision = true
    L10_10(L11_11, L12_12)
    L11_11.name = L8_8
    L11_11.npc = nil
    L11_11.puppet = nil
    L11_11.element = L12_12
    L11_11.disp = true
    L11_11.se_table = L12_12
    L11_11.se_task = nil
    L10_10[L8_8] = L11_11
    L11_11.speed = 1
    L11_11.hp = 0
    L11_11.player_place = L12_12
    L11_11.speed_control_task = nil
    L11_11.sensor_ref_counter = 0
    L11_11.set_speed = 1
    L10_10[L8_8] = L11_11
  end
  L6_6.gmarml01 = "bn_arm_l"
  L6_6.gmarmr01 = "bn_arm_r"
  L6_6.gmarmf01 = "bn_arm_f"
  L8_8 = nil
  for L12_12, L13_13 in L9_9(L10_10) do
    L15_15 = L14_14
    L15_15 = L5_5[L12_12]
    if L12_12 == "gmbody01" then
      L16_16(L17_17, L18_18)
      L16_16.node = L17_17
      L16_16(L17_17, L18_18, L19_19)
      L20_20 = -35
      L21_21 = 0
      L26_26 = L18_18(L19_19, L20_20, L21_21)
      L16_16(L17_17, L18_18, L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L18_18(L19_19, L20_20, L21_21))
    else
      L20_20 = L6_6[L12_12]
      L17_17(L18_18, L19_19, L20_20)
    end
    if L14_14 then
      L16_16.puppet = L14_14
      L16_16.npc = L15_15
      for L19_19, L20_20 in L16_16(L17_17) do
        L21_21 = L20_20[1]
        L22_22 = L20_20[2]
        if L12_12 == "gmbody01" then
          L23_23 = "gm_bodyarea_b_01"
        elseif not L23_23 then
          L23_23 = L22_22
          L24_24 = string
          L24_24 = L24_24.sub
          L25_25 = L20_20[1]
          L26_26 = string
          L26_26 = L26_26.len
          L26_26 = L26_26(L20_20[1])
          L26_26 = L26_26 - 4
          L24_24 = L24_24(L25_25, L26_26, string.len(L20_20[1]))
          L23_23 = L23_23 .. L24_24
        end
        L24_24 = createGameObject2
        L25_25 = "Node"
        L24_24 = L24_24(L25_25)
        L26_26 = L24_24
        L25_25 = L24_24.setName
        L25_25(L26_26, L23_23)
        L26_26 = L24_24
        L25_25 = L24_24.setPos
        L25_25(L26_26, Vector(0, 0, 0))
        L26_26 = L24_24
        L25_25 = L24_24.setForceMove
        L25_25(L26_26)
        L26_26 = L24_24
        L25_25 = L24_24.try_init
        L25_25(L26_26)
        L26_26 = L24_24
        L25_25 = L24_24.waitForReady
        L25_25(L26_26)
        L26_26 = L14_14
        L25_25 = L14_14.appendChildToJoint
        L25_25(L26_26, L24_24, L21_21)
        L25_25 = table
        L25_25 = L25_25.insert
        L26_26 = L2_2.chara
        L26_26 = L26_26[L12_12]
        L26_26 = L26_26.se_table
        L25_25(L26_26, L24_24)
        L25_25 = createGameObject2
        L26_26 = "AreaRegularBg"
        L25_25 = L25_25(L26_26)
        L26_26 = L25_25.setName
        L26_26(L25_25, L23_23 .. "_high")
        L26_26 = L25_25.setModelName
        L26_26(L25_25, L22_22)
        L26_26 = L25_25.setVisible
        L26_26(L25_25, false)
        L26_26 = L25_25.setActive
        L26_26(L25_25, false)
        L26_26 = L24_24.appendChild
        L26_26(L24_24, L25_25)
        L26_26 = nil
        L26_26 = createGameObject2("AreaRegularBg")
        L26_26:setName(L23_23 .. "_low")
        L26_26:setModelName(L22_22 .. "_low")
        L26_26:setVisible(false)
        L26_26:setActive(false)
        L24_24:appendChild(L26_26)
        table.insert(L2_2.chara[L12_12].element, {
          name = L23_23,
          hdl = L25_25,
          low_hdl = L26_26,
          node = L24_24
        })
        L2_2.script[L12_12].player_place[L23_23] = false
        if L12_12 == "gmbody01" then
          L24_24:try_start()
          L8_8 = L24_24
          L25_25:try_init()
          L25_25:waitForReady()
          L25_25:try_start()
        end
      end
    end
  end
  for L12_12, L13_13 in L9_9(L10_10) do
    L15_15 = "Node"
    L15_15 = L14_14.setName
    L15_15(L16_16, L17_17)
    L15_15 = L8_8.appendChild
    L15_15(L16_16, L17_17)
    L15_15 = createGameObject2
    L15_15 = L15_15(L16_16)
    L16_16(L17_17, L18_18)
    L16_16(L17_17, L18_18)
    L16_16(L17_17, L18_18)
    L16_16(L17_17, L18_18)
    L16_16(L17_17, L18_18)
    L20_20 = "_low"
    L17_17(L18_18, L19_19)
    L20_20 = "_low"
    L17_17(L18_18, L19_19)
    L17_17(L18_18, L19_19)
    L17_17(L18_18, L19_19)
    L17_17(L18_18, L19_19)
    L17_17.node = L14_14
    L17_17.high = L15_15
    L17_17.low = L16_16
    L20_20 = 0
    L21_21 = 0
    L17_17.pos = L18_18
    L20_20 = L17_17
    L18_18(L19_19, L20_20)
    L20_20 = L15_15
    L18_18(L19_19, L20_20)
    L20_20 = L16_16
    L18_18(L19_19, L20_20)
    L21_21 = L7_7
    L20_20 = L7_7.getNodeLocalPosRot
    L22_22 = L13_13
    L26_26 = L20_20(L21_21, L22_22)
    L18_18(L19_19, L20_20, L21_21, L22_22, L23_23, L24_24, L25_25, L26_26, L20_20(L21_21, L22_22))
  end
  if A1_1 then
    if L9_9 ~= nil then
      L10_10(L11_11)
      L15_15 = L10_10
      L12_12(L13_13)
      L12_12(L13_13)
      for L15_15, L16_16 in L12_12(L13_13) do
        for L20_20, L21_21 in L17_17(L18_18) do
          L22_22 = findGameObject2
          L23_23 = "EventData"
          L24_24 = "evarea2_"
          L25_25 = L21_21.name
          L24_24 = L24_24 .. L25_25
          L22_22 = L22_22(L23_23, L24_24)
          if L22_22 then
            L23_23 = L21_21.node
            L24_24 = L23_23
            L23_23 = L23_23.appendChild
            L25_25 = L22_22
            L23_23(L24_24, L25_25)
          end
        end
      end
    end
  end
  L9_9(L10_10)
  return L2_2
end
function GmBoss.createPlaceSensor(A0_27)
  local L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40
  if not L1_28 then
    return L1_28
  end
  for L4_31, L5_32 in L1_28(L2_29) do
    for L9_36, L10_37 in L6_33(L7_34) do
      L11_38 = L4_31
      L12_39 = "_OnEnter"
      L11_38 = L11_38 .. L12_39
      L12_39 = L4_31
      L13_40 = "_OnLeave"
      L12_39 = L12_39 .. L13_40
      L13_40 = _G
      L13_40[L11_38] = function(A0_41)
        A0_27.script[L4_31].sensor_ref_counter = A0_27.script[L4_31].sensor_ref_counter + 1
        print(string.format(" %s \227\129\171\229\133\165\227\129\163\227\129\159:%d", L4_31, A0_27.script[L4_31].sensor_ref_counter))
        A0_27:setPlayerPlace(L4_31, L10_37.name, true)
      end
      L13_40 = _G
      L13_40[L12_39] = function(A0_42)
        A0_27.script[L4_31].sensor_ref_counter = A0_27.script[L4_31].sensor_ref_counter - 1
        print(string.format(" %s \227\129\139\227\130\137\229\135\186\227\129\159:%d", L4_31, A0_27.script[L4_31].sensor_ref_counter))
        A0_27:setPlayerPlace(L4_31, L10_37.name, false)
      end
      L13_40 = createGameObject2
      L13_40 = L13_40("PlayerSensor")
      L13_40:setName("sensor_" .. L10_37.name)
      L13_40:setDetectBehavior(1)
      L13_40:addBox(Vector(50, 50, 50))
      L13_40:setOnEnter(L11_38)
      L13_40:setOnLeave(L12_39)
      L13_40:try_init()
      L13_40:waitForReady()
      L13_40:try_start()
      L10_37.node:appendChild(L13_40)
      L13_40:setActive(false)
      L10_37.sensor = L13_40
      break
    end
    break
  end
end
function GmBoss.setDispFlag(A0_43, A1_44, A2_45)
  if not GmBoss._isValid(A0_43) then
    return false
  end
  A0_43.chara[A0_43.labels[A1_44]].disp = A2_45
end
function GmBoss.getDispFlag(A0_46, A1_47)
  local L2_48, L3_49
  L2_48 = A0_46.chara
  L3_49 = A0_46.labels
  L3_49 = L3_49[A1_47]
  L2_48 = L2_48[L3_49]
  L2_48 = L2_48.disp
  return L2_48
end
function GmBoss.createArmObject(A0_50, A1_51)
  local L2_52, L3_53, L4_54, L5_55, L6_56, L7_57, L8_58, L9_59, L10_60, L11_61, L12_62
  L2_52 = A0_50.labels
  L2_52 = L2_52[A1_51]
  L3_53 = gm_list
  L3_53 = L3_53[L2_52]
  for L7_57, L8_58 in L4_54(L5_55) do
    L9_59 = L8_58[2]
    L10_60 = key
    if L10_60 == "gmbody01" then
      L10_60 = "gm_bodyarea_b_01"
    elseif not L10_60 then
      L10_60 = L9_59
      L11_61 = string
      L11_61 = L11_61.sub
      L12_62 = L8_58[1]
      L11_61 = L11_61(L12_62, string.len(L8_58[1]) - 4, string.len(L8_58[1]))
      L10_60 = L10_60 .. L11_61
    end
    L11_61 = A0_50.chara
    L11_61 = L11_61[L2_52]
    L11_61 = L11_61.element
    L11_61 = L11_61[L7_57]
    L11_61 = L11_61.node
    L12_62 = L11_61
    L11_61 = L11_61.setPos
    L11_61(L12_62, Vector(0, 0, 0))
    L11_61 = createGameObject2
    L12_62 = "AreaRegularBg"
    L11_61 = L11_61(L12_62)
    L12_62 = L11_61.setName
    L12_62(L11_61, L10_60)
    L12_62 = L11_61.setModelName
    L12_62(L11_61, L9_59)
    L12_62 = L11_61.setEventRange
    L12_62(L11_61, 50)
    L12_62 = L11_61.setVisible
    L12_62(L11_61, false)
    L12_62 = L11_61.setActive
    L12_62(L11_61, false)
    L12_62 = L11_61.try_init
    L12_62(L11_61)
    L12_62 = L11_61.waitForReady
    L12_62(L11_61)
    L12_62 = L11_61.try_start
    L12_62(L11_61)
    L12_62 = nil
    L12_62 = createGameObject2("AreaRegularBg")
    L12_62:setName(L10_60 .. "_low")
    L12_62:setModelName(L9_59 .. "_low")
    L12_62:setEventRange(50)
    L12_62:setVisible(false)
    L12_62:setActive(false)
    L12_62:try_init()
    L12_62:waitForReady()
    L12_62:try_start()
    A0_50.chara[L2_52].element[L7_57].node:appendChild(L11_61)
    A0_50.chara[L2_52].element[L7_57].node:appendChild(L12_62)
    A0_50.chara[L2_52].element[L7_57].hdl = L11_61
    A0_50.chara[L2_52].element[L7_57].low_hdl = L12_62
  end
end
function GmBoss.run(A0_63)
  if not GmBoss._isValid(A0_63) then
    return false
  end
  _isGameOver = false
  A0_63:createPlaceSensor()
  for _FORV_4_, _FORV_5_ in pairs(A0_63.chara) do
    if _FORV_5_.disp then
      for _FORV_9_, _FORV_10_ in ipairs(_FORV_5_.element) do
        while _FORV_10_.hdl:isLoading() do
          wait()
        end
        _FORV_10_.hdl:setVisible(true)
        _FORV_10_.hdl:setActive(true)
        while _FORV_10_.low_hdl:isLoading() do
          wait()
        end
        _FORV_10_.low_hdl:setVisible(false)
        _FORV_10_.low_hdl:setActive(true)
        if _FORV_10_.sensor ~= nil then
          _FORV_10_.sensor:setActive(true)
        end
        A0_63:addArmEffect("ef_ev_brkpar_04", _FORV_10_.node, false)
      end
      if Sound:isPlayingSEHandle(_FORV_5_.se_task) == 1 then
        stopSEHandle(_FORV_5_.se_task)
        _FORV_5_.se_task = nil
      end
      _FORV_5_.se_task = Sound:playSEHandleLineStrips("ene_gc_body", 1, nil, _FORV_5_.se_table)
    end
  end
  for _FORV_4_, _FORV_5_ in pairs(A0_63.part) do
    while _FORV_5_.high:isLoading() do
      wait()
    end
    _FORV_5_.high:setVisible(true)
    _FORV_5_.high:setActive(true)
    while _FORV_5_.low:isLoading() do
      wait()
    end
    _FORV_5_.low:setVisible(false)
    _FORV_5_.low:setActive(true)
    _FORV_5_.pos = GmBoss._shallowCopy(_FORV_5_.high:getPos())
  end
  A0_63:setMotionSpeedManager(true)
  A0_63:buildingMoveManager()
  A0_63:partsLODManager()
end
function GmBoss.setMotionSpeedManager(A0_64, A1_65)
  local L2_66, L3_67, L4_68, L5_69
  if A1_65 then
    for L5_69, _FORV_6_ in L2_66(L3_67) do
      if A0_64.script[L5_69].motion_speed_task ~= nil then
        A0_64.script[L5_69].motion_speed_task:abort()
        A0_64.script[L5_69].motion_speed_task = nil
      end
      A0_64.script[L5_69].motion_speed_task = invokeTask(function()
        while true do
          if A0_64.script[L5_69].sensor_ref_counter > 0 then
            if 0 < A0_64.script[L5_69].speed then
              A0_64.script[L5_69].speed = A0_64.script[L5_69].speed - 0.01
              if 0 > A0_64.script[L5_69].speed then
                A0_64.script[L5_69].speed = 0
              end
            end
          elseif A0_64.script[L5_69].speed < A0_64.script[L5_69].set_speed then
            A0_64.script[L5_69].speed = A0_64.script[L5_69].speed + 0.01
            if A0_64.script[L5_69].speed > A0_64.script[L5_69].set_speed then
              A0_64.script[L5_69].speed = A0_64.script[L5_69].set_speed
            end
          elseif A0_64.script[L5_69].speed > A0_64.script[L5_69].set_speed then
            A0_64.script[L5_69].speed = A0_64.script[L5_69].speed - 0.01
            if A0_64.script[L5_69].speed < A0_64.script[L5_69].set_speed then
              A0_64.script[L5_69].speed = A0_64.script[L5_69].set_speed
            end
          end
          A0_64.chara[L5_69].npc:setPlayMotionSpeed(A0_64.script[L5_69].speed)
          wait()
        end
      end)
      break
    end
  else
    for L5_69, _FORV_6_ in L2_66(L3_67) do
      if A0_64.script[L5_69].motion_speed_task ~= nil then
        A0_64.script[L5_69].motion_speed_task:abort()
        A0_64.script[L5_69].motion_speed_task = nil
      end
    end
  end
end
function GmBoss.partsLODManager(A0_70)
  local L1_71, L2_72
  L1_71 = 120
  L2_72 = 200
  return invokeTask(function()
    local L0_73, L1_74, L2_75, L3_76, L4_77, L5_78, L6_79, L7_80, L8_81, L9_82, L10_83, L11_84
    while true do
      L0_73 = L1_71
      for L4_77, L5_78 in L1_74(L2_75) do
        if L5_78 == "gmbody01" then
          L0_73 = L2_72
        end
        if L6_79 then
          for L9_82, L10_83 in L6_79(L7_80) do
            L11_84 = Fn_getDistanceToPlayer
            L11_84 = L11_84(L10_83.node)
            if L0_73 > L11_84 then
              L11_84 = true
            else
              L11_84 = L11_84 or false
            end
            if L10_83.hdl:getVisible() ~= L11_84 then
              L10_83.hdl:setVisible(L11_84)
              L10_83.low_hdl:setVisible(not L11_84)
            end
          end
        end
      end
      for L4_77, L5_78 in L1_74(L2_75) do
        if L7_80 < L8_81 then
        else
        end
        L9_82 = L8_81
        if L8_81 ~= L7_80 then
          L9_82 = L8_81
          L10_83 = L7_80
          L8_81(L9_82, L10_83)
          L9_82 = L8_81
          L10_83 = not L7_80
          L8_81(L9_82, L10_83)
        end
      end
      L1_74()
    end
  end)
end
function GmBoss.buildingMoveManager(A0_85)
  local L1_86, L2_87
  L1_86 = 2000
  L2_87 = {
    3,
    10,
    3,
    7.5,
    10,
    7.5
  }
  return invokeTask(function()
    local L0_88, L1_89, L2_90, L3_91, L4_92, L5_93, L6_94, L7_95, L8_96, L9_97, L10_98, L11_99
    L0_88 = 0
    while true do
      for L4_92, L5_93 in L1_89(L2_90) do
        L6_94 = L5_93.node
        L7_95 = L6_94
        L6_94 = L6_94.getName
        L6_94 = L6_94(L7_95)
        L7_95 = tonumber
        L8_96 = string
        L8_96 = L8_96.sub
        L9_97 = L6_94
        L10_98 = -1
        L11_99 = L8_96(L9_97, L10_98)
        L7_95 = L7_95(L8_96, L9_97, L10_98, L11_99, L8_96(L9_97, L10_98))
        L8_96 = L7_95 - 1
        L8_96 = 350 * L8_96
        L8_96 = L0_88 - L8_96
        L9_97 = L8_96 * 360
        L10_98 = L1_86
        L9_97 = L9_97 / L10_98
        L10_98 = L2_87[L7_95]
        L11_99 = Sin
        L11_99 = L11_99(Deg2Rad(L9_97))
        L10_98 = L10_98 * L11_99
        L11_99 = L2_87[L7_95]
        L10_98 = L10_98 - L11_99
        L11_99 = GmBoss
        L11_99 = L11_99._shallowCopy
        L11_99 = L11_99(L5_93.pos)
        L11_99.y = L11_99.y + L10_98
        L5_93.high:setPos(L11_99)
        L5_93.low:setPos(L11_99)
      end
      L0_88 = L0_88 + 1
      if L0_88 >= L1_89 then
        L0_88 = 0
      end
      L1_89()
    end
  end)
end
function GmBoss._isValid(A0_100)
  local L1_101
  if A0_100 == nil then
    L1_101 = false
    return L1_101
  end
  L1_101 = true
  return L1_101
end
function GmBoss._installMethods(A0_102)
  local L1_103, L2_104, L3_105, L4_106, L5_107
  for L4_106, L5_107 in L1_103(L2_104) do
    if type(L5_107) == "function" then
      A0_102[L4_106] = L5_107
    end
  end
end
function GmBoss._shallowCopy(A0_108)
  if type(A0_108) ~= "table" then
    return A0_108
  end
  for _FORV_5_, _FORV_6_ in pairs(A0_108) do
    ;({})[_FORV_5_] = _FORV_6_
  end
  return {}
end
function GmBoss.setWorldPos(A0_109, A1_110)
  A0_109.base:setWorldPos(A1_110)
  A0_109.base:setForceMove()
end
function GmBoss.getWorldPos(A0_111)
  return A0_111.base:getWorldPos()
end
function GmBoss.setWorldRot(A0_112, A1_113)
  A0_112.base:setWorldRot(A1_113)
  A0_112.base:setForceMove()
end
function GmBoss.getWorldRot(A0_114)
  return A0_114.base:getWorldRot()
end
function GmBoss.setWorldTransform(A0_115, A1_116, A2_117)
  A0_115.base:setWorldTransform(A1_116, A2_117)
  A0_115.base:setForceMove()
end
function GmBoss.setHp(A0_118, A1_119, A2_120)
  local L3_121, L4_122, L5_123
  L3_121 = false
  L4_122 = false
  L5_123 = A0_118.labels
  L5_123 = L5_123[A1_119]
  if L5_123 then
    if A0_118.script[L5_123].hp <= 0 then
      print("\227\129\153\227\129\167\227\129\171\230\173\187\227\130\147\227\129\167\227\129\132\227\130\139")
      L4_122 = true
    else
      print("\227\129\190\227\129\160\231\148\159\227\129\141\227\129\166\227\129\132\227\130\139")
      L4_122 = false
    end
    A0_118.script[L5_123].hp = A2_120
    print(string.format("Hp\227\130\146\227\130\187\227\131\131\227\131\136:%s = %d", L5_123, A2_120))
  end
  if A2_120 <= 0 and not L4_122 then
    print("\232\133\149\227\130\146\229\163\138\227\129\153")
    invokeTask(function()
      A0_118:brokenArm(A1_119)
    end)
    return false
  end
  return true
end
function GmBoss.getHp(A0_124, A1_125)
  local L2_126, L3_127
  L2_126 = A0_124.labels
  L2_126 = L2_126[A1_125]
  if L2_126 then
    L3_127 = A0_124.script
    L3_127 = L3_127[L2_126]
    L3_127 = L3_127.hp
    return L3_127
  end
  L3_127 = -1
  return L3_127
end
function GmBoss.setPlayerPlace(A0_128, A1_129, A2_130, A3_131)
  local L4_132, L5_133
  L4_132 = A0_128.labels
  L4_132 = L4_132[A1_129]
  if L4_132 then
    L5_133 = A0_128.script
    L5_133 = L5_133[L4_132]
    L5_133 = L5_133.player_place
    L5_133[A2_130] = A3_131
  end
end
function GmBoss.getPlayerPlace(A0_134)
  local L1_135, L2_136, L3_137, L4_138, L5_139, L6_140, L7_141, L8_142, L9_143
  for L4_138, L5_139 in L1_135(L2_136) do
    for L9_143, _FORV_10_ in L6_140(L7_141) do
      if _FORV_10_ then
        return L4_138, L9_143
      end
    end
  end
  return L1_135, L2_136
end
function GmBoss.setActive(A0_144, A1_145, A2_146)
  local L3_147
  L3_147 = A0_144.labels
  L3_147 = L3_147[A1_145]
  if L3_147 then
    A0_144.chara[L3_147].puppet:setActive(A2_146)
    if Sound:isPlayingSEHandle(A0_144.chara[L3_147].se_task) == 1 then
      stopSEHandle(A0_144.chara[L3_147].se_task)
      A0_144.chara[L3_147].se_task = nil
    end
    if A2_146 then
      A0_144.chara[L3_147].se_task = Sound:playSEHandleLineStrips("ene_gc_body", 1, nil, A0_144.chara[L3_147].se_table)
    end
  end
end
function GmBoss.appearanceArm(A0_148, A1_149, A2_150)
  local L3_151, L4_152, L5_153, L6_154, L7_155, L8_156, L9_157
  L3_151 = A0_148.labels
  L3_151 = L3_151[A1_149]
  L4_152 = {}
  L5_153(L6_154, L7_155)
  L5_153(L6_154, L7_155, L8_156)
  L9_157 = 0
  L5_153(L6_154, L7_155, L8_156, L9_157)
  if L3_151 then
    if A2_150 then
      L9_157 = nil
      L5_153(L6_154, L7_155, L8_156, L9_157, A0_148.chara[L3_151].puppet)
    end
    for L9_157, _FORV_10_ in L6_154(L7_155) do
      while _FORV_10_.hdl:isLoading() do
        wait()
      end
      if _FORV_10_.hdl:isEffectiveness() then
        _FORV_10_.hdl:setVisible(true)
        _FORV_10_.hdl:setActive(true)
      else
        _FORV_10_.hdl:setEffectiveness(true, false)
      end
      if _FORV_10_.low_hdl:isEffectiveness() then
        _FORV_10_.low_hdl:setVisible(false)
        _FORV_10_.low_hdl:setActive(true)
      else
        _FORV_10_.low_hdl:setEffectiveness(true, false)
      end
      if _FORV_10_.sensor ~= nil then
        _FORV_10_.sensor:setActive(true)
      end
      L4_152[L9_157] = {}
      L4_152[L9_157] = createEffectAroundTarget(_FORV_10_.node, 3, "ef_ev_brkpar_05", 25)
    end
  end
  L5_153(L6_154, L7_155, L8_156)
  if L5_153 == 1 then
    L5_153(L6_154)
    L5_153.se_task = nil
  end
  L9_157 = 1
  L5_153.se_task = L6_154
  repeat
    L5_153()
  until L5_153
  L5_153(L6_154, L7_155, L8_156)
  L9_157 = 1
  L5_153(L6_154, L7_155, L8_156, L9_157)
  L5_153(L6_154, L7_155)
  for L8_156, L9_157 in L5_153(L6_154) do
    for _FORV_13_, _FORV_14_ in pairs(L9_157) do
      _FORV_14_:setEmitStop(true)
    end
  end
end
function GmBoss.brokenArm(A0_158, A1_159, A2_160)
  local L3_161, L4_162, L5_163, L6_164, L7_165, L8_166, L9_167, L10_168
  L3_161 = A0_158.labels
  L3_161 = L3_161[A1_159]
  L4_162 = {}
  if L5_163 == 1 then
    L5_163(L6_164, L7_165)
    L5_163.se_task = nil
  end
  L8_166 = 0.2
  L5_163(L6_164, L7_165, L8_166)
  L8_166 = "dead_00"
  L9_167 = 1
  L5_163(L6_164, L7_165, L8_166, L9_167)
  L5_163(L6_164)
  for L8_166 = 1, #L6_164 do
    L9_167 = A0_158.chara
    L9_167 = L9_167[L3_161]
    L9_167 = L9_167.element
    L9_167 = #L9_167
    L9_167 = L9_167 - L8_166
    L9_167 = L9_167 + 1
    L10_168 = A0_158.chara
    L10_168 = L10_168[L3_161]
    L10_168 = L10_168.element
    L10_168 = L10_168[L9_167]
    L4_162[L8_166] = {}
    L4_162[L8_166] = createEffectAroundTarget(L10_168.node, 3, "ef_ev_brkpar_05", 25)
    Sound:playSE("ene_gc_arm_fall", 1, nil, L10_168.hdl)
    invokeTask(function()
      local L0_169, L1_170, L2_171
      L0_169 = waitSeconds
      L1_170 = L8_166
      L1_170 = L1_170 * 1
      L0_169(L1_170)
      L0_169 = print
      L1_170 = string
      L1_170 = L1_170.format
      L2_171 = "%s\227\130\146\232\144\189\228\184\139\227\129\149\227\129\155\227\129\190\227\129\153"
      L2_171 = L1_170(L2_171, L10_168.hdl:getName())
      L0_169(L1_170, L2_171, L1_170(L2_171, L10_168.hdl:getName()))
      L0_169 = 0
      L1_170 = 0
      L2_171 = L10_168.node
      L2_171 = L2_171.getWorldPos
      L2_171 = L2_171(L2_171)
      while true do
        if L0_169 < 0.6 then
          L1_170 = -9.80665 * L0_169 * L0_169 / 10
        elseif L0_169 < 3.2 then
          L1_170 = -9.80665 * L0_169 / 10
        else
          L1_170 = -3.138128
        end
        if L0_169 > 3.2 then
          for _FORV_6_, _FORV_7_ in ipairs(L4_162[L8_166]) do
            _FORV_7_:setEmitStop(true)
          end
          if L10_168.hdl:isEffectiveness() then
            print("Effectiveness\227\130\146\231\132\161\229\138\185\227\129\171\227\129\151\227\129\190\227\129\153:" .. L10_168.hdl:getName())
            L10_168.hdl:setEffectiveness(false)
          end
          if L10_168.low_hdl:isEffectiveness() then
            print("Effectiveness\227\130\146\231\132\161\229\138\185\227\129\171\227\129\151\227\129\190\227\129\153:" .. L10_168.low_hdl:getName())
            L10_168.low_hdl:setEffectiveness(false)
          end
        end
        if not (L0_169 > 4) then
          L2_171 = L2_171 + Vector(0, L1_170, 0)
          L0_169 = L0_169 + 0.01
          L10_168.node:setWorldPos(L2_171)
          wait()
        end
      end
      print(string.format("%s\227\130\146\230\182\136\227\129\151\227\129\190\227\129\153", L10_168.hdl:getName()))
      L10_168.hdl:try_term()
      L10_168.hdl = nil
      L10_168.low_hdl:try_term()
      L10_168.low_hdl = nil
      if L10_168.sensor ~= nil then
        L10_168.sensor:setActive(false)
      end
    end)
    do break end
    break
  end
  if L3_161 then
    if A2_160 then
      L8_166 = 1
      L9_167 = nil
      L10_168 = A0_158.chara
      L10_168 = L10_168[L3_161]
      L10_168 = L10_168.puppet
      L5_163(L6_164, L7_165, L8_166, L9_167, L10_168)
    end
    L8_166 = 1
    L9_167 = nil
    L10_168 = A0_158.chara
    L10_168 = L10_168[L3_161]
    L10_168 = L10_168.puppet
    L6_164(L7_165)
  else
  end
  L8_166 = false
  L5_163(L6_164, L7_165, L8_166)
end
function GmBoss.isArmBrokenAll(A0_172)
  return A0_172:isArmBroken("f") and A0_172:isArmBroken("r") and A0_172:isArmBroken("l")
end
function GmBoss.isArmBroken(A0_173, A1_174)
  return not A0_173:getDispFlag(A1_174)
end
function GmBoss.addArmEffect(A0_175, A1_176, A2_177, A3_178)
  local L4_179
  L4_179 = createGameObject2
  L4_179 = L4_179("Effect")
  L4_179:setName(A1_176)
  L4_179:setModelName(A1_176)
  A2_177:appendChild(L4_179)
  L4_179:try_init()
  L4_179:waitForReady()
  L4_179:try_start()
  L4_179:setActive(true)
  L4_179:setLoop(A3_178)
  L4_179:play()
  return L4_179
end
function GmBoss.attackArm(A0_180, A1_181)
  local L2_182
  L2_182 = _isAttackMotion
  if L2_182 then
    return
  end
  _isAttackMotion = true
  L2_182 = A0_180.labels
  L2_182 = L2_182[A1_181]
  A0_180:setMotionSpeedManager(false)
  A0_180:setMotionSpeed("r", 0.05)
  A0_180:setMotionSpeed("l", 0.05)
  A0_180:setMotionSpeed("f", 0.05)
  A0_180:setMotionSpeed("b", 0.05)
  A0_180:playMotionAll(string.format("attack_%s_00", A1_181), 1)
  Sound:playSE("ep11_ghost_scream", 1, nil, A0_180.chara[L2_182].puppet)
  Sound:playSE("ene_gc_arm_whoosh", 1, nil, A0_180.chara[L2_182].puppet)
  invokeTask(function()
    repeat
      wait()
    until _gm:isMotionEnd(A1_181)
    print("\230\148\187\230\146\131\231\181\130\227\130\143\227\130\138")
    A0_180:setMotionSpeed("r", 0.3)
    A0_180:setMotionSpeed("l", 0.3)
    A0_180:setMotionSpeed("f", 0.3)
    A0_180:setMotionSpeed("b", 0.3)
    A0_180:playMotionAll("stay", 1)
    A0_180:setMotionSpeedManager(true)
    _isAttackMotion = false
  end)
end
function GmBoss.playSE(A0_183, A1_184, A2_185, A3_186)
  local L4_187
  L4_187 = A0_183.labels
  L4_187 = L4_187[A1_184]
  Sound:playSE(A2_185, A3_186, nil, A0_183.chara[L4_187].puppet)
end
function GmBoss.stopBodySE(A0_188)
  for _FORV_4_, _FORV_5_ in pairs(A0_188.chara) do
    if _FORV_5_.disp and _FORV_5_.se_task ~= nil then
      Sound:stopSEHandle(_FORV_5_.se_task)
      _FORV_5_.se_task = nil
    end
  end
end
function GmBoss.playMotion(A0_189, A1_190, A2_191, A3_192)
  local L4_193
  L4_193 = A0_189.labels
  L4_193 = L4_193[A1_190]
  if L4_193 then
    A0_189.chara[L4_193].npc:playMotion(A2_191, {
      animSpeed = A0_189.script[L4_193].set_speed,
      animBlendDuration = A3_192 or -1
    })
  end
end
function GmBoss.playMotionAll(A0_194, A1_195, A2_196)
  for _FORV_6_, _FORV_7_ in pairs(A0_194.chara) do
    _FORV_7_.npc:playMotion(A1_195, {
      animSpeed = A0_194.script[_FORV_6_].set_speed,
      animBlendDuration = A2_196 or -1
    })
  end
end
function GmBoss.isMotionEnd(A0_197, A1_198)
  local L2_199
  L2_199 = A0_197.labels
  L2_199 = L2_199[A1_198]
  if L2_199 then
    return A0_197.chara[L2_199].npc:isMotionEnd()
  end
  return true
end
function GmBoss.playAddMotion(A0_200, A1_201, A2_202)
  local L3_203
  L3_203 = A0_200.labels
  L3_203 = L3_203[A1_201]
  if L3_203 then
    A0_200.chara[L3_203].npc:playAddMotion(L3_203)
  end
end
function GmBoss.setMotionSpeed(A0_204, A1_205, A2_206)
  local L3_207
  L3_207 = A0_204.labels
  L3_207 = L3_207[A1_205]
  if L3_207 then
    A0_204.chara[L3_207].npc:setPlayMotionSpeed(A2_206)
    A0_204.script[L3_207].set_speed = A2_206
  end
end
function GmBoss.getMotionSpeed(A0_208, A1_209)
  local L2_210, L3_211
  L2_210 = A0_208.labels
  L2_210 = L2_210[A1_209]
  if L2_210 then
    L3_211 = A0_208.script
    L3_211 = L3_211[L2_210]
    L3_211 = L3_211.set_speed
    return L3_211
  end
  L3_211 = 1
  return L3_211
end
function GmBoss.getMouthNode(A0_212)
  local L1_213
  L1_213 = A0_212.script
  L1_213 = L1_213.absorption
  L1_213 = L1_213.node
  return L1_213
end
function GmBoss.getArmHandle(A0_214)
  return (findGameObject2("Node", "gm_armarea_b_f_03"))
end
function GmBoss.getBodyHandle(A0_215)
  return (findGameObject2("Node", "gm_bodyarea_b_01"))
end
function GmBoss.isGameOver(A0_216)
  local L1_217
  L1_217 = _isGameOver
  return L1_217
end
function GmBoss.setArmSensorActive(A0_218, A1_219, A2_220)
  local L3_221
  L3_221 = A0_218.labels
  L3_221 = L3_221[A1_219]
  for _FORV_7_, _FORV_8_ in ipairs(A0_218.chara[L3_221].element) do
    if _FORV_8_.sensor ~= nil then
      _FORV_8_.sensor:setActive(A2_220)
    end
  end
end
function createEffectAroundTarget(A0_222, A1_223, A2_224, A3_225)
  local L4_226, L5_227, L6_228, L7_229, L8_230, L9_231
  L4_226 = {}
  for L8_230 = 1, A1_223 do
    L9_231 = createGameObject2
    L9_231 = L9_231("Effect")
    L9_231:setName(string.format("sfx_node_%s_%02d", A2_224, L8_230))
    L9_231:setModelName(A2_224)
    L9_231:setPos(Vector(RandF(-A3_225, A3_225), RandF(-A3_225, A3_225), RandF(-A3_225, A3_225)))
    A0_222:appendChild(L9_231)
    L9_231:try_init()
    L9_231:waitForReady()
    L9_231:try_start()
    L9_231:setActive(true)
    L9_231:setLoop(loop)
    L9_231:play()
    table.insert(L4_226, L9_231)
  end
  return L4_226
end
function GmBoss.absorptionEffStandby(A0_232)
  local L1_233
  L1_233 = A0_232.script
  L1_233 = L1_233.absorption
  L1_233 = L1_233.eff
  if not L1_233 then
    L1_233 = createGameObject2
    L1_233 = L1_233("Effect")
    L1_233:setName("ef_ev_bk03_par01")
    L1_233:setModelName("ef_ev_bk03_par01")
    A0_232.script.absorption.node:appendChild(L1_233)
    L1_233:try_init()
    L1_233:waitForReady()
    A0_232.script.absorption.eff = L1_233
  end
  L1_233 = A0_232.script
  L1_233 = L1_233.absorption
  L1_233 = L1_233.eff2
  if not L1_233 then
    L1_233 = createGameObject2
    L1_233 = L1_233("Effect")
    L1_233:setName("ef_ev_gfc_02")
    L1_233:setModelName("ef_ev_gfc_02")
    A0_232.script.absorption.node:appendChild(L1_233)
    L1_233:try_init()
    L1_233:waitForReady()
    A0_232.script.absorption.eff2 = L1_233
  end
end
function GmBoss.absorptionEffPlay(A0_234)
  if A0_234.script.absorption.eff then
    if A0_234.script.absorption.eff:getEmitStop() then
      A0_234.script.absorption.eff:setEmitStop(false)
    else
      A0_234.script.absorption.eff:try_start()
      A0_234.script.absorption.eff:setActive(true)
      A0_234.script.absorption.eff:setLoop(true)
      A0_234.script.absorption.eff:play()
    end
  else
    print("\229\144\184\227\129\132\232\190\188\227\129\191\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147:1")
  end
  if A0_234.script.absorption.eff2 then
    if A0_234.script.absorption.eff2:getEmitStop() then
      A0_234.script.absorption.eff2:setEmitStop(false)
    else
      A0_234.script.absorption.eff2:try_start()
      A0_234.script.absorption.eff2:setActive(true)
      A0_234.script.absorption.eff2:setLoop(true)
      A0_234.script.absorption.eff2:play()
    end
  else
    print("\229\144\184\227\129\132\232\190\188\227\129\191\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147:2")
  end
  A0_234.script.absorption.se = Sound:playSEHandle("ep11_ghost_absorb", 1, A0_234.chara.gmbody01.puppet)
  Camera:shake2D(0, 0.015, 10, 0)
end
function GmBoss.absorptionEffStop(A0_235)
  if A0_235.script.absorption.eff then
    A0_235.script.absorption.eff:setEmitStop(true)
  end
  if A0_235.script.absorption.eff2 then
    A0_235.script.absorption.eff2:setEmitStop(true)
  end
  if A0_235.script.absorption.se then
    Sound:stopSEHandle(A0_235.script.absorption.se)
  end
  Camera:stopShake(3)
end
function expEffect(A0_236, A1_237)
  local L2_238, L3_239
  L2_238 = A0_236.x
  L3_239 = RandI
  L3_239 = L3_239(-A1_237, A1_237)
  L2_238 = L2_238 + L3_239
  A0_236.x = L2_238
  L2_238 = A0_236.y
  L3_239 = RandI
  L3_239 = L3_239(-A1_237, A1_237)
  L2_238 = L2_238 + L3_239
  A0_236.y = L2_238
  L2_238 = A0_236.z
  L3_239 = RandI
  L3_239 = L3_239(-A1_237, A1_237)
  L2_238 = L2_238 + L3_239
  A0_236.z = L2_238
  L2_238 = "ef_com_exp_14"
  L3_239 = string
  L3_239 = L3_239.format
  L3_239 = L3_239("gm_exp_%d", RandI(99999))
  Fn_createEffect(L3_239, L2_238, A0_236, false)
end
function GmBoss.absorptionPlayerEffectStandby(A0_240)
  if _playerEffect ~= nil then
    _playerEffect:try_term()
    _playerEffect = nil
  end
  _playerEffect = createGameObject2("Effect")
  _playerEffect:setName("ef_ev_stone_01")
  _playerEffect:setModelName("ef_ev_stone_01")
  Fn_getPlayer():appendChild(_playerEffect)
  _playerEffect:try_init()
  _playerEffect:waitForReady()
end
function GmBoss.absorptionPlayerEffectPlay(A0_241)
  if _playerEffect ~= nil then
    if _playerEffect:getEmitStop() then
      _playerEffect:setEmitStop(false)
    else
      _playerEffect:try_start()
      _playerEffect:setActive(true)
      _playerEffect:setLoop(true)
      _playerEffect:play()
    end
  else
    print("\229\144\184\227\129\132\232\190\188\227\129\191\227\130\168\227\131\149\227\130\167\227\130\175\227\131\136\227\129\140\227\129\130\227\130\138\227\129\190\227\129\155\227\130\147:Player")
  end
end
function GmBoss.absorptionPlayerEffectStop(A0_242)
  if _playerEffect ~= nil then
    _playerEffect:setEmitStop(true)
  end
end
function GmBoss.playerEffectControl(A0_243)
  local L1_244, L2_245, L3_246, L4_247
  L1_244 = A0_243.script
  L1_244 = L1_244.absorption
  L1_244 = L1_244.node
  L2_245 = L1_244
  L1_244 = L1_244.getWorldPos
  L1_244 = L1_244(L2_245)
  L2_245 = Fn_getPlayerWorldPos
  L2_245 = L2_245()
  L3_246 = NormalizeVector
  L4_247 = L1_244 - L2_245
  L3_246 = L3_246(L4_247)
  L4_247 = ArcQuat
  L4_247 = L4_247(Vector(0, 0, 1), L3_246)
  _playerEffect:setWorldRot(L4_247)
end
function GmBoss.absorption(A0_248)
  local L1_249, L2_250
  L1_249 = {}
  L1_249.type = "windfield"
  L1_249.damage = 0
  L1_249.force = -7
  L1_249.time = 1
  L1_249.interval = 0
  L2_250 = A0_248.script
  L2_250 = L2_250.absorption
  L2_250 = L2_250.node
  L2_250 = L2_250.getWorldPos
  L2_250 = L2_250(L2_250)
  L1_249.pos = L2_250
  L2_250 = Vector
  L2_250 = L2_250(0, 0, 0)
  L1_249.rot = L2_250
  L1_249.radius = 700
  L2_250 = {}
  L2_250.type = "windfield"
  L2_250.damage = 0
  L2_250.force = -15
  L2_250.time = 1
  L2_250.interval = 0
  L2_250.pos = A0_248.script.absorption.node:getWorldPos()
  L2_250.rot = Vector(0, 0, 0)
  L2_250.radius = 700
  if A0_248.script.absorption.task then
    A0_248.script.absorption.task:abort()
    A0_248.script.absorption.task = nil
  end
  A0_248.script.absorption.task = invokeTask(function()
    local L0_251, L1_252, L2_253, L3_254, L4_255, L5_256, L6_257
    L0_251 = 0
    L1_252 = 0
    L2_253 = {}
    L3_254 = 0
    L4_255 = nil
    while true do
      L5_256 = A0_248
      L6_257 = L5_256
      L5_256 = L5_256.playerEffectControl
      L5_256(L6_257)
      L5_256 = A0_248.script
      L5_256 = L5_256.absorption
      L5_256 = L5_256.node
      L6_257 = L5_256
      L5_256 = L5_256.getWorldPos
      L5_256 = L5_256(L6_257)
      L6_257 = Fn_getDistanceToPlayer
      L6_257 = L6_257(L5_256)
      if L6_257 <= 350 or L0_251 <= 1000 then
        if Player:isGravityControlMode() then
          if L3_254 ~= 1 or L0_251 % 30 == 0 then
            if L4_255 ~= nil then
              L4_255:try_term()
              L4_255 = nil
            end
            if L0_251 < 100 then
              L1_249.force = -3
            elseif L0_251 >= 100 and L0_251 < 200 then
              L1_249.force = -4
            elseif L0_251 >= 200 and L0_251 < 300 then
              L1_249.force = -5
            else
              L1_249.force = -7
            end
            createGameObject2("BulletShockwave"):attack(L1_249)
            L3_254 = 1
          end
        elseif L3_254 ~= 2 or L0_251 % 30 == 0 then
          if L4_255 ~= nil then
            L4_255:try_term()
            L4_255 = nil
          end
          if L0_251 < 100 then
            L1_249.force = -7
          elseif L0_251 >= 100 and L0_251 < 200 then
            L1_249.force = -9
          elseif L0_251 >= 200 and L0_251 < 300 then
            L1_249.force = -11
          else
            L1_249.force = -15
          end
          L4_255 = createGameObject2("BulletShockwave")
          L4_255:attack(L2_250)
          L3_254 = 2
        end
      end
      L1_252 = L1_252 - 1
      if L1_252 < 0 then
        expEffect(L5_256, 60)
        L1_252 = 5
      end
      if L6_257 < 40 and not L2_253.near then
        if A0_248:isArmBrokenAll() then
          L0_251 = 1000
          print("\232\133\149\227\129\140\229\133\168\227\129\166\231\132\161\227\129\132\227\129\174\227\129\167\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\229\135\166\231\144\134\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147")
        else
          _isGameOver = true
          Fn_captionView("ic_gm_boss_00100")
          Player:applyImpactDamage(Fn_getPlayerWorldPos(), Vector(0, 1, 0), Player:getEnergy(Player.kEnergy_Life), false)
          Player:setEnergy(Player.kEnergy_Life, 0)
          invokeTask(function()
            Fn_whiteout(3)
            Fn_scriptGameOver(false)
          end)
          L2_253.near = true
        end
      elseif L6_257 < 100 and not L2_253.middle then
        Fn_captionView("ic_gm_boss_00101")
        L2_253.middle = true
      elseif L6_257 < 160 and not L2_253.far then
        Fn_captionView("ic_gm_boss_00102")
        L2_253.far = true
      end
      if not (L0_251 > 1000) and (not (L6_257 > 350) or not (L0_251 > 600)) then
        L0_251 = L0_251 + 1
        if L0_251 % 100 == 0 then
          print(string.format("dist: %f, count: %d", L6_257, L0_251))
        end
        wait()
      end
    end
    L5_256 = print
    L6_257 = "absorptionEffStop"
    L5_256(L6_257)
    L5_256 = A0_248
    L6_257 = L5_256
    L5_256 = L5_256.absorptionEffStop
    L5_256(L6_257)
    L5_256 = A0_248
    L6_257 = L5_256
    L5_256 = L5_256.absorptionPlayerEffectStop
    L5_256(L6_257)
    if L4_255 ~= nil then
      L6_257 = L4_255
      L5_256 = L4_255.kill
      L5_256(L6_257)
      L4_255 = nil
    end
    repeat
      L5_256 = A0_248.script
      L5_256 = L5_256.absorption
      L5_256 = L5_256.node
      L6_257 = L5_256
      L5_256 = L5_256.getWorldPos
      L5_256 = L5_256(L6_257)
      L6_257 = Fn_getDistanceToPlayer
      L6_257 = L6_257(L5_256)
      wait()
    until L6_257 > 360
  end)
end
function GmBoss.absorption2(A0_258)
  if A0_258.script.absorption.task then
    A0_258.script.absorption.task:abort()
    A0_258.script.absorption.task = nil
  end
  A0_258.script.absorption.task = invokeTask(function()
    local L0_259, L1_260, L2_261
    L0_259 = 600
    L1_260 = 0
    while true do
      L2_261 = A0_258.script
      L2_261 = L2_261.absorption
      L2_261 = L2_261.node
      L2_261 = L2_261.getWorldPos
      L2_261 = L2_261(L2_261)
      L1_260 = L1_260 - 1
      if L1_260 < 0 then
        expEffect(L2_261, 60)
        L1_260 = 5
      end
      L0_259 = L0_259 - 1
      if not (L0_259 < 0) then
        wait()
      end
    end
    L2_261 = A0_258
    L2_261 = L2_261.absorptionEffStop
    L2_261(L2_261)
  end)
end
function GmBoss.absorption3(A0_262)
  local L1_263, L2_264
  L1_263 = {}
  L1_263.type = "windfield"
  L1_263.damage = 0
  L1_263.force = -7
  L1_263.time = 1
  L1_263.interval = 0
  L2_264 = A0_262.script
  L2_264 = L2_264.absorption
  L2_264 = L2_264.node
  L2_264 = L2_264.getWorldPos
  L2_264 = L2_264(L2_264)
  L1_263.pos = L2_264
  L2_264 = Vector
  L2_264 = L2_264(0, 0, 0)
  L1_263.rot = L2_264
  L1_263.radius = 700
  L2_264 = {}
  L2_264.type = "windfield"
  L2_264.damage = 0
  L2_264.force = -15
  L2_264.time = 1
  L2_264.interval = 0
  L2_264.pos = A0_262.script.absorption.node:getWorldPos()
  L2_264.rot = Vector(0, 0, 0)
  L2_264.radius = 700
  if A0_262.script.absorption.task then
    A0_262.script.absorption.task:abort()
    A0_262.script.absorption.task = nil
  end
  A0_262.script.absorption.task = invokeTask(function()
    local L0_265, L1_266, L2_267, L3_268, L4_269, L5_270
    L0_265 = 600
    L1_266 = 0
    L2_267 = {}
    L3_268 = 0
    L4_269 = nil
    while true do
      L5_270 = A0_262
      L5_270 = L5_270.playerEffectControl
      L5_270(L5_270)
      L5_270 = A0_262.script
      L5_270 = L5_270.absorption
      L5_270 = L5_270.node
      L5_270 = L5_270.getWorldPos
      L5_270 = L5_270(L5_270)
      if Player:isGravityControlMode() then
        if L3_268 ~= 1 or L0_265 % 30 == 0 then
          if L4_269 ~= nil then
            L4_269:try_term()
            L4_269 = nil
          end
          if L0_265 > 500 then
            L1_263.force = -3
          elseif L0_265 > 400 and L0_265 <= 500 then
            L1_263.force = -4
          elseif L0_265 > 300 and L0_265 <= 400 then
            L1_263.force = -5
          else
            L1_263.force = -7
          end
          createGameObject2("BulletShockwave"):attack(L1_263)
          L3_268 = 1
        end
      elseif L3_268 ~= 2 or L0_265 % 30 == 0 then
        if L4_269 ~= nil then
          L4_269:try_term()
          L4_269 = nil
        end
        if L0_265 > 500 then
          L2_264.force = -4
        elseif L0_265 > 400 and L0_265 <= 500 then
          L2_264.force = -6
        elseif L0_265 > 300 and L0_265 <= 400 then
          L2_264.force = -8
        else
          L2_264.force = -10
        end
        L4_269 = createGameObject2("BulletShockwave")
        L4_269:attack(L2_264)
        L3_268 = 2
      end
      L1_266 = L1_266 - 1
      if L1_266 < 0 then
        expEffect(L5_270, 60)
        L1_266 = 5
      end
      if Fn_getDistanceToPlayer(L5_270) < 40 and not L2_267.near then
        if A0_262:isArmBrokenAll() then
          L0_265 = 0
          print("\232\133\149\227\129\140\229\133\168\227\129\166\231\132\161\227\129\132\227\129\174\227\129\167\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\229\135\166\231\144\134\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147")
        else
          _isGameOver = true
          Fn_captionView("ic_gm_boss_00100")
          Player:applyImpactDamage(Fn_getPlayerWorldPos(), Vector(0, 1, 0), Player:getEnergy(Player.kEnergy_Life), false)
          Player:setEnergy(Player.kEnergy_Life, 0)
          L2_267.near = true
          invokeTask(function()
            Fn_whiteout(3)
            Fn_scriptGameOver(false)
          end)
        end
      elseif Fn_getDistanceToPlayer(L5_270) < 100 and not L2_267.middle then
        Fn_captionView("ic_gm_boss_00101")
        L2_267.middle = true
      elseif Fn_getDistanceToPlayer(L5_270) < 160 and not L2_267.far then
        Fn_captionView("ic_gm_boss_00102")
        L2_267.far = true
      end
      L0_265 = L0_265 - 1
      if not (L0_265 < 0) then
        wait()
      end
    end
    L5_270 = print
    L5_270("absorptionEffStop")
    L5_270 = A0_262
    L5_270 = L5_270.absorptionEffStop
    L5_270(L5_270)
    L5_270 = A0_262
    L5_270 = L5_270.absorptionPlayerEffectStop
    L5_270(L5_270)
    if L4_269 ~= nil then
      L5_270 = L4_269.kill
      L5_270(L4_269)
      L4_269 = nil
    end
  end)
end
function GmBoss.isAbsorptionEnd(A0_271)
  if A0_271.script.absorption.task and A0_271.script.absorption.task:isRunning() then
    return false
  end
  print("isAbsorptionEnd")
  return true
end
function GmBoss.getAbsorptionPos(A0_272)
  return A0_272.script.absorption.node:getWorldPos()
end
function GmBoss.move(A0_273, A1_274, A2_275, A3_276)
  local L4_277, L5_278, L6_279, L7_280, L8_281
  L5_278 = A0_273
  L4_277 = A0_273.getWorldPos
  L4_277 = L4_277(L5_278)
  L6_279 = A0_273
  L5_278 = A0_273.getWorldRot
  L5_278 = L5_278(L6_279)
  L6_279 = A1_274 - L4_277
  L7_280, L8_281 = nil, nil
  L7_280 = L4_277
  L6_279.x = L6_279.x / A3_276
  L6_279.y = L6_279.y / A3_276
  L6_279.z = L6_279.z / A3_276
  for _FORV_12_ = 1, A3_276 do
    L7_280 = L7_280 + L6_279
    L8_281 = SlerpQuat(_FORV_12_ / A3_276, L5_278, A2_275)
    wait()
    A0_273:setWorldTransform(L7_280, L8_281)
  end
  A0_273:setWorldTransform(A1_274, A2_275)
end
function GmBoss.stop(A0_282)
  local L1_283
end
function GmBoss.moveMotionSpeed(A0_284, A1_285, A2_286, A3_287)
  local L4_288, L5_289, L6_290, L7_291, L8_292, L9_293
  L5_289 = A0_284
  L4_288 = A0_284.getMotionSpeed
  L4_288 = L4_288(L5_289, L6_290)
  L5_289 = A0_284.getMotionSpeed
  L5_289 = L5_289(L6_290, L7_291)
  L5_289 = A2_286 - L5_289
  L5_289 = L5_289 / A3_287
  for L9_293 = 1, L5_289 do
    A0_284:setMotionSpeed("b", L4_288)
    A0_284:setMotionSpeed(A1_285, L4_288)
    print("i = " .. L9_293)
    print("now_spd = " .. L4_288)
    wait()
    L4_288 = L4_288 + A3_287
  end
  L9_293 = A2_286
  L6_290(L7_291, L8_292, L9_293)
  L9_293 = A2_286
  L6_290(L7_291, L8_292, L9_293)
end
function GmBoss.getMoveMotionSpeed(A0_294, A1_295, A2_296, A3_297)
  local L4_298
  L4_298 = A2_296 - A1_295
  L4_298 = L4_298 / A3_297
  return L4_298
end
function GmBoss.movePos(A0_299, A1_300, A2_301)
  local L3_302, L4_303, L5_304
  L4_303 = A0_299
  L3_302 = A0_299.getWorldPos
  L3_302 = L3_302(L4_303)
  L4_303 = Vector
  L5_304 = 0
  L4_303 = L4_303(L5_304, 0, 0)
  L5_304 = nil
  L5_304 = L3_302
  L4_303 = A1_300 - L3_302
  L4_303.x = L4_303.x / A2_301
  L4_303.y = L4_303.y / A2_301
  L4_303.z = L4_303.z / A2_301
  for _FORV_9_ = 1, A2_301 do
    L5_304 = L5_304 + L4_303
    wait()
    A0_299:setWorldPos(L5_304)
  end
  A0_299:setWorldPos(A1_300)
end
function GmBoss.AIep11_a(A0_305)
  local L1_306, L2_307, L3_308, L4_309, L5_310, L6_311, L7_312, L8_313, L9_314
  L1_306, L2_307 = nil, nil
  L3_308 = false
  L4_309 = false
  L5_310 = nil
  L6_311 = 0.8
  L7_312 = 0.1
  L8_313 = 90
  L9_314 = 60
  while true do
    L1_306, L2_307 = A0_305:getPlayerPlace()
    if L1_306 ~= false then
      if L1_306 == L3_308 then
      else
        if L3_308 == false then
          print("\233\131\168\228\189\141\227\129\171\231\167\187\229\139\149")
          if L5_310 ~= nil then
            L5_310:abort()
            L5_310 = nil
          end
          L5_310 = invokeTask(function(A0_315)
            local L2_316, L3_317, L4_318
            L2_316 = A0_305
            L3_317 = L2_316
            L2_316 = L2_316.moveMotionSpeed
            L4_318 = A0_315
            L2_316(L3_317, L4_318, L7_312, A0_305:getMoveMotionSpeed(L6_311, L7_312, L9_314))
          end, L1_306)
        else
        end
      end
    elseif L3_308 ~= false then
      print("\233\131\168\228\189\141\227\129\139\227\130\137\229\160\180\229\164\150\227\129\184")
      if L5_310 ~= nil then
        L5_310:abort()
        L5_310 = nil
      end
      L5_310 = invokeTask(function(A0_319)
        local L2_320, L3_321, L4_322
        L2_320 = A0_305
        L3_321 = L2_320
        L2_320 = L2_320.moveMotionSpeed
        L4_322 = A0_319
        L2_320(L3_321, L4_322, L6_311, A0_305:getMoveMotionSpeed(L7_312, L6_311, L8_313))
      end, L3_308)
    end
    L3_308 = L1_306
    L4_309 = L2_307
    wait()
  end
end
function GmBoss.AIep11_b(A0_323)
  local L1_324, L2_325, L3_326, L4_327, L5_328, L6_329, L7_330, L8_331, L9_332
  L1_324, L2_325 = nil, nil
  L3_326 = false
  L4_327 = false
  L5_328 = nil
  L6_329 = 0.8
  L7_330 = 0.1
  L8_331 = 90
  L9_332 = 60
  while true do
    L1_324, L2_325 = A0_323:getPlayerPlace()
    if L1_324 ~= false then
      if L1_324 == L3_326 then
      else
        if L3_326 == false then
          print("\233\131\168\228\189\141\227\129\171\231\167\187\229\139\149")
          if L5_328 ~= nil then
            L5_328:abort()
            L5_328 = nil
          end
          L5_328 = invokeTask(function(A0_333)
            local L2_334, L3_335, L4_336
            L2_334 = A0_323
            L3_335 = L2_334
            L2_334 = L2_334.moveMotionSpeed
            L4_336 = A0_333
            L2_334(L3_335, L4_336, L7_330, A0_323:getMoveMotionSpeed(L6_329, L7_330, L9_332))
          end, L1_324)
        else
        end
      end
    elseif L3_326 ~= false then
      print("\233\131\168\228\189\141\227\129\139\227\130\137\229\160\180\229\164\150\227\129\184")
      if L5_328 ~= nil then
        L5_328:abort()
        L5_328 = nil
      end
      L5_328 = invokeTask(function(A0_337)
        local L2_338, L3_339, L4_340
        L2_338 = A0_323
        L3_339 = L2_338
        L2_338 = L2_338.moveMotionSpeed
        L4_340 = A0_337
        L2_338(L3_339, L4_340, L6_329, A0_323:getMoveMotionSpeed(L7_330, L6_329, L8_331))
      end, L3_326)
    end
    L3_326 = L1_324
    L4_327 = L2_325
    wait()
  end
end
function GmBoss.AI(A0_341, A1_342)
end
function GmBoss.debug(A0_343)
  invokeTask(function()
    while true do
      for _FORV_3_, _FORV_4_ in pairs(A0_343.script) do
        for _FORV_8_, _FORV_9_ in pairs(_FORV_4_.player_place) do
        end
      end
      wait()
    end
  end)
end
