dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep11_common.lua")
typedef_BridgeClass = {}
function typedef_BridgeClass.new(A0_0)
  local L1_1, L2_2
  L1_1 = {}
  L1_1.max = 48
  L2_2 = {}
  L1_1.hdl = L2_2
  L2_2 = {}
  L1_1.map_hdl = L2_2
  L2_2 = {}
  L1_1.jointCount = L2_2
  L1_1.x_num = 3
  L1_1.y_num = 4
  L1_1.z_num = 4
  function L2_2(A0_3, A1_4)
    local L2_5, L3_6, L4_7, L5_8, L6_9, L7_10
    L2_5 = Fn_getGameObject
    L2_5 = L2_5(L3_6)
    for L6_9 = 1, A0_3.max do
      L7_10 = L2_5.findGameObject2
      L7_10 = L7_10(L2_5, "GimmickBg", A1_4 .. L6_9)
      A0_3:RegistrationHandle(L6_9, L7_10)
    end
  end
  L1_1.RegistrationHandles = L2_2
  function L2_2(A0_11, A1_12, A2_13)
    A0_11.hdl[A1_12] = A2_13
    A2_13:setCollidableBlockEnable(false)
    A2_13:setVisibleBlockEnable(false)
    A2_13:setLockonPermission(true)
    A2_13:setEventListener("broken", function()
      if not _kit_caption then
        Fn_captionView("ep11_09030")
        _kit_caption = true
      end
    end)
  end
  L1_1.RegistrationHandle = L2_2
  function L2_2(A0_14, A1_15)
    local L2_16, L3_17, L4_18, L5_19, L8_20, L9_21, L10_22, L12_23, L13_24, L14_25, L15_26, L16_27, L17_28, L18_29
    for L5_19 = 1, A0_14.z_num do
      L8_20[L5_19] = L9_21
      for L12_23 = 1, A0_14.y_num do
        L13_24[L12_23] = L14_25
        for L16_27 = 1, A0_14.x_num do
          L17_28 = A0_14.map_hdl
          L17_28 = L17_28[L5_19]
          L17_28 = L17_28[L12_23]
          L18_29 = A0_14.hdl
          L18_29 = L18_29[(L5_19 - 1) * (A0_14.x_num * A0_14.y_num) + (L12_23 - 1) * A0_14.x_num + L16_27]
          L17_28[L16_27] = L18_29
        end
      end
    end
  end
  L1_1.RegistrationMap = L2_2
  function L2_2(A0_30)
    local L1_31
    L1_31 = A0_30.max
    return L1_31
  end
  L1_1.GetBridgeMax = L2_2
  function L2_2(A0_32)
    local L1_33
    for _FORV_4_ = 1, table.maxn(A0_32.hdl) do
      if not A0_32.hdl[_FORV_4_]:isBroken() then
        A0_32.hdl[_FORV_4_]:pushJob(nil, "S", RandF(0, 3), "B")
      end
    end
  end
  L1_1.RequestBreakAll = L2_2
  function L2_2(A0_34)
    for _FORV_4_, _FORV_5_ in ipairs(A0_34.jointCount) do
      if _FORV_5_ < 4 then
        return true
      end
    end
    return false
  end
  L1_1.isOverBroken = L2_2
  function L2_2(A0_35)
    local L1_36
    L1_36 = 16
    for _FORV_5_, _FORV_6_ in ipairs(A0_35.jointCount) do
      if _FORV_6_ < L1_36 then
        L1_36 = _FORV_6_
      end
    end
    return L1_36
  end
  L1_1.getMinJoint = L2_2
  function L2_2(A0_37)
    local L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44, L8_45, L9_46, L10_47
    L1_38 = {}
    for L5_42 = 1, L3_40 - 1 do
      L1_38[L5_42] = L6_43
      L6_43[L5_42] = 0
      for L9_46 = 1, A0_37.y_num do
        L10_47 = L1_38[L5_42]
        L10_47[L9_46] = {}
        L10_47 = ""
        for _FORV_14_ = 1, A0_37.x_num do
          if A0_37.map_hdl[L5_42][L9_46][_FORV_14_]:isBroken() == false and A0_37.map_hdl[L5_42 + 1][L9_46][_FORV_14_]:isBroken() == false then
            L1_38[L5_42][L9_46][_FORV_14_] = false
            A0_37.jointCount[L5_42] = A0_37.jointCount[L5_42] + 1
            L10_47 = L10_47 .. "O"
          else
            L1_38[L5_42][L9_46][_FORV_14_] = true
            L10_47 = L10_47 .. "X"
          end
        end
      end
    end
    return L2_39
  end
  L1_1.isBroken = L2_2
  function L2_2(A0_48, A1_49)
    local L2_50, L3_51, L4_52, L5_53
    L2_50 = 1
    L3_51 = 1
    L4_52 = 1
    while true do
      while true do
        while true do
          L5_53 = A1_49[L4_52]
          L5_53 = L5_53[L3_51]
          L5_53 = L5_53[L2_50]
          if L5_53 then
            L5_53 = A0_48.y_num
            if L3_51 >= L5_53 then
              L5_53 = A0_48.x_num
              if L2_50 >= L5_53 then
                L5_53 = false
                return L5_53
              end
              L3_51 = 1
              L2_50 = L2_50 + 1
            end
            L3_51 = L3_51 + 1
        end
      end
      else
        L4_52 = L4_52 + 1
        L5_53 = #A1_49
        if L4_52 > L5_53 then
          L5_53 = true
          return L5_53
        end
      end
    end
  end
  L1_1.isSurfaceJoined = L2_2
  return L1_1
