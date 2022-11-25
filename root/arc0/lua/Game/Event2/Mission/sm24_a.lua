dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppet_tbl = {}
is_in_sensor = false
is_out_of_range = false
auto_desctive_task_tbl = {}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    {
      name = "sm24_ruffian_wom01",
      type = "wom04",
      node = "locator2_ruffian_wom01",
      active = false,
      color_variation = 2,
      hair_variation = 0
    },
    {
      name = "sm24_ruffian01",
      type = "thug04",
      node = "locator2_ruffian_01",
      active = false,
      use_fall = true
    },
    {
      name = "sm24_ruffian02",
      type = "thug05",
      node = "locator2_ruffian_02",
      active = false,
      color_variation = 2,
      hair_variation = 0,
      use_fall = true
    },
    {
      name = "sm24_ruffian03",
      type = "thug05",
      node = "locator2_ruffian_03",
      active = false,
      color_variation = 3,
      hair_variation = 1,
      use_fall = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  sdemo = SDemo.create("sm24_sdemo")
  puppet_tbl.sm24_man01 = Fn_findNpcPuppet("sm24_man01")
  Fn_pcSensorOff("pccubesensor2_ferriswheel_01")
  Fn_pcSensorOff("pccubesensor2_bickering_01")
  Fn_loadPlayerMotion({
    "kit01_ep16_lookaround_00"
  })
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L4_5.pos = "locator2_look_at_ferriswheel_01"
  L4_5.time = 4
  L4_5.hashfunc = "EaseInOut"
  L0_1(L1_2, L2_3, L3_4)
  while true do
    if L0_1 then
      L0_1()
    end
  end
  L0_1(L1_2)
  L0_1(L1_2)
  L3_4.pos = "locator2_sdemo_01_cam_02"
  L3_4.time = 1
  L3_4.hashfunc = "EaseInOut"
  L4_5.pos = "locator2_sdemo_01_aim_02"
  L4_5.time = 1
  L4_5.hashfunc = "EaseInOut"
  L0_1(L1_2, L2_3, L3_4)
  while true do
    if L0_1 then
      L0_1()
    end
  end
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L0_1()
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  is_in_sensor = false
  L0_1(L1_2)
  while true do
    if L0_1 == false then
      L0_1()
    end
  end
  is_in_sensor = false
  L0_1(L1_2)
  L0_1()
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  for L3_4 = 1, 3 do
    L6_7 = string
    L6_7 = L6_7.format
    L7_8 = "%02d"
    L6_7 = L6_7(L7_8, L3_4)
    L6_7 = L4_5
    L7_8 = 0
    L5_6(L6_7, L7_8)
  end
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6)
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4)
  while true do
    if L0_1 ~= nil then
      L0_1()
    end
  end
  L0_1(L1_2)
  L0_1(L1_2, L2_3, L3_4, L4_5)
  L0_1(L1_2, L2_3)
  L7_8 = L2_3(L3_4, L4_5)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L2_3(L3_4, L4_5))
  is_in_sensor = false
  L1_2(L2_3)
  while true do
    if L1_2 ~= false then
      if L1_2 ~= L2_3 then
      end
    end
    if L1_2 ~= L2_3 then
      L1_2()
    end
  end
  L1_2(L2_3)
  is_in_sensor = false
  L1_2()
  L1_2(L2_3)
  L0_1(L1_2)
  L6_7 = {
    L7_8,
    "wom01_scared_nevy_00"
  }
  L7_8 = "wom01_scared_nevy_in_00"
  L7_8 = L2_3(L3_4, L4_5, L5_6, L6_7)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L2_3(L3_4, L4_5, L5_6, L6_7))
  for L4_5, L5_6 in L1_2(L2_3) do
    L6_7 = "sm24_ruffian"
    L7_8 = string
    L7_8 = L7_8.format
    L7_8 = L7_8("%02d", L4_5)
    L6_7 = L6_7 .. L7_8
    L7_8 = Fn_findNpc
    L7_8 = L7_8(L6_7)
    L7_8:changeEnemy()
    L7_8:setEventListener("npcDead", function()
      L7_8:setEventListener("npcDead", nil)
      L0_1[L4_5] = true
    end)
    L7_8:setEventListener("npcFall", function()
      L7_8:setEventListener("npcFall", nil)
      L0_1[L4_5] = true
    end)
    do break end
    break
  end
  L2_3.move_task = nil
  L2_3.update = L3_4
  L2_3.destractor = L3_4
  L6_7 = L2_3
  L2_3(L3_4, L4_5)
  L2_3(L3_4)
  while true do
    for L6_7, L7_8 in L3_4(L4_5) do
      if L7_8 == false then
        break
      end
    end
    if L2_3 ~= true then
      L3_4()
    end
  end
  L2_3(L3_4)
  L2_3()
  L2_3()
  L2_3(L3_4, L4_5)
  L2_3(L3_4)
  L2_3(L3_4, L4_5)
  L2_3(L3_4, L4_5)
  L2_3(L3_4, L4_5)
  for L5_6, L6_7 in L2_3(L3_4) do
    L7_8 = auto_desctive_task_tbl
    L7_8 = L7_8[L5_6]
    L7_8 = L7_8.abort
    L7_8(L7_8)
  end
  auto_desctive_task_tbl = L2_3
  L2_3()
  do break end
  L0_1()
  L0_1()
  L0_1()
