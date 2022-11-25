dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
mine_name = "ep12_mine"
_addGravityOre = {
  mineOreEvdName = "ep12_n_mine",
  instance_flg = false,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_ore_max = 37
_puppet_crow = nil
_brain_crow = nil
_litho_timer_task = nil
_clear_time = {
  0,
  1,
  44,
  99
}
_litho_05_obj_cnt = 0
_litho_05_obj_max = 40
_drop_tbl = {
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "3",
  "2",
  "2",
  "2",
  "2",
  "2",
  "1",
  "1",
  "1",
  "e",
  "e",
  "e",
  "e",
  "e",
  "e",
  "e",
  "e",
  "e",
  "e",
  "e",
  "v",
  "v",
  "v",
  "v",
  "v",
  "v",
  "v",
  "v",
  "s"
}
_gem_mun = 20
_item_get_tbl = {}
_start_drop = false
_lottery = false
_debug_flag = false
function Initialize()
  local L0_0
  L0_0 = Player
  L0_0 = L0_0.setAttrTune
  L0_0(L0_0, Player.kAttrTune_Jupiter)
  L0_0 = GameDatabase
  L0_0 = L0_0.set
  L0_0(L0_0, ggd.GlobalSystemFlags__GaugeCoercion, true)
  L0_0 = Fn_sendEventComSb
  L0_0("statusChengeEp12", "aisle")
  L0_0 = GlobalGem
  L0_0 = L0_0.SetPreciousGemAddCallback
  L0_0(L0_0, "OnGemGet")
  L0_0 = table
  L0_0 = L0_0.maxn
  L0_0 = L0_0(_drop_tbl)
  for _FORV_4_ = 1, L0_0 do
    _item_get_tbl[_FORV_4_] = false
  end
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  repeat
    L0_1()
  until L0_1
  for L3_4 = 1, _ore_max do
    L4_5 = Fn_getGravityOre2
    L4_5 = L4_5(string.format("gravityore_az4_a_05_L05_%02d", L3_4))
    if L4_5 ~= nil then
      L4_5:setActive(false)
    end
  end
  L0_1(L1_2)
  L0_1(L1_2)
  repeat
    L0_1()
  until L0_1
  _puppet_crow = L0_1
  _brain_crow = L0_1
  L0_1(L1_2, L2_3, L3_4)
  L0_1()
  L0_1()
  _litho_navi = L0_1
  L0_1(L1_2)
  repeat
    L0_1()
  until L0_1
  L0_1(L1_2)
  L0_1()
  L0_1(L1_2)
  repeat
    L0_1()
  until L0_1
  L0_1(L1_2)
  _litho_timer_task = L0_1
  repeat
    if L1_2 == false then
      L1_2(L2_3, L3_4)
      L1_2(L2_3, L3_4)
      L1_2(L2_3)
      L1_2(L2_3, L3_4)
      L1_2()
    end
    L1_2()
  until L1_2
  L1_2(L2_3)
  L1_2(L2_3, L3_4)
  if L1_2 ~= nil then
    L1_2(L2_3, L3_4)
  end
  L1_2(L2_3, L3_4)
  L1_2(L2_3, L3_4)
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L1_2(L2_3)
  for L4_5 = 1, _ore_max do
    if Fn_getGravityOre2(string.format("gravityore_az4_a_05_L05_%02d", L4_5)) ~= nil then
      Fn_getGravityOre2(string.format("gravityore_az4_a_05_L05_%02d", L4_5)):setActive(false)
    end
  end
  repeat
    L1_2()
  until L1_2
  L1_2()
  L1_2()
  L1_2()
  L1_2()
end
function litho_init()
  local L0_6, L1_7, L2_8, L3_9
  L0_6(L1_7)
  L0_6(L1_7)
  L0_6(L1_7)
  L0_6()
  repeat
    L0_6()
  until L0_6
  for L3_9 = 1, _ore_max do
    if Fn_getGravityOre2(string.format("gravityore_az4_a_05_L05_%02d", L3_9)) ~= nil then
      Fn_getGravityOre2(string.format("gravityore_az4_a_05_L05_%02d", L3_9)):setActive(true)
    else
      print("handle nil : gravityore_az4_a_05_L05_0" .. L3_9)
    end
  end
  _litho_05_obj_cnt = 0
end
function litho_timer(A0_10)
  while _litho_theme ~= true do
    if _litho_theme == nil then
      HUD:timerSetSecond(A0_10)
      HUD:timerSetVisible(true)
      HUD:timerStart()
      _timer_se = Sound:playSEHandle("sys_countdown", 1)
      while HUD:timerGetSecond() > 0 do
        wait()
      end
      _litho_theme = false
      HUD:timerStop()
      if _timer_se ~= nil then
        Sound:stopSEHandle(_timer_se)
      end
    end
    wait()
  end
end
function restart_litho()
  print("*** ep12_k:restart_litho ***")
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_missionRetry(true)
end
function oreBroken_ep12_n(A0_11)
  if A0_11:getTypeName() ~= "GravityOre2" then
    return
  end
  invokeTask(function()
    local L0_12, L1_13, L2_14
    L0_12 = A0_11
    L1_13 = L0_12
    L0_12 = L0_12.getTagText
    L0_12 = L0_12(L1_13)
    L1_13 = A0_11
    L2_14 = L1_13
    L1_13 = L1_13.getBreakForce
    L1_13 = L1_13(L2_14)
    _ore_force = L1_13
    L1_13 = _ore_force
    L2_14 = _ore_force
    L2_14 = L2_14.x
    L2_14 = L2_14 / 3
    L1_13.x = L2_14
    L1_13 = _ore_force
    L2_14 = _ore_force
    L2_14 = L2_14.y
    L2_14 = L2_14 / 3
    L1_13.y = L2_14
    L1_13 = _ore_force
    L2_14 = _ore_force
    L2_14 = L2_14.z
    L2_14 = L2_14 / 3
    L1_13.z = L2_14
    L1_13 = 0
    repeat
      L2_14 = wait
      L2_14()
      L2_14 = _lottery
    until L2_14 == false
    repeat
      _lottery = true
      L2_14 = _start_drop
      if L2_14 == false then
        L2_14 = RandI
        L2_14 = L2_14(_gem_mun)
        L1_13 = L2_14
        _start_drop = true
      else
        L2_14 = RandI
        L2_14 = L2_14(5)
        if L2_14 > 3 then
          L2_14 = print
          L2_14("ALL")
          L2_14 = RandI
          L2_14 = L2_14(_ore_max)
          L1_13 = L2_14
        else
          L2_14 = print
          L2_14("gem only")
          L2_14 = RandI
          L2_14 = L2_14(_gem_mun)
          L1_13 = L2_14
        end
      end
      L2_14 = print
      L2_14("drop >>>>> " .. L1_13)
      L2_14 = wait
      L2_14()
      L2_14 = _item_get_tbl
      L2_14 = L2_14[L1_13]
    until L2_14 == false
    L2_14 = _item_get_tbl
    L2_14[L1_13] = true
    _lottery = false
    L2_14 = print
    L2_14("drop " .. L1_13 .. " : " .. _drop_tbl[L1_13])
    L2_14 = _drop_tbl
    L2_14 = L2_14[L1_13]
    if L2_14 == "e" then
      L2_14 = createGem
      L2_14(A0_11, 4, 1)
    else
      L2_14 = _drop_tbl
      L2_14 = L2_14[L1_13]
      if L2_14 == "v" then
        L2_14 = createGem
        L2_14(A0_11, 5, 1)
      else
        L2_14 = _drop_tbl
        L2_14 = L2_14[L1_13]
        if L2_14 == "s" then
          L2_14 = createGem
          L2_14(A0_11, 6, 1)
        else
          L2_14 = tonumber
          L2_14 = L2_14(_drop_tbl[L1_13])
          createGem(A0_11, 1, L2_14)
        end
      end
    end
  end)
  return {drop_all_off = true}
end
function createGem(A0_15, A1_16, A2_17)
  local L3_18, L4_19, L5_20, L6_21, L7_22
  L6_21 = " ] : "
  L7_22 = tostring
  L7_22 = L7_22(A2_17)
  L3_18(L4_19)
  if A2_17 > 0 then
    for L6_21 = 1, A2_17 do
      L7_22 = createGameObject2
      L7_22 = L7_22("Gem")
      L7_22:setGemModelNo(A1_16)
      L7_22:setPos(Vector(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
      L7_22:setDynamic(true)
      A0_15:appendChild(L7_22)
      if crow_broken == true then
        L7_22:setCrow(true)
      end
      L7_22:try_init()
      L7_22:waitForReadyAsync(function()
        L7_22:try_start()
        L7_22:setImpulse(_ore_force)
      end)
      break
    end
  end
end
function OnGemGet(A0_23)
  _litho_05_obj_cnt = _litho_05_obj_cnt + 1
  HUD:counter999SubNum()
end
function Finalize()
  if _timer_se ~= nil then
    Sound:stopSEHandle(_timer_se)
  end
end
