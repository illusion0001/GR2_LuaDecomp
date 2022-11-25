dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep26_common.lua")
import("GlobalGem")
_boss_health = 0
part_change = false
_core_break = {}
core_halfnum = 1
core_resetnum = 3
_core_sel = false
sel_chk = true
_core_cnt = 0
_breakcore_No = nil
_respown_time = 1000
plus_time = 150
_core_time = {}
_core_rest = {}
_core_break = {}
_sp_warp = false
boss_release = false
change_B = false
change_D = false
sp_2nd = false
warp_now = false
far_flag = false
attack_wait = false
attack_name = ""
_a_phase_1 = false
_a_phase_2 = false
_a_phase_3 = false
_a_phase_4 = false
_a_phase_5 = false
_old_core_cnt = 0
enmgen2_battle_boss_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "demon",
      locator = "locator_boss_01",
      name = "demon01"
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
  end
}
function Initialize()
  Fn_loadEventData("evx/dt_brk_eff", "evarea2_dt_c_root", true)
  Fn_loadEventData("evx/ep26_boss", "evarea2_dt_c_root", true)
  enmgen = findGameObject2("EnemyGenerator", "enmgen2_a_boss")
  if enmgen ~= nil then
    enmgen:requestSpawn()
  end
  enmgen:setEnemyMarker(false)
  Fn_pcSensorOff("pccubesensor2_outrange_02")
end
function Ingame()
  local L0_8, L1_9, L2_10, L3_11
  L0_8(L1_9, L2_10, L3_11, IdentQuat(), Vector(1, 1, 1))
  for L3_11 = 1, 24 do
    Fn_createEffect("exp", "ef_ev_smk_04", findGameObject2("Node", "locator2_smk_" .. string.format("%02d", L3_11)):getWorldPos(), false)
  end
  for L3_11 = 1, 20 do
    Fn_createEffect("exp", "ef_ev_fir_04", findGameObject2("Node", "locator2_fir_" .. string.format("%02d", L3_11)):getWorldPos(), false)
  end
  while true do
    if L0_8 == nil then
      L0_8()
    end
  end
  _demon_puppet = L0_8
  while true do
    if L0_8 == nil then
      L0_8()
    end
  end
  L1_9(L2_10, L3_11)
  repeat
    if L1_9 == "ep26_a" then
      L2_10(L3_11)
      fn_demonEvent = L2_10
    elseif L1_9 == "ep26_b" then
      L2_10(L3_11)
      for _FORV_5_ = 1, 12 do
        _core_time[_FORV_5_] = _respown_time
        _core_rest[_FORV_5_] = true
        _core_break[_FORV_5_] = false
      end
      fn_demonEvent = L2_10
    elseif L1_9 == "ep26_c" then
      L2_10(L3_11)
      phase = 0
      fn_demonEvent = L2_10
    elseif L1_9 == "ep26_d" then
      L2_10(L3_11)
      fn_demonEvent = L2_10
    elseif L1_9 == "ep26_e" then
      _sp_attack = false
      _sp_warp = false
      boss_release = false
      phase = 0
      time_cnt = 0
      L2_10(L3_11)
      fn_demonEvent = L2_10
    elseif L1_9 == "ep26_f" then
      L2_10(L3_11)
      fn_demonEvent = L2_10
    elseif L1_9 == "ep26_h" then
      L2_10(L3_11)
      pos_01 = L2_10
      pos_02 = L2_10
      phase = 0
      fn_demonEvent = L2_10
    end
    while true do
      if L0_8 then
      end
      if L2_10 ~= false then
        if L0_8 then
          if L2_10 ~= false then
            if not L0_8 then
              if L2_10 ~= nil then
              end
              if L0_8 then
              end
              if L3_11 ~= false then
                L3_11()
              end
            end
          end
        end
      end
    end
    L2_10(L3_11, "enemy_demon_event", fn_demonEvent)
    repeat
      L2_10()
    until L2_10 == true
    part_change = false
  until L2_10
end
function Finalize()
  Camera:removeScreenEffect(0)
end
function pccubesensor2_outrange_01_OnLeave()
  warp_now = true
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_reset_01")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\145")
    Fn_catWarp()
    warp_now = false
  end)
end
function pccubesensor2_outrange_02_OnLeave()
  local L0_12, L1_13
  far_flag = true
end
function boss_health_handing(A0_14)
  local L1_15
  _boss_health = A0_14
end
function boss_hearth_return()
  local L0_16, L1_17
  L0_16 = _boss_health
  return L0_16
end
function boss_name()
  _boss_puppet = findGameObject2("Puppet", "demon01")
  return _boss_puppet
end
function requestIdling()
  enmgen:requestIdlingEnemy(true)
end
function requestunIdling()
  enmgen:requestIdlingEnemy(false)
end
function demon_spown()
  enmgen:requestSpawn()
end
function demon_del()
  enmgen:requestAllEnemyKill()
end
function partchange()
  local L0_18, L1_19
  part_change = true
end
function coresel()
  local L0_20, L1_21
  L0_20 = _core_sel
  return L0_20
end
function selchk()
  local L0_22, L1_23
  sel_chk = true
end
function corereset()
  local L0_24, L1_25
  L0_24 = _core_reset
  return L0_24
end
function corerest(A0_26)
  return _core_rest[A0_26]
end
function corebreak(A0_27)
  return _core_break[A0_27]
end
function coretime(A0_28)
  return _core_time[A0_28]
end
function breakcore(A0_29)
  local L1_30
  _breakcore_No = A0_29
end
function corecnt(A0_31)
  local L1_32
  L1_32 = _core_cnt
  return L1_32
end
function spattack()
  local L0_33, L1_34
  _sp_attack = true
end
function outrangeOff()
  Fn_pcSensorOff("pccubesensor2_outrange_01")
  Fn_pcSensorOn("pccubesensor2_outrange_02")
end
function outrangeOn()
  Fn_pcSensorOn("pccubesensor2_outrange_01")
  Fn_pcSensorOff("pccubesensor2_outrange_02")
end
function spwarp()
  local L0_35, L1_36
  L0_35 = _sp_warp
  return L0_35
end
function sprelease()
  local L0_37, L1_38
  L0_37 = boss_release
  return L0_37
end
function pcpos()
  return pc_pos.x, pc_pos.y, pc_pos.z
end
function ChangeBret()
  local L0_39, L1_40
  L0_39 = change_B
  return L0_39
end
function ChangeD()
  local L0_41, L1_42
  change_D = true
end
function sp2nd()
  local L0_43, L1_44
  sp_2nd = true
end
function warpNow()
  local L0_45, L1_46
  L0_45 = warp_now
  return L0_45
end
function farChack()
  local L0_47, L1_48
  L0_47 = far_flag
  return L0_47
end
function attackname(A0_49)
  local L1_50
  attack_name = A0_49
end
function attackwait()
  local L0_51, L1_52
  L0_51 = attack_wait
  return L0_51
end
function a_phase(A0_53)
  local L1_54
  L1_54 = nil
  if A0_53 == 1 then
    L1_54 = _a_phase_1
  elseif A0_53 == 2 then
    L1_54 = _a_phase_2
  elseif A0_53 == 3 then
    L1_54 = _a_phase_3
  elseif A0_53 == 4 then
    L1_54 = _a_phase_4
  elseif A0_53 == 5 then
    L1_54 = _a_phase_5
  end
  return L1_54
end
