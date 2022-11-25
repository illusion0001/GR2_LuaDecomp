import("Area")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm51_common.lua")
Durability_Carry_over = 100
sm51_route_handle = {}
sm51_movearea_list = {
  {
    area = "mi_a_09_02",
    locator = "locator2_route_01"
  },
  {
    area = "mi_a_11_01",
    locator = "locator2_route_0201"
  },
  {
    area = "mi_a_18_02",
    locator = "locator2_route_0202"
  },
  {
    area = "mi_a_20_01",
    locator = "locator2_route_0301"
  },
  {
    area = "mi_a_23_04",
    locator = "locator2_route_0501"
  },
  {
    area = "mi_a_21_03",
    locator = "locator2_route_0601"
  },
  {
    area = "mi_a_13_01",
    locator = "locator2_route_0701"
  },
  {
    area = "mi_a_10",
    locator = "locator2_route_0801"
  }
}
land_moved = false
land_move_task = nil
_sm51_sweetsbox = nil
_sm51_sweetsbox_bk = nil
puppets = {}
_sm51_receiver_npc_motion = {
  check_point_npc_01 = {
    sm51_waiting = "man01_lookaround_02",
    sm51_action = "man01_wavehand_far_00",
    sm51_after = "man01_cheer_00"
  },
  check_point_npc_02 = {
    sm51_waiting = "wom01_stay_03",
    sm51_action = "wom21_stay_01",
    sm51_after = "wom01_cheer_01"
  },
  check_point_npc_03 = {
    sm51_waiting = "wom21_lookaround_00",
    sm51_action = "wom21_stay_01",
    sm51_after = "wom21_reply_yes_00"
  }
}
_sm51_receiver_npc_action_distance = 50
_sm51_received_flag = {}
_npc_motion_task = {}
function Initialize()
  local L0_0
  L0_0 = print
  L0_0("LOAD COMMON SET")
  L0_0 = Player
  L0_0 = L0_0.setGrabDropGuard
  L0_0(L0_0, true)
  L0_0 = {
    {
      name = "check_point_npc_01",
      type = "man39",
      node = "locator2_check_point_npc_01"
    },
    {
      name = "check_point_npc_02",
      type = "wom30",
      node = "locator2_check_point_npc_02"
    },
    {
      name = "check_point_npc_03",
      type = "wom26",
      node = "locator2_check_point_npc_03"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadNpcEventMotion("check_point_npc_01", _sm51_receiver_npc_motion.check_point_npc_01)
  Fn_loadNpcEventMotion("check_point_npc_02", _sm51_receiver_npc_motion.check_point_npc_02)
  Fn_loadNpcEventMotion("check_point_npc_03", _sm51_receiver_npc_motion.check_point_npc_03)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  while true do
    wait()
  end
end
function Durability_NumIn(A0_1)
  print("back:" .. Durability_Carry_over .. " send:" .. A0_1)
  Durability_Carry_over = A0_1
end
function Durability_NumBack()
  local L0_2
  L0_2 = nil
  L0_2 = Durability_Carry_over
  print("back:" .. Durability_Carry_over .. " get:" .. L0_2)
  return L0_2
end
function InitializeArea()
  if land_moved == false and land_move_task == nil then
    land_move_task = invokeTask(function()
      while false == false do
        for _FORV_5_ = 1, #sm51_movearea_list do
          if sm51_route_handle[_FORV_5_] == nil then
            if Fn_findAreaHandle("ji_a_root"):findSubArea(sm51_movearea_list[_FORV_5_].area) ~= nil then
              sm51_route_handle[_FORV_5_] = Fn_findAreaHandle("ji_a_root"):findSubArea(sm51_movearea_list[_FORV_5_].area)
              sm51_route_handle[_FORV_5_]:setDriftEnable(true)
            else
              break
            end
          end
        end
        _FOR_()
      end
      for _FORV_5_ = 1, #sm51_movearea_list do
        Fn_warpArea(sm51_movearea_list[_FORV_5_].area, sm51_movearea_list[_FORV_5_].locator, false)
        print("AREA WARP : " .. sm51_movearea_list[_FORV_5_].area .. " >> " .. sm51_movearea_list[_FORV_5_].locator)
      end
      for _FORV_5_ = 1, #sm51_movearea_list do
        sm51_route_handle[_FORV_5_] = Fn_findAreaHandle("ji_a_root"):findSubArea(sm51_movearea_list[_FORV_5_].area)
        sm51_route_handle[_FORV_5_]:setDriftEnable(true)
      end
      land_moved = true
    end)
  end
end
function isInitializedArea()
  if land_moved == true then
    if land_move_task ~= nil then
      land_move_task:abort()
      land_move_task = nil
    end
    return true
  end
  return false
end
function SetNpcActive(A0_3)
  if Fn_findNpc(A0_3) ~= nil then
    Fn_findNpc(A0_3):setActive(true)
  end
end
function StartNpcAction(A0_4)
  local L1_5
  L1_5 = EndNpcAction
  L1_5(A0_4)
  L1_5 = Fn_findNpc
  L1_5 = L1_5(A0_4)
  if L1_5 ~= nil then
    _npc_motion_task[A0_4] = sm51_receiver_npc_action(A0_4, L1_5)
  end
end
function EndNpcAction(A0_6)
  if _npc_motion_task[A0_6] ~= nil and _npc_motion_task[A0_6]:isRunning() == true then
    _npc_motion_task[A0_6]:abort()
  end
  _npc_motion_task[A0_6] = nil
end
function findComGameNode(A0_7)
  return findGameObject2("Node", A0_7)
end
function sm51_receiver_npc_action(A0_8, A1_9)
  return invokeTask(function()
    local L0_10
    L0_10 = {}
    L0_10.degree_h = 25
    L0_10.degree_v = 25
    L0_10.in_length = 20
    L0_10.out_length = 20
    L0_10.valid = false
    npc_param = L0_10
    L0_10 = A1_9
    L0_10 = L0_10.setSightParam
    L0_10(L0_10, npc_param)
    L0_10 = _sm51_received_flag
    L0_10[A0_8] = 0
    L0_10 = Fn_playMotionNpc
    L0_10(A1_9, {
      _sm51_receiver_npc_motion[A0_8].sm51_waiting
    }, false, {isRepeat = true})
    L0_10 = _sm51_receiver_npc_action_distance
    repeat
      L0_10 = Fn_getDistanceToPlayer(A1_9)
      wait()
    until _sm51_received_flag[A0_8] == 1 or L0_10 < _sm51_receiver_npc_action_distance and A1_9:isInSight()
    if _sm51_received_flag[A0_8] == 0 then
      repeat
        wait()
      until _sm51_received_flag[A0_8] == 2
      invokeTask(function()
        while not (_sm51_received_flag[A0_8] > 0) do
          Fn_turnNpc(A1_9)
          if Fn_getDistanceToPlayer(A1_9) > 5 then
            Fn_playMotionNpc(A1_9, {
              _sm51_receiver_npc_motion[A0_8].sm51_action
            }, true, {
              animBlendDuration = {0.1}
            })
            Fn_playMotionNpc(A1_9, {"stay"}, false, {
              animBlendDuration = {0.1}
            })
          end
          waitSeconds(3)
        end
      end):abort()
    end
    if _sm51_received_flag[A0_8] == 1 then
      Fn_turnNpc(A1_9)
    end
    print(A0_8 .. " AFTER MOTION START")
    Fn_playMotionNpc(A1_9, {
      _sm51_receiver_npc_motion[A0_8].sm51_after
    }, true, {
      animBlendDuration = {0.5}
    })
    Fn_playMotionNpc(A1_9, {
      _sm51_receiver_npc_motion[A0_8].sm51_waiting
    }, false, {
      animBlendDuration = {0.5},
      isRepeat = true
    })
  end)
end
function setReceivedFlag(A0_11, A1_12)
  _sm51_received_flag[A0_11] = A1_12
end
_is_box_broken = false
function SweetsboxInit(A0_13)
  invokeTask(function()
    if _sm51_sweetsbox == nil then
      _sm51_sweetsbox_bk = RAC_createGimmickBg("sweetsbox_02", "woodbox_kk_03", "locator2_switch_point", false, false, nil, true)
      _sm51_sweetsbox_bk:setActive(false)
      RAC_createGimmickBg("sweetsbox_01", "woodbox_kk_03", A0_13, false, false, nil, true, "event_obj_02"):setEnableDelayedCollision(false)
      _sm51_sweetsbox = RAC_createGimmickBg("sweetsbox_01", "woodbox_kk_03", A0_13, false, false, nil, true, "event_obj_02")
      _is_box_broken = false
    end
  end)
end
function GetSweetsboxReady()
  local L1_14
  L1_14 = _sm51_sweetsbox
  if L1_14 then
    L1_14 = true
    return L1_14
  end
  L1_14 = false
  return L1_14
end
function SweetsboxGrabObject()
  if _sm51_sweetsbox ~= nil then
    Player:setGrabObject(_sm51_sweetsbox)
  end
end
function GetSweetsboxIsGrabed()
  if _sm51_sweetsbox ~= nil then
    return _sm51_sweetsbox:isGrabbed()
  end
  return false
end
function GetSweetsboxIsBroken()
  local L0_15, L1_16
  L0_15 = _is_box_broken
  return L0_15
end
function SweetsboxDropObject()
  Player:dropGrabObject()
  _sm51_sweetsbox:setGrabReleaseForce(true)
end
function SweetsboxWarpRecreateObject(A0_17)
  if _sm51_sweetsbox ~= nil then
    if _sm51_sweetsbox:getDynamicObject() ~= nil then
      _sm51_sweetsbox:getDynamicObject():try_term()
    end
    _sm51_sweetsbox:try_term()
    _sm51_sweetsbox = nil
  end
  if _sm51_sweetsbox_bk ~= nil then
    if _sm51_sweetsbox_bk:getDynamicObject() ~= nil then
      _sm51_sweetsbox_bk:getDynamicObject():try_term()
    end
    _sm51_sweetsbox_bk:try_term()
    _sm51_sweetsbox_bk = nil
  end
  SweetsboxInit(A0_17)
end
function SweetsboxBrokenObject()
  SweetsboxDropObject()
  invokeTask(function()
    local L0_18, L1_19, L2_20
    L0_18 = wait
    L0_18()
    L0_18 = _sm51_sweetsbox
    L1_19 = L0_18
    L0_18 = L0_18.getDynamicObject
    L0_18 = L0_18(L1_19)
    if L0_18 == nil then
      L0_18 = _sm51_sweetsbox
    end
    L2_20 = L0_18
    L1_19 = L0_18.getWorldTransform
    L2_20 = L1_19(L2_20)
    L0_18:setWorldTransform(findGameObject2("Node", "locator2_switch_point"):getWorldTransform())
    L0_18:setForceMove()
    L0_18:setActive(false)
    _sm51_sweetsbox_bk:setWorldTransform(L1_19, L2_20)
    _sm51_sweetsbox_bk:setForceMove()
    _sm51_sweetsbox_bk:setActive(true)
    wait()
    _sm51_sweetsbox_bk:requestBreak(_sm51_sweetsbox_bk:getWorldPos(), 0.1)
    _is_box_broken = true
  end)
end
function Finalize()
  for _FORV_3_, _FORV_4_ in pairs(_npc_motion_task) do
    if _FORV_4_ ~= nil and _FORV_4_:isRunning() == true then
      _FORV_4_:abort()
    end
  end
  _npc_motion_task = {}
  Fn_resetArea()
  Player:setGrabDropGuard(true)
  Player:setForcedNormalGrab(false)
end
