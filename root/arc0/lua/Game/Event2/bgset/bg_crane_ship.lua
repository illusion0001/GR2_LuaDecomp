dofile("/Game/Event2/bgset/bg_crane_ship_param.lua")
function createCraneShipJir()
  local L0_0, L1_1, L2_2
  L0_0 = createGameObject2
  L1_1 = "Area"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setName
  L1_1(L2_2, "ve_crane_root")
  L2_2 = L0_0
  L1_1 = L0_0.setDriftParams
  L1_1(L2_2, DRIFT_PARAM_CRANE_SHIP)
  L1_1 = createGameObject2
  L2_2 = "GimmickBg"
  L1_1 = L1_1(L2_2)
  L2_2 = L1_1.setName
  L2_2(L1_1, "ship_jir_wall")
  L2_2 = L1_1.setCollisionName
  L2_2(L1_1, "ve_crane_root_wall")
  L2_2 = L1_1.setAttributeName
  L2_2(L1_1, "invisible_col")
  L2_2 = L1_1.setCollidablePermission
  L2_2(L1_1, false)
  L2_2 = L0_0.appendChild
  L2_2(L0_0, L1_1)
  L2_2 = createGameObject2
  L2_2 = L2_2("Puppet")
  L2_2:setName("ship_jir_rudder")
  loadFileAsset("evd", "CharDefs/npc/rudder"):wait()
  L2_2:setDescription(loadFileAsset("evd", "CharDefs/npc/rudder"):getRoot())
  L0_0:appendChild(L2_2)
  return L0_0, L1_1, L2_2
end
function createCraneShipHex()
  local L0_3, L1_4, L2_5, L3_6, L4_7
  L0_3 = createGameObject2
  L1_4 = "Area"
  L0_3 = L0_3(L1_4)
  L2_5 = L0_3
  L1_4 = L0_3.setName
  L3_6 = "g1_crane_pd_01"
  L1_4(L2_5, L3_6)
  L2_5 = L0_3
  L1_4 = L0_3.setDriftParams
  L3_6 = DRIFT_PARAM_CRANE_SHIP
  L1_4(L2_5, L3_6)
  L1_4 = createGameObject2
  L2_5 = "GimmickBg"
  L1_4 = L1_4(L2_5)
  L3_6 = L1_4
  L2_5 = L1_4.setName
  L4_7 = "ship_hex_wall"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setCollisionName
  L4_7 = "g1_crane_pd_01_wall"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setAttributeName
  L4_7 = "invisible_col"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.setCollidablePermission
  L4_7 = false
  L2_5(L3_6, L4_7)
  L3_6 = L0_3
  L2_5 = L0_3.appendChild
  L4_7 = L1_4
  L2_5(L3_6, L4_7)
  L2_5 = createGameObject2
  L3_6 = "Puppet"
  L2_5 = L2_5(L3_6)
  L4_7 = L2_5
  L3_6 = L2_5.setName
  L3_6(L4_7, "ship_hex_rudder")
  L3_6 = loadFileAsset
  L4_7 = "evd"
  L3_6 = L3_6(L4_7, "CharDefs/npc/rudder")
  L4_7 = L3_6.wait
  L4_7(L3_6)
  L4_7 = L2_5.setDescription
  L4_7(L2_5, L3_6:getRoot())
  L4_7 = L0_3.appendChild
  L4_7(L0_3, L2_5)
  L4_7 = createGameObject2
  L4_7 = L4_7("Puppet")
  L4_7:setName("ship_hex_lever")
  loadFileAsset("evd", "CharDefs/npc/lever"):wait()
  L4_7:setDescription(loadFileAsset("evd", "CharDefs/npc/lever"):getRoot())
  L0_3:appendChild(L4_7)
  return L0_3, L1_4, L2_5, L4_7
