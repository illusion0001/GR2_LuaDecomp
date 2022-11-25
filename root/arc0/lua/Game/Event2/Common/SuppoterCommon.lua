dofile("/Game/Supporter/supporter_spawn.lua")
function Fn_spawnSuppotCrow(A0_0, A1_1, A2_2, A3_3, A4_4)
  local L5_5, L6_6
  L5_5 = findGameObject2
  L6_6 = "Node"
  L5_5 = L5_5(L6_6, A2_2 or "locator2_crow_start_pos")
  L6_6 = Vector
  L6_6 = L6_6(0, 0, 0)
  if L5_5 ~= nil then
    print("*** Fn_spawnSuppotCrow ***")
    print("     node.pos" .. tostring(L5_5:getWorldPos()))
    print("     node.rot" .. tostring(L5_5:getWorldRot()))
    print("*** ****************** ***")
    L5_5:setForceMove()
    wait()
    return Supporter.Spawner.create_supporter_crow_to_node(L5_5, A0_0, A1_1, A3_3, A4_4)
  else
    return Supporter.Spawner.create_supporter_crow(L6_6, nil, A0_0, A1_1, A3_3, A4_4)
  end
end
function Fn_spawnSuppotKitten(A0_7, A1_8, A2_9, A3_10, A4_11)
  local L5_12, L6_13
  L5_12 = findGameObject2
  L6_13 = "Node"
  L5_12 = L5_12(L6_13, A1_8 or "locator2_kitten_start_pos")
  L6_13 = Vector
  L6_13 = L6_13(0, 0, 0)
  if L5_12 ~= nil then
    print("*** Fn_spawnSuppotKitten ***")
    print("     node.pos" .. tostring(L5_12:getWorldPos()))
    print("     node.rot" .. tostring(L5_12:getWorldRot()))
    print("*** ****************** ***")
    L5_12:setForceMove()
    wait()
    return Supporter.Spawner.create_supporter_kitten_to_node(L5_12, A0_7, A2_9, A3_10, A4_11)
  else
    return Supporter.Spawner.create_supporter_kitten(L6_13, nil, A0_7, A2_9, A3_10, A4_11)
  end
end
function Fn_spawnSuppotKali(A0_14)
  local L1_15, L2_16
  L1_15 = findGameObject2
  L2_16 = "Node"
  L1_15 = L1_15(L2_16, "locator2_kali_start_pos")
  L2_16 = Vector
  L2_16 = L2_16(0, 0, 0)
  if L1_15 ~= nil then
    L1_15:setForceMove()
    wait()
    L2_16 = L1_15:getWorldPos()
  end
  return Supporter.Spawner.create_supporter_crow(L2_16, enemy)
end
function Fn_loadSupporterEventMotion(A0_17, A1_18)
  local L2_19, L3_20, L4_21, L5_22, L6_23
  for L5_22, L6_23 in L2_19(L3_20) do
    A0_17:loadPoseAnimation(L6_23, L6_23)
  end
  while true do
    if L2_19 then
      L2_19()
    end
  end
end
function Fn_playSupporterEventMotion(A0_24, A1_25, A2_26, A3_27)
  local L4_28
  L4_28 = {}
  L4_28.isRepeat = false
  L4_28.animBlendDuration = 0
  L4_28.isRepeat = A2_26 or L4_28.isRepeat
  L4_28.animBlendDuration = A3_27 or L4_28.animBlendDuration
  A0_24:playPoseAnimation(A1_25, L4_28)
