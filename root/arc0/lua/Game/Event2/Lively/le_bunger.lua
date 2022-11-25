local L1_1
L0_0 = {}
LeBunger = L0_0
_LeBungerNear = false
L0_0 = LeBunger
function L1_1()
  local L0_2
  L0_2 = {}
  L0_2.name = "bunger"
  L0_2.evb = nil
  L0_2.start = false
  L0_2.task_init = nil
  L0_2.task_run = nil
  L0_2.fire = {}
  L0_2.param = {
    {
      craftsman = nil,
      base = nil,
      node = nil,
      node2 = nil
    },
    {
      craftsman = nil,
      base = nil,
      node = nil,
      node2 = nil
    },
    {
      craftsman = nil,
      base = nil,
      node = nil,
      node2 = nil
    },
    {
      craftsman = nil,
      base = nil,
      node = nil,
      node2 = nil
    },
    {
      craftsman = nil,
      base = nil,
      node = nil,
      node2 = nil
    }
  }
  L0_2.is_create = false
  L0_2.sp_days = false
  L0_2.interval = 0
  LeBunger._installMethods(L0_2)
  return L0_2
end
L0_0.create = L1_1
L0_0 = LeBunger
function L1_1(A0_3)
  if not LeBunger._isValid(A0_3) then
    return false
  end
  if A0_3.start then
    A0_3:debugPrint("\227\129\153\227\129\167\227\129\171\229\136\157\230\156\159\229\140\150\230\184\136\227\129\191\227\129\167\227\129\153")
    return
  end
  if A0_3.task_init then
    A0_3:debugPrint("\232\138\177\231\129\171\227\129\174evb\227\129\175\229\136\157\230\156\159\229\140\150\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_3.task_init = invokeTask(function()
    local L0_4, L1_5
    L0_4 = loadFileAsset
    L1_5 = "evb"
    L0_4 = L0_4(L1_5, "evx/le17")
    if L0_4 then
      L1_5 = L0_4.wait
      L1_5(L0_4)
      L1_5 = L0_4.getRoot
      L1_5 = L1_5(L0_4)
      A0_3.evb = EventData:create("LeBunger", nil, L1_5)
      A0_3.evb:try_init()
      A0_3.evb:waitForReady()
      A0_3.evb:try_start()
      A0_3.start = true
    end
    A0_3.task_init = nil
  end)
