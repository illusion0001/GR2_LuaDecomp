_death_ghost_list = {}
_on_hold_death_ghost_list = {}
_create_comp_death_ghost = false
_get_death_ghost_load_task = nil
_on_hold_create_comp_death_ghost = false
_on_hold_get_death_ghost_load_task = nil
function creatDeathGhost(A0_0, A1_1, A2_2)
  if not _get_death_ghost_load_task then
    _create_comp_death_ghost = false
    removeAllDeathGhost()
    _get_death_ghost_load_task = invokeSystemTask(function()
      local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11
      L0_3 = A1_1
      L1_4 = A2_2
      L2_5 = type
      L3_6 = L0_3
      L2_5 = L2_5(L3_6)
      if "string" == L2_5 then
        L2_5 = Fn_findAreaHandle
        L3_6 = L0_3
        L2_5 = L2_5(L3_6)
        L0_3 = L2_5
      end
      L2_5 = type
      L3_6 = L1_4
      L2_5 = L2_5(L3_6)
      if "string" == L2_5 then
        L2_5 = findGameObject2
        L3_6 = "Node"
        L2_5 = L2_5(L3_6, L4_7)
        L1_4 = L2_5
      end
      L2_5 = syncGhost
      L3_6 = A0_0
      L2_5 = L2_5(L3_6)
      if L2_5 ~= nil then
        L3_6 = print
        L8_11 = L4_7(L5_8, L6_9)
        L3_6(L4_7, L5_8, L6_9, L7_10, L8_11, L4_7(L5_8, L6_9))
        L3_6 = {}
        for L7_10, L8_11 in L4_7(L5_8) do
          if __creatDeathGhost(L8_11, A1_1, A2_2) then
            table.insert(L3_6, L8_11)
          end
        end
        L2_5 = nil
        _death_ghost_list = L3_6
      else
        L3_6 = print
        L3_6(L4_7)
        L3_6 = {}
        _death_ghost_list = L3_6
      end
      _create_comp_death_ghost = true
      _get_death_ghost_load_task = nil
    end)
  end
end
function syncGhost(A0_12)
  local L1_13, L2_14, L3_15
  L1_13 = print
  L2_14 = "\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\131\135\227\131\188\227\130\191\227\130\146\229\143\151\228\191\161"
  L1_13(L2_14)
  L1_13 = 900
  L2_14 = 1
  L3_15 = nil
  repeat
    L2_14, L3_15 = Ugc:getDeathGhostInfo(A0_12)
    print("getDeathGhostInfo:", L2_14)
    L1_13 = L1_13 - 1
    if L1_13 < 0 then
      print("\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\227\131\135\227\131\188\227\130\191\227\130\146\229\143\151\227\129\145\229\143\150\227\130\140\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159\227\128\130")
      break
    end
    wait()
  until L2_14 == 0
  if L2_14 ~= 0 then
    L3_15 = nil
  end
  return L3_15
end
function dealOnHoldDeathGhost(A0_16, A1_17)
  if not _on_hold_get_death_ghost_load_task then
    _on_hold_create_comp_death_ghost = false
    _on_hold_get_death_ghost_load_task = invokeSystemTask(function()
      local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24
      L0_18 = A0_16
      L1_19 = A1_17
      if "string" == L2_20 then
        L0_18 = L2_20
      end
      if "string" == L2_20 then
        L1_19 = L2_20
      end
      if not L0_18 or "" == L0_18 or not L1_19 or "" == L1_19 then
        L2_20(L3_21)
        _on_hold_get_death_ghost_load_task = nil
        _on_hold_create_comp_death_ghost = true
        return
      end
      if L2_20 then
        if L2_20 > 0 then
          for L5_23, L6_24 in L2_20(L3_21) do
            if L6_24.ghostPuppet then
              print("\228\191\157\231\149\153\227\129\171\227\129\151\227\129\166\227\129\132\227\129\159\227\130\180\227\131\188\227\130\185\227\131\136\239\188\154" .. L6_24.ghostPuppet:getName() .. " \231\148\159\230\136\144")
              __creatDeathGhost_last_half(L6_24, L0_18, L1_19)
              table.insert(_death_ghost_list, L6_24)
            end
          end
        end
      end
      _on_hold_death_ghost_list = L2_20
      _on_hold_get_death_ghost_load_task = nil
      _on_hold_create_comp_death_ghost = true
    end)
  end
