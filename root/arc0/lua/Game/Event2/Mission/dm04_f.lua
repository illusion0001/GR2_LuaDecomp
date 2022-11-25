dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
GATE_MAX = 8
FLOOR_GROUP_MAX = 9
GAME_TIME = 90
FLOOR_DAMAGE = 0.5
DAMAGE_FLOOR_CAPTION = {
  "dm04_05002",
  "dm04_05003",
  "dm04_05004"
}
SAFE_FLOOR_CAPTION = {WHITE = "dm04_05005", BLACK = "dm04_05006"}
dm04_exit = false
dm04_black_danger = false
dm04_white_danger = false
dm04_white_zone = false
dm04_black_zone = false
dm04_hurt_zone = false
dm04_current_zone = 0
dm04_is_floor_damaged = false
dm04_activate_task = nil
_process_damage_task = nil
dm04_is_near_exit_caption = false
dm04_caption_task = nil
dm04_gate_hdl = {}
_wormhole_hdl = nil
_damage_effect_hdl = nil
_gate_effect_hdl = {}
_gate_close_effect_hdl = {}
_floor_effect_black_hdl = {}
_floor_effect_white_hdl = {}
enmgen2_slalom_01 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_01_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_02 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_02_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_03 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_03_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_04 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_04_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_05 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_05_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_06 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_06_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_07 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_07_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_08 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_08_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_09 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_09_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_10 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_10_01",
      name = "blacknevi"
    }
  }
}
enmgen2_slalom_11 = {
  spawnOnStart = true,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_11_01",
      name = "blacknevi"
    }
  }
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0(L1_1)
  for L3_3 = 1, GATE_MAX do
    dm04_gate_hdl[L3_3] = findGameObject2("Node", "bg2_az6_guidecircle_" .. string.format("%02d", L3_3))
  end
  L3_3 = _floor_effect_white_hdl
  L0_0(L1_1, L2_2, L3_3)
  L3_3 = _floor_effect_black_hdl
  L0_0(L1_1, L2_2, L3_3)
  L0_0(L1_1)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7
  L0_4()
  L0_4()
  L1_5.eff_name = "wormhole_oc_01"
  L3_7 = "Node"
  L1_5.pos_node = L2_6
  L1_5.loop = true
  _wormhole_hdl = L0_4
  for L3_7 = 1, GATE_MAX do
    _gate_effect_hdl[L3_7] = Fn_createEffect("ef__gate__" .. string.format("%02d", L3_7), "ef_bg_gate_01", dm04_gate_hdl[L3_7], true)
  end
  L0_4(L1_5, L2_6)
  L0_4()
  L0_4(L1_5)
  L0_4(L1_5)
  L3_7 = false
  L0_4(L1_5, L2_6, L3_7)
  L0_4()
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4()
  L0_4(L1_5, L2_6)
  L0_4(L1_5, L2_6)
  L0_4(L1_5, L2_6)
  L0_4(L1_5)
  dm04_activate_task = L0_4
  _process_damage_task = L0_4
  dm04_black_danger = true
  L0_4()
  while true do
    if L0_4 == false then
      L0_4()
      if L0_4 <= 0 then
        if L0_4 ~= nil then
          L0_4(L1_5)
          dm04_caption_task = nil
        end
        L3_7 = L2_6
        L3_7 = 3
        L0_4(L1_5, L2_6, L3_7, nil, "environmental", 0)
      end
      L3_7 = "pccubesensor2_exit"
      L3_7 = L1_5(L2_6, L3_7)
      if L0_4 < 45 then
        if L0_4 ~= nil then
          L0_4(L1_5)
          dm04_caption_task = nil
        end
        if L0_4 == false then
          dm04_is_near_exit_caption = true
          L0_4(L1_5)
        end
      end
    end
  end
  if L0_4 ~= nil then
    L0_4(L1_5)
    _process_damage_task = nil
  end
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4()
  L0_4()
  if L0_4 ~= nil then
    L0_4(L1_5)
    _wormhole_hdl = nil
  end
  L0_4()
  L0_4()
  L0_4()
end
function Finalize()
  if _process_damage_task ~= nil then
    _process_damage_task:abort()
    _process_damage_task = nil
  end
  HUD:timerStop()
  HUD:timerSetVisible(false)
