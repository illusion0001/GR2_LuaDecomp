dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
import("GlobalGem")
mine_name = "ep03_mine"
_litho_theme = nil
_ore_max = 77
_clear = 30
_count = 0
_gem_other_max = 10000
_get_count = 0
_island_navi = nil
_island_navi_disp = 50
_island_navi_hide = 25
_island_sink_tbl = {
  {
    loc = "litho_08_01_sink",
    wait_time = 45
  },
  {
    loc = "litho_08_02_sink",
    wait_time = 40
  },
  {
    loc = "litho_08_03_sink",
    wait_time = 35
  },
  {
    loc = "litho_08_04_sink",
    wait_time = 30
  },
  {
    loc = "litho_08_05_sink",
    wait_time = 0
  }
}
_island_sink_task = nil
_sink_island = nil
_sink_max = 5
_sink_start = false
_debug_flag = false
_debug_sink_time = 0
_addGravityOre = {
  mineOreEvdName = "ep03_p_mine",
  instance_flg = false,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_poison_area = false
function Initialize()
  _area_02_hdl = Fn_findAreaHandle("az_a_02")
  _sdemo = SDemo.create("sink_first")
  _sdemo:set(findGameObject2("Node", "locator2_sink_first_cam_00"):getWorldPos(), findGameObject2("Node", "locator2_sink_first_aim_02"):getWorldPos())
  Fn_pcSensorOff("pccubesensor2_az_a_catwarp_litho_08")
  Fn_setCatWarpCheckPoint("locator2_catwarp_ep03_o")
  _catwarp_change = false
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  if L0_0 == true then
    _cam_00_hdl = L0_0
    _aim_00_hdl = L0_0
    _cam_01_hdl = L0_0
    _aim_01_hdl = L0_0
    _cam_02_hdl = L0_0
    _aim_02_hdl = L0_0
    L0_0(L1_1)
  end
  repeat
    L0_0()
  until L0_0
  for L3_3 = 1, _ore_max do
    if Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_3)) ~= nil then
      Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_3)):setActive(false)
    end
  end
  while true do
    if L0_0 == false then
      L0_0()
    end
  end
  L0_0(L1_1)
  _total_break = L0_0
  L0_0(L1_1)
  if L0_0 then
    L0_0(L1_1)
    L0_0(L1_1)
    L0_0()
  else
    L0_0()
    L0_0()
    _island_navi = L0_0
  end
  repeat
    L0_0()
  until L0_0
  L0_0()
  L0_0(L1_1)
  repeat
    L0_0()
  until L0_0
  L0_0(L1_1)
  _island_navi = L0_0
  _miss_check = L0_0
  _poison_check = L0_0
  L0_0(L1_1)
  repeat
    if L0_0 == false then
      L0_0()
    end
    L0_0()
  until L0_0
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  L0_0(L1_1)
  repeat
    L0_0()
  until L0_0
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L3_3 = true
  L0_0(L1_1, L2_2, L3_3)
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0()
  L3_3 = "locator2_az_a_02_set_02"
  L0_0(L1_1, L2_2, L3_3, 0)
  repeat
    L0_0()
  until L0_0
  for L3_3 = 1, _ore_max do
    if Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_3)) ~= nil then
      Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_3)):setActive(false)
    end
  end
  L0_0(L1_1)
  repeat
    L0_0()
  until L0_0
  L0_0()
  L0_0()
  L0_0()
  L0_0()
end
function litho_init()
  local L0_4, L1_5, L2_6, L3_7
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4(L1_5)
  L0_4()
  repeat
    L0_4()
  until L0_4
  for L3_7 = 1, _ore_max do
    if Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_7)) ~= nil then
      Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_7)):setActive(true)
      Fn_getGravityOre2(string.format("gravityore_az_a_02_L08_%02d", L3_7)):setEventListener("broken", function(A0_8)
        _count = _count + 1
        HUD:counter99_99AddNum()
      end)
    else
      print("handle nil : gravityore_az_a_02_L08_0" .. L3_7)
    end
  end
  L0_4()
  repeat
    L0_4()
  until L0_4
end
function sink_start_demo()
  _island_sink_task = invokeTask(island_sink)
