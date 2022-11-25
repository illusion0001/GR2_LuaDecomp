dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
tailing_lost_dist = 60
caution_max = 100
MAN_MOTION = {
  damaged = "man01_damage_middle_b_00"
}
puppet_tbl = {}
start_mission_part = ""
disp_alertness = nil
dist_monitor_task = nil
indicative_task = nil
force_vigilance_rise = false
tailing_restart_type = 0
alertness_add_wait = false
indicative_add_wait = false
lost_check_enable = true
eye_alertness_up = false
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm24_man01",
      type = "man81",
      node = "locator2_man01",
      active = false
    },
    {
      name = "sm24_tourist01",
      type = "man70",
      node = "locator2_tourist_01",
      active = false
    },
    {
      name = "sm24_tourist02",
      type = "wom38",
      node = "locator2_tourist_02",
      active = false
    },
    {
      name = "sm24_talk_npc05",
      type = "wom03",
      node = "locator2_talk_npc_05",
      active = false,
      color_variation = 3,
      hair_variation = 0
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_out_01")
  Fn_pcSensorOff("pccubesensor2_out_02")
  Fn_loadNpcEventMotion("sm24_man01", MAN_MOTION)
  start_mission_part = Fn_getMissionPart()
  Mob:restrict_sm24_00(true)
end
function Ingame()
  while true do
    wait()
  end
end
function Finalize()
  if Fn_getPlayer() then
    RAC_endCatWarpControl("sm24_area_out_all")
  end
  Mob:restrict_sm24_00(false)
end
DispAlertnessCrass = {}
function DispAlertnessCrass.new()
  local L0_1
  L0_1 = {}
  L0_1.req_visible = {}
  L0_1.visible = true
  L0_1.gauge_rate = 0
  L0_1.task = invokeTask(function()
    local L1_2
    L1_2 = L0_1
    RAC_gaugeInit("sm24_09001", HUD.kCountType_Up, 0.5)
    L1_2.visible = true
  end)
  function L0_1.setAlertnessRate(A0_3, A1_4)
    A0_3.gauge_rate = A1_4
    HUD:miniGaugeSetNum(A0_3.gauge_rate / caution_max, false)
  end
  function L0_1.destroy(A0_5)
    if A0_5.task ~= nil then
      A0_5.task:abort()
      A0_5.task = nil
    end
    HUD:miniGaugeSetVisible(false)
  end
  return L0_1
end
function invokeDistMonitorTask()
  return invokeTask(function()
    local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L9_15, L10_16, L11_17, L12_18, L13_19
    L0_6 = 2
    L1_7 = 20
    L2_8 = 20
    L3_9 = 30
    L4_10 = 0
    L5_11 = 0
    L6_12 = false
    L7_13 = Fn_findNpc
    L8_14 = "sm24_man01"
    L7_13 = L7_13(L8_14)
    while true do
      L9_15 = L7_13
      L8_14 = L7_13.isStarted
      L8_14 = L8_14(L9_15)
      if not L8_14 then
        L8_14 = wait
        L8_14()
      end
    end
    L9_15 = L7_13
    L8_14 = L7_13.changeDamageType
    L10_16 = 2
    L8_14(L9_15, L10_16)
    L9_15 = L7_13
    L8_14 = L7_13.setEventListener
    L10_16 = "npcDamaged"
    function L11_17(A0_20)
      print("  attacker:" .. A0_20.attacker)
      print("  damageType:" .. A0_20.damageType)
      if A0_20.attacker == "player" then
        L6_12 = true
        Fn_userCtrlOff()
      end
    end
    L8_14(L9_15, L10_16, L11_17)
    while true do
      L8_14 = Fn_getDistanceToPlayer
      L9_15 = puppet_tbl
      L9_15 = L9_15.sm24_man01
      L8_14 = L8_14(L9_15)
      L9_15 = 0
      eye_alertness_up = false
      if L6_12 == true then
        L9_15 = caution_max
      else
        L10_16 = false
        L11_17, L12_18, L13_19 = nil, nil, nil
        if alertness_add_wait == false then
          L11_17, L12_18 = puppet_tbl.sm24_man01:getWorldTransform()
          L11_17.y = L11_17.y + 1.5
          Query:setEyeSightTransform(L11_17, L12_18)
          Query:setEyeSightAngle(Deg2Rad(L3_9))
          Query:setEyeSightRange(math.min(L8_14, math.max(L1_7, L2_8)) + 1)
          L13_19 = Fn_getPlayerWorldPos()
          L13_19.y = L13_19.y + 1.5
          if Query:checkEyeSightSphere(L13_19, 1) == true and Query:raycastEyeSight(L13_19) == nil then
            L10_16 = true
            eye_alertness_up = true
          end
        end
        if L1_7 > L8_14 and L10_16 == true then
          L4_10 = math.min(L4_10 + (caution_max - caution_max * L8_14 / L1_7) * 0.02, caution_max)
          if L0_6 > L8_14 then
            L4_10 = math.min(L4_10 + caution_max, caution_max)
          end
        elseif force_vigilance_rise == false then
          L4_10 = math.max(L4_10 - 1, 0)
        end
        if force_vigilance_rise == true then
          L5_11 = math.min(L5_11 + 0.2, caution_max)
        else
          L5_11 = math.max(L5_11 - 1, 0)
        end
        L9_15 = math.min(L4_10 + L5_11, caution_max)
      end
      L10_16 = disp_alertness
      if L10_16 ~= nil then
        L10_16 = disp_alertness
        L11_17 = L10_16
        L10_16 = L10_16.setAlertnessRate
        L12_18 = L9_15
        L10_16(L11_17, L12_18)
      end
      L10_16 = caution_max
      if L9_15 >= L10_16 then
        L10_16 = force_vigilance_rise
        if L10_16 == true and L6_12 == false then
          tailing_restart_type = 3
        elseif L6_12 == true then
          tailing_restart_type = 4
        else
          tailing_restart_type = 1
        end
        while true do
          L10_16 = tailing_restart_type
          if L10_16 ~= 0 then
            L10_16 = wait
            L10_16()
          end
        end
        L6_12 = false
        L4_10 = 0
        L5_11 = 0
      else
        L10_16 = lost_check_enable
        if L10_16 == true then
          L10_16 = tailing_lost_dist
          if L8_14 > L10_16 then
            L10_16 = true
            L11_17 = Fn_isInSightTarget
            L12_18 = puppet_tbl
            L12_18 = L12_18.sm24_man01
            L13_19 = 1
            L11_17 = L11_17(L12_18, L13_19)
            if L11_17 == true then
              L11_17 = Fn_getPlayerWorldTransform
              L12_18 = L11_17()
              L13_19 = L11_17.y
              L13_19 = L13_19 + 1.5
              L11_17.y = L13_19
              L13_19 = Query
              L13_19 = L13_19.setEyeSightTransform
              L13_19(L13_19, L11_17, L12_18)
              L13_19 = Query
              L13_19 = L13_19.setEyeSightAngle
              L13_19(L13_19, Deg2Rad(45))
              L13_19 = Query
              L13_19 = L13_19.setEyeSightRange
              L13_19(L13_19, L8_14 + 1)
              L13_19 = puppet_tbl
              L13_19 = L13_19.sm24_man01
              L13_19 = L13_19.getWorldPos
              L13_19 = L13_19(L13_19)
              L13_19.y = L13_19.y + 0.5
              L10_16 = Query:raycastEyeSight(L13_19) ~= nil
            else
              L10_16 = true
            end
            if L10_16 then
              tailing_restart_type = 2
              while true do
                L11_17 = tailing_restart_type
                if L11_17 ~= 0 then
                  L11_17 = wait
                  L11_17()
                end
              end
              L4_10 = 0
              L5_11 = 0
              L6_12 = false
            end
          end
        end
      end
      L10_16 = wait
      L10_16()
    end
  end)
end
function invokeIndicativeTask()
  return invokeTask(function()
    local L0_21, L1_22, L2_23, L3_24, L4_25, L5_26, L6_27, L7_28
    L0_21 = 7
    L1_22 = Fn_findNpc
    L2_23 = "sm24_man01"
    L1_22 = L1_22(L2_23)
    while true do
      L3_24 = L1_22
      L2_23 = L1_22.isStarted
      L2_23 = L2_23(L3_24)
      if not L2_23 then
        L2_23 = wait
        L2_23()
      end
    end
    L2_23 = 0
    while true do
      L3_24 = Fn_getDistanceToPlayer
      L4_25 = puppet_tbl
      L4_25 = L4_25.sm24_man01
      L3_24 = L3_24(L4_25)
      L4_25 = false
      L5_26, L6_27, L7_28 = nil, nil, nil
      if indicative_add_wait == false then
        L5_26, L6_27 = puppet_tbl.sm24_man01:getWorldTransform()
        L5_26.y = L5_26.y + 1.5
        Query:setEyeSightTransform(L5_26, L6_27)
        Query:setEyeSightRange(math.min(L3_24, math.max(L0_21, L0_21)) + 1)
        L7_28 = Fn_getPlayerWorldPos()
        L7_28.y = L7_28.y + 1.5
        L4_25 = Query:raycastEyeSight(L7_28) == nil
      end
      if L0_21 >= L3_24 and L4_25 then
        L2_23 = math.min(L2_23 + (100 - 100 * L3_24 / L0_21) * 0.01, caution_max)
      else
        L2_23 = math.max(L2_23 - 1, 0)
      end
      if L2_23 >= 100 and L1_22:isTurnEnd() then
        L1_22:pauseMove(true)
        L1_22:turn(Fn_getPlayerWorldPos())
        waitSeconds(2)
        L1_22:pauseMove(false)
      end
      L4_25 = wait
      L4_25()
    end
  end)
end
function invokeOutOfRange(A0_29)
  local L1_30
  L1_30 = "locator2_pc_return_a"
  if A0_29 == "C2" then
    L1_30 = "locator2_pc_return_c2"
  end
  RAC_startCatWarpControl("sm24_area_out_all", nil, "pccubesensor2_out_01", "pccubesensor2_out_02", L1_30, nil, nil, "sm24_09000")
end
function endOutOfRange()
  RAC_endCatWarpControl("sm24_area_out_all")
end
function isThisStartMissionPart()
  if start_mission_part == Fn_getMissionPart() then
    return true
  end
  return false
end
function sm24_findGameObject2(A0_31, A1_32)
  return findGameObject2(A0_31, A1_32)
end
function startDispAlertness()
  if disp_alertness == nil then
    disp_alertness = DispAlertnessCrass.new()
  end
  if dist_monitor_task == nil then
    dist_monitor_task = invokeDistMonitorTask()
  end
end
function endDispAlertness()
  if disp_alertness ~= nil then
    disp_alertness:destroy()
    disp_alertness = nil
  end
  if dist_monitor_task ~= nil then
    dist_monitor_task:abort()
    dist_monitor_task = nil
  end
  if indicative_task ~= nil then
    indicative_task:abort()
    indicative_task = nil
  end
end
function resetAlertnessRate()
  if disp_alertness ~= nil then
    disp_alertness:setAlertnessRate(0)
  end
end
function setAlertnessAddWait(A0_33)
  local L1_34
  alertness_add_wait = A0_33
end
function setForceAlertnessRide(A0_35)
  local L1_36
  force_vigilance_rise = A0_35
end
function getIsAlertnessUp()
  local L0_37, L1_38
  L0_37 = eye_alertness_up
  return L0_37
end
function setIndicativeAddWait(A0_39)
  local L1_40
  indicative_add_wait = A0_39
end
function setLostCheckEnable(A0_41)
  local L1_42
  lost_check_enable = A0_41
end
function getTailingRestartType()
  local L0_43, L1_44
  L0_43 = tailing_restart_type
  return L0_43
end
function resetTailingRestartType()
  local L0_45, L1_46
  tailing_restart_type = 0
end
