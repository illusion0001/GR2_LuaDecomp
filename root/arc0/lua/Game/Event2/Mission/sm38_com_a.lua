dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm38_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_mob_escape_and_voice_task = nil
_PANIC_RUN_MOTION_TBL = {
  m_run = "man01_run_afraid_00",
  w_run = "wom01_run_afraid_00",
  c_run = "chi01_run_afraid_00"
}
ESCAPE_INDEX_MAX = 6
ESCAPE_NODE_PERFIX = "locator2_sm_38_d_p_route_"
function Initialize()
  RAC_side_setupShopNpc()
  Mob:restrict_sm38_00(true)
  Player:setForcedNormalGrab(true)
end
function Ingame()
  while true do
    wait()
  end
end
function Finalize()
  Mob:restrict_sm38_00(false)
  Player:dropGrabObject()
  EndMobTask()
  RAC_side_endShopNpcTask()
  Player:setForcedNormalGrab(false)
end
function find_ComA_Object(A0_0)
  return findGameObject2("Node", A0_0)
end
function StartMobTask()
  local L0_1, L1_2
  L0_1 = {}
  L1_2 = Mob
  L1_2 = L1_2.letStateMode
  L1_2(L1_2, Mob.StateMode.kGrabbed, true)
  L1_2 = {}
  Fn_createChangeMobToNpc(L1_2, {grab = true})
  if _mob_escape_and_voice_task == nil then
    _mob_escape_and_voice_task = invokeTask(function()
      local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12
      while true do
        L0_3 = {}
        for L4_7, L5_8 in L1_4(L2_5) do
          if L7_10 == nil then
            L0_1[L7_10] = true
            L9_12 = L5_8.name
            L7_10(L8_11, L9_12)
          end
          if L7_10 == true then
            if L7_10 ~= nil then
              L9_12 = L7_10
              if L8_11 then
                L9_12 = "val.name........."
                L9_12 = L9_12 .. L5_8.name
                L8_11(L9_12)
                L9_12 = L5_8.name
                L9_12 = L8_11.setStagger
                L9_12(L8_11, true)
                L9_12 = Fn_setGrabNpc
                L9_12(L5_8.name, true, true)
                L9_12 = move_npc
                L9_12(L5_8.name, L6_9, L0_3, L0_1)
              end
            end
          end
        end
        for L4_7, L5_8 in L1_4(L2_5) do
          for L9_12, _FORV_10_ in L6_9(L7_10) do
            if L1_2[L9_12].name == L5_8 then
              table.remove(L1_2, L9_12)
              break
            end
          end
        end
        L1_4()
      end
    end)
  end
end
function EndMobTask()
  Mob:letStateMode(Mob.StateMode.kGrabbed, false)
  if _mob_escape_and_voice_task ~= nil then
    _mob_escape_and_voice_task:abort()
    _mob_escape_and_voice_task = nil
  end
end
function move_npc(A0_13, A1_14, A2_15, A3_16)
  local L4_17, L5_18, L6_19
  L4_17 = _PANIC_RUN_MOTION_TBL
  L4_17 = L4_17.m_run
  L5_18 = string
  L5_18 = L5_18.match
  L6_19 = A0_13
  L5_18 = L5_18(L6_19, "w")
  if L5_18 ~= nil then
    L5_18 = _PANIC_RUN_MOTION_TBL
    L4_17 = L5_18.w_run
  else
    L5_18 = string
    L5_18 = L5_18.match
    L6_19 = A0_13
    L5_18 = L5_18(L6_19, "c")
    if L5_18 == nil then
      L5_18 = string
      L5_18 = L5_18.match
      L6_19 = A0_13
      L5_18 = L5_18(L6_19, "k")
    elseif L5_18 ~= nil then
      L5_18 = _PANIC_RUN_MOTION_TBL
      L4_17 = L5_18.c_run
    end
  end
  L5_18 = Fn_loadNpcEventMotion
  L6_19 = A0_13
  L5_18(L6_19, _PANIC_RUN_MOTION_TBL)
  L5_18 = Fn_moveNpc
  L6_19 = A0_13
  L5_18 = L5_18(L6_19, ESCAPE_NODE_PERFIX .. string.format("%02d", RandI(ESCAPE_INDEX_MAX)), {
    anim_run = L4_17,
    arrivedLength = 0.5,
    runLength = -1
  })
  if L5_18 ~= nil then
    while true do
      L6_19 = Fn_findNpc
      L6_19 = L6_19(A0_13)
      L6_19 = L6_19.isMoveEnd
      L6_19 = L6_19(L6_19)
      if L6_19 then
        L6_19 = wait
        L6_19()
        L6_19 = Fn_findNpcPuppet
        L6_19 = L6_19(A0_13)
      end
      if Fn_isInSightTarget(L6_19) ~= false or not (Fn_getDistanceToPlayer(L6_19) > 20) then
      end
    end
    L6_19 = L5_18.abort
    L6_19(L5_18)
    L5_18 = nil
  end
  L6_19 = print
  L6_19("startChangeMob.." .. A0_13 .. "(" .. A1_14 .. ")")
  L6_19 = table
  L6_19 = L6_19.insert
  L6_19(A2_15, A0_13)
  L6_19 = Fn_changeNpcToMob
  L6_19(A0_13)
  A3_16[A0_13] = nil
end
function mobPanicStart()
  Mob:makeSituationPanic(true)
end
function mobPanicEnd()
  Mob:makeSituationPanic(false)
end
function setTutorialCaption()
  if Fn_isCaptionView() == false then
    Fn_tutorialCaption("grab")
  end
end
function killTutorialCaption()
  if Fn_isCaptionView() == true then
    Fn_tutorialCaptionKill()
  end
end