end
BomClass = {}
function BomClass.new(A0_54)
  local L1_55
  L1_55 = {}
  L1_55.index = A0_54
  L1_55.handle = Fn_getGameObject("com_sb"):findGameObject2("GimmickBg", string.format("bg2_bom_%02d", A0_54))
  L1_55.handle:setCollidableBlockEnable(false)
  L1_55.handle:setVisibleBlockEnable(false)
  L1_55.handle:setEventListener("dynamic", bomDynamicEventhandler)
  L1_55.handle:setEventListener("restore", bomRestoreEventHandler)
  L1_55.handle:setEventListener("broken", bomBrokenEventHandler)
  return L1_55
end
function bomDynamicEventhandler(A0_56)
  A0_56:getDynamicObject():setEventListener("broken", bomBrokenDynamicEventHandler)
  A0_56:setEventListener("broken", nil)
end
function bomRestoreEventHandler(A0_57, A1_58)
  A0_57:setEventListener("broken", bomBrokenEventHandler)
end
function bomBrokenDynamicEventHandler(A0_59)
  local L1_60
  L1_60 = A0_59.getWorldPos
  L1_60 = L1_60(A0_59)
  bomExplosion(L1_60)
end
function bomBrokenEventHandler(A0_61)
  local L1_62, L2_63, L3_64
  L2_63 = A0_61
  L1_62 = A0_61.getDynamicObject
  L1_62 = L1_62(L2_63)
  L3_64 = A0_61
  L2_63 = A0_61.getWorldPos
  L2_63 = L2_63(L3_64)
  L3_64 = nil
  if L1_62 ~= nil then
    L3_64 = L1_62:getWorldPos()
  else
    L3_64 = L2_63
  end
  bomExplosion(L3_64)
end
function bomExplosion(A0_65)
  local L1_66, L2_67, L3_68, L4_69, L5_70, L6_71, L7_72, L8_73, L9_74
  L1_66 = {}
  L2_67 = Fn_getPlayer
  L2_67 = L2_67()
  L1_66.player = L2_67
  L2_67 = Fn_sendEventComSb
  L3_68 = "getNpcPuppet"
  L2_67 = L2_67(L3_68, L4_69)
  L1_66.cid = L2_67
  L2_67 = Fn_sendEventComSb
  L3_68 = "getNpcPuppet"
  L2_67 = L2_67(L3_68, L4_69)
  L1_66.sis = L2_67
  L2_67 = {}
  L2_67.type = "hardblow"
  L2_67.damage = 10000
  L2_67.force = 10
  L2_67.time = 0.1
  L2_67.interval = -1
  L2_67.pos = A0_65
  L3_68 = Vector
  L3_68 = L3_68(L4_69, L5_70, L6_71)
  L2_67.rot = L3_68
  L2_67.radius = 2.1
  L3_68 = createGameObject2
  L3_68 = L3_68(L4_69)
  L4_69(L5_70, L6_71)
  for L7_72, L8_73 in L4_69(L5_70) do
    L9_74 = L8_73.getWorldPos
    L9_74 = L9_74(L8_73)
    if not _isCrowDemo and 2 > Fn_get_distance(L9_74, A0_65) then
      _isGameOver = true
      Fn_pcSensorOff("pccubesensor2_start_ep11_b")
      if L7_72 == "player" then
        Fn_captionView("ep11_01001")
        Player:applyImpactDamage(Fn_getPlayerWorldPos(), Vector(0, 1, 0), Player:getEnergy(Player.kEnergy_Life), false)
        Player:setEnergy(Player.kEnergy_Life, 0)
      elseif L7_72 == "cid" then
        Fn_captionView("ep11_01002")
      elseif L7_72 == "sis" then
        Fn_captionView("ep11_01003")
      end
      invokeTask(function()
        Fn_whiteout(3)
        Fn_scriptGameOver(false)
      end)
      break
    end
  end