end
L0_0.init = L1_1
L0_0 = LeBunger
function L1_1(A0_6, A1_7, A2_8, A3_9, A4_10, A5_11)
  if not LeBunger._isValid(A0_6) then
    return false
  end
  if not A0_6.start then
    A0_6:debugPrint("\232\138\177\231\129\171\227\129\174\229\136\157\230\156\159\229\140\150\227\129\140\231\181\130\227\130\143\227\129\163\227\129\166\227\129\132\227\129\170\227\129\132\227\129\174\227\129\167\229\174\159\232\161\140\227\129\151\227\129\190\227\129\155\227\130\147")
    return
  end
  if A0_6.task_run then
    A0_6:debugPrint("\232\138\177\231\129\171\227\129\174\227\130\191\227\130\185\227\130\175\227\129\175\229\174\159\232\161\140\228\184\173\227\129\167\227\129\153")
    return
  end
  A0_6.task_run = invokeTask(function()
    local L0_12, L1_13, L2_14, L3_15, L4_16
    L0_12 = A0_6
    L1_13 = L0_12
    L0_12 = L0_12.debugPrint
    L2_14 = "month, day, hour, minute, second"
    L3_15 = tostring
    L4_16 = A1_7
    L3_15 = L3_15(L4_16)
    L4_16 = ":"
    L2_14 = L2_14 .. L3_15 .. L4_16 .. tostring(A2_8) .. ":" .. tostring(A3_9) .. ":" .. tostring(A4_10) .. ":" .. tostring(A5_11)
    L0_12(L1_13, L2_14)
    L0_12 = A1_7
    if L0_12 ~= 0 then
      L0_12 = A2_8
      if L0_12 ~= 0 then
        A0_6.sp_days = true
        L0_12 = A0_6
        L1_13 = L0_12
        L0_12 = L0_12.debugPrint
        L2_14 = "\231\137\185\229\136\165\227\129\170\230\151\165\227\129\174\232\138\177\231\129\171\227\130\146\228\184\138\227\129\146\227\129\190\227\129\153"
        L0_12(L1_13, L2_14)
      end
    else
      L0_12 = A0_6
      L1_13 = L0_12
      L0_12 = L0_12.debugPrint
      L2_14 = "\232\138\177\231\129\171\227\130\146\228\184\138\227\129\146\227\129\190\227\129\153"
      L0_12(L1_13, L2_14)
    end
    L0_12 = A0_6
    L1_13 = L0_12
    L0_12 = L0_12._findCraftmanNode
    L0_12(L1_13)
    L0_12 = Rtc
    L1_13 = L0_12
    L0_12 = L0_12.localtime
    L0_12 = L0_12(L1_13)
    L1_13 = Rtc
    L2_14 = L1_13
    L1_13 = L1_13.localtime
    L1_13 = L1_13(L2_14)
    L2_14 = 0
    L3_15 = 0
    L4_16 = 1
    A0_6.interval = 0
    while true do
      A0_6:_createCraftman()
      L1_13.hour = L0_12.hour
      L1_13.minute = L0_12.minute
      L0_12 = Rtc:localtime()
      if L1_13.minute ~= L0_12.minute then
        L3_15 = L3_15 + 1
        A0_6:debugPrint("\231\181\140\233\129\142\230\153\130\233\150\147 " .. tostring(L0_12.hour) .. ":" .. tostring(L0_12.minute) .. ": m " .. tostring(L3_15))
      elseif L1_13.hour ~= L0_12.hour then
        L2_14 = L2_14 + 1
        A0_6:debugPrint("\231\181\140\233\129\142\230\153\130\233\150\147 " .. tostring(L0_12.hour) .. ":" .. tostring(L0_12.minute) .. ": h " .. tostring(L2_14))
      end
      if A0_6.sp_days then
        if not (L2_14 >= 1) then
          else
          end
          if not (L3_15 >= 1) then
            if GameDatabase:get(ggd.Menu__MapName, new_city) == "ed" then
              if A0_6.is_create and 0 >= A0_6.interval then
                while true do
                  L4_16 = RandI(1, 5)
                  if A0_6.param[L4_16].base ~= nil and -1 ~= L4_16 then
                    break
                  end
                  wait()
                end
                A0_6:_fire(A0_6.param[L4_16].node)
              end
              A0_6.interval = A0_6.interval - 1
              if 0 > A0_6.interval then
                A0_6.interval = 0
              end
            else
              A0_6.interval = 0
            end
            wait()
          end
        end
    end
    A0_6:debugPrint("\232\138\177\231\129\171\231\181\130\228\186\134\227\128\129\227\130\173\227\131\163\227\131\169\227\130\146\229\137\138\233\153\164\227\129\151\227\129\190\227\129\153")
    while not A0_6:_terminateCraftman() do
      wait()
    end
    A0_6:debugPrint("\232\138\177\231\129\171\227\129\175\227\129\153\227\129\185\227\129\166\231\181\130\228\186\134\227\129\151\227\129\190\227\129\151\227\129\159\227\128\130")
    A0_6.task_run = nil
  end)
end
L0_0.run = L1_1
L0_0 = LeBunger
function L1_1(A0_17)
  if not LeBunger._isValid(A0_17) then
    return false
  end
  A0_17.is_create = false
  A0_17.task_run = A0_17:_abortTask(A0_17.task_run)
  for _FORV_4_, _FORV_5_ in ipairs(A0_17.param) do
    if _FORV_5_.craftsman then
      Fn_disappearNpc(_FORV_5_.craftsman)
    end
    _FORV_5_.craftsman = nil
    _FORV_5_.base = A0_17:_termGameObj(_FORV_5_.base)
  end