end
function island_sink()
  local L0_9, L1_10, L2_11, L3_12
  for L3_12 = 1, _sink_max do
    _sink_island = _island_sink_tbl[L3_12].loc
    Camera:shake3D(5, 0.25, 1.25, _area_02_hdl:getWorldPos(), 0)
    if L3_12 == 1 then
      waitSeconds(1.5)
      print(">>>>> sink SDemo Start <<<<<")
      Fn_getPlayer():setVisible(false)
      Fn_resetPcPos("locator2_pc_lihto_08_sdemo")
      _sdemo:play()
    else
      waitSeconds(3)
    end
    _debug_sink_time = _island_sink_tbl[L3_12].wait_time
    Fn_sendEventComSb("requestMoveArea", "ANY_MOVE", _island_sink_tbl[L3_12].loc)
    waitSeconds(1.5)
    if L3_12 == 1 then
      waitSeconds(2)
      invokeTask(function()
        Fn_resetPcPos("locator2_pc_sd_litho_08")
      end)
      _sdemo:stop(1)
      Fn_getPlayer():setVisible(true)
      waitSeconds(1)
      Fn_captionView("ep03_07001")
      _sink_start = true
    elseif L3_12 == 2 then
      Fn_captionView("ep03_07003")
    elseif L3_12 == 3 then
      Fn_captionView("ep03_07004")
    elseif L3_12 == 4 then
      Fn_captionView("ep03_07005")
    end
    _island = L3_12
    waitSeconds(_island_sink_tbl[L3_12].wait_time)
  end
end
function oreBroken_ep03_p(A0_13)
  if _total_break > _count then
    _ore_force = A0_13:getBreakForce()
    if RandI(3) == 1 then
      createGem(A0_13, 5, 1)
    else
      createGem(A0_13, 4, 1)
    end
    return {drop_all_off = true}
  else
    return {drop_all_off = false}
  end
end
function createGem(A0_14, A1_15, A2_16)
  local L3_17, L4_18, L5_19, L6_20, L7_21
  L6_20 = " ] : "
  L7_21 = tostring
  L7_21 = L7_21(A2_16)
  L3_17(L4_18)
  if A2_16 > 0 then
    for L6_20 = 1, A2_16 do
      L7_21 = createGameObject2
      L7_21 = L7_21("Gem")
      L7_21:setGemModelNo(A1_15)
      L7_21:setPos(Vector(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
      L7_21:setDynamic(true)
      L7_21:setVisibleBlockHalfSize(150)
      A0_14:appendChild(L7_21)
      L7_21:try_init()
      L7_21:waitForReadyAsync(function()
        L7_21:try_start()
        L7_21:setImpulse(_ore_force)
      end)
      break
    end
  end
end
function restart_litho()
  print("*** ep03_p:restart_litho ***")
  Fn_userCtrlAllOff()
  Player:setStay(true)
  Fn_pcSensorOff("pccubesensor2_az_a_catwarp_litho_08")
  if _island_sink_task ~= nil then
    _island_sink_task:abort()
  end
  Fn_whiteout(0.3)
  GameDatabase:set(ggd.EventFlags__ep03__flag02, _total_break + _count)
  Player:applyPoisonDamage(0, 0.01)
  Fn_sendEventComSb("pauseArea", "az_a_02", true)
  _island_navi:abort()
  Sound:playSE("pc1_018", 1, Fn_getPlayer())
  Fn_sendEventComSb("requestWarpArea", "az_a_02", "locator2_az_a_02_set_02", 0)
  repeat
    wait()
  until Fn_sendEventComSb("isAreaWarpEnd")
  Fn_sendEventComSb("missionFailure")
  repeat
    wait()
  until Fn_sendEventComSb("isFailureProcessEnd")
  Fn_sendEventComSb("az_a_catwarp", true)
  if _poison_first_flag == false then
    GameDatabase:set(ggd.EventFlags__ep03__flag01, 0)
  end
  Fn_missionRetry(true)
end
function pccubesensor2_az_a_catwarp_litho_08_OnLeave()
  print("******************* litho08 catwarp *******************")
  invokeTask(function()
    if Fn_sendEventComSb("isPoisonAreaIN") or _poison_area then
      if _litho_theme == nil then
        _litho_theme = false
      end
    else
      Fn_sendEventComSb("requestCatwarp")
    end
  end)
end
function pccubesensor2_poison_litho_08_OnEnter(A0_22, A1_23)
  print("******************* litho08 poison area >>> in *******************")
  _poison_area = true
end
function pccubesensor2_poison_litho_08_OnLeave(A0_24, A1_25)
  print("******************* litho08 poison area >>> out *******************")
  _poison_area = false
end
function Finalize()
  local L0_26, L1_27
end