end
function endCaptionAndView(A0_8)
  Fn_captionViewEnd()
  Fn_captionView(A0_8)
end
function damageFloorCaptionTask()
  return invokeTask(function()
    waitSeconds(2)
    Fn_captionViewEnd()
    Fn_captionView(DAMAGE_FLOOR_CAPTION[RandI(#DAMAGE_FLOOR_CAPTION)])
  end)
end
function initFloorDamageEffect(A0_9, A1_10, A2_11)
  local L3_12, L4_13, L5_14, L6_15, L7_16, L8_17, L9_18
  for L6_15 = 1, FLOOR_GROUP_MAX do
    L7_16 = 1
    while true do
      L8_17 = findGameObject2
      L9_18 = "Node"
      L8_17 = L8_17(L9_18, A0_9 .. string.format("%02d", L6_15) .. "_" .. string.format("%02d", L7_16))
      if L8_17 ~= nil then
        L9_18 = RAC_createEffect
        L9_18 = L9_18({
          eff_name = A1_10,
          parent_hdl = L8_17,
          loop = true
        })
        while L9_18:isReady() == false do
          wait()
        end
        table.insert(A2_11, L9_18)
        L7_16 = L7_16 + 1
      end
    end
  end
end
function damage_floor()
  if dm04_caption_task == nil then
    dm04_caption_task = damageFloorCaptionTask()
  end
  if Player:getEnergy(Player.kEnergy_Life) - FLOOR_DAMAGE > 0 then
    Player:setEnergy(Player.kEnergy_Life, Player:getEnergy(Player.kEnergy_Life) - FLOOR_DAMAGE)
    if Player:getEnergy(Player.kEnergy_Life) < 1 then
      RAC_setBulletShockwave(Fn_getPlayerWorldPos(), 1, 3, nil, "environmental", 0)
    end
  end
end
function playDamageEffect(A0_19)
  local L1_20
  L1_20 = Vector
  L1_20 = L1_20(0, 0.75, 0)
  if _damage_effect_hdl == nil then
    _damage_effect_hdl = Fn_createEffect(A0_19, A0_19, Fn_getPlayer(), true, L1_20)
  end
end
function endDamageEffect()
  if _damage_effect_hdl ~= nil then
    Fn_finishedTremEffect(_damage_effect_hdl)
    _damage_effect_hdl = nil
  end
end
function playFloorEffectBlack()
  for _FORV_3_, _FORV_4_ in ipairs(_floor_effect_white_hdl) do
    _FORV_4_.eff_task:setActive(false)
  end
  for _FORV_3_, _FORV_4_ in ipairs(_floor_effect_black_hdl) do
    _FORV_4_.eff_task:setActive(true)
  end
end
function playFloorEffectWhite()
  for _FORV_3_, _FORV_4_ in ipairs(_floor_effect_black_hdl) do
    _FORV_4_.eff_task:setActive(false)
  end
  for _FORV_3_, _FORV_4_ in ipairs(_floor_effect_white_hdl) do
    _FORV_4_.eff_task:setActive(true)
  end
end
function deactivateDamage(A0_21)
  local L1_22, L2_23, L3_24, L4_25
  for L4_25 = A0_21, 75 do
    Fn_pcSensorOff("pccubesensor2_hurt_" .. string.format("%02d", L4_25))
  end
end
function activateDamage(A0_26)
  local L1_27, L2_28, L3_29, L4_30
  if A0_26 == nil then
    A0_26 = 1
  end
  for L4_30 = 1, A0_26 - 1 do
    Fn_pcSensorOn("pccubesensor2_hurt_" .. string.format("%02d", L4_30))
  end
  L1_27(L2_28)
  for L4_30 = A0_26, 75 do
    if dm04_current_zone > 0 and L4_30 < 8 then
      waitSeconds(0.25)
    elseif 1 < dm04_current_zone and L4_30 < 16 then
      waitSeconds(0.25)
    elseif dm04_current_zone > 2 and L4_30 < 24 then
      waitSeconds(0.25)
    elseif dm04_current_zone > 3 and L4_30 < 30 then
      waitSeconds(0.25)
    elseif dm04_current_zone > 4 and L4_30 < 41 then
      waitSeconds(0.25)
    elseif 5 < dm04_current_zone and L4_30 < 54 then
      waitSeconds(0.25)
    elseif dm04_current_zone > 6 and L4_30 < 65 then
      waitSeconds(0.25)
    else
      waitSeconds(3)
    end
    Fn_pcSensorOn("pccubesensor2_hurt_" .. string.format("%02d", L4_30))
  end
end
function invokeProcessDamageTask()
  local L0_31
  L0_31 = {}
  L0_31.se_handle = nil
  L0_31.main_task = invokeTask(function()
    local L0_32
    L0_32 = L0_31
    while true do
      if dm04_white_zone == true and dm04_white_danger == true then
        if false == false and L0_32.se_handle == nil then
          L0_32.se_handle = Sound:playSEHandle("dm04_damage_zone", 1)
        end
        dm04_is_floor_damaged = true
        playDamageEffect("ef_ev_white_smk")
        damage_floor()
      elseif dm04_black_zone == true and dm04_black_danger == true then
        if false == false and L0_32.se_handle == nil then
          L0_32.se_handle = Sound:playSEHandle("dm04_damage_zone", 1)
        end
        dm04_is_floor_damaged = true
        playDamageEffect("ef_ev_black_smk")
        damage_floor()
      elseif dm04_hurt_zone == true then
        if false == false and L0_32.se_handle == nil then
          L0_32.se_handle = Sound:playSEHandle("dm04_damage_zone", 1)
        end
        dm04_is_floor_damaged = false
        endDamageEffect()
        damage_floor()
      else
        dm04_is_floor_damaged = false
        endDamageEffect()
        if dm04_caption_task ~= nil then
          dm04_caption_task:abort()
          dm04_caption_task = nil
        end
        if L0_32.se_handle ~= nil then
          Sound:stopSEHandle(L0_32.se_handle)
          L0_32.se_handle = nil
        end
      end
      wait()
    end
  end)
  function L0_31.isRunning(A0_33)
    return A0_33.main_task ~= nil and A0_33.main_task:isRunning()
  end
  function L0_31.abort(A0_34)
    if A0_34.se_handle ~= nil then
      Sound:stopSEHandle(A0_34.se_handle)
      A0_34.se_handle = nil
    end
    if A0_34.main_task ~= nil then
      A0_34.main_task:abort()
      A0_34.main_task = nil
    end
  end
end
function white_OnEnter()
  local L0_35, L1_36
  dm04_white_zone = true
end
function white_OnLeave()
  local L0_37, L1_38
  dm04_white_zone = false
end
function black_OnEnter()
  local L0_39, L1_40
  dm04_black_zone = true
end
function black_OnLeave()
  local L0_41, L1_42
  dm04_black_zone = false
end
function pccubesensor2_hurt_OnEnter()
  local L0_43, L1_44
  dm04_hurt_zone = true
end
function pccubesensor2_hurt_OnLeave()
  local L0_45, L1_46
  dm04_hurt_zone = false
end
function pccubesensor2_exit_OnEnter()
  invokeTask(function()
    dm04_exit = true
    Fn_captionViewWait("dm04_05010")
    Fn_pcSensorOff("pccubesensor2_exit")
  end)
end
function close_gate(A0_47)
  _gate_close_effect_hdl[A0_47] = Fn_createEffect("ef__gate__c__" .. string.format("%02d", A0_47), "ef_ev_gate_in", dm04_gate_hdl[A0_47], false)
  waitSeconds(1)
  dm04_gate_hdl[A0_47]:setActive(false)
  if _gate_effect_hdl[A0_47] ~= nil then
    Fn_finishedTremEffect(_gate_effect_hdl[A0_47], 1)
  end
  Fn_finishedTremEffect(_gate_close_effect_hdl[A0_47], 0.5)
end
function pccubesensor2_gate_01_OnEnter(A0_48)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.BLACK)
    playFloorEffectWhite()
    close_gate(1)
    A0_48:setActive(false)
    dm04_black_danger = false
    dm04_white_danger = true
  end)
end
function pccubesensor2_gate_02_OnEnter(A0_49)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.WHITE)
    playFloorEffectBlack()
    close_gate(2)
    A0_49:setActive(false)
    dm04_black_danger = true
    dm04_white_danger = false
  end)