end
function isCreatCompdealOnHoldDeathGhost()
  local L0_25, L1_26
  L0_25 = _on_hold_create_comp_death_ghost
  return L0_25
end
function isCreatCompDeathGhost()
  local L0_27, L1_28
  L0_27 = _create_comp_death_ghost
  return L0_27
end
function gettDeathGhostSetArea()
  local L0_29
  L0_29 = _create_comp_death_ghost
  if L0_29 then
    L0_29 = {}
    for _FORV_4_, _FORV_5_ in pairs(_death_ghost_list) do
      table.insert(L0_29, _FORV_5_.area:getName())
    end
    return L0_29
  end
  L0_29 = nil
  return L0_29
end
function removeDeathGhost(A0_30)
  local L1_31, L2_32, L3_33, L4_34
  for L4_34, _FORV_5_ in L1_31(L2_32) do
    if _FORV_5_.onlineID == A0_30 then
      if _FORV_5_.task then
        _FORV_5_.task:abort()
      end
      if _FORV_5_.ghostPuppet ~= nil then
        _FORV_5_.ghostPuppet:try_term()
      end
      table.remove(_death_ghost_list, L4_34)
      return
    end
  end
end
function removeAllDeathGhost()
  for _FORV_3_, _FORV_4_ in ipairs(_death_ghost_list) do
    if _FORV_4_.task then
      _FORV_4_.task:abort()
    end
    if _FORV_4_.ghostPuppet ~= nil then
      _FORV_4_.ghostPuppet:try_term()
    end
  end
  _death_ghost_list = {}
end
function runDeathGhost()
  local L0_35, L1_36, L2_37, L3_38, L4_39
  for L3_38, L4_39 in L0_35(L1_36) do
    L4_39.ghostPuppet:setActive(true)
    L4_39.ghostPuppet:setVisible(true)
    if L4_39.task then
      L4_39.task:abort()
      L4_39.task = nil
    end
    L4_39.task = invokeTask(function(A0_40)
      repeat
        wait(10)
      until __checkGhost(A0_40)
      removeDeathGhost(A0_40.onlineID)
    end, L4_39)
    if L4_39.marker then
      L4_39.marker:setActive(true)
    end
  end
end
function stopDeathGhost()
  for _FORV_3_, _FORV_4_ in pairs(_death_ghost_list) do
    _FORV_4_.ghostPuppet:setActive(false)
    _FORV_4_.ghostPuppet:setVisible(false)
    if _FORV_4_.task then
      _FORV_4_.task:abort()
      _FORV_4_.task = nil
    end
  end
end
function __creatDeathGhost(A0_41, A1_42, A2_43)
  local L3_44
  L3_44 = A0_41.replay
  if not L3_44 then
    L3_44 = print
    L3_44(string.format("%s \227\129\174\227\131\170\227\131\151\227\131\172\227\130\164\227\131\135\227\131\188\227\130\191\227\129\140\228\184\141\230\173\163\227\129\167\227\129\153", A0_41.onlineID))
    return
  end
  L3_44 = __createGhostPuppet
  L3_44 = L3_44(A0_41.onlineID, A0_41.replay)
  A0_41.ghostPuppet = L3_44
  L3_44 = A0_41.ghostPuppet
  L3_44 = L3_44.getPuppet
  L3_44 = L3_44(L3_44)
  A0_41.puppet = L3_44
  L3_44 = A0_41.puppet
  L3_44 = L3_44.getBrain
  L3_44 = L3_44(L3_44)
  A0_41.brain = L3_44
  L3_44 = A0_41.puppet
  L3_44 = L3_44.setVisible
  L3_44(L3_44, false)
  L3_44 = 0
  A0_41.area = A0_41.brain:getArea(L3_44)
  if A0_41.area == nil then
    if A1_42 and A2_43 then
      print("\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\174\233\133\141\231\189\174\227\130\168\227\131\170\227\130\162\227\130\146\228\187\163\230\155\191\227\129\151\227\129\166\233\133\141\231\189\174\227\130\146\232\169\166\227\129\191\227\130\139 : " .. A0_41.onlineID)
      __creatDeathGhost_last_half(A0_41, A1_42, A2_43)
    else
      print("\230\173\187\227\129\171\227\129\150\227\129\190\227\130\180\227\131\188\227\130\185\227\131\136\227\129\139\227\130\137\233\133\141\231\189\174\227\130\168\227\131\170\227\130\162\227\129\174\230\138\189\229\135\186\227\129\140\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147\227\129\167\227\129\151\227\129\159 : " .. A0_41.onlineID)
      table.insert(_on_hold_death_ghost_list, A0_41)
      return false
    end
  else
    print(A0_41.onlineID .. " \227\129\175\227\128\129" .. A0_41.area:getName() .. " \227\129\171\233\133\141\231\189\174")
    __creatDeathGhost_last_half(A0_41)
  end
  return true
