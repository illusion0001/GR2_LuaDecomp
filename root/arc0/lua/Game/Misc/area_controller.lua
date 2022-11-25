import("Area")
AreaController = {}
function AreaController.create(A0_0)
  local L1_1, L2_2
  L1_1 = A0_0
  L2_2 = type
  L2_2 = L2_2(A0_0)
  if L2_2 == "string" then
    L2_2 = Fn_findAreaHandle
    L2_2 = L2_2(L1_1)
    L1_1 = L2_2
  end
  L2_2 = {}
  L2_2.name = A0_0
  L2_2.handle = L1_1
  L2_2.velocity = 10
  L2_2.loop = false
  L2_2.angle = 30
  L2_2.move_type = false
  L2_2.move_wait = false
  L2_2.move_end = false
  L2_2.anim = false
  L2_2.anim_ratio = 1
  L2_2.anim_repeat = 0
  L2_2.anim_wait = false
  L2_2.anim_end = false
  L2_2.drift = true
  L2_2.anim_cue = false
  AreaController._installMethods(L2_2)
  return L2_2
end
function AreaController.setMoveParam(A0_3, A1_4)
  local L2_5
  if A1_4 then
    L2_5 = A1_4.velocity
    if L2_5 ~= nil then
      L2_5 = A1_4.velocity
    else
      L2_5 = L2_5 or A0_3.velocity
    end
    A0_3.velocity = L2_5
    L2_5 = A1_4.angle
    if L2_5 ~= nil then
      L2_5 = A1_4.angle
    else
      L2_5 = L2_5 or A0_3.angle
    end
    A0_3.angle = L2_5
    L2_5 = A1_4.loop
    if L2_5 ~= nil then
      L2_5 = A1_4.loop
    else
      L2_5 = L2_5 or false
    end
    A0_3.loop = L2_5
    L2_5 = A1_4.move_wait
    if L2_5 ~= nil then
      L2_5 = A1_4.move_wait
    else
      L2_5 = L2_5 or false
    end
    A0_3.move_wait = L2_5
    L2_5 = A1_4.move_type
    if L2_5 ~= nil then
      L2_5 = A1_4.move_type
    else
      L2_5 = L2_5 or 1
    end
    A0_3.move_type = L2_5
    L2_5 = A1_4.move_atime
    if L2_5 ~= nil then
      L2_5 = A1_4.move_atime
    else
      L2_5 = L2_5 or A0_3.move_atime
    end
    A0_3.move_atime = L2_5
    L2_5 = A1_4.move_bdist
    if L2_5 ~= nil then
      L2_5 = A1_4.move_bdist
    else
      L2_5 = L2_5 or A0_3.move_bdist
    end
    A0_3.move_bdist = L2_5
  end
end
function AreaController.move(A0_6, A1_7)
  local L2_8, L3_9, L4_10, L5_11, L6_12
  if not L2_8 then
    L2_8(L3_9)
    return L2_8
  end
  A0_6.move_end = false
  A0_6.drift = L2_8
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  L2_8(L3_9, L4_10)
  if L2_8 == "table" then
    A0_6.targets = true
    L2_8(L3_9, L4_10)
    L2_8(L3_9, L4_10)
    L2_8(L3_9)
    for L5_11, L6_12 in L2_8(L3_9) do
      A0_6.handle:appendMoveTarget(A0_6:_findNode(L6_12))
    end
    L2_8(L3_9)
  else
    A0_6.targets = false
    if L2_8 == 2 then
      L5_11 = A0_6
      L6_12 = A1_7
      L5_11 = A0_6.move_atime
      L6_12 = A0_6.move_bdist
      L2_8(L3_9, L4_10, L5_11, L6_12)
    else
      L5_11 = A0_6
      L6_12 = A1_7
      L6_12 = L4_10(L5_11, L6_12)
      L2_8(L3_9, L4_10, L5_11, L6_12, L4_10(L5_11, L6_12))
    end
  end
  if L2_8 then
    repeat
      L2_8()
    until L2_8
    A0_6.move_end = true
    L2_8(L3_9, L4_10)
  else
    L2_8(L3_9)
  end
end
function AreaController.isMoveEnd(A0_13)
  local L1_14
  L1_14 = A0_13.move_end
  return L1_14
end
function AreaController.load(A0_15, A1_16)
  if A0_15.handle then
    A0_15.handle:loadMotionFileAsset(A1_16)
    repeat
      wait()
    until not A0_15.handle:isMotionLoading()
    A0_15.anim = true
  end
