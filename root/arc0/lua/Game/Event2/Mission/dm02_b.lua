dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/dm_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm02_common.lua")
MEMORY_DEBRIS_PARAM_TBL = {
  {
    memory_name = "bus",
    locator_name = "locator2_bus_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "hat",
    locator_name = "locator2_hat_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "house",
    locator_name = "locator2_house_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "spider",
    locator_name = "locator2_spider_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "garbage",
    locator_name = "locator2_garbage_mem_debris_01",
    attach_sensor = false
  },
  {
    memory_name = "extra_01",
    locator_name = "locator2_ex_mem_debris_01"
  },
  {
    memory_name = "extra_02",
    locator_name = "locator2_ex_mem_debris_02"
  }
}
_dm02_hakobune = false
_dm02_food = false
_extra_mem_debris_caption_idx = 1
_bg_bus = nil
_bg_hat = nil
_bg_house = nil
_bg_spider = nil
_bg_garbage = nil
_bg_ark = nil
_bg_bridge = nil
_bg_cone_01 = nil
_bg_cone_02 = nil
_bg_cone_03 = nil
_bg_cone_04 = nil
_bg_cone_05 = nil
_bg_cone_06 = nil
_bg_cone_07 = nil
_bg_cone_08 = nil
_bg_cone_09 = nil
_bg_cone_10 = nil
_bg_cone_11 = nil
_bg_cone_12 = nil
_bg_cone_13 = nil
_move_area_se_task = {}
_bg_bridge_01 = nil
_bg_bridge_02 = nil
_bg_bridge_03 = nil
_bg_bridge_04 = nil
_dm02_outrange = false
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_setCatActive
  L1_1 = false
  L0_0(L1_1)
  L0_0 = mother2
  L1_1 = L0_0
  L0_0 = L0_0.sendEvent
  L0_0 = L0_0(L1_1, "getBackgroundElement2Handle", "maze")
  L1_1 = {
    {
      name = "bit",
      type = "bit01",
      node = "locator2_bit_01",
      active = true
    },
    {
      name = "zaza",
      type = "zaz02",
      node = "locator2_zaza_01",
      active = false
    }
  }
  Fn_setupNpc(L1_1)
  bg_island_01 = L0_0:findSubArea("az5_b_01")
  bg_island_02 = L0_0:findSubArea("az5_b_02")
  bg_island_03 = L0_0:findSubArea("az5_b_03")
  bg_island_04 = L0_0:findSubArea("az5_b_04")
  bg_island_01:setDriftEnable(false)
  bg_island_02:setDriftEnable(false)
  bg_island_03:setDriftEnable(false)
  bg_island_04:setDriftEnable(false)
  _bg_cone_01 = L0_0:findSubArea("az5_b_06_01")
  _bg_cone_02 = L0_0:findSubArea("az5_b_06_02")
  _bg_cone_03 = L0_0:findSubArea("az5_b_06_03")
  _bg_cone_04 = L0_0:findSubArea("az5_b_06_04")
  _bg_cone_05 = L0_0:findSubArea("az5_b_06_05")
  _bg_cone_06 = L0_0:findSubArea("az5_b_06_06")
  _bg_cone_07 = L0_0:findSubArea("az5_b_06_07")
  _bg_cone_08 = L0_0:findSubArea("az5_b_06_08")
  _bg_cone_09 = L0_0:findSubArea("az5_b_06_09")
  _bg_cone_10 = L0_0:findSubArea("az5_b_06_010")
  _bg_cone_11 = L0_0:findSubArea("az5_b_06_011")
  _bg_cone_12 = L0_0:findSubArea("az5_b_06_012")
  _bg_cone_13 = L0_0:findSubArea("az5_b_06_013")
  _bg_bridge = findGameObject2("Node", "bg2_bridge")
  _bg_bridge_01 = findGameObject2("Node", "bg2_bridge_piece_01")
  _bg_bridge_02 = findGameObject2("Node", "bg2_bridge_piece_02")
  _bg_bridge_03 = findGameObject2("Node", "bg2_bridge_piece_03")
  _bg_bridge_04 = findGameObject2("Node", "bg2_bridge_piece_04")
  _bg_bridge_01:setVisible(false)
  _bg_bridge_02:setVisible(false)
  _bg_bridge_03:setVisible(false)
  _bg_bridge_04:setVisible(false)
  _bg_bus = findGameObject2("Node", "bg2_bus")
  _bg_ark = findGameObject2("Node", "bg2_ark")
  _bg_ark:setVisible(false)
  _bg_hat = findGameObject2("GimmickBg", "bg2_hat")
  _bg_house = findGameObject2("GimmickBg", "bg2_house")
  _bg_spider = findGameObject2("GimmickBg", "bg2_spider")
  _bg_garbage = findGameObject2("GimmickBg", "bg2_garbage")
  _bg_hat:setCollidablePermission(false)
  _bg_house:setCollidablePermission(false)
  _bg_spider:setCollidablePermission(false)
  _bg_garbage:setCollidablePermission(false)
  createMemoryDebris(MEMORY_DEBRIS_PARAM_TBL, memoryDebrisGetCallback)
  Fn_setCatWarpCheckPoint("warppoint2_pc_restart_pos_01")
  Fn_coercionPoseNomal()
