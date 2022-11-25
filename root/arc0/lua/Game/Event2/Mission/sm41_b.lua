dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
aiming_offset_y = 1.5
vogobox_01_max = 9
vogobox_01_num = 0
vogobox_01_navi = false
vogobox_01_wait = 150
nevy_battle_num = 0
enemy_gen = {}
puppets = {}
sdemo = nil
move_task = ""
is_in_sensor1 = false
is_in_sensor2 = false
CRIMINAL_NPC_MOTION = {
  run_afraid = "man01_run_afraid_00",
  surprise = "man01_lookback_watch_01"
}
enmgen2_nevy_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy01a",
      type = "stalker_strong",
      locator = "locator_01"
    },
    {
      name = "enemy01b",
      type = "stalker_strong",
      locator = "locator_02"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onSpawn = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end,
  onSetupGem = function(A0_12, A1_13)
    Fn_enemyPopGemSetup(A0_12, {
      A0_12:getSpecTable().spawnSet[1].name,
      A0_12:getSpecTable().spawnSet[2].name
    }, 2, GEM_VITAL)
  end,
  onPopGem = function(A0_14, A1_15)
    Fn_enemyAshPopGem(A0_14, A1_15)
  end
}
enmgen2_nevy_02 = {
  spawnOnStart = false,
  autoPrepare = false,
  autoRebirthFlag = false,
  spawnSet = {
    {
      name = "enemy01a",
      type = "stalker_strong",
      locator = "locator_01"
    },
    {
      name = "enemy01b",
      type = "stalker_strong",
      locator = "locator_02"
    },
    {
      name = "enemy01c",
      type = "stalker_strong",
      locator = "locator_03"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end,
  onSpawn = function(A0_24, A1_25)
  end,
  onObjectAsh = function(A0_26, A1_27)
  end
}
function Initialize()
  local L0_28, L1_29, L2_30
  L0_28 = Fn_userCtrlAllOff
  L0_28()
  L0_28 = {L1_29}
  L1_29 = "evarea2_id_a_root"
  L1_29 = Fn_loadEventData
  L1_29(L2_30, L0_28, true)
  L1_29 = {L2_30}
  L2_30.name = "npc_criminal"
  L2_30.type = "man80"
  L2_30.node = "locator2_criminal_pos"
  L2_30.active = true
  L2_30.reset = false
  L2_30(L1_29)
  L2_30.sm41_client = Fn_findNpcPuppet("sm41_client")
  for _FORV_5_, _FORV_6_ in L2_30(L1_29) do
    puppets[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  vogobox_01_max = 0
  while findGameObject2("Node", "bg2_vogo_boxset_01" .. string.format("%02d", L2_30)) ~= nil do
    vogobox_01_max = vogobox_01_max + 1
  end
  while true do
    enemy_gen[L2_30] = findGameObject2("EnemyGenerator", "enmgen2_nevy_" .. string.format("%02d", L2_30))
    if enemy_gen[L2_30] ~= nil then
      print("CHECK" .. L2_30)
    end
  end
  Fn_loadNpcEventMotion("npc_criminal", CRIMINAL_NPC_MOTION)
  Fn_userCtrlOn()
  sdemo = SDemo.create("sm41_b_sdemo")
end
function Ingame()
  local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36
  L0_31 = Fn_userCtrlAllOff
  L0_31()
  L0_31 = Player
  L0_31 = L0_31.setStay
  L0_31(L1_32, L2_33)
  L0_31 = Fn_coercionPoseBattle
  L0_31()
  L0_31 = Fn_findNpc
  L0_31 = L0_31(L1_32)
  L0_31 = L0_31.ignoreStoop
  L0_31(L1_32)
  L0_31 = {}
  L4_35 = false
  L1_32(L2_33, L3_34, L4_35)
  L1_32(L2_33)
  L4_35 = "locator2_sdemo02_aim_01"
  L5_36 = false
  L1_32(L2_33, L3_34, L4_35, L5_36)
  L1_32(L2_33)
  L1_32()
  L1_32()
  L4_35 = {}
  L4_35.pos = "locator2_sdemo02_cam_02"
  L4_35.time = 6
  L4_35 = {L5_36}
  L5_36 = {}
  L5_36.pos = "locator2_criminal_pos"
  L5_36.time = 6
  L1_32(L2_33, L3_34, L4_35)
  while true do
    if L1_32 then
      L1_32()
    end
  end
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L1_32(L2_33)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L1_32(L2_33)
  L4_35 = "locator2_sdemo03_aim_01"
  L5_36 = false
  L1_32(L2_33, L3_34, L4_35, L5_36)
  L4_35 = {}
  L4_35.pos = "locator2_sdemo03_cam_02"
  L4_35.time = 3
  L4_35 = {L5_36}
  L5_36 = {}
  L5_36.pos = "locator2_sdemo03_aim_02"
  L5_36.time = 3
  L1_32(L2_33, L3_34, L4_35)
  L0_31 = L1_32
  for L4_35, L5_36 in L1_32(L2_33) do
    L5_36:setActive(true)
  end
  L1_32(L2_33)
  L1_32(L2_33, L3_34)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L4_35 = CRIMINAL_NPC_MOTION
  L4_35 = L4_35.surprise
  L4_35 = false
  L5_36 = {}
  L5_36.isRepeat = false
  L5_36.isStop = true
  L5_36.animBlendDuration = 0.4
  L1_32(L2_33, L3_34, L4_35, L5_36)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  repeat
    L2_33()
  until L2_33
  L2_33(L3_34)
  L4_35 = false
  L2_33(L3_34, L4_35)
  L4_35 = 1
  L2_33(L3_34, L4_35)
  L2_33(L3_34)
  L4_35 = "pccubesensor2_out_of_range_02m"
  L5_36 = "pccubesensor2_out_of_range_02l"
  L1_32(L2_33, L3_34, L4_35, L5_36, "locator2_pc_start_pos", "locator2_back_to_range_02", nil, "sm41_01011")
  L1_32()
  L1_32()
  L1_32(L2_33, L3_34)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L1_32(L2_33)
  L1_32(L2_33)
  while true do
    if L1_32 > 0 then
      L1_32()
    end
  end
  L1_32(L2_33)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L1_32(L2_33)
  while true do
    if L1_32 > 0 then
      L1_32()
    end
  end
  if L1_32 < L2_33 then
    L1_32(L2_33)
    while true do
      if L1_32 == true then
        L1_32()
      end
    end
    L1_32(L2_33)
    L1_32(L2_33, L3_34)
    L1_32(L2_33)
    vogobox_01_num = L1_32
    L1_32(L2_33, L3_34)
    L4_35 = vogobox_01_num
    L1_32(L2_33, L3_34)
    L1_32(L2_33, L3_34)
    while true do
      if L1_32 < L2_33 then
        vogobox_01_num = L1_32
        if not L1_32 then
          if L1_32 <= 5 then
            vogobox_01_wait = L1_32
            if L1_32 == 0 then
              for L4_35 = 1, vogobox_01_max do
                L5_36 = findGameObject2
                L5_36 = L5_36("Node", "bg2_vogo_boxset_01" .. string.format("%02d", L4_35))
                if L5_36 ~= nil and not L5_36:isBroken() then
                  RAC_DynamicMultiNaviAdd(L5_36)
                end
              end
              vogobox_01_navi = true
            end
          end
        end
        L4_35 = vogobox_01_num
        L1_32(L2_33, L3_34)
        L1_32()
      end
    end
    L1_32()
    L1_32(L2_33, L3_34)
  end
  L1_32(L2_33)
  for L4_35, L5_36 in L1_32(L2_33) do
    invokeTask(function()
      Fn_setAlpha(L5_36, false, 3, 10)
      L5_36:setVisible(false)
    end)
    break
  end
  if L2_33 > 8 then
    L2_33(L3_34)
  end
  L2_33(L3_34)
  while true do
    if L2_33 == true then
      L2_33()
    end
  end
  L2_33(L3_34)
  L4_35 = "pccubesensor2_out_of_range_01m"
  L5_36 = "pccubesensor2_out_of_range_01l"
  L1_32(L2_33, L3_34, L4_35, L5_36, "locator2_pc_start_pos", nil, nil, "sm41_01009")
  L1_32()
  L1_32(L2_33)
  L4_35 = false
  L1_32(L2_33, L3_34, L4_35)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L4_35 = "pccubesensor2_vogo_start_02"
  L5_36 = L2_33(L3_34, L4_35)
  L1_32(L2_33, L3_34, L4_35, L5_36, L2_33(L3_34, L4_35))
  L4_35 = "scared_in_00"
  L5_36 = "scared_00"
  L4_35 = false
  L5_36 = {}
  L5_36.isRepeat = false
  L5_36.isStop = true
  L5_36.animBlendDuration = 0.5
  L1_32(L2_33, L3_34, L4_35, L5_36)
  while true do
    if L1_32 then
      L4_35 = 180
      L5_36 = nil
    end
    if not L1_32 then
      L1_32()
    end
  end
  while L1_32 ~= nil do
    if L2_33 then
      L4_35 = 0.2
    end
    if not L2_33 then
      L2_33()
    end
  end
  L4_35 = "kit035b_1"
  L2_33(L3_34, L4_35)
  L2_33(L3_34)
  L4_35 = "enmgen2_nevybattle_02_01"
  L5_36 = true
  L2_33(L3_34, L4_35, L5_36)
  while true do
    if not L2_33 then
      L2_33()
    end
  end
  if L1_32 ~= nil then
    L2_33(L3_34)
  end
  L1_32()
  while true do
    if L1_32 == true then
      L1_32()
    end
  end
  L1_32(L2_33)
  L1_32(L2_33, L3_34)
  L1_32(L2_33)
  L1_32(L2_33)
  L1_32()
  L1_32()
  L1_32()
  L1_32()
end
function Finalize()
  local L0_37, L1_38
end
function create_haze(A0_39)
  local L1_40, L2_41, L3_42, L4_43
  L1_40 = {}
  L2_41 = 1
  while true do
    L3_42 = findGameObject2
    L4_43 = "Node"
    L3_42 = L3_42(L4_43, A0_39 .. string.format("%02d", L2_41))
    if L3_42 ~= nil then
      L4_43 = createGameObject2
      L4_43 = L4_43("Effect")
      L4_43:setModelName("ef_ev_smk_bk")
      L4_43:setName("haze_" .. string.format("%02d", L2_41))
      L4_43:setLoop(true)
      L4_43:play()
      L4_43:setActive(false)
      L4_43:try_init()
      L4_43:waitForReady()
      L4_43:try_start()
      L3_42:appendChild(L4_43)
      L1_40[L2_41] = L4_43
    else
      break
    end
    L2_41 = L2_41 + 1
  end
  return L1_40
end
function getBrokenNum()
  local L0_44, L1_45, L2_46, L3_47, L4_48
  L0_44 = 0
  for L4_48 = 1, vogobox_01_max do
    if findGameObject2("Node", "bg2_vogo_boxset_01" .. string.format("%02d", L4_48)):isBroken() then
      L0_44 = L0_44 + 1
    end
  end
  return L0_44
end
function pccubesensor2_vogo_start_01_OnEnter()
  local L0_49, L1_50
  is_in_sensor1 = true
end
function pccubesensor2_vogo_start_01_OnLeave()
  local L0_51, L1_52
  is_in_sensor1 = false
end
function pccubesensor2_vogo_start_02_OnEnter()
  local L0_53, L1_54
  is_in_sensor2 = true
end
function pccubesensor2_vogo_start_02_OnLeave()
  local L0_55, L1_56
  is_in_sensor2 = false
end