end
L0_0.terminate = L1_1
L0_0 = LeBunger
function L1_1(A0_18)
  if not LeBunger._isValid(A0_18) then
    return false
  end
  A0_18:terminate()
  for _FORV_4_, _FORV_5_ in ipairs(A0_18.param) do
    _FORV_5_.node = nil
    _FORV_5_.node2 = nil
  end
  for _FORV_4_, _FORV_5_ in ipairs(A0_18.fire) do
    if _FORV_5_ then
      _FORV_5_.task = A0_18:_abortTask(_FORV_5_.task)
      _FORV_5_.task_launch = A0_18:_abortTask(_FORV_5_.task_launch)
      _FORV_5_.locus = A0_18:_termGameObj(_FORV_5_.locus)
      _FORV_5_.flash = A0_18:_termGameObj(_FORV_5_.flash)
      _FORV_5_.firework = A0_18:_termGameObj(_FORV_5_.firework)
      _FORV_5_.wave = A0_18:_termGameObj(_FORV_5_.wave)
      _FORV_5_.node = A0_18:_termGameObj(_FORV_5_.node)
    end
  end
  A0_18.fire = {}
  A0_18.task_init = A0_18:_abortTask(A0_18.task_init)
  A0_18.evb = A0_18:_termGameObj(A0_18.evb)
  A0_18.start = false
end
L0_0.kill = L1_1
L0_0 = LeBunger
function L1_1(A0_19)
  local L1_20
  if A0_19 == nil then
    L1_20 = false
    return L1_20
  end
  L1_20 = true
  return L1_20
