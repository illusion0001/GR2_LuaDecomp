import("GameDatabase")
kTermAll = 0
kTermRequest = 1
kTermReserve = 2
_exit_sandbox = false
_is_ready = false
_npc_list = {}
_not_mob_list = {}
_term_request_list = {}
_term_reserve_list = {}
_wait_task = nil
_changeComplete = false
function _main_func()
  local L0_0, L1_1
end
function main()
  debugPrint("no initialize")
  invokeSystemTask(function()
    debugPrint("main task run!!")
    while not _exit_sandbox do
      _main_func()
      wait()
    end
  end)
  wait()
end
function exitsandbox()
  print("exit npc manager")
  terminateAllGameObjects()
  _exit_sandbox = true
end
setExitCallback(exitsandbox)
function _insertTable(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8, L7_9, L8_10
  L3_5 = A0_2[A1_3]
  if L3_5 == nil then
    L3_5 = {}
    A0_2[A1_3] = L3_5
  end
  L3_5 = type
  L3_5 = L3_5(L4_6)
  if L3_5 == "table" then
    for L7_9, L8_10 in L4_6(L5_7) do
      table.insert(A0_2[A1_3], L8_10)
    end
  elseif L3_5 == "string" then
    L4_6(L5_7, L6_8)
  end
end
function _emptyFunc()
  local L0_11, L1_12
end
function _termNpcFunc()
  local L0_13, L1_14, L2_15, L3_16, L4_17
  if L0_13 == L1_14 then
    L0_13()
    L0_13(L1_14)
    _npc_list = L0_13
    _not_mob_list = L0_13
    _term_request_list = L0_13
    _term_reserve_list = L0_13
  elseif L0_13 == L1_14 then
    if L0_13 ~= nil then
      for L3_16, L4_17 in L0_13(L1_14) do
        if findGameObject2("NpcGenerator", L4_17) then
          if findGameObject2("NpcGenerator", L4_17):isRunning() then
            debugPrint(findGameObject2("NpcGenerator", L4_17):getName() .. " terminate")
            findGameObject2("NpcGenerator", L4_17):try_term()
          else
            debugPrint(findGameObject2("NpcGenerator", L4_17):getName() .. " kill")
            findGameObject2("NpcGenerator", L4_17):kill()
          end
        end
      end
    end
    _term_request_list = L0_13
  elseif L0_13 == L1_14 then
    if L0_13 ~= nil then
      for L3_16, L4_17 in L0_13(L1_14) do
        if findGameObject2("NpcGenerator", L4_17) then
          if findGameObject2("NpcGenerator", L4_17):isRunning() then
            debugPrint(findGameObject2("NpcGenerator", L4_17):getName() .. " terminate")
            findGameObject2("NpcGenerator", L4_17):try_term()
          else
            debugPrint(findGameObject2("NpcGenerator", L4_17):getName() .. " kill")
            findGameObject2("NpcGenerator", L4_17):kill()
          end
        end
      end
    end
    _term_reserve_list = L0_13
  end
  _main_func = L0_13
end
function _changeMobFunc()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L10_28, L11_29, L12_30, L13_31
  function L0_18(A0_32, A1_33)
    local L2_34, L3_35
    L2_34 = false
    if L3_35 then
      for _FORV_6_, _FORV_7_ in L3_35(_not_mob_list[A1_33]) do
        if _FORV_7_ == A0_32.name then
          L2_34 = true
          break
        end
      end
    end
    if L2_34 == false then
      if L3_35 == "man" or L3_35 == "wom" or L3_35 == "chi" then
        if findGameObject2("NpcGenerator", A0_32.name) then
          findGameObject2("NpcGenerator", A0_32.name):changeMob()
          debugPrint(A0_32.name .. " \227\129\175 " .. L3_35 .. " \227\129\170\227\129\174\227\129\167mob\227\129\171\229\136\135\227\130\138\230\155\191\227\129\136\227\129\190\227\129\151\227\129\159")
        end
      elseif findGameObject2("NpcGenerator", A0_32.name) then
        if findGameObject2("NpcGenerator", A0_32.name):getActive() then
          if string.len(L3_35) == 3 then
            debugPrint(A0_32.name .. " \227\129\175 " .. L3_35 .. " \227\129\170\227\129\174\227\129\167mob\229\140\150\227\129\167\227\129\141\227\129\170\227\129\132\227\129\174\227\129\167\227\129\157\227\129\174\227\129\190\227\129\190\227\129\171\227\129\151\227\129\190\227\129\153")
          else
            debugPrint(A0_32.name .. " \227\129\175 " .. L3_35 .. " \227\129\167\227\128\129\227\130\173\227\131\163\227\131\169\227\129\167\227\129\175\231\132\161\227\129\132\227\129\168\227\129\151\227\129\166\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
            findGameObject2("NpcGenerator", A0_32.name):try_term()
          end
        else
          debugPrint(A0_32.name .. " \227\129\175 " .. L3_35 .. " \227\129\170\227\129\174\227\129\167mob\229\140\150\227\129\167\227\129\141\227\129\170\227\129\132\227\129\174\227\129\167\227\129\153\227\129\140active\227\129\140false\227\129\170\227\129\174\227\129\167\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
          findGameObject2("NpcGenerator", A0_32.name):try_term()
        end
      else
        debugPrint(A0_32.name .. " \227\129\175\227\128\129\227\129\153\227\129\167\227\129\171\227\131\159\227\131\131\227\130\183\227\131\167\227\131\179\229\129\180\227\129\167\229\137\138\233\153\164\227\129\149\227\130\140\227\129\166\227\129\132\227\129\190\227\129\153")
      end
    else
      L3_35(A0_32.name .. " \227\129\175\227\129\157\227\129\174\227\129\190\227\129\190\227\129\167\227\129\153")
    end
  end
  _changeComplete = false
  for L4_22, L5_23 in L1_19(L2_20) do
    if L4_22 ~= "eventheader" then
      for L9_27, L10_28 in L6_24(L7_25) do
        L11_29 = L0_18
        L12_30 = L10_28
        L13_31 = L4_22
        L11_29(L12_30, L13_31)
      end
    else
      for L11_29, L12_30 in L8_26(L9_27) do
        L13_31 = L12_30.mission
        if L13_31 == L7_25 then
          L13_31 = ggd
          L13_31 = L13_31["Savedata__EventFinishedFlags__" .. L7_25]
          if GameDatabase:get(L13_31) == 1 then
            L0_18(L12_30, L4_22)
          end
        else
          L13_31 = debugPrint
          L13_31("eventheader\227\129\167\231\148\159\230\136\144\227\129\151\227\129\159\227\128\129" .. L12_30.name .. "\227\129\175\227\129\157\227\129\174\227\129\190\227\129\190\227\129\171\227\129\151\227\129\190\227\129\153")
        end
      end
    end
  end
  _not_mob_list = L1_19
  _changeComplete = true
  _main_func = L1_19
end
function _isEndChageMob()
  local L0_36
  L0_36 = nil
  if _changeComplete == true then
    L0_36 = true
    _changeComplete = false
  else
    L0_36 = false
  end
  return L0_36
end
function isObjectReady()
  local L0_37, L1_38
  L0_37 = _is_ready
  return L0_37
end
function requestReady()
  _is_ready = false
  initializeAllGameObjects()
  debugPrint("init npc")
  if not _wait_task then
    _wait_task = invokeSystemTask(function()
      waitForReadyAllGameObjects()
      _is_ready = true
      debugPrint("npc is ready")
      _wait_task = nil
    end)
  end
end
function requestStart()
  startAllGameObjects()
  debugPrint("npc is start")
end
function requestTerm(A0_39)
  local L1_40
  _term_type = A0_39
  L1_40 = _termNpcFunc
  _main_func = L1_40
end
function requestMob()
  local L0_41, L1_42
  L0_41 = _changeMobFunc
  _main_func = L0_41
end
function requestTermNpc(A0_43)
  _insertTable(_term_request_list, "global", A0_43)
end
function reserveTermNpc(A0_44)
  _insertTable(_term_reserve_list, "global", A0_44)
end
function reserveNotMob(A0_45, A1_46)
  _insertTable(_not_mob_list, A0_45, A1_46)
end
function setNpcName(A0_47, A1_48, A2_49, A3_50)
  if _npc_list[A0_47] == nil then
    _npc_list[A0_47] = {}
  end
  table.insert(_npc_list[A0_47], {
    name = A1_48,
    type = A2_49,
    mission = A3_50
  })
end
function getNpcType(A0_51, A1_52)
  if _npc_list[A0_51] then
    for _FORV_5_, _FORV_6_ in ipairs(_npc_list[A0_51]) do
      if _FORV_6_.name == A1_52 then
        return _FORV_6_.type
      end
    end
  end
  return nil
end
function setAllNpcActive(A0_53)
  local L1_54, L2_55, L3_56, L4_57, L5_58
  for L4_57, L5_58 in L1_54(L2_55) do
    for _FORV_9_, _FORV_10_ in ipairs(L5_58) do
      if findGameObject2("NpcGenerator", _FORV_10_.name) then
        findGameObject2("NpcGenerator", _FORV_10_.name):setActive(A0_53)
      end
    end
  end
end
function debugPrint(A0_59)
  print(" < npc mng > " .. A0_59)
end
