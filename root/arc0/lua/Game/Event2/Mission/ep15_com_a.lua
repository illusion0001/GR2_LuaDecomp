dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
import("Vehicle")
VGEM_MAX = 2
_vehicle_hdl = nil
_puppet_tbl = {}
_cat_warp_node = "locator2_restart_a_01"
_bra01_mot_list = {
  speech = "bra01_speech_00"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0 = Fn_getMissionPart
  L0_0 = L0_0()
  for L4_4 = 1, VGEM_MAX do
    RAC_createGemAsync("gem" .. string.format("%02d", L4_4), GEM_VITAL, "locator2_vgem_" .. string.format("%02d", L4_4))
  end
  L2_2.name = "brahman"
  L2_2.type = "bra01"
  L2_2.node = "locator2_brahman"
  L2_2.use_gravity = false
  L2_2.attach = false
  L2_2.active = true
  L3_3.name = "kali_npc"
  L3_3.type = "cow01"
  L3_3.node = "locator2_kali"
  L3_3.use_gravity = false
  L3_3.attach = false
  L3_3.active = true
  L4_4.name = "adicca"
  L4_4.type = "man77"
  L4_4.node = "locator2_adicca"
  L4_4.use_gravity = false
  L4_4.attach = false
  L4_4.active = true
  L2_2(L3_3)
  for _FORV_5_, _FORV_6_ in L2_2(L3_3) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  L2_2(L3_3, L4_4, "cow01_speech_00")
end
function Ingame()
  controlVE()
  Fn_pcSensorOn("pccubesensor2_restart")
  while true do
    wait()
  end
end
function Finalize()
  if _vehicle_hdl ~= nil then
    _vehicle_hdl:try_term()
    _vehicle_hdl = nil
  end
  Vehicle:setVisible(false)
  Fn_disappearNpc("brahman")
  Fn_disappearNpc("kali_npc")
  Fn_disappearNpc("adicca")
end
function pccubesensor2_restart_OnEnter()
  invokeTask(function()
    Fn_setCatWarpCheckPoint(_cat_warp_node)
    Fn_catWarp()
    waitSeconds(1.5)
    Fn_captionView("ep15_09000")
  end)
end
function controlVE()
  local L0_5, L1_6
  while true do
    L0_5 = Vehicle
    L1_6 = L0_5
    L0_5 = L0_5.isReady
    L0_5 = L0_5(L1_6)
    if not L0_5 then
      L0_5 = wait
      L0_5()
    end
  end
  L0_5 = {
    L1_6,
    findGameObject2("Node", "locator2_ve_02"):getWorldPos()
  }
  L1_6 = findGameObject2
  L1_6 = L1_6("Node", "locator2_ve_01")
  L1_6 = L1_6.getWorldPos
  L1_6 = L1_6(L1_6)
  L1_6 = Vehicle
  L1_6 = L1_6.spawnRoute
  L1_6 = L1_6(L1_6, L0_5, g_own)
  _vehicle_hdl = Vehicle:spawnVehicle("CarGovM03", g_own)
  _vehicle_hdl:setVisible(true)
  _vehicle_hdl:setMomentRate(0)
  _vehicle_hdl:setName("enzetsu_car")
  Vehicle:attach(L1_6, _vehicle_hdl)
  _vehicle_hdl:setBaseSpeed(0)
  _vehicle_hdl:setWorldTransform(findGameObject2("Node", "locator2_ve_01"):getWorldTransform())
  _vehicle_hdl:procFloat(false)
  Fn_findNpc("brahman"):disableCollision()
  Fn_loadNpcEventMotion("brahman", _bra01_mot_list)
  Fn_playNpcEventMotion("brahman", _bra01_mot_list.speech, true)
end
function changeCatWarpPoint(A0_7)
  _cat_warp_node = A0_7
  Fn_setCatWarpCheckPoint(_cat_warp_node)
end
function escapeNpc()
  invokeTask(function()
    while Fn_isInSightTarget(_puppet_tbl.gurigo_a_npc01, 1) or not (Fn_getDistanceToPlayer(_puppet_tbl.gurigo_a_npc01) > 30) do
      wait()
    end
    Fn_disappearNpc("gurigo_a_npc01")
  end)
  invokeTask(function()
    while Fn_isInSightTarget(_puppet_tbl.gurigo_a_npc02, 1) or not (Fn_getDistanceToPlayer(_puppet_tbl.gurigo_a_npc02) > 30) do
      wait()
    end
    Fn_disappearNpc("gurigo_a_npc02")
  end)
end
