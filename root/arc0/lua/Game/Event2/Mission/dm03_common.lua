local L1_1
L0_0 = {}
L0_0.stalker = 5
L0_0.runner = 6
L0_0.guardcore = 7
L0_0.gellyfish = 8
L0_0.mosquito = 8
enemy_hint_time_tbl = L0_0
HINT_TIMER_MAX = 20
BREAKNPC__OUT_DIST = 2
BREAKNPC__IN_DIST = 5
RESPAWN_TIME = 120
_dm03_hint = false
_dm03_npc_near = false
_dm03_mob_disappear_cnt = 0
L0_0 = {}
_dm03_dist_task = L0_0
L0_0 = {}
L0_0.cya_stay = "cya01_idle_00"
L0_0.gade_stay = "gad01_idle_00"
NPC_MOTION = L0_0
function L0_0(A0_2, A1_3)
  return invokeTask(function()
    local L0_4, L1_5
    L0_4 = A1_3
    if L0_4 == nil then
      L0_4 = true
      A1_3 = L0_4
    end
    L0_4 = 1
    while true do
      while true do
        L1_5 = findGameObject2
        L1_5 = L1_5("NpcGenerator", A0_2 .. string.format("%02d", L0_4))
        if A1_3 == false then
          L1_5 = findGameObject2("NpcGenerator", A0_2)
        end
        if L1_5 ~= nil then
          while L1_5:isReady() == false do
            wait()
          end
          _dm03_dist_task[L1_5:getName()] = invokeTask(function()
            local L0_6
            while true do
              L0_6 = Fn_getDistanceToPlayer
              L0_6 = L0_6(L1_5:getWorldPos())
              if L1_5:getActive() == true then
                if L0_6 <= BREAKNPC__OUT_DIST then
                  waitSeconds(0.1)
                  Fn_setNpcActive(L1_5, false)
                  _dm03_mob_disappear_cnt = _dm03_mob_disappear_cnt + 1
                end
              elseif L0_6 >= BREAKNPC__IN_DIST then
                waitSeconds(0.1)
                Fn_setNpcActive(L1_5, true)
              end
              wait()
            end
          end)
          if A1_3 ~= false then
            L0_4 = L0_4 + 1
          end
        else
          break
        end
        wait()
      end
    end
  end)
end
_breakNpc = L0_0
function L0_0()
  return invokeTask(function()
    local L0_7
    L0_7 = 1
    while true do
      if _dm03_mob_disappear_cnt >= MOB_DISAPPEAR_CAPTION[L0_7].cnt then
        Fn_captionViewWait(MOB_DISAPPEAR_CAPTION[L0_7].cap)
        L0_7 = L0_7 + 1
      end
      if not (L0_7 > #MOB_DISAPPEAR_CAPTION) then
        wait()
      end
    end
  end)
end
_mob_disappear_caption_task = L0_0
function L0_0(A0_8, A1_9)
  if A1_9 == nil then
    A1_9 = 50
  end
  return invokeTask(function()
    while true do
      wait()
      if Fn_getDistanceToPlayer(A0_8:getWorldPos()) <= A1_9 and RAC_RaycastEyeSight(A0_8:getWorldPos(), Fn_getDistanceToPlayer(A0_8:getWorldPos()) + 1, 90, 1, 1) == true then
        _dm03_npc_near = true
        break
      end
    end
  end)
end
_npc_found_task = L0_0
function L0_0(A0_10)
  return invokeTask(function()
    local L0_11
    L0_11 = 0
    while true do
      L0_11 = L0_11 + 1
      if _dm03_hint == false then
        if L0_11 >= HINT_TIMER_MAX * 30 then
          Fn_captionView(A0_10)
          L0_11 = 0
        end
      else
        L0_11 = 0
      end
      wait()
    end
  end)
end
_hint_task = L0_0
