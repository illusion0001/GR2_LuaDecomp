dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm31_common.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Mob/mob_event_util.lua")
CUSTOMER_STAGE = 1
enemy_gen = {}
puppets = {}
sdemo = nil
move_task = nil
count_task = nil
sm31_costume_pdemo = nil
is_in_sensor = false
_foodcart_hdl = nil
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    "evarea2_dt_a_root"
  }
  Fn_loadEventData("evx/sm31_header", L0_0, true)
  Fn_setupNpc(customers_setting_table[CUSTOMER_STAGE])
  for _FORV_4_, _FORV_5_ in pairs(customers_setting_table[CUSTOMER_STAGE]) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  sm31_KitInit()
  sm31_CustomersInit()
  sdemo = SDemo.create("sm31_sdemo")
  sm31_costume_pdemo = PDemo.create("kit08_cow_00", findGameObject2("Node", "locator2_pc_coschange"), {camera = true, scene_param = false})
  Mob:letStateMode(Mob.StateMode.kNoAccessory, true)
  _foodcart_hdl = findGameObject2("GimmickBg", "bg2_yuji_foodcart")
  _foodcart_hdl:setVisibleBlockEnable(false)
  _foodcart_hdl:setCollidableBlockEnable(false)
  Mob:restrict_sm31_00(true)
  RAC_side_setupShopNpc()
  Fn_userCtrlOn()
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  while true do
    L0_1 = sm31_costume_pdemo
    L0_1 = L0_1.isLoading
    L0_1 = L0_1(L1_2)
    if L0_1 == false then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_turnNpc
  L7_8 = L2_3(L3_4)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L2_3(L3_4))
  L0_1 = Fn_turnNpc
  L7_8 = L2_3(L3_4)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L2_3(L3_4))
  L0_1 = Fn_kaiwaDemoView
  L0_1(L1_2)
  L0_1 = Fn_blackout
  L0_1()
  L0_1 = _foodcart_hdl
  L0_1 = L0_1.setWorldTransform
  L4_5 = "locator2_yuji_foodcart_pos_01"
  L7_8 = L2_3(L3_4)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L2_3(L3_4))
  L0_1 = Player
  L0_1 = L0_1.setAttrTune
  L0_1 = L0_1(L1_2, L2_3)
  if L0_1 == true then
    L1_2(L2_3)
  end
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L1_2()
  while true do
    if L1_2 == false then
      L1_2()
    end
  end
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L1_2()
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L0_1 = Player
  L0_1 = L0_1.setStay
  L0_1(L1_2, L2_3)
  L0_1 = Fn_loadPlayerMotion
  L0_1(L1_2)
  L0_1 = sm31_CustomersSet
  L0_1(L1_2)
  L0_1 = sm31_KitChangeIce
  L0_1(L1_2)
  L0_1 = sdemo
  L0_1 = L0_1.reset
  L0_1(L1_2)
  L0_1 = sdemo
  L0_1 = L0_1.set
  L4_5 = false
  L5_6 = Vector
  L6_7 = 0
  L7_8 = 1.5
  L7_8 = L5_6(L6_7, L7_8, 0)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L5_6(L6_7, L7_8, 0))
  L0_1 = sdemo
  L0_1 = L0_1.play
  L0_1(L1_2)
  L0_1 = Fn_fadein
  L0_1()
  L0_1 = sdemo
  L0_1 = L0_1.play
  L3_4.pos = "locator2_cam_advertising_02"
  L3_4.time = 3
  L3_4.hashfunc = "easeInOut"
  L4_5 = {}
  L4_5.pos = "locator2_aim_advertising_02"
  L4_5.time = 3
  L4_5.hashfunc = "easeInOut"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_captionViewWait
  L0_1(L1_2)
  L0_1 = Fn_captionViewWait
  L0_1(L1_2)
  L0_1 = sdemo
  L0_1 = L0_1.stop
  L0_1(L1_2, L2_3)
  L0_1 = waitSeconds
  L0_1(L1_2)
  L0_1 = RAC_infoView
  L0_1(L1_2)
  L0_1 = Fn_setBgmPoint
  L0_1(L1_2, L2_3)
  L0_1 = waitSeconds
  L0_1(L1_2)
  L0_1 = Fn_missionView
  L0_1(L1_2)
  L0_1 = Fn_countDown
  L0_1()
  L0_1 = Fn_setBgmPoint
  L0_1(L1_2, L2_3)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = sm31_Advertising_Part
  L0_1(L1_2, L2_3)
  L0_1 = sm31_TaskAbort
  L0_1(L1_2)
  L0_1 = sm31_CustomersDel
  L0_1()
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_resetPcPos
  L0_1(L1_2)
  L0_1 = 0
  for L4_5 = 1, 10 do
    L5_6 = Fn_setNpcActive
    L6_7 = "customers_"
    L7_8 = string
    L7_8 = L7_8.format
    L7_8 = L7_8("%02d", L4_5)
    L6_7 = L6_7 .. L7_8
    L7_8 = true
    L5_6(L6_7, L7_8)
    L5_6 = Fn_warpNpc
    L6_7 = "customers_"
    L7_8 = string
    L7_8 = L7_8.format
    L7_8 = L7_8("%02d", L4_5)
    L6_7 = L6_7 .. L7_8
    L7_8 = "locator2_flock_customer_"
    L7_8 = L7_8 .. string.format("%02d", L4_5) .. "_03"
    L5_6(L6_7, L7_8)
    L5_6 = Fn_watchNpc
    L6_7 = "customers_"
    L7_8 = string
    L7_8 = L7_8.format
    L7_8 = L7_8("%02d", L4_5)
    L6_7 = L6_7 .. L7_8
    L7_8 = false
    L5_6(L6_7, L7_8)
    L5_6 = wait
    L5_6()
    L5_6 = L0_1 % 3
    if L5_6 == 0 then
      L5_6 = RandI
      L6_7 = L4_5 - 2
      L7_8 = L4_5
      L5_6 = L5_6(L6_7, L7_8)
      if L5_6 < 1 then
        L5_6 = 1
      end
      L6_7 = Fn_getRandamNpcType
      L7_8 = customers_setting_table
      L7_8 = L7_8[CUSTOMER_STAGE]
      L7_8 = L7_8[L5_6]
      L7_8 = L7_8.name
      L6_7 = L6_7(L7_8)
      L7_8 = string
      L7_8 = L7_8.find
      L7_8 = L7_8(L6_7, "man")
      if L7_8 ~= nil then
        tm = 1
      end
      L7_8 = string
      L7_8 = L7_8.find
      L7_8 = L7_8(L6_7, "wom")
      if L7_8 ~= nil then
        tm = 2
      end
      L7_8 = string
      L7_8 = L7_8.find
      L7_8 = L7_8(L6_7, "chi")
      if L7_8 ~= nil then
        tm = 3
      end
      L7_8 = string
      L7_8 = L7_8.find
      L7_8 = L7_8(L6_7, "kid")
      if L7_8 ~= nil then
        tm = 3
      end
      L7_8 = math
      L7_8 = L7_8.random
      L7_8 = L7_8(1, RAC_GetTableLength(_line_up_motion[tm]))
      Fn_playMotionNpc(customers_setting_table[CUSTOMER_STAGE][L5_6].name, _line_up_motion[tm]["sm31c_mot" .. string.format("%02d", L7_8)], false)
    end
    L0_1 = L0_1 + 1
  end
  L1_2()
  L1_2(L2_3)
  L4_5 = "locator2_client_movepoint"
  L5_6 = false
  L6_7 = Vector
  L7_8 = 0
  L7_8 = L6_7(L7_8, 1.5, 0)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L6_7(L7_8, 1.5, 0))
  L1_2(L2_3)
  L1_2()
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2(L2_3)
  L4_5 = {}
  L4_5.pos = "locator2_stageclear_cam_02"
  L4_5.time = 2
  L4_5.hashfunc = "EaseInOut"
  L4_5 = {L5_6}
  L5_6 = {}
  L5_6.pos = "locator2_stageclear_aim_01"
  L5_6.time = 2
  L5_6.hashfunc = "EaseInOut"
  L1_2(L2_3, L3_4, L4_5)
  while true do
    if L1_2 then
      L1_2()
    end
  end
  L1_2(L2_3)
  L1_2(L2_3)
  L1_2()
  L1_2()
  L1_2()
  L1_2()
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
