dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/WarshipCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/ep07_common.lua")
_is_in_ar_attack_sensor = false
_soliloquy_01_task = nil
_is_in_soliloquy_01_sensor = false
function Initialize()
  Fn_pcSensorOff("pcspheresensor2_soliloquy_01")
  Fn_pcSensorOff("pcspheresensor2_soliloquy_02")
  Fn_pcSensorOff("pcspheresensor2_soliloquy_03")
  Fn_pcSensorOff("pcspheresensor2_ar_attack_01")
  Fn_userCtrlOff()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
  L0_0 = ep07_ftNpcSetSightTarget
  L0_0()
  L0_0 = 1
  while true do
    L1_1 = findGameObject2
    L2_2 = "Gem"
    L3_3 = "gem2_energy_a_"
    L3_3 = L3_3 .. L4_4
    L1_1 = L1_1(L2_2, L3_3)
    if L1_1 ~= nil then
      L3_3 = L1_1
      L2_2 = L1_1.setVisibleBlockHalfSize
      L2_2(L3_3, L4_4)
    else
      break
    end
    L0_0 = L0_0 + 1
  end
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = invokeTask
  function L1_1()
    local L0_14
    L0_14 = Fn_findNpc
    L0_14 = L0_14("ep07_sis_01")
    while true do
      if Fn_isValidNpc(L0_14, 30) == false then
        Fn_setNpcActive(L0_14, false)
        Fn_setNpcActive("ep07_gawa_01", false)
        break
      end
      waitSeconds(1)
    end
  end
  L0_0 = L0_0(L1_1)
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_navi_ar_01"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = invokeTask
  function L3_3()
    _is_in_soliloquy_01_sensor = false
    Fn_pcSensorOn("pcspheresensor2_soliloquy_01")
    repeat
      wait()
      if _is_in_soliloquy_01_sensor == true and Fn_isInSightTarget(L1_1, 1) == true then
      else
      end
    until 0 >= 20
    Fn_pcSensorOff("pcspheresensor2_soliloquy_01")
    _is_in_soliloquy_01_sensor = false
    Fn_captionView("ep07_00103")
  end
  L2_2 = L2_2(L3_3)
  _soliloquy_01_task = L2_2
  L2_2 = Fn_pcSensorOn
  L3_3 = "pcspheresensor2_soliloquy_02"
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOn
  L3_3 = "pcspheresensor2_soliloquy_03"
  L2_2(L3_3)
  L2_2 = Fn_missionView
  L3_3 = "ep07_00100"
  L2_2(L3_3)
  L2_2 = waitSeconds
  L3_3 = 1.3
  L2_2(L3_3)
  L2_2 = Fn_naviSet
  L3_3 = L1_1
  L2_2(L3_3)
  L2_2 = waitSeconds
  L3_3 = 2.5
  L2_2(L3_3)
  L2_2 = Fn_captionView
  L3_3 = "ep07_00101"
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOn
  L3_3 = "pcspheresensor2_ar_attack_01"
  L2_2(L3_3)
  while true do
    L2_2 = _is_in_ar_attack_sensor
    if L2_2 == false then
      L2_2 = wait
      L2_2()
    end
  end
  L2_2 = Fn_pcSensorOff
  L3_3 = "pcspheresensor2_ar_attack_01"
  L2_2(L3_3)
  L2_2 = Fn_naviKill
  L2_2()
  L2_2 = _soliloquy_01_task
  if L2_2 ~= nil then
    L2_2 = _soliloquy_01_task
    L3_3 = L2_2
    L2_2 = L2_2.abort
    L2_2(L3_3)
    _soliloquy_01_task = nil
  end
  L2_2 = Fn_pcSensorOff
  L3_3 = "pcspheresensor2_soliloquy_01"
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L3_3 = "pcspheresensor2_soliloquy_02"
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOff
  L3_3 = "pcspheresensor2_soliloquy_03"
  L2_2(L3_3)
  L3_3 = L0_0
  L2_2 = L0_0.abort
  L2_2(L3_3)
  L0_0 = nil
  do break end
  L0_0 = Fn_getGameObject
  L1_1 = "mother2"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0
  L0_0 = L0_0.findGameObject2
  L2_2 = "Sandbox2"
  L3_3 = "warshipManager"
  L0_0 = L0_0(L1_1, L2_2, L3_3)
  L1_1 = {}
  L2_2 = 1
  while true do
    L3_3 = L0_0.findGameObject2
    L13_13 = L6_6(L7_7, L8_8)
    L3_3 = L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L6_6(L7_7, L8_8))
    if L3_3 ~= nil then
      L6_6.node = L3_3
      L6_6.is_shot = false
      L4_4(L5_5, L6_6)
    else
      break
    end
    L2_2 = L2_2 + 1
  end
  L2_2 = Sound
  L3_3 = L2_2
  L2_2 = L2_2.playSEHandle
  L13_13 = L7_7(L8_8)
  L2_2 = L2_2(L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L7_7(L8_8))
  L3_3 = nil
  for L9_9, L10_10 in L6_6(L7_7) do
    L13_13 = L12_12
    L13_13 = L12_12(L13_13)
    if L5_5 == nil or L5_5 > L11_11 then
      L13_13 = L12_12
      L13_13 = Fn_getPlayerWorldPos
      L13_13 = L13_13()
      L13_13 = L13_13 - L12_12
      L13_13 = L13_13.Normalize
      L13_13 = L13_13(L13_13)
      L13_13 = L13_13 * 4
      if RAC_RaycastEyeSight(L12_12 + L13_13, L11_11 + 1, 180, 1, 0) == true then
      end
    end
  end
  if L4_4 ~= nil then
    L7_7.is_shot = true
    L3_3 = L7_7
  end
  L7_7(L8_8)
  if L6_6 ~= nil then
    L7_7(L8_8)
  end
  for L7_7 = 1, #L1_1 do
    L13_13 = L10_10(L11_11)
    for L13_13 = L7_7 + 1, #L1_1 do
      if L9_9 > Fn_getDistanceToPlayer(L1_1[L13_13].node:getWorldPos()) then
      end
    end
    if L8_8 ~= nil then
      L1_1[L7_7] = L11_11
      L1_1[L8_8] = L10_10
    end
  end
  for L11_11, L12_12 in L8_8(L9_9) do
    if not (L4_4 >= L5_5) then
      L13_13 = L12_12.is_shot
      if L13_13 == true then
        L13_13 = L7_7
        L13_13(L12_12.node:getWorldPos())
      end
    end
  end
  for L11_11, L12_12 in L8_8(L9_9) do
    if not (L5_5 <= L4_4) then
      L13_13 = L12_12.is_shot
      if L13_13 ~= true then
        L13_13 = L12_12.node
        L13_13 = L13_13.getWorldPos
        L13_13 = L13_13(L13_13)
        if RAC_RaycastEyeSight(L13_13 + (Fn_getPlayerWorldPos() - L13_13):Normalize() * 4, Fn_getDistanceToPlayer(L13_13) + 1, 180, 1, 0) == true then
          waitSeconds(0.3)
          L7_7(L12_12.node:getWorldPos())
          L1_1[L11_11].is_shot = true
        end
      end
    end
    if not (L5_5 <= L4_4) then
    end
  end
  for L11_11, L12_12 in L8_8(L9_9) do
    if not (L5_5 <= L4_4) then
      L13_13 = L12_12.is_shot
      if L13_13 ~= true then
        L13_13 = waitSeconds
        L13_13(0.2)
        L13_13 = L7_7
        L13_13(L12_12.node:getWorldPos())
        L13_13 = L1_1[L11_11]
        L13_13.is_shot = true
      end
    end
  end
  L8_8(L9_9, L10_10)
  L8_8()
  L8_8(L9_9)
  L13_13 = 4
  L9_9.offset = L10_10
  L9_9.delay_sec = 0
  L13_13 = 4
  L10_10.offset = L11_11
  L10_10.delay_sec = 0
  L13_13 = -5
  L11_11.offset = L12_12
  L11_11.delay_sec = 0.2
  L13_13 = Vector
  L13_13 = L13_13(-4, -2, -5)
  L12_12.offset = L13_13
  L12_12.delay_sec = 0.2
  L13_13 = {}
  L13_13.offset = Vector(0, 1, 9)
  L13_13.delay_sec = 0.4
  for L12_12, L13_13 in L9_9(L10_10) do
    invokeTask(function()
      local L0_15, L1_16, L2_17, L3_18, L4_19
      L0_15 = L13_13.delay_sec
      if L0_15 > 0 then
        L0_15 = waitSeconds
        L1_16 = L13_13.delay_sec
        L0_15(L1_16)
      end
      L0_15 = Fn_getPlayerWorldTransform
      L1_16 = L0_15()
      L2_17 = L3_3
      if L2_17 ~= nil then
        L2_17 = L3_3
      elseif not L2_17 then
        L2_17 = findGameObject2
        L3_18 = "Node"
        L4_19 = "locator2_navi_ar_01"
        L2_17 = L2_17(L3_18, L4_19)
        L3_18 = L2_17
        L2_17 = L2_17.getWorldPos
        L2_17 = L2_17(L3_18)
      end
      L3_18 = ConjQuat
      L4_19 = L1_16
      L3_18 = L3_18(L4_19)
      L4_19 = L2_17 - L0_15
      L4_19 = L3_18:Apply(L4_19)
      L4_19 = L4_19:Normalize()
      table.insert(L6_6, {
        eff_task = RAC_createEffect({
          eff_name = "ef_ev_exp_01",
          world_pos = L0_15 + (Fn_getPlayerWorldRot() * ArcQuat(Vector(0, 0, 1), L4_19)):Apply(L13_13.offset),
          time = 4
        })
      })
    end)
    break
  end
  L8_8(L9_9)
  L8_8(L9_9)
  L8_8(L9_9, L10_10)
  L8_8(L9_9)
  L8_8()
  if L2_2 ~= nil then
    L8_8(L9_9, L10_10)
    L2_2 = nil
  end
  for L11_11, L12_12 in L8_8(L9_9) do
    L13_13 = L6_6[L11_11]
    L13_13 = L13_13.eff_task
    L13_13 = L13_13.abort
    L13_13(L13_13)
    L13_13 = L6_6[L11_11]
    L13_13 = L13_13.se_node
    if L13_13 ~= nil then
      L13_13 = L6_6[L11_11]
      L13_13 = L13_13.se_node
      L13_13 = L13_13.try_term
      L13_13(L13_13)
    end
  end
  do break end
  L0_0 = Fn_setNpcActive
  L1_1 = "ep07_sis_01"
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_setNpcActive
  L1_1 = "ep07_gawa_01"
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setStay
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_setNextMissionFlag
  L0_0()
  L0_0 = Fn_nextMission
  L0_0()
  L0_0 = Fn_exitSandbox
  L0_0()
