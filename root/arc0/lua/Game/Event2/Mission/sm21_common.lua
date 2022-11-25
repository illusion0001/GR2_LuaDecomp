local L1_1
_onleave_com = false
_timer_task = nil
_run_timer_flag = false
_time_count = 0
function L0_0(A0_2, A1_3, A2_4)
  if A0_2:isGrabbed() == false then
    Fn_naviSet(A0_2)
    waitSeconds(1)
    Fn_tutorialCaption("grab")
    A1_3:setActive(true)
  end
  while A0_2:isGrabbed() == false do
    wait()
  end
  if A2_4 ~= nil then
    Fn_lookAtObjectWait(A2_4, 0, 0.02)
  end
  Fn_naviKill()
  A1_3:setActive(false)
  Fn_captionViewEnd()
  Fn_tutorialCaptionKill()
end
grabWait = L0_0
function L0_0(A0_5, A1_6, A2_7)
  Fn_appendNpcArea(A0_5, A1_6)
  Fn_setGrabReleaseNpc(A0_5)
  if A2_7 == true then
    Fn_warpNpc(A0_5, A1_6)
  end
  wait()
end
grabReset = L0_0
function L0_0(A0_8, A1_9, A2_10, A3_11, A4_12)
  local L5_13, L6_14, L7_15
  L5_13 = Fn_findNpc
  L6_14 = A0_8
  L5_13 = L5_13(L6_14)
  L6_14 = {}
  L6_14.isRepeat = true
  L7_15 = 0
  task = invokeTask(function()
    repeat
      L7_15 = RandF(A3_11, A4_12)
      L5_13:playMotion(A1_9, L6_14)
      waitSeconds(L7_15)
      L5_13:playMotion(A2_10)
      repeat
        wait()
      until L5_13:isMotionEnd()
      L5_13:playMotion(A1_9, L6_14)
    until false
  end)
  return task
end
insertMotion = L0_0
function L0_0(A0_16, A1_17)
  return (invokeTask(function()
    local L0_18
    while true do
      L0_18 = _onleave_com
      if L0_18 then
        L0_18 = Fn_findNpc
        L0_18 = L0_18("sm21_client")
        Fn_setGrabReleaseNpc(L0_18)
        Fn_catWarpIn()
        Fn_catWarpCheckPoint()
        if A0_16 ~= nil then
          A0_16()
        end
        Fn_catWarpOut()
        if L0_18:isGrabbed() == true then
          Fn_setGrabNpc(L0_18, false, false)
          while Player:setGrabObject(Fn_findNpcPuppet(L0_18)) == false do
            wait()
          end
        end
        if A1_17 ~= nil then
          A1_17()
        end
        _onleave_com = false
      end
      L0_18 = wait
      L0_18()
    end
  end))
end
anoterCatWarp = L0_0
function L0_0()
  local L0_19, L1_20
  _onleave_com = true
end
runCatWarp = L0_0
function L0_0(A0_21, A1_22)
  if _timer_task == nil then
    _timer_task = invokeTask(function()
      local L0_23
      L0_23 = 1
      while true do
        if _run_timer_flag == false then
          if A0_21 ~= nil and A0_21 > 0 then
            L0_23 = A0_21
          end
          waitSeconds(L0_23)
          _time_count = _time_count + L0_23
          if _time_count > 65535 then
            _time_count = 65535
          end
          if A1_22 ~= nil then
            A1_22(_time_count)
          end
        end
        wait()
      end
    end)
  end
end
runTimerTask = L0_0
function L0_0()
  local L0_24, L1_25
  L0_24 = _timer_task
  if L0_24 ~= nil then
    L0_24 = _run_timer_flag
    if L0_24 == false then
      _run_timer_flag = true
      _time_count = 0
    end
  end
end
stopTimerTask = L0_0
function L0_0()
  local L0_26, L1_27
  L0_26 = _timer_task
  if L0_26 ~= nil then
    L0_26 = _run_timer_flag
    if L0_26 == false then
      _run_timer_flag = true
    end
  end
end
pauseTimerTask = L0_0
function L0_0()
  local L0_28, L1_29
  L0_28 = _timer_task
  if L0_28 ~= nil then
    L0_28 = _run_timer_flag
    if L0_28 then
      _run_timer_flag = false
    end
  end
end
restartTimerTask = L0_0
function L0_0()
  _timer_task = Mv_safeTaskAbort(_timer_task)
end
abortTimerTask = L0_0
function L0_0()
  local L0_30, L1_31
  L0_30 = _time_count
  return L0_30
end
getTimerCount = L0_0
function L0_0(A0_32)
  local L1_33
  _time_count = A0_32
end
setTimerCount = L0_0
L0_0 = {}
Queue = L0_0
L0_0 = Queue
function L1_1()
  local L0_34
  L0_34 = {}
  L0_34.buff = {}
  return setmetatable(L0_34, {
    __index = Queue
  })
end
L0_0.new = L1_1
L0_0 = Queue
function L1_1(A0_35, A1_36)
  table.insert(A0_35.buff, A1_36)
end
L0_0.enqueue = L1_1
L0_0 = Queue
function L1_1(A0_37)
  return table.remove(A0_37.buff, 1)
end
L0_0.dequeue = L1_1
L0_0 = Queue
function L1_1(A0_38)
  local L1_39
  L1_39 = A0_38.buff
  L1_39 = #L1_39
  if L1_39 > 0 then
    L1_39 = A0_38.buff
    L1_39 = L1_39[1]
    return L1_39
  end
end
L0_0.top = L1_1
L0_0 = Queue
function L1_1(A0_40)
  local L1_41
  L1_41 = A0_40.buff
  L1_41 = #L1_41
  L1_41 = L1_41 == 0
  return L1_41
end
L0_0.isEmpty = L1_1
L0_0 = Queue
function L1_1(A0_42)
  return table.maxn(A0_42.buff)
end
L0_0.count = L1_1
L0_0 = Queue
function L1_1(A0_43)
  local L1_44, L2_45, L3_46, L4_47
  for L4_47 = 1, L2_45(L3_46) do
    table.remove(A0_43.buff, L4_47)
  end
end
L0_0.clear = L1_1