end
function pccubesensor2_gate_03_OnEnter(A0_50)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.BLACK)
    playFloorEffectWhite()
    close_gate(3)
    A0_50:setActive(false)
    dm04_black_danger = false
    dm04_white_danger = true
  end)
end
function pccubesensor2_gate_04_OnEnter(A0_51)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.WHITE)
    playFloorEffectBlack()
    close_gate(4)
    A0_51:setActive(false)
    dm04_black_danger = true
    dm04_white_danger = false
  end)
end
function pccubesensor2_gate_05_OnEnter(A0_52)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.BLACK)
    playFloorEffectWhite()
    close_gate(5)
    A0_52:setActive(false)
    dm04_black_danger = false
    dm04_white_danger = true
  end)
end
function pccubesensor2_gate_06_OnEnter(A0_53)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.WHITE)
    playFloorEffectBlack()
    close_gate(6)
    A0_53:setActive(false)
    dm04_black_danger = true
    dm04_white_danger = false
  end)
end
function pccubesensor2_gate_07_OnEnter(A0_54)
  invokeTask(function()
    endCaptionAndView(SAFE_FLOOR_CAPTION.BLACK)
    playFloorEffectWhite()
    close_gate(7)
    A0_54:setActive(false)
    dm04_black_danger = false
    dm04_white_danger = true
  end)
