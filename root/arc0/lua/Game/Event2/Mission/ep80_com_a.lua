dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Misc/area_controller.lua")
_area_ctrls = {}
_gem_pop = false
_crate_event = nil
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5,
    L6_6
  }
  L1_1 = "evarea2_po_a_01_ve_vog"
  L2_2 = "evarea2_po_a_01_haze"
  L3_3 = "evarea2_po_a_15_vog_crate"
  L4_4 = "evarea2_po_a_15_haze"
  L5_5 = "evarea2_po_a_15_gem"
  L6_6 = "evarea2_po_a_01_col"
  L1_1 = Fn_loadEventData
  L2_2 = "evx/ep80_common"
  L3_3 = L0_0
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_loadEventData
  L2_2 = "evx/ep80_area"
  L3_3 = nil
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = loadFileAsset
  L2_2 = "evb"
  L3_3 = "evx/ep80_common"
  L1_1 = L1_1(L2_2, L3_3)
  L3_3 = L1_1
  L2_2 = L1_1.wait
  L2_2(L3_3)
  L3_3 = L1_1
  L2_2 = L1_1.getRoot
  L2_2 = L2_2(L3_3)
  L4_4 = L2_2
  L3_3 = L2_2.findBundle
  L5_5 = "evarea2_po_a_01_vog_crate"
  L3_3 = L3_3(L4_4, L5_5)
  L4_4 = EventData
  L5_5 = L4_4
  L4_4 = L4_4.create
  L6_6 = "evarea2_po_a_01_vog_crate"
  L4_4 = L4_4(L5_5, L6_6, nil, L3_3)
  _crate_event = L4_4
  L4_4 = _area_ctrls
  L5_5 = AreaController
  L5_5 = L5_5.create
  L6_6 = "po_a_15"
  L5_5 = L5_5(L6_6)
  L4_4.po_a_15 = L5_5
  L4_4 = mission_part
  if L4_4 ~= "ep80_a" then
    L4_4 = mission_part
    if L4_4 ~= "ep80_b" then
      L4_4 = mission_part
      if L4_4 ~= "ep80_c" then
        L4_4 = mission_part
      end
    end
  else
    if L4_4 == "ep80_d" then
      L4_4 = _area_ctrls
      L4_4 = L4_4.po_a_15
      L5_5 = L4_4
      L4_4 = L4_4.warp
      L6_6 = "locator2_po_a_15_start"
      L4_4(L5_5, L6_6)
      L4_4 = _area_ctrls
      L4_4 = L4_4.po_a_15
      L5_5 = L4_4
      L4_4 = L4_4.load
      L6_6 = "po_a_15_ep80"
      L4_4(L5_5, L6_6)
      L4_4 = _area_ctrls
      L4_4 = L4_4.po_a_15
      L5_5 = L4_4
      L4_4 = L4_4.cue
      L4_4(L5_5)
  end
  else
    L4_4 = _area_ctrls
    L4_4 = L4_4.po_a_15
    L5_5 = L4_4
    L4_4 = L4_4.reset
    L4_4(L5_5)
    L4_4 = _area_ctrls
    L4_4 = L4_4.po_a_15
    L5_5 = L4_4
    L4_4 = L4_4.warp
    L6_6 = "locator2_po_a_15_goal"
    L4_4(L5_5, L6_6)
  end
  L4_4 = _area_ctrls
  L5_5 = AreaController
  L5_5 = L5_5.create
  L6_6 = "po_a_10_03"
  L5_5 = L5_5(L6_6)
  L4_4.po_a_10_03 = L5_5
  L4_4 = _area_ctrls
  L5_5 = AreaController
  L5_5 = L5_5.create
  L6_6 = "po_a_13_01"
  L5_5 = L5_5(L6_6)
  L4_4.po_a_13_01 = L5_5
  L4_4 = _area_ctrls
  L5_5 = AreaController
  L5_5 = L5_5.create
  L6_6 = "po_a_13_02"
  L5_5 = L5_5(L6_6)
  L4_4.po_a_13_02 = L5_5
  L4_4 = _area_ctrls
  L4_4 = L4_4.po_a_10_03
  L5_5 = L4_4
  L4_4 = L4_4.warp
  L6_6 = "locator2_po_a_10_03"
  L4_4(L5_5, L6_6)
  L4_4 = _area_ctrls
  L4_4 = L4_4.po_a_13_01
  L5_5 = L4_4
  L4_4 = L4_4.warp
  L6_6 = "locator2_po_a_13_01"
  L4_4(L5_5, L6_6)
  L4_4 = _area_ctrls
  L4_4 = L4_4.po_a_13_02
  L5_5 = L4_4
  L4_4 = L4_4.warp
  L6_6 = "locator2_po_a_13_02"
  L4_4(L5_5, L6_6)
  L4_4 = createGameObject2
  L5_5 = "Area"
  L4_4 = L4_4(L5_5)
  L6_6 = L4_4
  L5_5 = L4_4.setName
  L5_5(L6_6, "ve_vogo_root")
  L6_6 = L4_4
  L5_5 = L4_4.setAreaGroup
  L5_5(L6_6, "po")
  L5_5 = findGameObject2
  L6_6 = "Node"
  L5_5 = L5_5(L6_6, "locator2_shop_col")
  L6_6 = createGameObject2
  L6_6 = L6_6("GimmickBg")
  L6_6:setName("col_shop")
  L6_6:setCollisionName("ep80_col")
  L6_6:setAttributeName("invisible_col")
  L6_6:setCollidablePermission(true)
  L5_5:appendChild(L6_6)