end
function Ingame()
  local L0_2, L1_3
  L0_2 = Fn_userCtrlAllOff
  L0_2()
  L0_2 = setActiveMemoryDebris
  L1_3 = "extra_01"
  L0_2(L1_3)
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = waitSeconds
  L1_3 = 2
  L0_2(L1_3)
  L0_2 = Fn_kaiwaDemoView
  L1_3 = "dm02_00305k"
  L0_2(L1_3)
  L0_2 = RAC_createEffect
  L1_3 = {}
  L1_3.eff_name = "ef_ev_dis_01"
  L1_3.world_pos = Fn_findNpcPuppet("bit"):getWorldPos()
  L1_3.time = 6
  L0_2(L1_3)
  L0_2 = Fn_disappearNpc
  L1_3 = "bit"
  L0_2(L1_3, 60)
  L0_2 = waitSeconds
  L1_3 = 1
  L0_2(L1_3)
  L0_2 = RAC_LookAtObjectWait
  L1_3 = "bg2_bus"
  L0_2(L1_3, 1, 0.5, 2)
  L0_2 = RAC_createEffect
  L1_3 = {}
  L1_3.eff_name = "ef_ev_dis_01"
  L1_3.pos_node = findGameObject2("Node", "locator2_zaza_01")
  L1_3.time = 6
  L0_2(L1_3)
  L0_2 = waitSeconds
  L1_3 = 0.5
  L0_2(L1_3)
  L0_2 = Fn_setNpcActive
  L1_3 = "zaza"
  L0_2(L1_3, true)
  L0_2 = waitSeconds
  L1_3 = 1
  L0_2(L1_3)
  L0_2 = Fn_captionViewWait
  L1_3 = "dm02_01014"
  L0_2(L1_3)
  L0_2 = GameDatabase
  L1_3 = L0_2
  L0_2 = L0_2.get
  L0_2 = L0_2(L1_3, ggd.Savedata__EventFinishedFlags__dm02)
  if L0_2 == 1 then
    L0_2 = 0
    L1_3 = GameDatabase
    L1_3 = L1_3.get
    L1_3 = L1_3(L1_3, ggd.Savedata__EventFlags__dm02__flag02)
    while L1_3 > 0 do
      if L1_3 - math.floor(L1_3 / 2) * 2 ~= 0 then
        L0_2 = L0_2 + 1
      end
      L1_3 = math.floor(L1_3 / 2)
    end
    HUD:counter99_99SetTextID("\229\143\150\229\190\151\227\129\151\227\129\159\232\168\152\230\134\182\227\129\174\231\160\180\231\137\135\227\129\174\230\149\176")
    HUD:counter99_99SetMax(#MEMORY_DEBRIS_PARAM_TBL)
    HUD:counter99_99SetNum(L0_2)
    HUD:counter99_99SetVisible(true)
  end
  L0_2 = Fn_userCtrlOn
  L0_2()
  while true do
    L0_2 = _dm02_food
    if L0_2 == false then
      L0_2 = wait
      L0_2()
    end
  end
  L0_2 = Fn_lookAtObjectWait
  L1_3 = "bg2_ark"
  L0_2(L1_3)
  L0_2 = Fn_captionViewWait
  L1_3 = "dm02_01012"
  L0_2(L1_3)
  L0_2 = Fn_missionView
  L1_3 = "dm02_01011"
  L0_2(L1_3)
  while true do
    L0_2 = _dm02_hakobune
    if L0_2 == false then
      L0_2 = wait
      L0_2()
    end
  end
  L0_2 = Fn_userCtrlOff
  L0_2()
  L0_2 = Fn_kaiwaDemoView
  L1_3 = "dm02_00320k"
  L0_2(L1_3)
  L0_2 = GameDatabase
  L1_3 = L0_2
  L0_2 = L0_2.get
  L0_2 = L0_2(L1_3, ggd.Savedata__EventFlags__dm02__flag02)
  L1_3 = L0_2
  for _FORV_6_ = #MEMORY_DEBRIS_PARAM_TBL, 1, -1 do
    if L1_3 % 2 == 0 and isMemoryDebrisAcquired(MEMORY_DEBRIS_PARAM_TBL[_FORV_6_].memory_name) == true then
      L0_2 = L0_2 + 1
    end
    L1_3 = math.floor(L1_3 / 2)
  end
  _FOR_:set(ggd.Savedata__EventFlags__dm02__flag02, L0_2)
  if GameDatabase:get(ggd.EventFlags__dm02__flag01) == 1 and L0_2 >= 2 ^ (#MEMORY_DEBRIS_PARAM_TBL) - 1 then
    GameDatabase:set(ggd.EventFlags__dm02__flag01, 1)
  else
    GameDatabase:set(ggd.EventFlags__dm02__flag01, 0)
  end
  L0_2 = Fn_blackout
  L0_2()
  L0_2 = GameDatabase
  L1_3 = L0_2
  L0_2 = L0_2.get
  L0_2 = L0_2(L1_3, ggd.Savedata__EventFinishedFlags__dm02)
  if L0_2 == 1 then
    L0_2 = HUD
    L1_3 = L0_2
    L0_2 = L0_2.counter99_99SetVisible
    L0_2(L1_3, false)
  end
  L0_2 = Fn_setNextMissionFlag
  L0_2()
  L0_2 = Fn_nextMission
  L0_2()
  L0_2 = Fn_exitSandbox
  L0_2()
end
function Finalize()
  for _FORV_3_, _FORV_4_ in ipairs(_move_area_se_task) do
    _move_area_se_task[_FORV_3_]:abort()
  end
  _move_area_se_task = {}
  deleteMemoryDebris()
  Fn_setCatActive(true)
  Fn_resetCoercionPose()
end
function pccubesensor2_hat_OnEnter()
  Fn_pcSensorOff("pccubesensor2_hat")
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_captionViewWait("dm02_01000")
    wait()
    Fn_captionViewWait("dm02_01001")
    Fn_lookAtObject(_bg_hat):abort()
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = _bg_hat,
      time = 6
    })
    _bg_hat:setActive(false)
    setActiveMemoryDebris("hat")
    waitSeconds(2)
    setGettingMemoryDebris("hat")
    Fn_userCtrlOn()
  end)