end
function createCraneCage()
  local L0_8, L1_9, L2_10
  L0_8 = createGameObject2
  L1_9 = "GimmickBg"
  L0_8 = L0_8(L1_9)
  L2_10 = L0_8
  L1_9 = L0_8.setName
  L1_9(L2_10, "ve_cage_base")
  L1_9 = createGameObject2
  L2_10 = "GimmickBg"
  L1_9 = L1_9(L2_10)
  L2_10 = L1_9.setName
  L2_10(L1_9, "ve_cage")
  L2_10 = L1_9.setDrawModelName
  L2_10(L1_9, "ve_cage")
  L2_10 = L1_9.setCollisionName
  L2_10(L1_9, "ve_cage")
  L2_10 = L1_9.setAttributeName
  L2_10(L1_9, "ve_cage")
  L2_10 = L1_9.setVisibleBlockEnable
  L2_10(L1_9, false)
  L2_10 = L1_9.setCollidableBlockEnable
  L2_10(L1_9, false)
  L2_10 = L0_8.appendChild
  L2_10(L0_8, L1_9)
  L2_10 = createGameObject2
  L2_10 = L2_10("Wire")
  L2_10:setName("ve_wire")
  L2_10:setModelName("wire_nk_01")
  L2_10:setVisibleBlockEnable(false)
  return L0_8, L1_9, L2_10
end
function wireBind(A0_11, A1_12, A2_13, A3_14, A4_15)
  local L5_16, L6_17, L7_18, L8_19, L9_20, L10_21, L11_22
  L6_17 = A1_12
  L5_16 = A1_12.bind
  L7_18 = A2_13
  L8_19 = A3_14
  L9_20 = A4_15
  L10_21 = A0_11
  L11_22 = nil
  L5_16(L6_17, L7_18, L8_19, L9_20, L10_21, L11_22, Vector(0, -0.1, 0))
end
function warpShipObject(A0_23, A1_24, A2_25, A3_26)
  A1_24:setTransform(A0_23:getNodeLocalPosRot("ve_cage_01"))
  A1_24:setForceMove()
  A2_25:setTransform(A0_23:getNodeLocalPosRot("pos_rudder_00"))
  A2_25:setForceMove()
  if A3_26 then
    A3_26:setTransform(A0_23:getNodeLocalPosRot("pos_lever_01"))
    A3_26:setForceMove()
  end
end
function warpShipStartPos(A0_27, A1_28, A2_29, A3_30, A4_31)
  local L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38
  L5_32 = GameDatabase
  L6_33 = L5_32
  L5_32 = L5_32.set
  L7_34 = ggd
  L7_34 = L7_34.Savedata__CreneShipFlags__MoveDist
  L8_35 = A4_31
  L5_32(L6_33, L7_34, L8_35)
  L6_33 = A0_27
  L5_32 = A0_27.getPos
  L5_32 = L5_32(L6_33)
  L7_34 = A0_27
  L6_33 = A0_27.getNodeLocalPosRot
  L8_35 = "ve_cage_01"
  L6_33 = L6_33(L7_34, L8_35)
  L8_35 = A1_28
  L7_34 = A1_28.findSubArea
  L9_36 = A2_29
  L7_34 = L7_34(L8_35, L9_36)
  L9_36 = L7_34
  L8_35 = L7_34.getNodePosRot
  L10_37 = A3_30
  L9_36 = L8_35(L9_36, L10_37)
  if L8_35 == nil then
    L11_38 = L7_34
    L10_37 = L7_34.getTransform
    L11_38 = L10_37(L11_38)
    L9_36 = L11_38
    L8_35 = L10_37
  end
  L10_37 = createGameObject2
  L11_38 = "Node"
  L10_37 = L10_37(L11_38)
  L11_38 = createGameObject2
  L11_38 = L11_38("Node")
  L10_37:setName("hoge03")
  L11_38:setName("hoge04")
  L10_37:try_init()
  L11_38:try_init()
  L10_37:waitForReady()
  L11_38:waitForReady()
  L10_37:try_start()
  L11_38:try_start()
  L10_37:setTransform(L8_35, L9_36)
  L10_37:setForceMove()
  L10_37:appendChild(L11_38)
  L11_38:setPos(L5_32 - L6_33 + Vector(0, A4_31, 0))
  L11_38:setForceMove()
  A0_27:setWorldTransform(L11_38:getWorldTransform())
  A0_27:setForceMove()
  L10_37:try_term()
  L11_38:try_term()
  return L8_35, L9_36
end