end
function Ingame()
  local L0_7
  L0_7 = GameDatabase
  L0_7 = L0_7.set
  L0_7(L0_7, ggd.GlobalSystemFlags__AreaReset, false)
  L0_7 = mission_part
  if L0_7 == "ep80_f" then
    L0_7 = requestGetCrateTable
    L0_7 = L0_7("bg2_crate_b")
    for _FORV_4_, _FORV_5_ in pairs(L0_7) do
      _FORV_5_:try_term()
    end
  end
  L0_7 = mission_part
  if L0_7 == "ep80_g" then
    L0_7 = requestGetCrateTable
    L0_7 = L0_7("bg2_crate_a")
    for _FORV_4_, _FORV_5_ in pairs(L0_7) do
      _FORV_5_:try_term()
    end
  end
  L0_7 = findGameObject2
  L0_7 = L0_7("Area", "ve_vogo_root")
  L0_7:setWorldTransform(findGameObject2("Node", "locator2_ve_vog_root"):getWorldTransform())
  L0_7:setForceMove()
  while true do
    wait()
  end
end
function Finalize()
  GameDatabase:set(ggd.GlobalSystemFlags__AreaReset, true)
end
function requestVogoShipSetVisible(A0_8)
  findGameObject2("Area", "ve_vogo_root"):setEffectiveness(A0_8, true)
  if A0_8 then
    findGameObject2("Area", "ve_vogo_root"):setAreaGroup("po")
  else
    findGameObject2("Area", "ve_vogo_root"):setAreaGroup("")
  end
end
function requestAreaMove()
  _area_ctrls.po_a_15:setPlayParam({ratio = 0.1})
  _area_ctrls.po_a_15:play()
end
function requestAreaStop()
  _area_ctrls.po_a_15:stop()
end
function requestCreateHaze(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14
  L1_10 = {}
  L2_11 = 1
  while true do
    L3_12 = findGameObject2
    L4_13 = "Effect"
    L5_14 = "ef_"
    L5_14 = L5_14 .. A0_9 .. "_" .. string.format("%02d", L2_11)
    L3_12 = L3_12(L4_13, L5_14)
    if L3_12 ~= nil then
      L1_10[L2_11] = L3_12
    else
      break
    end
    L2_11 = L2_11 + 1
  end
  L3_12 = #L1_10
  if L3_12 == 0 then
    L3_12 = 1
    while true do
      L4_13 = findGameObject2
      L5_14 = "Node"
      L4_13 = L4_13(L5_14, "locator2_" .. A0_9 .. "_" .. string.format("%02d", L3_12))
      if L4_13 ~= nil then
        L5_14 = createGameObject2
        L5_14 = L5_14("Effect")
        L5_14:loadModel("ef_ev_smk_bk")
        L5_14:setName("ef_" .. A0_9 .. "_" .. string.format("%02d", L3_12))
        L5_14:setLoop(true)
        L5_14:play()
        L5_14:setActive(false)
        L5_14:try_init()
        L5_14:waitForReady()
        L5_14:try_start()
        L4_13:appendChild(L5_14)
        L1_10[L3_12] = L5_14
      else
        break
      end
      L3_12 = L3_12 + 1
    end
  end
  return L1_10
end
function requestSetHazeAlpha(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20, L6_21, L7_22, L8_23
  L3_18 = 1
  if A2_17 ~= nil then
    L3_18 = A2_17
  end
  for L7_22, L8_23 in L4_19(L5_20) do
    invokeTask(function()
      Fn_setAlpha(L8_23, A1_16, L3_18)
      L8_23:setActive(A1_16)
    end)
    break
  end
end
function requestGetCrateTable(A0_24)
  local L1_25, L2_26, L3_27, L4_28
  L1_25 = {}
  L2_26 = 1
  L3_27 = 1
  while true do
    L4_28 = A0_24
    L4_28 = L4_28 .. "_" .. string.format("%02d", L3_27)
    if findGameObject2("Node", L4_28) ~= nil then
      if findGameObject2("Node", L4_28):isBroken() == false then
        L1_25[L2_26] = findGameObject2("Node", L4_28)
        L2_26 = L2_26 + 1
      end
    else
      break
    end
    L3_27 = L3_27 + 1
  end
  return L1_25
end
function requestCrateSetActive(A0_29, A1_30)
  local L2_31
  L2_31 = requestGetCrateTable
  L2_31 = L2_31(A0_29)
  for _FORV_6_, _FORV_7_ in pairs(L2_31) do
    _FORV_7_:setActive(A1_30)
  end
end
function requestCreateGem()
  if _gem_pop == false then
    _gem_pop = true
    invokeTask(function()
      local L0_32
      L0_32 = {
        "evarea2_po_a_01_gem",
        "evarea2_bu_a_03_02_gem",
        "evarea2_bu_a_09_gem",
        "evarea2_bu_a_12_01_gem",
        "evarea2_bu_a_12_02_gem",
        "evarea2_bu_a_13_01_gem",
        "evarea2_bu_a_14_02_gem",
        "evarea2_bu_a_15_gem",
        "evarea2_ve_crane_root_gem"
      }
      Fn_loadEventData("evx/ep80_common", L0_32, true)
    end)
  end
end
function requestFindGameObject2(A0_33, A1_34)
  return findGameObject2(A0_33, A1_34)
end
function requestKillCrateEvent()
  if _crate_event ~= nil then
    _crate_event:kill()
  end
  _crate_event = nil
end