end
function pccubesensor2_house_OnEnter()
  Fn_pcSensorOff("pccubesensor2_house")
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_captionViewWait("dm02_01002")
    wait()
    Fn_captionViewWait("dm02_01003")
    Fn_lookAtObject(_bg_house):abort()
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = _bg_house,
      time = 6
    })
    _bg_house:setActive(false)
    setActiveMemoryDebris("house")
    waitSeconds(2)
    setGettingMemoryDebris("house")
    Fn_userCtrlOn()
    invokeTask(cone_move_01)
  end)
end
function pccubesensor2_spider_OnEnter()
  Fn_pcSensorOff("pccubesensor2_spider")
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_captionViewWait("dm02_01004")
    wait()
    Fn_captionViewWait("dm02_01005")
    Fn_lookAtObject(_bg_spider):abort()
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = _bg_spider,
      time = 6
    })
    _bg_spider:setActive(false)
    setActiveMemoryDebris("spider")
    waitSeconds(2)
    setGettingMemoryDebris("spider")
    Fn_userCtrlOn()
    invokeTask(cone_move_02)
    setActiveMemoryDebris("extra_02")
  end)
end
function pccubesensor2_garbage_OnEnter()
  Fn_pcSensorOff("pccubesensor2_garbage")
  Fn_userCtrlAllOff()
  invokeTask(function()
    Fn_captionViewWait("dm02_01006")
    Fn_lookAtObject(_bg_garbage):abort()
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = _bg_garbage,
      time = 6
    })
    _bg_garbage:setActive(false)
    setActiveMemoryDebris("garbage")
    waitSeconds(2)
    setGettingMemoryDebris("garbage")
    _dm02_food = true
    _bg_ark:setVisible(true)
    Fn_userCtrlOn()
  end)