end
function __creatDeathGhost_last_half(A0_45, A1_46, A2_47)
  local L3_48, L4_49, L5_50, L6_51, L7_52
  L3_48 = 0
  if A1_46 then
    A0_45.area = A1_46
  end
  L4_49 = A0_45.brain
  L5_50 = L4_49
  L4_49 = L4_49.getLPos
  L6_51 = L3_48
  L4_49 = L4_49(L5_50, L6_51)
  L5_50 = A0_45.brain
  L6_51 = L5_50
  L5_50 = L5_50.getLAng
  L7_52 = L3_48
  L5_50 = L5_50(L6_51, L7_52)
  L6_51 = createGameObject2
  L7_52 = "Node"
  L6_51 = L6_51(L7_52)
  A0_45.node = L6_51
  L6_51 = A0_45.node
  L7_52 = L6_51
  L6_51 = L6_51.setName
  L6_51(L7_52, "locator_" .. A0_45.onlineID .. "_node")
  L6_51 = A0_45.area
  L7_52 = L6_51
  L6_51 = L6_51.appendChild
  L6_51(L7_52, A0_45.node)
  if A2_47 then
    L6_51 = A0_45.area
    L7_52 = L6_51
    L6_51 = L6_51.appendChild
    L6_51(L7_52, A0_45.node)
    L6_51 = A0_45.node
    L7_52 = L6_51
    L6_51 = L6_51.setTransform
    L6_51(L7_52, A2_47:getTransform())
    L7_52 = A2_47
    L6_51 = A2_47.getWorldPos
    L6_51 = L6_51(L7_52)
    L6_51 = L6_51 - L4_49
    L7_52 = Vector
    L7_52 = L7_52(RandF(-2, 2), RandF(2), RandF(-2, 2))
    L7_52 = L7_52:Normalize()
    L7_52.x = L7_52.x * 1.5
    L7_52.y = L7_52.y * 1.5
    L7_52.z = L7_52.z * 1.5
    L6_51 = L6_51 + L7_52
    A0_45.ghostPuppet:setOffsetVec_World(0, L6_51)
  else
    L6_51 = A0_45.area
    L7_52 = L6_51
    L6_51 = L6_51.appendChild
    L6_51(L7_52, A0_45.node)
    L6_51 = A0_45.node
    L7_52 = L6_51
    L6_51 = L6_51.setTransform
    L6_51(L7_52, L4_49, L5_50)
  end
  L6_51 = A0_45.node
  L7_52 = L6_51
  L6_51 = L6_51.try_init
  L6_51(L7_52)
  L6_51 = A0_45.node
  L7_52 = L6_51
  L6_51 = L6_51.waitForReadyAsync
  L6_51(L7_52, function(A0_53)
    A0_53:try_start()
  end)
  L6_51 = HUD
  L7_52 = L6_51
  L6_51 = L6_51.createGhostMarker
  L6_51 = L6_51(L7_52, {
    id = A0_45.onlineID,
    obj = A0_45.node,
    length = 40
  })
  A0_45.marker = L6_51
  L6_51 = A0_45.marker
  L7_52 = L6_51
  L6_51 = L6_51.setActive
  L6_51(L7_52, false)
  L6_51 = __createEffect
  L7_52 = "ef_ui_deathpar"
  L6_51 = L6_51(L7_52, "ef_ui_deathpar", A0_45.area, A0_45.node:getPos() + Vector(0, 1.5, 0))
  A0_45.sfx = L6_51
  A0_45.task = nil