end
L0_0._isValid = L1_1
L0_0 = LeBunger
function L1_1(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26
  for L4_25, L5_26 in L1_22(L2_23) do
    if type(L5_26) == "function" then
      A0_21[L4_25] = L5_26
    end
  end
end
L0_0._installMethods = L1_1
L0_0 = LeBunger
function L1_1(A0_27, A1_28)
  if A1_28 then
    A0_27:debugPrint(A1_28:getName() .. " \227\130\146\231\160\180\230\163\132")
    if A1_28:isRunning() then
      A1_28:try_term()
    else
      A1_28:kill()
    end
  end
  return nil
end
L0_0._termGameObj = L1_1
L0_0 = LeBunger
function L1_1(A0_29, A1_30)
  if A1_30 and A1_30:isRunning() then
    A1_30:abort()
  end
  return nil
end
L0_0._abortTask = L1_1
L0_0 = LeBunger
function L1_1(A0_31)
  local L1_32, L2_33, L3_34, L4_35
  for L4_35, _FORV_5_ in L1_32(L2_33) do
    _FORV_5_.node = findGameObject2("Node", "locator2_firework_craftman_0" .. L4_35)
    _FORV_5_.node2 = findGameObject2("Node", "locator2_firework_point_0" .. L4_35)
  end
end
L0_0._findCraftmanNode = L1_1
L0_0 = LeBunger
function L1_1(A0_36)
  local L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44
  for L4_40, L5_41 in L1_37(L2_38) do
    L6_42 = L5_41.craftsman
    if L6_42 == nil then
      L6_42 = L5_41.node
      if L6_42 then
        L6_42 = Fn_isInSightTarget
        L7_43 = L5_41.node
        L6_42 = L6_42(L7_43)
        if not L6_42 then
          L6_42 = {L7_43}
          L7_43 = {}
          L8_44 = "LeBungerCraftman_0"
          L8_44 = L8_44 .. L4_40
          L7_43.name = L8_44
          L7_43.type = "man39"
          L8_44 = L5_41.node
          L8_44 = L8_44.getName
          L8_44 = L8_44(L8_44)
          L7_43.node = L8_44
          L7_43.start = true
          L7_43 = Fn_setupNpc
          L8_44 = L6_42
          L7_43 = L7_43(L8_44)
          L8_44 = L6_42[1]
          L8_44 = L8_44.name
          L8_44 = L7_43[L8_44]
          L5_41.craftsman = L8_44
          L8_44 = A0_36.debugPrint
          L8_44(A0_36, L6_42[1].name .. "\227\130\146\228\189\156\230\136\144")
          L8_44 = "LeBungerBase_0"
          L8_44 = L8_44 .. L4_40
          L5_41.base = Fn_createTerrainBg(L5_41.node2, "LeBungerBase_0" .. L4_40, "fireworkslauncher_md_01")
          A0_36:debugPrint(L8_44 .. "\227\130\146\228\189\156\230\136\144")
          A0_36.is_create = true
        end
      end
    end
  end
end
L0_0._createCraftman = L1_1
L0_0 = LeBunger
function L1_1(A0_45)
  local L1_46
  L1_46 = true
  for _FORV_5_, _FORV_6_ in pairs(A0_45.param) do
    if _FORV_6_.craftsman then
      if _FORV_6_.node and not Fn_isInSightTarget(_FORV_6_.node) then
        A0_45.is_create = false
        Fn_disappearNpc(_FORV_6_.craftsman)
        _FORV_6_.craftsman = nil
        _FORV_6_.base = A0_45:_termGameObj(_FORV_6_.base)
      else
        L1_46 = false
      end
    end
  end
  return L1_46
end
L0_0._terminateCraftman = L1_1
L0_0 = LeBunger
function L1_1(A0_47, A1_48, A2_49, A3_50)
  local L4_51
  L4_51 = createGameObject2
  L4_51 = L4_51("Effect")
  L4_51:setName(A1_48)
  L4_51:setModelName(A2_49)
  if type(A3_50) == "table" then
    L4_51:setPos(A3_50)
  else
    A3_50:appendChild(L4_51)
  end
  return L4_51
end
L0_0._createEffect = L1_1
L0_0 = LeBunger
function L1_1(A0_52, A1_53)
  local L2_54, L3_55, L4_56, L5_57, L6_58
  L2_54 = {}
  L2_54.task = nil
  L2_54.locus = nil
  L2_54.flash = nil
  L2_54.firework = nil
  L2_54.wave = nil
  L2_54.node = nil
  L2_54.task_launch = nil
  L2_54.task = L3_55
  for L6_58, _FORV_7_ in L3_55(L4_56) do
    if _FORV_7_.task == nil then
      table.remove(A0_52.fire, L6_58)
    end
  end
  L6_58 = L2_54
  L3_55(L4_56, L5_57, L6_58)
end
L0_0._fire = L1_1
L0_0 = LeBunger
function L1_1(A0_59, A1_60, A2_61)
  local L3_62
  L3_62 = Sound
  L3_62 = L3_62.playSE
  L3_62(L3_62, A1_60, 1, "", A2_61)
  L3_62 = A2_61.getWorldPos
  L3_62 = L3_62(A2_61)
  while not (L3_62.y + 100 <= L3_62.y) do
    L3_62.y = L3_62.y + 0.67
    A2_61:setWorldPos(L3_62)
    wait()
  end
end
L0_0._playLaunchSnd = L1_1
L0_0 = LeBunger
function L1_1(A0_63, A1_64)
  print(" - le bunger - " .. A1_64)
end
L0_0.debugPrint = L1_1
L0_0 = LeBunger
function L1_1(A0_65, A1_66, A2_67)
  local L3_68, L4_69, L5_70
  L3_68 = 0 + A2_67
  function L4_69(A0_71)
    local L1_72
    L1_72 = A1_66
    L1_72 = L1_72 + 10
    if Debug:isDebugMenuOpen() then
      L1_72 = L1_72 + 200
    end
    Font:debugPrint(L1_72, 20 + 18 * L3_68, A0_71)
    L3_68 = L3_68 + 1
  end
  function L5_70(A0_73, A1_74)
    local L2_75
    L2_75 = A0_73 ~= nil and A1_74 or "nil"
    return L2_75
  end
  L4_69("- Bunger -")
  L4_69("init task : " .. (A0_65.task_init ~= nil and "run" or "nil"))
  L4_69("run  task : " .. (A0_65.task_run ~= nil and "run" or "nil"))
  L4_69("start     : " .. tostring(A0_65.start))
  L4_69("sp_days   : " .. tostring(A0_65.sp_days))
  L4_69("interval  : " .. tostring(A0_65.interval))
  L4_69("create    : " .. tostring(A0_65.is_create))
  for _FORV_9_, _FORV_10_ in ipairs(A0_65.param) do
    L4_69("npc : " .. L5_70(_FORV_10_.craftsman, "create") .. " base : " .. L5_70(_FORV_10_.base, "create") .. " node : " .. L5_70(_FORV_10_.node, "find") .. " node2 : " .. L5_70(_FORV_10_.node2, "find"))
  end
  L4_69("fire cnt  : " .. tostring(#A0_65.fire))
  for _FORV_9_, _FORV_10_ in ipairs(A0_65.fire) do
    L4_69("fire task : " .. tostring(_FORV_10_.task))
  end
  return L3_68 - A2_67
end
L0_0.debugDisp = L1_1
function L0_0()
  local L0_76, L1_77
  _LeBungerNear = true
end
pcspheresensor2_sound_range_OnEnter = L0_0
function L0_0()
  local L0_78, L1_79
  _LeBungerNear = false
end
pcspheresensor2_sound_range_OnLeave = L0_0