end
function pccubesensor2_bus_OnEnter()
  Fn_pcSensorOff("pccubesensor2_bus")
  Fn_userCtrlAllOff()
  invokeTask(function()
    local L0_4
    L0_4 = Fn_findNpcPuppet
    L0_4 = L0_4("zaza")
    RAC_LookAtObjectWait(L0_4, 1, 0.3, 3)
    Fn_kaiwaDemoView("dm02_00310k")
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      world_pos = L0_4:getWorldPos(),
      time = 6
    })
    Fn_disappearNpc("zaza", 60)
    waitSeconds(1)
    Fn_captionView("dm02_01007")
    waitSeconds(1)
    RAC_createEffect({
      eff_name = "ef_ev_dis_01",
      pos_node = _bg_bus,
      time = 6
    })
    _bg_bus:setActive(false)
    setActiveMemoryDebris("bus")
    waitSeconds(2)
    setGettingMemoryDebris("bus")
    Fn_userCtrlOn()
    Fn_missionView("dm02_01008")
  end)
end
function pccubesensor2_bridge_OnEnter()
  Fn_pcSensorOff("pccubesensor2_bridge")
  invokeTask(function()
    _bg_bridge:requestBreak(_bg_bridge:getWorldPos(), 1)
    _bg_bridge_01:setVisible(true)
    _bg_bridge_02:setVisible(true)
    _bg_bridge_03:setVisible(true)
    _bg_bridge_04:setVisible(true)
    Sound:playSE("sac_505c", 1)
    Fn_captionView("dm02_01009")
  end)
end
function pccubesensor2_hakobune_OnEnter()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_hakobune")
    _dm02_hakobune = true
  end)
  Fn_pcSensorOff("pccubesensor2_hakobune")
end
function pccubesensor2_outrange_OnEnter()
  Fn_userCtrlAllOff()
  _dm02_outrange = true
  invokeTask(function()
    Sound:playSE("sac_507", 1)
    Fn_captionView("dm02_01010")
    waitSeconds(2)
    StageReset()
  end)
end
function pccubesensor2_trigger_1A_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_1A")
  end
end
function pccubesensor2_trigger_2B_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_2B")
  end
end
function pccubesensor2_trigger_3B_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_3B")
  end
end
function pccubesensor2_trigger_4C_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_4C")
  end
end
function pccubesensor2_trigger_5C_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_5C")
  end
end
function pccubesensor2_trigger_6D_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_6D")
  end
