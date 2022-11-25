dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm31_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
CUSTOMER_STAGE = 2
enemy_gen = {}
puppets = {}
sdemo = nil
move_task = nil
count_task = nil
is_in_sensor = false
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    {
      name = "sdemo02_kali",
      node = "locator2_sdemo02_Kali",
      type = "cow01"
    }
  }
  Fn_setupNpc(customers_setting_table[CUSTOMER_STAGE])
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(customers_setting_table[CUSTOMER_STAGE]) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_findNpcPuppet("sdemo02_kali"):loadPoseAnimation("stay", "cow01_stay_01")
  sm31_KitInit()
  sm31_CustomersInit()
  sdemo = SDemo.create("sm31_b_sdemo")
  Mob:letStateMode(Mob.StateMode.kNoAccessory, true)
  Mob:restrict_sm31_00(true)
  RAC_side_setupShopNpc()
  _foodcart_hdl = findGameObject2("GimmickBg", "bg2_yuji_foodcart")
  _foodcart_hdl:setVisibleBlockEnable(false)
  _foodcart_hdl:setCollidableBlockEnable(false)
end
function Ingame()
  local L0_1, L1_2
  L0_1 = sm31_KitChangeIce
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = "npcgen2_kali_01"
  L1_2 = Fn_setNpcVisible
  L1_2(L0_1, true)
  L1_2 = Fn_warpNpc
  L1_2(L0_1, "locator2_sdemo02_Kali")
  L1_2 = RAC_setCostumeWait
  L1_2("kit08", "locator2_pc_start_pos")
  L1_2 = Fn_disableCostumeChange
  L1_2(true)
  L1_2 = Fn_loadPlayerMotion
  L1_2(_event_pc_motion_table)
  L1_2 = Fn_warpNpc
  L1_2("sm31_client", "locator2_client_movepoint")
  L1_2 = Fn_userCtrlAllOff
  L1_2()
  L1_2 = sm31_CustomersSet
  L1_2(true)
  L1_2 = Fn_resetPcPos
  L1_2("locator2_advertising_start_pos")
  L1_2 = sdemo
  L1_2 = L1_2.reset
  L1_2(L1_2)
  L1_2 = sdemo
  L1_2 = L1_2.set
  L1_2(L1_2, "locator2_cam_advertising", "locator2_aim_advertising_01", false, Vector(0, 1.5, 0))
  L1_2 = sdemo
  L1_2 = L1_2.setCameraParam
  L1_2(L1_2, nil, 0.1, {deg = 44})
  L1_2 = sdemo
  L1_2 = L1_2.play
  L1_2(L1_2)
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = waitSeconds
  L1_2(1)
  L1_2 = Fn_captionView
  L1_2("sm31_01000")
  L1_2 = sdemo
  L1_2 = L1_2.stop
  L1_2(L1_2, 2)
  L1_2 = waitSeconds
  L1_2(2)
  L1_2 = Fn_findNpc
  L1_2 = L1_2("sdemo02_kali")
  Fn_captionView("sm31_01001")
  sdemo:reset()
  sdemo:set("locator2_sdemo02_cam_01", "locator2_sdemo_Kali_aim_01", false)
  sdemo:play()
  waitSeconds(1.5)
  Player:setLookAtIk(true, 1, L1_2:getPuppet():getWorldPos() + Vector(0, 1.5, 0))
  waitSeconds(2)
  Fn_kaiwaDemoView("sm31_00400k")
  lookat_flag = false
  sdemo:play({
    {
      pos = "locator2_sdemo02_cam_02",
      time = 5,
      hashfunc = "Linear"
    }
  }, {
    {
      pos = "locator2_sdemo_Kali_aim_02",
      time = 5,
      hashfunc = "Linear"
    }
  })
  waitSeconds(1.5)
  Sound:playSE("kit043c", 1)
  Fn_captionViewWait("sm31_01002")
  Fn_captionView("sm31_01003")
  while sdemo:isPlay() do
    wait()
  end
  Fn_resetPcPos("locator2_advertising_start_pos")
  sdemo:play({
    {
      pos = "locator2_sdemo02_cam_03",
      time = 2.5,
      hashfunc = "Linear"
    }
  }, {
    {
      pos = "locator2_sdemo_Kali_aim_03",
      time = 1.25,
      hashfunc = "Linear"
    },
    {
      pos = "locator2_sdemo_Kali_aim_04",
      time = 1.25,
      hashfunc = "Linear"
    }
  })
  while sdemo:isPlay() do
    wait()
  end
  sdemo:stop(1)
  L1_2 = Fn_fadein
  L1_2()
  L1_2 = Fn_setBgmPoint
  L1_2("event", "eventpri")
  L1_2 = findGameObject2
  L1_2 = L1_2("Node", "locator2_aim_advertising_01")
  look_task = RAC_LookAtObject(L1_2, 2)
  Fn_missionView("sm31_01004")
  Fn_countDown()
  Fn_setBgmPoint("event", "eventstart")
  Fn_userCtrlOn()
  sm31_Advertising_Part("locator2_advertising_start_pos")
  sm31_TaskAbort(false)
  sm31_CustomersDel()
  Fn_resetPcPos("locator2_advertising_goal_pos")
  Fn_warpNpc("sm31_client", "locator2_ojin_clear_goal")
  Fn_userCtrlAllOff()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:restrict_sm31_00(false)
  sm31_KitFinalize()
  sm31_TaskAbort(false)
  sm31_disappearNpc()
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
  RAC_side_endShopNpcTask()
  sm31_endOjinMotion()
  sm31_endEugMotion()
  Fn_disableCostumeChange(false)
end
function pccubesensor2_next_advertising_point_01_OnEnter()
  local L0_3, L1_4
  is_in_sensor = true
end
function pccubesensor2_next_advertising_point_01_OnLeave()
  local L0_5, L1_6
  is_in_sensor = false
end