end
function __createGhostPuppet(A0_54, A1_55)
  createGameObject2("GhostPuppet"):setName(A0_54)
  createGameObject2("GhostPuppet"):setAssetName("ghost05")
  createGameObject2("GhostPuppet"):setCopyFile(A1_55)
  createGameObject2("GhostPuppet"):setGhostType(GhostPuppet.kGhostType_ReplayOnly)
  createGameObject2("GhostPuppet"):setVisible(false)
  createGameObject2("GhostPuppet"):try_init()
  createGameObject2("GhostPuppet"):waitForReady()
  createGameObject2("GhostPuppet"):try_start()
  print("createGhost:" .. A0_54)
  return (createGameObject2("GhostPuppet"))
end
function __createEffect(A0_56, A1_57, A2_58, A3_59)
  local L4_60
  L4_60 = createGameObject2
  L4_60 = L4_60("Effect")
  L4_60:setName(A0_56)
  L4_60:setModelName(A1_57)
  if A2_58 then
    A2_58:appendChild(L4_60)
  end
  L4_60:setPos(A3_59)
  L4_60:try_init()
  L4_60:waitForReadyAsync(function(A0_61)
    A0_61:try_start()
    A0_61:play()
    A0_61:setLoop(true)
  end)
  return L4_60
end
function __isGhostTouchable(A0_62)
  local L1_63, L3_64
  L1_63 = 25
  L3_64 = 5
  if L1_63 > Fn_getDistanceToPlayer(A0_62) and Fn_isInSightTarget(A0_62, 0.7) and Fn_isPlayerReyCheck(A0_62, L1_63) then
  else
  end
  return Fn_isInSightTarget(A0_62, 0.3) and true
end
function __checkGhost(A0_65)
  if __isGhostTouchable(A0_65.sfx) then
    print(A0_65.onlineID .. "\227\130\146\231\153\186\232\166\139\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
    __touchGhost(A0_65)
    return true
  else
    return false
  end
end
function __touchGhost(A0_66)
  local L1_67, L2_68, L3_69, L4_70, L5_71, L6_72, L7_73
  L1_67 = print
  L2_68 = string
  L2_68 = L2_68.format
  L7_73 = L2_68(L3_69, L4_70)
  L1_67(L2_68, L3_69, L4_70, L5_71, L6_72, L7_73, L2_68(L3_69, L4_70))
  L1_67 = Ugc
  L2_68 = L1_67
  L1_67 = L1_67.touchDeathGhost
  L1_67 = L1_67(L2_68, L3_69)
  L2_68 = print
  L6_72 = #L1_67
  L7_73 = L3_69(L4_70, L5_71, L6_72)
  L2_68(L3_69, L4_70, L5_71, L6_72, L7_73, L3_69(L4_70, L5_71, L6_72))
  L2_68 = A0_66.sfx
  L2_68 = L2_68.try_term
  L2_68(L3_69)
  A0_66.sfx = nil
  L2_68 = A0_66.brain
  L2_68 = L2_68.getCnt
  L2_68 = L2_68(L3_69)
  L6_72 = GameDatabase
  L7_73 = L6_72
  L6_72 = L6_72.get
  L6_72 = L6_72(L7_73, ggd.Savedata__StatisticalChart__GhostCollectCount)
  L6_72 = L6_72 + 1
  L3_69(L4_70, L5_71, L6_72)
  L3_69(L4_70, L5_71)
  for L6_72 = 1, #L1_67 do
    L7_73 = GlobalGem
    L7_73 = L7_73.convertTalismanOreInfo
    L7_73 = L7_73(L7_73, L1_67[L6_72].Hi, L1_67[L6_72].Lo, L1_67[L6_72].Other)
    oreDrop2(L7_73, A0_66.node)
  end
  L3_69(L4_70, L5_71)
  L3_69(L4_70, L5_71)
  L3_69(L4_70, L5_71)
  L3_69(L4_70)
  L3_69(L4_70)
  L3_69(L4_70, L5_71)
end
_debug_down_load_death_ghost = {
  name = "DownLoadDeathGhost",
  callback = function()
    if __dbg_deathGhost_task then
      __dbg_deathGhost_task:abort()
      __dbg_deathGhost_task = nil
    end
    __dbg_deathGhost_task = invokeTask(function()
      Ugc:removeInstantDeathGhost()
      Ugc:downloadOtherDeathGhost()
      Fn_missionRetry()
    end)
  end
}
table.insert(g_customDebugMenu, _debug_down_load_death_ghost)