end
function Finalize()
  local L0_9, L1_10, L2_11, L3_12
  for L3_12 = 1, 3 do
    Fn_disappearNpc("sm24_ruffian" .. string.format("%02d", L3_12))
  end
  L0_9(L1_10, L2_11)
  L0_9(L1_10)
  L0_9(L1_10)
end
function invokeMoveDeactiveTask(A0_13, A1_14, A2_15, A3_16)
  local L4_17
  L4_17 = {}
  L4_17.move_task = nil
  L4_17.deactive_task = nil
  function L4_17.update(A0_18)
    A0_18.deactive_task = RAC_InvokeAutoDeactiveNpcTask(A0_13, A2_15)
    A0_18.move_task = RAC_invokeMoveCharaTask(A0_13, A1_14, {
      runLength = -1,
      arrivedLength = 1.5,
      recast = true
    })
    while A0_18.deactive_task:isRunning() and A0_18.move_task:isRunning() do
      wait()
    end
    A0_18.move_task:abort()
    A0_18.move_task = nil
    RAC_stopNpcMoveTask(A0_13)
    if A0_18.deactive_task:isRunning() then
      Fn_playMotionNpc(A0_13, A3_16, false, {isRepeat = false, isStop = true})
      while A0_18.deactive_task:isRunning() do
        wait()
      end
    end
    A0_18.deactive_task:abort()
    A0_18.deactive_task = nil
  end
  function L4_17.destractor(A0_19)
    if A0_19.move_task ~= nil then
      A0_19.move_task:abort()
      A0_19.move_task = nil
      RAC_stopNpcMoveTask(A0_13)
    end
    if A0_19.deactive_task ~= nil then
      A0_19.deactive_task:abort()
      A0_19.deactive_task = nil
      Fn_setNpcActive(A0_13, false)
    end
  end
  return RAC_InvokeTaskWithDestractor(L4_17.update, L4_17.destractor, L4_17)
end
function pccubesensor2_ferriswheel_01_OnEnter()
  local L0_20, L1_21
  is_in_sensor = true
end
function pccubesensor2_ferriswheel_01_OnLeave()
  local L0_22, L1_23
  is_in_sensor = false
end
function pccubesensor2_bickering_01_OnEnter()
  local L0_24, L1_25
  is_in_sensor = true
end
function pccubesensor2_bickering_01_OnLeave()
  local L0_26, L1_27
  is_in_sensor = false
end
