dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/dm03_common.lua")
_ark_wing_01_hdl = nil
_ark_wing_02_hdl = nil
_ark_wing_03_hdl = nil
_ark_wing_04_hdl = nil
_ark_head_hdl = nil
_capwarp_caption = "dm03_01009"
_capwarp_return_node_name = "locator2_return_b"
_breakNpc_task = {}
function Initialize()
  local L0_0, L1_1
  L0_0 = _createActor
  L1_1 = "kit01"
  L0_0(L1_1, "locator2_kat")
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "bg2_ark_01")
  L1_1 = L0_0
  L0_0 = L0_0.setVisibleBlockEnable
  L0_0(L1_1, false)
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "bg2_ark_01")
  _ark_body_hdl = L0_0
  L0_0 = "g1_ark_pd_01_wing"
  L1_1 = "g1_ark_pd_01_head"
  _ark_wing_01_hdl = createGameObject2("GimmickBg")
  _ark_wing_01_hdl:setName("ark_wing_01")
  _ark_wing_01_hdl:setDrawModelName(L0_0)
  _ark_wing_01_hdl:setCollisionName(L0_0)
  _ark_wing_01_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_01_hdl)
  _ark_wing_01_hdl:setVisibleBlockEnable(false)
  _ark_wing_02_hdl = createGameObject2("GimmickBg")
  _ark_wing_02_hdl:setName("ark_wing_02")
  _ark_wing_02_hdl:setDrawModelName(L0_0)
  _ark_wing_02_hdl:setCollisionName(L0_0)
  _ark_wing_02_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_02_hdl)
  _ark_wing_02_hdl:setVisibleBlockEnable(false)
  _ark_wing_03_hdl = createGameObject2("GimmickBg")
  _ark_wing_03_hdl:setName("ark_wing_03")
  _ark_wing_03_hdl:setDrawModelName(L0_0)
  _ark_wing_03_hdl:setCollisionName(L0_0)
  _ark_wing_03_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_03_hdl)
  _ark_wing_03_hdl:setVisibleBlockEnable(false)
  _ark_wing_04_hdl = createGameObject2("GimmickBg")
  _ark_wing_04_hdl:setName("ark_wing_04")
  _ark_wing_04_hdl:setDrawModelName(L0_0)
  _ark_wing_04_hdl:setCollisionName(L0_0)
  _ark_wing_04_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_04_hdl)
  _ark_wing_04_hdl:setVisibleBlockEnable(false)
  _ark_head_hdl = createGameObject2("GimmickBg")
  _ark_head_hdl:setName("ark_head")
  _ark_head_hdl:setDrawModelName(L1_1)
  _ark_head_hdl:setCollisionName(L1_1)
  _ark_head_hdl:setAttributeName(L1_1)
  _ark_body_hdl:appendChild(_ark_head_hdl)
  _ark_head_hdl:setVisibleBlockEnable(false)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11
  L0_2 = _breakNpc_task
  L1_3 = _breakNpc
  L2_4 = "npcgen2_crowd_extra_"
  L1_3 = L1_3(L2_4)
  L0_2.crowd_extra = L1_3
  L0_2 = _breakNpc_task
  L1_3 = _breakNpc
  L2_4 = "npcgen2_crowd_"
  L1_3 = L1_3(L2_4)
  L0_2.crowd = L1_3
  L0_2 = _breakNpc_task
  L1_3 = _breakNpc
  L2_4 = "npcgen2_brefman"
  L3_5 = false
  L1_3 = L1_3(L2_4, L3_5)
  L0_2.brefman = L1_3
  L0_2 = _ark_body_hdl
  L1_3 = L0_2
  L0_2 = L0_2.getNodePosRot
  L2_4 = "move_wing_01"
  L3_5 = true
  L1_3 = L0_2(L1_3, L2_4, L3_5)
  L2_4 = _ark_body_hdl
  L3_5 = L2_4
  L2_4 = L2_4.getNodePosRot
  L4_6 = "move_wing_02"
  L5_7 = true
  L3_5 = L2_4(L3_5, L4_6, L5_7)
  L4_6 = _ark_body_hdl
  L5_7 = L4_6
  L4_6 = L4_6.getNodePosRot
  L6_8 = "move_wing_03"
  L7_9 = true
  L5_7 = L4_6(L5_7, L6_8, L7_9)
  L6_8 = _ark_body_hdl
  L7_9 = L6_8
  L6_8 = L6_8.getNodePosRot
  L8_10 = "move_wing_04"
  L9_11 = true
  L7_9 = L6_8(L7_9, L8_10, L9_11)
  L8_10 = _ark_body_hdl
  L9_11 = L8_10
  L8_10 = L8_10.getNodePosRot
  L9_11 = L8_10(L9_11, "move_head", true)
  _ark_wing_01_hdl:setTransform(L0_2, L1_3)
  _ark_wing_02_hdl:setTransform(L2_4, L3_5)
  _ark_wing_03_hdl:setTransform(L4_6, L5_7)
  _ark_wing_04_hdl:setTransform(L6_8, L7_9)
  _ark_head_hdl:setTransform(L8_10, L9_11)
