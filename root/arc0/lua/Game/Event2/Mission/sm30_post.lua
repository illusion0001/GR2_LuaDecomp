dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
CHECK_DISTANCE_TO_PLAYER = 30
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  if IsNpcExist() then
    repeat
      wait()
    until not invokeTask(ClientControl):isRunning() and not invokeTask(StaffControl):isRunning()
  end
  kill()
end
function Finalize()
  local L0_2, L1_3
end
function IsNpcExist()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9
  L0_4 = {
    L1_5,
    L2_6,
    L3_7
  }
  for L4_8, L5_9 in L1_5(L2_6) do
    if Fn_findNpcPuppet(L5_9) == nil then
      return false
    end
  end
  return L1_5
end
function StaffControl()
  local L0_10, L1_11
  L0_10 = {
    L1_11,
    {
      name = "sm30_assistant_01",
      motion_tbl = {
        "talk_angry_00"
      }
    }
  }
  L1_11 = {}
  L1_11.name = "sm30_director_01"
  L1_11.motion_tbl = {
    "talk_sad_02",
    "stay_01"
  }
  L1_11 = {}
  for _FORV_5_, _FORV_6_ in pairs(L0_10) do
    L1_11[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  repeat
    wait()
  until not invokeTask(function()
    Fn_turnNpc("sm30_assistant_01", L1_11.sm30_director_01)
  end):isRunning() and not invokeTask(function()
    Fn_turnNpc("sm30_director_01", L1_11.sm30_assistant_01)
  end):isRunning()
  for _FORV_7_, _FORV_8_ in pairs(L0_10) do
    Fn_playMotionNpc(_FORV_8_.name, _FORV_8_.motion_tbl, false, {isRandom = true, isRepeat = true})
  end
  while true do
    if Fn_isValidNpc("sm30_director_01") == false then
      Fn_disappearNpc("sm30_director_01")
      Fn_disappearNpc("sm30_assistant_01")
      break
    end
    waitSeconds(1)
  end
end
function ClientControl()
  repeat
    wait()
  until not RAC_invokeMoveCharaTask("sm30_client", "locator2_client_move_", {runLength = -1, navimesh = false}):isRunning()
  Fn_playMotionNpc("sm30_client", "breath_00", false, {animBlendDuration = 0.5})
  while true do
    if Fn_isValidNpc("sm30_client") == false then
      Fn_disappearNpc("sm30_client")
      break
    end
    waitSeconds(1)
  end
end
function IsDisAppear(A0_12)
  return not Fn_isInSightTarget(A0_12, 1) and Fn_getDistanceToPlayer(A0_12) > CHECK_DISTANCE_TO_PLAYER
end
