dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
aiming_offset_y = 1.5
nevybattle_locator = 5
vogo_move_speed = 1.2
vogobox_complete = false
vogobox_cap_timer = 0
vogobox_02_max = 15
vogobox_02_num = 0
vogobox_02_navi = false
vogobox_02_wait = 150
puppets = {}
move_task = nil
vogo_node = nil
nevybattle_caption_task = nil
vogo_flee_task = nil
vogo_talk_task = nil
is_in_sensor = false
CLIENT_NPC_MOTION = {
  run_afraid = "man01_run_afraid_00"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = {L1_1}
  L1_1 = "evarea2_id_a_root"
  L1_1 = Fn_loadEventData
  L2_2 = "evx/sm41_common"
  L1_1(L2_2, L3_3, true)
  L1_1 = {}
  L1_1.shout = "kit01_shout_00"
  L2_2 = Fn_loadPlayerMotion
  L2_2(L3_3)
  L2_2 = puppets
  L2_2.sm41_client = L3_3
  L2_2 = {L3_3}
  L3_3.name = "npc_homeless"
  L3_3.type = "man05"
  L3_3.node = "locator2_homeless_pos"
  L3_3.active = false
  L3_3(L2_2)
  for _FORV_6_, _FORV_7_ in L3_3(L2_2) do
    puppets[_FORV_7_.name] = Fn_findNpcPuppet(_FORV_7_.name)
  end
  L3_3("sm41_client", CLIENT_NPC_MOTION)
  vogobox_02_max = 0
  while findGameObject2("Node", "bg2_vogo_boxset_02" .. string.format("%02d", L3_3)) ~= nil do
    vogobox_02_max = vogobox_02_max + 1
  end
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8
  L0_4()
  L3_7 = "pccubesensor2_out_of_range_03m"
  L4_8 = "pccubesensor2_out_of_range_03l"
  L0_4(L1_5, L2_6, L3_7, L4_8, "locator2_pc_start_pos", "locator2_back_to_range_03", nil, "sm41_02011")
  L0_4(L1_5)
  L0_4(L1_5, L2_6)
  L0_4()
  L0_4(L1_5)
  nevybattle_caption_task = L0_4
  vogo_flee_task = L0_4
  L0_4()
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L0_4(L1_5)
  vogobox_02_num = L0_4
  L0_4(L1_5, L2_6)
  L3_7 = vogobox_02_num
  L0_4(L1_5, L2_6)
  L0_4(L1_5, L2_6)
  while true do
    if L0_4 < L1_5 then
      vogobox_02_num = L0_4
      if not L0_4 then
        if L0_4 <= 5 then
          vogobox_02_wait = L0_4
          if L0_4 == 0 then
            for L3_7 = 1, vogobox_02_max do
              L4_8 = findGameObject2
              L4_8 = L4_8("Node", "bg2_vogo_boxset_02" .. string.format("%02d", L3_7))
              if L4_8 ~= nil and not L4_8:isBroken() then
                RAC_DynamicMultiNaviAdd(L4_8)
              end
            end
            vogobox_02_navi = true
          end
        end
      end
      L3_7 = vogobox_02_num
      L0_4(L1_5, L2_6)
      L0_4()
    end
  end
  L0_4(L1_5)
  L0_4(L1_5, L2_6)
  vogobox_complete = true
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  if L0_4 > 0 then
    L0_4(L1_5, L2_6)
    L0_4(L1_5)
    L0_4(L1_5)
  end
  repeat
    L0_4()
  until L0_4 == 0
  L0_4(L1_5)
  L0_4(L1_5, L2_6)
  L0_4(L1_5)
  while true do
    if L0_4 == true then
      L0_4()
    end
  end
  L0_4(L1_5)
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  repeat
    L0_4()
  until L0_4 == 0
  L0_4(L1_5, L2_6)
  L0_4(L1_5)
  L0_4()
  L0_4()
  L0_4(L1_5)
  if L0_4 ~= nil then
    L0_4(L1_5)
    nevybattle_caption_task = nil
  end
  if L0_4 ~= nil then
    L0_4(L1_5)
    vogo_flee_task = nil
  end
  if L0_4 ~= nil then
    L0_4(L1_5)
    vogo_talk_task = nil
  end
  if L0_4 ~= nil then
    L0_4(L1_5)
    vogo_move_task = nil
  end
  L0_4()
  for L3_7 = 1, vogobox_02_max do
    L4_8 = findGameObject2
    L4_8 = L4_8("Node", "bg2_vogo_boxset_02" .. string.format("%02d", L3_7))
    if L4_8 ~= nil then
      L4_8:setActive(false)
    end
  end
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4(L1_5, L2_6)
  L0_4(L1_5, L2_6)
  L3_7 = "vogo_node"
  L4_8 = "Node"
  vogo_node = L2_6
  L2_6()
  L3_7 = 15
  L0_4(L1_5, L2_6, L3_7)
  L0_4()
  L0_4(L1_5)
  L3_7 = L2_6
  L3_7 = {}
  L3_7.anim_in = "inform_ex_in_00"
  L3_7.anim_lp = "inform_ex_00"
  L3_7.anim_out = "inform_ex_out_00"
  L3_7.anim_stay = "stay"
  L0_4(L1_5, L2_6, L3_7)
  L0_4(L1_5)
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L3_7 = 1
  L4_8 = puppets
  L4_8 = L4_8.npc_homeless
  L4_8 = L4_8.getWorldPos
  L4_8 = L4_8(L4_8)
  L4_8 = L4_8 + Vector(0, 1.5, 0)
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L0_4(L1_5, L2_6)
  L0_4(L1_5, L2_6)
  L3_7 = 1
  L4_8 = Vector
  L4_8 = L4_8(0, 0, 0)
  L0_4(L1_5, L2_6, L3_7, L4_8, L4_8(0, 0, 0))
  L0_4(L1_5, L2_6)
  L0_4(L1_5)
  L3_7 = 1
  L4_8 = findGameObject2
  L4_8 = L4_8("Node", "locator2_client_pos_01")
  L4_8 = L4_8.getWorldPos
  L4_8 = L4_8(L4_8)
  L4_8 = L4_8 + Vector(0, 1.5, 0)
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L1_5(L2_6)
  L3_7 = "kit020b"
  L1_5(L2_6, L3_7)
  L1_5(L2_6)
  L3_7 = "locator2_client_move_"
  L4_8 = {}
  L4_8.arrivedLength = 0
  L4_8.runLength = 0
  L4_8.anim_run_speed = 1
  L4_8.anim_speed_over = true
  move_task = L1_5
  if L0_4 ~= nil then
    L1_5(L2_6)
  end
  L3_7 = false
  L4_8 = 1
  L1_5(L2_6, L3_7, L4_8, Vector(0, 0, 0))
  L1_5(L2_6)
  L3_7 = 1
  L4_8 = puppets
  L4_8 = L4_8.sm41_client
  L4_8 = L4_8.getWorldPos
  L4_8 = L4_8(L4_8)
  L4_8 = L4_8 + Vector(0, 1.5, 0)
  L0_4(L1_5, L2_6, L3_7, L4_8)
  L3_7 = "locator2_client_move_01"
  while L2_6 < 15 do
    L3_7 = puppets
    L3_7 = L3_7.sm41_client
    L4_8 = L3_7
    L3_7 = L3_7.getWorldTransform
    L4_8 = L3_7(L4_8)
    L3_7.y = L3_7.y + 2
    vogo_node:setWorldTransform(L3_7, L4_8)
    if RAC_RaycastEyeSight(vogo_node, 400) then
    else
    end
    wait()
  end
  while L1_5 ~= nil do
    L4_8 = L1_5
    L3_7 = L1_5.isRunning
    L3_7 = L3_7(L4_8)
    if L3_7 then
      L3_7 = wait
      L3_7()
    end
  end
  if L1_5 ~= nil then
    L4_8 = L1_5
    L3_7 = L1_5.abort
    L3_7(L4_8)
  end
  L3_7 = move_task
  if L3_7 ~= nil then
    L3_7 = move_task
    L4_8 = L3_7
    L3_7 = L3_7.abort
    L3_7(L4_8)
    move_task = nil
  end
  L3_7 = Fn_setNpcActive
  L4_8 = "sm41_client"
  L3_7(L4_8, false)
  L3_7 = vogo_node
  L4_8 = L3_7
  L3_7 = L3_7.try_term
  L3_7(L4_8)
  vogo_node = nil
  if L0_4 ~= nil then
    L4_8 = L0_4
    L3_7 = L0_4.abort
    L3_7(L4_8)
  end
  L3_7 = Player
  L4_8 = L3_7
  L3_7 = L3_7.setLookAtIk
  L3_7(L4_8, false, 1, Vector(0, 0, 0))
  L0_4(L1_5)
  L0_4()
  L0_4()
  L0_4()
  L0_4()
end
function Finalize()
  local L0_9, L1_10
end
function create_haze(A0_11)
  local L1_12, L2_13, L3_14, L4_15
  L1_12 = {}
  L2_13 = 1
  while true do
    L3_14 = findGameObject2
    L4_15 = "Node"
    L3_14 = L3_14(L4_15, A0_11 .. string.format("%02d", L2_13))
    if L3_14 ~= nil then
      L4_15 = createGameObject2
      L4_15 = L4_15("Effect")
      L4_15:setModelName("ef_ev_smk_bk")
      L4_15:setName("haze_" .. string.format("%02d", L2_13))
      L4_15:setLoop(true)
      L4_15:play()
      L4_15:setActive(false)
      L4_15:try_init()
      L4_15:waitForReady()
      L4_15:try_start()
      L3_14:appendChild(L4_15)
      L1_12[L2_13] = L4_15
    else
      break
    end
    L2_13 = L2_13 + 1
  end
  return L1_12
end
function getBrokenNum()
  local L0_16, L1_17, L2_18, L3_19, L4_20
  L0_16 = 0
  for L4_20 = 1, vogobox_02_max do
    if findGameObject2("Node", "bg2_vogo_boxset_02" .. string.format("%02d", L4_20)) ~= nil and findGameObject2("Node", "bg2_vogo_boxset_02" .. string.format("%02d", L4_20)):isBroken() then
      L0_16 = L0_16 + 1
      vogobox_cap_timer = 0
    end
  end
  return L0_16
end