end
function bomGrabbedEventHandler(A0_75)
  local L1_76
end
function isBomGrabbed()
  local L0_77, L1_78, L2_79, L3_80, L4_81, L5_82
  L0_77 = false
  L1_78 = Player
  L1_78 = L1_78.getGrabObjectCount
  L1_78 = L1_78(L2_79)
  if L1_78 > 0 then
    L1_78 = Fn_getGameObject
    L1_78 = L1_78(L2_79)
    for L5_82 = 1, 16 do
      if L1_78:findGameObject2("GimmickBg", string.format("bg2_bom_%02d", L5_82)) ~= nil and L1_78:findGameObject2("GimmickBg", string.format("bg2_bom_%02d", L5_82)):isGrabbed() then
        L0_77 = true
        break
      else
        L0_77 = false
      end
    end
  else
    L0_77 = false
  end
  return L0_77
end
function bomManager(A0_83)
  local L1_84, L2_85, L3_86, L4_87, L5_88, L6_89, L7_90, L8_91, L9_92
  L1_84 = 16
  L2_85 = {}
  L3_86 = nil
  L4_87 = false
  L5_88 = 0
  if L3_86 == nil then
    for L9_92 = 1, L1_84 do
      L2_85[L9_92] = BomClass.new(L9_92)
    end
    L3_86 = L6_89
  end
  if A0_83 == "abort" and L3_86 ~= nil then
    L6_89(L7_90, L8_91)
    L6_89(L7_90)
    for L9_92 = 1, L1_84 do
      if L2_85[L9_92].handle ~= nil then
        L2_85[L9_92].handle:try_term()
        L2_85[L9_92].handle = nil
        L2_85[L9_92] = nil
      end
    end
    L6_89(L7_90)
    L3_86 = nil
  end
end
_crow = {}
_bridge = {}
_cid_message = {}
_kit_caption = false
_crowTask = nil
_isGameOver = false
_isCrowDemo = false
function Initialize()
  _sdemo = SDemo.create("ep11_b")
  _bridge = typedef_BridgeClass.new()
  Player:setGrabPickupCategPriority("npc", Player.kGrabPickupPrio_High)
  Player:setGrabPickupCategPriority("gimmickbg", Player.kGrabPickupPrio_Low)