end
function pccubesensor2_gate_08_OnEnter(A0_55)
  invokeTask(function()
    if dm04_is_near_exit_caption == false then
      dm04_is_near_exit_caption = true
      endCaptionAndView("dm04_05011")
    end
    playFloorEffectBlack()
    close_gate(8)
    A0_55:setActive(false)
    dm04_black_danger = true
    dm04_white_danger = false
  end)
end
function pcspheresensor2_cp_01_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_01")
    Fn_pcSensorOff("pcspheresensor2_cp_01")
    dm04_current_zone = 1
  end)
end
function pcspheresensor2_cp_02_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_02")
    Fn_pcSensorOff("pcspheresensor2_cp_02")
    dm04_current_zone = 2
  end)
end
function pcspheresensor2_cp_03_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_03")
    Fn_pcSensorOff("pcspheresensor2_cp_03")
    dm04_current_zone = 3
  end)
end
function pcspheresensor2_cp_04_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_04")
    Fn_pcSensorOff("pcspheresensor2_cp_04")
    dm04_current_zone = 4
  end)
end
function pcspheresensor2_cp_05_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_05")
    Fn_pcSensorOff("pcspheresensor2_cp_05")
    dm04_current_zone = 5
  end)
end
function pcspheresensor2_cp_06_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_06")
    Fn_pcSensorOff("pcspheresensor2_cp_06")
    dm04_current_zone = 6
  end)
end
function pcspheresensor2_cp_07_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_cp_07")
    Fn_pcSensorOff("pcspheresensor2_cp_07")
    dm04_current_zone = 7
  end)
end
function outrange_OnLeave()
  invokeTask(function()
    if dm04_activate_task ~= nil and dm04_activate_task:isRunning() then
      dm04_activate_task:abort()
    end
    while dm04_activate_task and dm04_activate_task:isRunning() do
      wait()
    end
    deactivateDamage(1)
    Fn_catWarp()
    if dm04_current_zone > 6 then
      dm04_activate_task = activateDamage(66)
    elseif dm04_current_zone > 5 then
      dm04_activate_task = activateDamage(55)
    elseif dm04_current_zone > 4 then
      dm04_activate_task = activateDamage(42)
    elseif dm04_current_zone > 3 then
      dm04_activate_task = activateDamage(31)
    elseif dm04_current_zone > 2 then
      dm04_activate_task = activateDamage(25)
    elseif 1 < dm04_current_zone then
      dm04_activate_task = activateDamage(17)
    elseif dm04_current_zone > 0 then
      dm04_activate_task = activateDamage(9)
    else
      dm04_activate_task = activateDamage(1)
    end
    Fn_captionViewWait("dm04_05001")
  end)
end