end
function Finalize()
  local L0_20, L1_21
end
function pcspheresensor2_ar_attack_01_OnEnter()
  local L0_22, L1_23
  _is_in_ar_attack_sensor = true
end
function pcspheresensor2_ar_attack_01_OnLeave()
  local L0_24, L1_25
  _is_in_ar_attack_sensor = false
end
function pcspheresensor2_soliloquy_01_OnEnter()
  local L0_26, L1_27
  _is_in_soliloquy_01_sensor = true
end
function pcspheresensor2_soliloquy_01_OnLeave()
  local L0_28, L1_29
  _is_in_soliloquy_01_sensor = false
end
function pcspheresensor2_soliloquy_02_OnEnter()
  Fn_pcSensorOff("pcspheresensor2_soliloquy_02")
  if _soliloquy_01_task ~= nil then
    _soliloquy_01_task:abort()
    _soliloquy_01_task = nil
  end
  Fn_captionView("ep07_00106")
end
function pcspheresensor2_soliloquy_02_OnLeave()
  local L0_30, L1_31
end
function pcspheresensor2_soliloquy_03_OnEnter()
  Fn_pcSensorOff("pcspheresensor2_soliloquy_03")
  if _soliloquy_01_task ~= nil then
    _soliloquy_01_task:abort()
    _soliloquy_01_task = nil
  end
  Fn_captionView("ep07_00104")
end
function pcspheresensor2_soliloquy_03_OnLeave()
  local L0_32, L1_33
  _is_in_soliloquy_03_sensor = false
end