end
function Ingame()
  local L0_93, L1_94, L2_95, L3_96, L4_97, L5_98, L6_99, L7_100
  L0_93 = emergency_catwarp_start
  L0_93 = L0_93()
  L1_94 = {
    L2_95,
    L3_96,
    L4_97
  }
  L2_95 = Player
  L2_95 = L2_95.kAbility_Grab
  L3_96 = Player
  L3_96 = L3_96.kAbility_ExGrab
  L2_95 = Fn_lockPlayerAbility
  L3_96 = L1_94
  L2_95(L3_96, L4_97)
  L2_95 = Fn_userCtrlOff
  L2_95()
  L2_95 = Fn_setCatWarp
  L3_96 = false
  L2_95(L3_96)
  L2_95 = Fn_sendEventComSb
  L3_96 = "setPcSensor"
  L2_95(L3_96, L4_97, L5_98)
  L2_95 = Fn_pcSensorOn
  L3_96 = "pccubesensor2_start_ep11_b"
  L2_95(L3_96)
  L2_95 = Fn_sendEventComSb
  L3_96 = "setNpcActive"
  L7_100 = "man40"
  L2_95(L3_96, L4_97, L5_98)
  L2_95 = bomManager
  L2_95()
  L2_95 = _bridge
  L3_96 = L2_95
  L2_95 = L2_95.RegistrationHandles
  L2_95(L3_96, L4_97)
  L2_95 = _bridge
  L3_96 = L2_95
  L2_95 = L2_95.RegistrationMap
  L2_95(L3_96)
  L2_95 = Fn_getGameObject
  L3_96 = "com_sb"
  L2_95 = L2_95(L3_96)
  L3_96 = L2_95.findGameObject2
  L3_96 = L3_96(L4_97, L5_98, L6_99)
  if L3_96 ~= nil then
    L4_97(L5_98, L6_99)
    L4_97(L5_98, L6_99)
    L4_97(L5_98, L6_99)
  end
  for L7_100 = 1, 16 do
    if L2_95:findGameObject2("GimmickBg", string.format("bg2_bom_%02d", L7_100)) ~= nil then
      L2_95:findGameObject2("GimmickBg", string.format("bg2_bom_%02d", L7_100)):setAutoRestore(60)
      L2_95:findGameObject2("GimmickBg", string.format("bg2_bom_%02d", L7_100)):setIgnoreGrab(false)
    end
  end
  L7_100 = "sis01"
  L7_100 = "setGemActive"
  L6_99(L7_100, true, "vital_b", 1, 5)
  while true do
    L7_100 = "isGmReady"
    if not L6_99 then
      L6_99()
    end
  end
  L7_100 = "getCrowHandle"
  L7_100 = typedef_CrowClass
  L7_100 = L7_100.new
  L7_100 = L7_100(L6_99)
  _crow = L7_100
  L7_100 = Fn_setCatWarpCheckPoint
  L7_100("locator2_pc_start_pos")
  _isGameOver = false
  _isCrowDemo = false
  L7_100 = Fn_missionStart
  L7_100()
  L7_100 = invokeTask
  L7_100 = L7_100(crowMove3)
  _crowTask = L7_100
  L7_100 = Fn_userCtrlOn
  L7_100()
  L7_100 = Fn_sendEventComSb
  L7_100("requestSpawn", {"enmgen2_01", "enmgen2_02"})
  L7_100 = HUD
  L7_100 = L7_100.sightMarkerSetDisable
  L7_100(L7_100, false)
  L7_100 = Fn_missionView
  L7_100("ep11_09014")
  _currentMissionText = "ep11_09014"
  L7_100 = HUD
  L7_100 = L7_100.info
  L7_100(L7_100, "ep11_info_01", false)
  L7_100 = waitSeconds
  L7_100(_MARKER_WAIT_AFTER_MISSION_VIEW)
  L7_100 = {
    Player.kAbility_Grab,
    Player.kAbility_ExGrab,
    Player.kAbility_Throw
  }
  Fn_unLockPlayerAbility(L7_100)
  _cid_message = {}
  _cid_message.cheer1 = false
  _cid_message.cheer2 = false
  _cid_message.nobomb = false
  invokeTask(function()
    repeat
      if isBomGrabbed() then
        Fn_naviSet(findGameObject2("Node", "locator2_navi_bridge"))
      else
        Fn_naviSet(findGameObject2("Node", "locator2_navi_ship"))
      end
      wait()
    until _bridge:isBroken()
    Fn_naviKill()
  end)
  repeat
    wait()
  until _bridge:isBroken() or _bridge:isOverBroken() or Fn_sendEventComSb("getGmHp", "f") <= 0
  crowDemo()
  repeat
    wait()
  until Fn_sendEventComSb("requestGmAction", "move", "locator2_boss_start_ep11_c")
  print("\228\186\161\233\156\138\233\131\189\229\184\130\227\129\171\231\167\187\229\139\149\227\129\174\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136")
  repeat
    wait()
  until _bridge:isBroken()
  _bridge:RequestBreakAll()
  Fn_naviKill()
  bomManager("abort")
  Fn_captionViewWait("ep11_09017")
  if L0_93 then
    L0_93:abort()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_101
  L0_101 = _crowTask
  if L0_101 ~= nil then
    L0_101 = _crowTask
    L0_101 = L0_101.abort
    L0_101(L0_101)
    _crowTask = nil
  end
  L0_101 = Fn_getPlayer
  L0_101 = L0_101()
  if L0_101 then
    L0_101 = {
      Player.kAbility_Grab,
      Player.kAbility_ExGrab,
      Player.kAbility_Throw
    }
    Fn_unLockPlayerAbility(L0_101)
  end
end
function getCenterPos(A0_102, A1_103)
  return Vector((A0_102.x + A1_103.x) / 2, (A0_102.y + A1_103.y) / 2, (A0_102.z + A1_103.z) / 2)