end
function Finalize()
  _ark_wing_01_hdl:try_term()
  _ark_wing_01_hdl = nil
  _ark_wing_02_hdl:try_term()
  _ark_wing_02_hdl = nil
  _ark_wing_03_hdl:try_term()
  _ark_wing_03_hdl = nil
  _ark_wing_04_hdl:try_term()
  _ark_wing_04_hdl = nil
  _ark_head_hdl:try_term()
  _ark_head_hdl = nil
  for _FORV_3_, _FORV_4_ in pairs(_dm03_dist_task) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() then
      _dm03_dist_task[_FORV_3_]:abort()
    end
    _dm03_dist_task[_FORV_3_] = nil
  end
  _dm03_dist_task = {}
  for _FORV_3_, _FORV_4_ in pairs(_breakNpc_task) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() then
      _breakNpc_task[_FORV_3_]:abort()
    end
    _breakNpc_task[_FORV_3_] = nil
  end
  _breakNpc_task = {}
end
function _createActor(A0_12, A1_13)
  local L2_14, L3_15, L4_16
  L2_14 = findGameObject2
  L3_15 = "Node"
  L4_16 = A1_13
  L2_14 = L2_14(L3_15, L4_16)
  L3_15 = createGameObject2
  L4_16 = "Puppet"
  L3_15 = L3_15(L4_16)
  L4_16 = createGameObject2
  L4_16 = L4_16("ActorBrain")
  invokeTask(function()
    L3_15:loadModel(A0_12 .. "_base")
    if string.sub(A0_12, 1, 3) == "kit" then
      L3_15:loadBaseSkeleton(A0_12 .. "_base", A0_12 .. "_base")
      L3_15:waitForLoading()
    end
    L3_15:try_init()
    L4_16:try_init()
    L3_15:waitForReady()
    L4_16:waitForReady()
    L3_15:setTransform(L2_14:getWorldTransform())
    L3_15:setBrain(L4_16)
    L3_15:try_start()
    L4_16:try_start()
    L3_15:loadPoseAnimation("stay", "kit01_stay_00")
    while L3_15:isLoading() do
      wait()
    end
    L3_15:playPoseAnimation("stay")
  end)
end
function setCatWarpOption(A0_17, A1_18)
  _capwarp_caption = A0_17
  _capwarp_return_node_name = A1_18
end
function pccubesensormulti2_area_out_near_OnLeave()
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    RAC_missionNaviCaption(nil, nil, _capwarp_caption)
    Player:setStay(false)
    Fn_userCtrlOn()
  end)
end
function pccubesensormulti2_area_out_far_OnLeave()
  invokeTask(function()
    _is_catwarp = true
    Player:setStay(true)
    Fn_userCtrlAllOff()
    Fn_catWarpIn()
    Fn_setCatWarpCheckPoint(_capwarp_return_node_name)
    Fn_catWarpCheckPoint()
    wait()
    Fn_catWarpOut()
    while not HUD:faderStability() do
      wait()
    end
    wait(15)
    Fn_userCtrlOn()
    Player:setStay(false)
    waitSeconds(1)
    _is_catwarp = false
  end)
end