end
function Fn_spawnSuppotCrowGhost(A0_29, A1_30, A2_31)
  local L3_32, L4_33
  L3_32 = findGameObject2
  L4_33 = "Node"
  L3_32 = L3_32(L4_33, A2_31 or "locator2_crow_start_pos")
  L4_33 = Vector
  L4_33 = L4_33(0, 0, 0)
  if L3_32 ~= nil then
    print("*** Fn_spawnSuppotCrowGhost ***")
    print("     node.pos" .. tostring(L3_32:getWorldPos()))
    print("     node.rot" .. tostring(L3_32:getWorldRot()))
    print("*** ****************** ***")
    L3_32:setForceMove()
    wait()
    return Supporter.Spawner.create_supporter_crow_ghost_to_node(L3_32, A0_29, A1_30)
  else
    return Supporter.Spawner.create_supporter_crow_ghost(L4_33, nil, A0_29, A1_30)
  end
end
function Fn_spawnSuppotCrowForGaruda(A0_34, A1_35, A2_36)
  local L3_37, L4_38
  L3_37 = findGameObject2
  L4_38 = "Node"
  L3_37 = L3_37(L4_38, A2_36 or "locator2_crow_start_pos")
  L4_38 = Vector
  L4_38 = L4_38(0, 0, 0)
  if L3_37 ~= nil then
    print("*** Fn_spawnSuppotCrowForGaruda ***")
    print("     node.pos" .. tostring(L3_37:getWorldPos()))
    print("     node.rot" .. tostring(L3_37:getWorldRot()))
    print("*** ****************** ***")
    L3_37:setForceMove()
    wait()
    return Supporter.Spawner.create_supporter_crow_garuda_to_node(L3_37, A0_34, A1_35, with_ange)
  else
    return Supporter.Spawner.create_supporter_crow_garuda(L4_38, nil, A0_34, A1_35, with_ange)
  end
end
function Fn_spawnSuppotKittenForFeline(A0_39, A1_40, A2_41, A3_42, A4_43)
  local L5_44, L6_45
  L5_44 = findGameObject2
  L6_45 = "Node"
  L5_44 = L5_44(L6_45, A1_40 or "locator2_kitten_start_pos")
  L6_45 = Vector
  L6_45 = L6_45(0, 0, 0)
  if L5_44 ~= nil then
    print("*** Fn_spawnSuppotKittenForFeline ***")
    print("     node.pos" .. tostring(L5_44:getWorldPos()))
    print("     node.rot" .. tostring(L5_44:getWorldRot()))
    print("*** ****************** ***")
    L5_44:setForceMove()
    wait()
    return Supporter.Spawner.create_supporter_kitten_feline_to_node(L5_44, A0_39, A2_41, A3_42, A4_43)
  else
    return Supporter.Spawner.create_supporter_kitten_feline(L6_45, nil, A0_39, A2_41, A3_42, A4_43)
  end
end
function Fn_setRavenActive(A0_46, A1_47)
  if findGameObject2("Puppet", "supporter_raven") then
    if A0_46 == false then
      if type(A1_47) == "table" then
        findGameObject2("Puppet", "supporter_raven"):setWorldPos(A1_47)
        findGameObject2("Puppet", "supporter_raven"):setForceMove()
      end
      findGameObject2("Puppet", "supporter_raven"):getBrain():reset()
    end
    findGameObject2("Puppet", "supporter_raven"):getBrain():setActive(A0_46)
    findGameObject2("Puppet", "supporter_raven"):setActive(A0_46)
  end
end
function Fn_TerminateSupporterFromPuppet(A0_48)
  if A0_48 ~= nil then
    if A0_48:getBrain() ~= nil then
      A0_48:getBrain():try_term()
    end
    A0_48:try_term()
    A0_48 = nil
  end
end
function Fn_TerminateSupporterFromBrain(A0_49)
  if A0_49 ~= nil then
    if A0_49:getGizmo() ~= nil then
      A0_49:getGizmo():try_term()
    end
    A0_49:try_term()
    A0_49 = nil
  end
end
function Fn_createSuppotArea(A0_50, A1_51)
  if A1_51:isEnableGraph() then
    Supporter.Area.create_graphs_to_supporter(A0_50, A1_51)
  end
end
function Fn_deleteSuppotArea(A0_52)
  Supporter.Area.delete_graphs_to_supporter(A0_52)
end