end
function crowDemo()
  local L0_104, L1_105, L2_106, L3_107
  L0_104 = _isGameOver
  if L0_104 then
    return
  end
  _isCrowDemo = true
  L0_104 = Fn_sendEventComSb
  L1_105 = "getNodeHandle"
  L2_106 = "locator2_sdemo_cam_01"
  L0_104 = L0_104(L1_105, L2_106)
  L1_105 = Fn_sendEventComSb
  L2_106 = "getNodeHandle"
  L3_107 = "locator2_crow_temp_ep11_b"
  L1_105 = L1_105(L2_106, L3_107)
  L2_106 = Player
  L3_107 = L2_106
  L2_106 = L2_106.setEnergy
  L2_106(L3_107, Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  L2_106 = Player
  L3_107 = L2_106
  L2_106 = L2_106.setEnergyInfinite
  L2_106(L3_107, Player.kEnergy_Gravity, true)
  L2_106 = Player
  L3_107 = L2_106
  L2_106 = L2_106.setStay
  L2_106(L3_107, true, true)
  L2_106 = Fn_sendEventComSb
  L3_107 = "requestIdling"
  L2_106(L3_107, {"enmgen2_01", "enmgen2_02"}, true)
  L2_106 = Fn_sendEventComSb
  L3_107 = "npcPause"
  L2_106(L3_107, "man45", true)
  L2_106 = Fn_sendEventComSb
  L3_107 = "npcPause"
  L2_106(L3_107, "wom25", true)
  L2_106 = Fn_sendEventComSb
  L3_107 = "npcPause"
  L2_106(L3_107, "man40", true)
  L2_106 = {L3_107}
  L3_107 = {}
  L3_107.pos = "locator2_sdemo_b_camera_02"
  L3_107.time = 5
  L3_107 = {
    {
      pos = "locator2_sdemo_b_target_02",
      time = 5
    }
  }
  _sdemo:set("locator2_sdemo_b_camera_01", Fn_getPlayer(), false)
  _sdemo:play(L2_106, L3_107)
  Fn_sendEventComSb("killArmEnemy", "f")
  waitSeconds(6)
  Fn_captionView("ep11_09016")
  waitSeconds(3)
  _crow_demo = false
  _sdemo:stop(0)
  _crow.setIdling(true)
  _crow.warpToNode(L1_105)
  Player:setEnergy(Player.kEnergy_Gravity, Player:getEnergyMax(Player.kEnergy_Gravity))
  Player:setEnergyInfinite(Player.kEnergy_Gravity, false)
  Player:setStay(false)
  Fn_sendEventComSb("requestIdling", {"enmgen2_01", "enmgen2_02"}, false)
  Fn_sendEventComSb("npcPause", "man45", false)
  Fn_sendEventComSb("npcPause", "wom25", false)
  Fn_sendEventComSb("npcPause", "man40", false)
  _isCrowDemo = false
end
function crowMove3()
  _crow.setAbility(Supporter.Ability.Follow, false)
  _crow.setAbility(Supporter.Ability.Warp, false)
  _crow.setIdling(false)
  _crow.clearMovePoint()
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_ep11_b_01"), Supporter.MovePoint.Takeoff, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_ep11_b_02"), Supporter.MovePoint.Air, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_ep11_b_03"), Supporter.MovePoint.Air, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_ep11_b_04"), Supporter.MovePoint.Air, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_ep11_b_05"), Supporter.MovePoint.Air, 5)
  _crow.startMove()
  print("CROW\231\167\187\229\139\149\233\150\139\229\167\139")
  repeat
    wait()
  until _crow.isMoveEnd()
  _crow.setIdling(true)
  _crow.warpToNode("locator2_crow_ep11_b_05")
  print("CROW\231\167\187\229\139\149\229\174\140\228\186\134")
end
function pccubesensor2_start_ep11_b_OnEnter(A0_108)
  print(string.format("minJoint:%d", _bridge:getMinJoint()))
  if _bridge:getMinJoint() < 5 and not _cid_message.cheer2 and _cid_message.cheer1 then
    Fn_captionView("ep11_09056")
    _cid_message.cheer1 = true
    _cid_message.cheer2 = true
  elseif _bridge:getMinJoint() < 12 and not _cid_message.cheer1 then
    Fn_captionView("ep11_09055")
    _cid_message.cheer1 = true
  else
    Fn_captionView("ep11_09057")
  end
end
function pccubesensor2_start_ep11_b_OnLeave(A0_109)
  if not _cid_message.nobomb then
    Fn_sendEventComSb("escapeNpcAction")
    if isBomGrabbed() then
      Fn_captionView("ep11_09015")
    else
      Fn_captionView("ep11_09050")
    end
    _cid_message.nobomb = true
  end
end
function pccubesensor2_warning_OnEnter(A0_110)
  local L1_111
end
function pccubesensor2_warning_OnLeave(A0_112)
  invokeTask(function()
    Fn_captionViewWait("ep11_01000")
  end)
end
function pccubesensor2_outrange_OnEnter(A0_113)
  local L1_114
end
function pccubesensor2_outrange_OnLeave(A0_115)
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep11_01000")
    Fn_missionView(_currentMissionText)
  end)
end