end
function pccubesensor2_trigger_7E_OnEnter()
  if _dm02_outrange == false then
    Fn_setCatWarpCheckPoint("locator2_trigger_7E")
  end
end
function cone_move_01()
  dm_areaAnimate(_bg_cone_01, "az5_b_06_01_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_02, "az5_b_06_02_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_03, "az5_b_06_03_goto_po", 2, true, false)
end
function cone_move_02()
  dm_areaAnimate(_bg_cone_04, "az5_b_06_04_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_05, "az5_b_06_05_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_06, "az5_b_06_06_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_07, "az5_b_06_07_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_08, "az5_b_06_08_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_09, "az5_b_06_09_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_10, "az5_b_06_10_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_11, "az5_b_06_11_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_12, "az5_b_06_12_goto_po", 2, true, false)
  dm_areaAnimate(_bg_cone_13, "az5_b_06_13_01_goto_po", 2, true, false)
end
function cone_move_03()
  dm_areaAnimate(_bg_cone_13, "az5_b_06_13_02_goto_po", 2, false, false)
end
function invokeMoveAreaPlaySE(A0_5, A1_6)
  local L2_7
  L2_7 = {}
  L2_7.se_handle = nil
  L2_7.main_task = invokeTask(function()
    local L0_8
    L0_8 = L2_7
    if A1_6 ~= nil then
      while true do
        for _FORV_4_, _FORV_5_ in ipairs(A1_6) do
          if 0 < _FORV_5_.play_frame then
            L0_8.se_handle = Sound:playSEHandle("dm02_floar_move", 1, "", A0_5)
            Sound:setAudibleRange(L0_8.se_handle, 7)
            wait(_FORV_5_.play_frame)
            Sound:stopSEHandle(L0_8.se_handle)
            L0_8.se_handle = nil
          end
          if 0 < _FORV_5_.stop_frame then
            wait(_FORV_5_.stop_frame)
          end
        end
      end
    else
      L0_8.se_handle = Sound:playSEHandle("dm02_floar_move", 1, "", A0_5)
      Sound:setAudibleRange(L0_8.se_handle, 7)
      while true do
        wait()
      end
    end
  end)
  function L2_7.isRunning(A0_9)
    return A0_9.main_task ~= nil and A0_9.main_task:isRunning()
  end
  function L2_7.abort(A0_10)
    if A0_10.se_handle ~= nil then
      stopSEHandle(A0_10.se_handle)
      A0_10.se_handle = nil
    end
    if A0_10.main_task ~= nil then
      A0_10.main_task:abort()
      A0_10.main_task = nil
    end
  end
  return L2_7
end
function StageReset()
  Fn_userCtrlAllOff()
  Fn_blackout()
  Fn_catWarpCheckPoint()
  Fn_fadein()
  Fn_userCtrlOn()
  dm_userCtrlCameraOn()
  _dm02_outrange = false
end
function memoryDebrisGetCallback(A0_11)
  if A0_11 == "extra_01" then
    showExtraMemDebrisCaption()
  elseif A0_11 == "extra_02" then
    showExtraMemDebrisCaption()
    cone_move_03()
  end
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__dm02) == 1 then
    for _FORV_5_ = #MEMORY_DEBRIS_PARAM_TBL, 1, -1 do
      if MEMORY_DEBRIS_PARAM_TBL[_FORV_5_].memory_name == A0_11 then
        if math.floor(GameDatabase:get(ggd.Savedata__EventFlags__dm02__flag02) / 2 ^ (_FORV_5_ - 1)) % 2 == 0 then
          HUD:counter99_99AddNum()
        end
        break
      end
    end
  end
end
function showExtraMemDebrisCaption()
  local L0_12
  L0_12 = {"dm02_00130", "dm02_02008"}
  if _extra_mem_debris_caption_idx <= #L0_12 then
    Fn_captionView(L0_12[_extra_mem_debris_caption_idx])
    _extra_mem_debris_caption_idx = _extra_mem_debris_caption_idx + 1
  end
end