end
function AreaController.setPlayParam(A0_17, A1_18)
  local L2_19
  if A1_18 then
    L2_19 = A1_18.ratio
    if L2_19 ~= nil then
      L2_19 = A1_18.ratio
    else
      L2_19 = L2_19 or A0_17.anim_ratio
    end
    A0_17.anim_ratio = L2_19
    L2_19 = A1_18.loop
    if L2_19 ~= nil then
      L2_19 = A1_18.loop
    else
      L2_19 = L2_19 or A0_17.anim_repeat
    end
    A0_17.anim_repeat = L2_19
    L2_19 = A1_18.anim_wait
    if L2_19 ~= nil then
      L2_19 = A1_18.anim_wait
    else
      L2_19 = L2_19 or A0_17.anim_wait
    end
    A0_17.anim_wait = L2_19
  end
end
function AreaController.cue(A0_20)
  local L1_21
  L1_21 = A0_20.handle
  if L1_21 then
    L1_21 = A0_20.anim
  elseif not L1_21 then
    L1_21 = print
    L1_21(" [ misc ac ] \227\130\168\227\131\170\227\130\162\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\139\227\128\129\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\129\140\227\131\173\227\131\188\227\131\137\227\129\167\227\129\141\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129\233\160\173\229\135\186\227\129\151\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
    L1_21 = false
    return L1_21
  end
  L1_21 = A0_20.handle
  L1_21 = L1_21.getDriftEnable
  L1_21 = L1_21(L1_21)
  A0_20.drift = L1_21
  L1_21 = A0_20.handle
  L1_21 = L1_21.setDriftEnable
  L1_21(L1_21, false)
  L1_21 = A0_20.handle
  L1_21 = L1_21.setMoveEnable
  L1_21(L1_21, true)
  L1_21 = A0_20._findWarpNode
  L1_21 = L1_21(A0_20, node_name)
  if L1_21 then
    A0_20:_areaFree()
    if Area:getAnimEnable() == false then
      Area:setAnimEnable(true)
    end
    A0_20.handle:resetMoveAnim()
    A0_20.handle:setMoveAnimRatio(1)
    A0_20.handle:playMoveAnim(A0_20.anim_repeat)
    wait()
    A0_20.handle:setMoveAnimRatio(0)
    if Area:getAnimEnable() == false then
      Area:setAnimEnable(false)
    end
    wait()
    A0_20:_warpPlayer(L1_21)
    L1_21:try_term()
  else
    if Area:getAnimEnable() == false then
      Area:setAnimEnable(true)
    end
    A0_20.handle:resetMoveAnim()
    A0_20.handle:setMoveAnimRatio(1)
    A0_20.handle:playMoveAnim(A0_20.anim_repeat)
    wait()
    A0_20.handle:setMoveAnimRatio(0)
    if Area:getAnimEnable() == false then
      Area:setAnimEnable(false)
    end
    wait()
  end
  A0_20.handle:setDriftEnable(A0_20.drift)
  A0_20.handle:setMoveEnable(true)
  A0_20.anim_cue = true
end
function AreaController.play(A0_22, A1_23)
  local L2_24
  L2_24 = A0_22.handle
  if L2_24 then
    L2_24 = A0_22.anim
  elseif not L2_24 then
    L2_24 = print
    L2_24(" [ misc ac ] \227\130\168\227\131\170\227\130\162\227\129\140\229\173\152\229\156\168\227\129\151\227\129\170\227\129\132\227\129\139\227\128\129\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\129\140\227\131\173\227\131\188\227\131\137\227\129\167\227\129\141\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\227\128\129\229\134\141\231\148\159\227\129\167\227\129\141\227\129\190\227\129\155\227\130\147")
    L2_24 = false
    return L2_24
  end
  A0_22.anim_end = false
  L2_24 = A0_22.handle
  L2_24 = L2_24.getDriftEnable
  L2_24 = L2_24(L2_24)
  A0_22.drift = L2_24
  L2_24 = A0_22.handle
  L2_24 = L2_24.setDriftEnable
  L2_24(L2_24, false)
  L2_24 = A0_22.handle
  L2_24 = L2_24.setMoveEnable
  L2_24(L2_24, true)
  L2_24 = A0_22._findWarpNode
  L2_24 = L2_24(A0_22, A1_23)
  if L2_24 then
    if A0_22.anim_cue == false then
      A0_22:_areaFree()
      A0_22.handle:setMoveAnimRatio(0)
      A0_22.handle:playMoveAnim(A0_22.anim_repeat)
      wait()
      A0_22:_warpPlayer(L2_24)
    end
    A0_22.handle:setMoveAnimRatio(A0_22.anim_ratio)
  else
    A0_22.handle:setMoveAnimRatio(A0_22.anim_ratio)
    if A0_22.anim_cue == false then
      A0_22.handle:playMoveAnim(A0_22.anim_repeat)
    end
  end
  A0_22.anim_cue = false
  if A0_22.anim_wait then
    repeat
      wait()
    until A0_22.handle:isMoveAnimEnd()
    A0_22.anim_end = true
    A0_22.handle:setDriftEnable(A0_22.drift)
    A0_22.handle:setMoveEnable(true)
  else
    invokeTask(function()
      repeat
        wait()
      until A0_22.handle:isMoveAnimEnd()
      A0_22.anim_end = true
      A0_22.handle:setDriftEnable(A0_22.drift)
      A0_22.handle:setMoveEnable(true)
    end)
  end
end
function AreaController.isPlayEnd(A0_25)
  local L1_26
  L1_26 = A0_25.anim_end
  return L1_26
end
function AreaController.stop(A0_27)
  if A0_27.anim then
    A0_27.handle:stopMoveAnim()
  elseif A0_27.targets then
    A0_27.handle:beginMoveTargets()
    A0_27.handle:endMoveTargets()
  elseif A0_27.move_type == 2 then
    A0_27.handle:setMoveTarget2(nil)
  else
    A0_27.handle:setMoveTarget(nil)
  end
  A0_27.handle:setDriftEnable(A0_27.drift)
  A0_27.handle:setMoveEnable(false)
end
function AreaController.reset(A0_28)
  A0_28.handle:stopMoveAnim()
  A0_28.handle:resetMoveAnim()
  A0_28.handle:beginMoveTargets()
  A0_28.handle:endMoveTargets()
  A0_28.handle:setMoveTarget2(nil)
  A0_28.handle:setMoveTarget(nil)
  A0_28.handle:setMoveEnable(true)
end
function AreaController.pause(A0_29, A1_30)
  if A0_29.anim then
    if A1_30 == true then
      A0_29.handle:setMoveAnimRatio(0)
      A0_29.handle:setMoveEnable(false)
    else
      A0_29.handle:setMoveAnimRatio(A0_29.anim_ratio)
      A0_29.handle:setMoveEnable(true)
    end
  elseif A1_30 or A1_30 == nil then
    A0_29.handle:setMoveVelocity(0)
  else
    A0_29.handle:setMoveVelocity(A0_29.velocity)
  end
end
function AreaController.warp(A0_31, A1_32, A2_33)
  local L3_34, L4_35, L5_36, L6_37
  L3_34 = A0_31.handle
  if not L3_34 then
    L3_34 = false
    return L3_34
  end
  L4_35 = A0_31
  L3_34 = A0_31._findNode
  L5_36 = A1_32
  L3_34 = L3_34(L4_35, L5_36)
  L4_35 = true
  if A2_33 then
    L4_35 = false
    L6_37 = L3_34
    L5_36 = L3_34.getWorldPos
    L5_36 = L5_36(L6_37)
    L6_37 = A0_31.handle
    L6_37 = L6_37.getWorldPos
    L6_37 = L6_37(L6_37)
    if A2_33 < L5_36:DistanceTo(L6_37) then
      L4_35 = true
    end
  end
  if L4_35 then
    L5_36 = A0_31.handle
    L6_37 = L5_36
    L5_36 = L5_36.getDriftEnable
    L5_36 = L5_36(L6_37)
    L6_37 = A0_31.handle
    L6_37 = L6_37.setDriftEnable
    L6_37(L6_37, false)
    L6_37 = A0_31._findWarpNode
    L6_37 = L6_37(A0_31)
    if L6_37 then
      A0_31:_areaFree()
      A0_31:_warpSelf(L3_34)
      A0_31:_warpPlayer(L6_37)
      L6_37:try_term()
    else
      A0_31:_warpSelf(L3_34)
    end
    A0_31.handle:setDriftEnable(L5_36)
  end
end
function AreaController._findNode(A0_38, A1_39)
  local L2_40
  L2_40 = A1_39
  if type(L2_40) == "string" then
    L2_40 = findGameObject2("Node", L2_40)
  end
  if L2_40 then
    if type(L2_40) == "table" then
      print(" [ misc ac ] pos " .. tostring(A1_39))
    else
      print(" [ misc ac ] " .. L2_40:getName() .. " : " .. L2_40:getTypeName())
    end
  end
  return L2_40
end
function AreaController._isValid(A0_41)
  local L1_42
  if A0_41 == nil then
    L1_42 = false
    return L1_42
  end
  L1_42 = true
  return L1_42
end
function AreaController._installMethods(A0_43)
  local L1_44, L2_45, L3_46, L4_47, L5_48
  for L4_47, L5_48 in L1_44(L2_45) do
    if type(L5_48) == "function" then
      A0_43[L4_47] = L5_48
    end
  end
end
function AreaController._findWarpNode(A0_49, A1_50)
  local L2_51
  L2_51 = nil
  if A0_49.handle:getName() == Player:getRecentAreaName() then
    if A1_50 == nil then
      L2_51 = createGameObject2("Node")
      L2_51:setName("tmp_kit_warp_node")
      A0_49.handle:appendChild(L2_51)
      L2_51:setWorldTransform(Player:getPuppet():getWorldTransform())
      L2_51:try_init()
      L2_51:waitForReady()
      L2_51:try_start()
    else
      L2_51 = A0_49:_findNode(A1_50)
    end
  end
  return L2_51
end
function AreaController._areaFree(A0_52)
  Player:getPuppet():setCollidable(false)
  Area:setEnableLoading(false)
  Area:setAreaFree()
  wait()
  print(" [ misc ac ] \227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\228\185\151\227\129\163\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\228\184\128\230\151\166\230\137\128\229\177\158\227\130\146\229\136\135\227\130\138\227\129\190\227\129\151\227\129\159")
end
function AreaController._warpPlayer(A0_53, A1_54)
  if A1_54 then
    A1_54:setForceMove()
    wait()
    print(" [ misc ac ] \227\130\173\227\131\136\227\130\165\227\131\179\227\129\174\231\167\187\229\139\149\229\133\136\227\131\142\227\131\188\227\131\137 : " .. tostring(A1_54:getName()))
    print(" [ misc ac ] \227\130\173\227\131\136\227\130\165\227\131\179\227\129\174\231\167\187\229\139\149\229\137\141       : " .. tostring(Player:getPuppet():getWorldTransform()))
    Player:reset(Player.kReset_Standing, A1_54:getWorldTransform())
  end
  Player:getPuppet():setCollidable(true)
  Area:setEnableLoading(true)
  wait()
  print(" [ misc ac ] \227\130\173\227\131\136\227\130\165\227\131\179\227\129\174\231\167\187\229\139\149\229\190\140       : " .. tostring(Player:getPuppet():getWorldTransform()))
  print(" [ misc ac ] \227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\227\131\175\227\131\188\227\131\151\227\129\149\227\129\155\227\129\190\227\129\151\227\129\159")
  while Area:isLoading() do
    wait()
  end
  print(" [ misc ac ] \227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\227\131\175\227\131\188\227\131\151\229\190\140\227\129\174\232\170\173\227\129\191\232\190\188\227\129\191\229\190\133\227\129\161\231\181\130\228\186\134")
end
function AreaController._warpSelf(A0_55, A1_56)
  print(" [ misc ac ] \231\167\187\229\139\149\227\130\168\227\131\170\227\130\162\229\144\141         : " .. tostring(A0_55.handle:getName()))
  print(" [ misc ac ] \227\130\168\227\131\170\227\130\162\227\129\174\231\167\187\229\139\149\229\133\136\227\131\142\227\131\188\227\131\137 : " .. tostring(A1_56:getName()) .. " : " .. tostring(A1_56:getWorldTransform()))
  print(" [ misc ac ] \227\130\168\227\131\170\227\130\162\227\129\174\231\167\187\229\139\149\229\137\141       : " .. tostring(A0_55.handle:getWorldTransform()))
  A0_55.handle:setWorldTransform(A1_56:getWorldTransform())
  A0_55.handle:setForceMove()
  wait()
  print(" [ misc ac ] \227\130\168\227\131\170\227\130\162\227\129\174\231\167\187\229\139\149\229\190\140       : " .. tostring(A0_55.handle:getWorldTransform()))
end
