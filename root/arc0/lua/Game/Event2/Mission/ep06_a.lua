dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/balloon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
import("Vehicle")
_global = {
  puppet_tbl = {},
  catwarp_navi = false,
  cid_talk = false
}
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_disappearNpc
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOff
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    L1_1,
    L2_2,
    {
      name = "rich_01_mam",
      type = "wom28",
      node = "locator2_rich_01_mam",
      active = false,
      reset = false
    },
    {
      name = "rich_02",
      type = "wom29",
      node = "locator2_rich_02_01",
      active = false,
      reset = false
    }
  }
  L1_1.name = "ep06_cid_01"
  L1_1.type = "cid01"
  L1_1.node = "locator2_cid_02"
  L1_1.reset = false
  L2_2.name = "rich_01_child"
  L2_2.type = "chi16"
  L2_2.node = "locator2_rich_01_child"
  L2_2.active = false
  L2_2.reset = false
  L1_1(L2_2)
  for _FORV_4_, _FORV_5_ in L1_1(L2_2) do
    _global.puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1.ep06_madam_01 = L2_2
  L1_1.ep06_cid_01 = L2_2
  L1_1.hurt = "wom01_trouble_00"
  L1_1.agree = "wom01_talk_agree_00"
  L2_2.b_talk = "chi01_balloon_talk_00"
  L2_2.b_glad = "chi01_balloon_glad_00"
  Fn_loadNpcEventMotion("rich_01_mam", L1_1)
  Fn_loadNpcEventMotion("rich_01_child", L2_2)
end
function Ingame()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18, L16_19
  L0_3 = {L1_4}
  L1_4 = Player
  L1_4 = L1_4.kAbility_Grab
  L1_4 = Fn_lockPlayerAbility
  L2_5 = L0_3
  L3_6 = nil
  L1_4(L2_5, L3_6)
  L1_4 = Fn_setCatWarp
  L2_5 = false
  L1_4(L2_5)
  L1_4 = anoterCatWarp
  L1_4()
  L1_4 = Fn_setCatWarpCheckPoint
  L2_5 = "locator2_pc_start_pos"
  L1_4(L2_5)
  while true do
    L1_4 = Vehicle
    L2_5 = L1_4
    L1_4 = L1_4.isReady
    L1_4 = L1_4(L2_5)
    if not L1_4 then
      L1_4 = wait
      L1_4()
    end
  end
  L1_4 = {
    L2_5,
    [16] = L3_6(L4_7)
  }
  L2_5 = findGameObject2
  L3_6 = "Node"
  L4_7 = "locator2_cid_ship_02"
  L2_5 = L2_5(L3_6, L4_7)
  L3_6 = L2_5
  L2_5 = L2_5.getWorldPos
  L2_5 = L2_5(L3_6)
  L3_6 = findGameObject2
  L4_7 = "Node"
  L5_8 = "locator2_cid_02"
  L3_6 = L3_6(L4_7, L5_8)
  L4_7 = L3_6
  L3_6 = L3_6.getWorldPos
  L16_19 = L3_6(L4_7)
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[2] = L3_6
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[3] = L4_7
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[4] = L5_8
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[5] = L6_9
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[6] = L7_10
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[7] = L8_11
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[8] = L9_12
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[9] = L10_13
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[10] = L11_14
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[11] = L12_15
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[12] = L13_16
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[13] = L14_17
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[14] = L15_18
  ;({
    L2_5,
    [16] = L3_6(L4_7)
  })[15] = L16_19
  pos_route_tbl = L1_4
  L1_4 = Mv_createScriptVehicle
  L2_5 = pos_route_tbl
  L3_6 = "ForEp00Viecle"
  L4_7 = "ship_01"
  L5_8 = "locator2_cid_ship_02"
  L1_4 = L1_4(L2_5, L3_6, L4_7, L5_8)
  L3_6 = L1_4
  L2_5 = L1_4.setBaseSpeed
  L4_7 = 0
  L2_5(L3_6, L4_7)
  L2_5 = Fn_missionStart
  L2_5()
  L2_5 = Fn_pcSensorOff
  L3_6 = "pccubesensor2_next_part_01"
  L2_5(L3_6)
  L2_5 = Fn_playMotionNpc
  L3_6 = "ep06_cid_01"
  L4_7 = "stay"
  L5_8 = false
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = Fn_turnNpc
  L3_6 = "ep06_madam_01"
  L2_5(L3_6)
  L2_5 = waitSeconds
  L3_6 = 1
  L2_5(L3_6)
  L2_5 = Fn_kaiwaDemoView
  L3_6 = "ep06_00105k"
  L2_5(L3_6)
  L2_5 = Fn_userCtrlOn
  L2_5()
  L2_5 = Fn_pcSensorOn
  L3_6 = "pccubesensor2_rich_01_home"
  L2_5(L3_6)
  L2_5 = Fn_setNpcActive
  L3_6 = "rich_01_child"
  L4_7 = true
  L2_5(L3_6, L4_7)
  L2_5 = Fn_setNpcActive
  L3_6 = "rich_01_mam"
  L4_7 = true
  L2_5(L3_6, L4_7)
  L2_5 = Fn_pcSensorOff
  L3_6 = "pccubesensor2_rich_01"
  L2_5(L3_6)
  L2_5 = Fn_playMotionNpc
  L3_6 = "rich_01_child"
  L4_7 = "cry_00"
  L5_8 = false
  L2_5(L3_6, L4_7, L5_8)
  L2_5 = Fn_playNpcEventMotion
  L3_6 = "rich_01_mam"
  L4_7 = "wom01_trouble_00"
  L5_8 = true
  L6_9 = 0
  L7_10 = false
  L2_5(L3_6, L4_7, L5_8, L6_9, L7_10)
  L2_5 = Fn_missionView
  L3_6 = "ep06_00101"
  L2_5(L3_6)
  L2_5 = waitSeconds
  L3_6 = NAVI_WAIT
  L2_5(L3_6)
  L2_5 = Fn_naviSet
  L3_6 = findGameObject2
  L4_7 = "Node"
  L5_8 = "locator2_rich_01_home"
  L16_19 = L3_6(L4_7, L5_8)
  L2_5(L3_6, L4_7, L5_8, L6_9, L7_10, L8_11, L9_12, L10_13, L11_14, L12_15, L13_16, L14_17, L15_18, L16_19, L3_6(L4_7, L5_8))
  L2_5 = waitSeconds
  L3_6 = 2.5
  L2_5(L3_6)
  L2_5 = {L3_6}
  L3_6 = Player
  L3_6 = L3_6.kAbility_Grab
  L3_6 = Fn_unLockPlayerAbility
  L4_7 = L2_5
  L5_8 = nil
  L3_6(L4_7, L5_8)
  L3_6 = Fn_captionViewWait
  L4_7 = "ep06_00100"
  L3_6(L4_7)
  L3_6 = invokeTask
  function L4_7()
    Fn_turnNpc("ep06_madam_01", _global.puppet_tbl.ep06_cid_01)
    Fn_playMotionNpc("ep06_madam_01", "talk_cid_03", false)
    Fn_playMotionNpc("ep06_cid_01", "talk_lady_01", false)
    waitSeconds(3)
    Fn_pcSensorOn("pccubesensor2_talk_01")
    waitSeconds(1)
    while true do
      if _global.cid_talk == true then
        if 0 == 0 then
          Fn_captionViewWait("ep06_00102")
        elseif 0 + 1 == 1 then
          Fn_captionViewWait("ep06_00103")
        elseif 0 + 1 + 1 == 2 then
          Fn_captionViewWait("ep06_00104")
        else
          Fn_captionViewWait("ep06_00105")
          break
        end
      end
      waitSeconds(2)
    end
  end
  L3_6(L4_7)
  L3_6 = invokeTask
  function L4_7()
    while true do
      Sound:playSE("w10_917", 1, "", _global.puppet_tbl.rich_01_child)
      waitSeconds(math.random(6, 10) * 0.3)
      wait()
    end
  end
  L3_6 = L3_6(L4_7)
  L4_7 = invokeTask
  function L5_8()
    while true do
      waitSeconds(math.random(8, 12) * 1)
      Sound:playSE("w08_916", 1, "", _global.puppet_tbl.rich_01_mam)
      wait()
    end
  end
  L4_7 = L4_7(L5_8)
  L5_8 = false
  while true do
    L6_9 = Fn_getDistanceToPlayer
    L7_10 = "locator2_rich_01_child"
    L6_9 = L6_9(L7_10)
    L7_10 = findGameObject2
    L8_11 = "Node"
    L9_12 = "locator2_rich_01_child"
    L7_10 = L7_10(L8_11, L9_12)
    if L6_9 < 25 then
      L8_11 = Fn_isInSightTarget
      L9_12 = L7_10
      L8_11 = L8_11(L9_12)
      if L8_11 then
        L8_11 = Player
        L9_12 = L8_11
        L8_11 = L8_11.setStay
        L10_13 = true
        L8_11(L9_12, L10_13)
        L8_11 = Player
        L9_12 = L8_11
        L8_11 = L8_11.setControl
        L10_13 = Player
        L10_13 = L10_13.kControl_All
        L11_14 = false
        L8_11(L9_12, L10_13, L11_14)
        L8_11 = Camera
        L9_12 = L8_11
        L8_11 = L8_11.setControl
        L10_13 = Camera
        L10_13 = L10_13.kPlayer
        L11_14 = Camera
        L11_14 = L11_14.kControl_All
        L12_15 = false
        L8_11(L9_12, L10_13, L11_14, L12_15)
        L8_11 = Fn_captionView
        L9_12 = "ep06_00146"
        L8_11(L9_12)
        L8_11 = Fn_lookAtObjectWait
        L9_12 = L7_10
        L10_13 = 0
        L11_14 = 0.02
        L8_11(L9_12, L10_13, L11_14)
        L8_11 = Fn_captionView
        L9_12 = "ep06_00147"
        L8_11(L9_12)
        L8_11 = Fn_naviKill
        L8_11()
        L8_11 = Fn_pcSensorOff
        L9_12 = "pccubesensor2_rich_01_home"
        L8_11(L9_12)
        L8_11 = Fn_naviSet
        L9_12 = L7_10
        L8_11(L9_12)
        L8_11 = Fn_pcSensorOn
        L9_12 = "pccubesensor2_rich_01"
        L8_11(L9_12)
        L8_11 = Player
        L9_12 = L8_11
        L8_11 = L8_11.setControl
        L10_13 = Player
        L10_13 = L10_13.kControl_All
        L11_14 = true
        L8_11(L9_12, L10_13, L11_14)
        L8_11 = Camera
        L9_12 = L8_11
        L8_11 = L8_11.setControl
        L10_13 = Camera
        L10_13 = L10_13.kPlayer
        L11_14 = Camera
        L11_14 = L11_14.kControl_All
        L12_15 = true
        L8_11(L9_12, L10_13, L11_14, L12_15)
        L8_11 = Player
        L9_12 = L8_11
        L8_11 = L8_11.setStay
        L10_13 = false
        L8_11(L9_12, L10_13)
        L5_8 = true
        break
      end
    end
    L8_11 = wait
    L8_11()
  end
  L6_9 = Mv_waitPhase
  L6_9()
  L6_9 = Fn_naviKill
  L6_9()
  L6_9 = Fn_pcSensorOff
  L7_10 = "pccubesensor2_rich_01"
  L6_9(L7_10)
  L6_9 = Fn_setCatWarpCheckPoint
  L7_10 = "locator2_rich_01_home"
  L6_9(L7_10)
  L6_9 = Fn_pcSensorOff
  L7_10 = "pccubesensor2_talk_01"
  L6_9(L7_10)
  L6_9 = waitSeconds
  L7_10 = 1
  L6_9(L7_10)
  L6_9 = wait
  L6_9()
  L6_9 = Fn_setNpcActive
  L7_10 = "ep06_madam_01"
  L8_11 = false
  L6_9(L7_10, L8_11)
  L6_9 = Fn_setNpcActive
  L7_10 = "ep06_cid_01"
  L6_9(L7_10)
  L6_9 = Fn_setNpcActive
  L7_10 = "ep06_ve02"
  L6_9(L7_10)
  L7_10 = L1_4
  L6_9 = L1_4.setVisible
  L8_11 = false
  L6_9(L7_10, L8_11)
  L6_9 = Fn_kaiwaDemoView
  L7_10 = "ep06_00110k"
  L6_9(L7_10)
  L6_9 = Fn_pcSensorOn
  L7_10 = "pccubesensor2_balloon_search_01"
  L6_9(L7_10)
  L6_9 = Balloon
  L6_9 = L6_9.create
  L7_10 = "_balloon_name"
  L6_9 = L6_9(L7_10)
  _balloon = L6_9
  L6_9 = _balloon
  L7_10 = L6_9
  L6_9 = L6_9.start
  L6_9(L7_10)
  L6_9 = 0
  L7_10 = 0
  L8_11 = false
  L9_12 = false
  function L10_13()
    Fn_naviKill()
    Fn_captionView("ep06_00120")
    Fn_pcSensorOff("pccubesensor2_balloon_search_01")
    Fn_pcSensorOn("pccubesensor2_balloon_clear_01")
    Fn_naviSet(findGameObject2("Node", "locator2_rich_01_child"))
    L9_12 = true
    if not L8_11 then
      L8_11 = true
    end
  end
  L11_14 = findGameObject2
  L12_15 = "Node"
  L13_16 = "locator2_balloon_01"
  L11_14 = L11_14(L12_15, L13_16)
  L13_16 = L11_14
  L12_15 = L11_14.getWorldPos
  L12_15 = L12_15(L13_16)
  L13_16 = _balloon
  L13_16 = L13_16.puppet
  L14_17 = L13_16
  L13_16 = L13_16.setWorldPos
  L15_18 = L12_15
  L13_16(L14_17, L15_18)
  L13_16 = _balloon
  L14_17 = L13_16
  L13_16 = L13_16.move
  L15_18 = nil
  L16_19 = L10_13
  L13_16(L14_17, L15_18, L16_19)
  L13_16 = _global
  L13_16.catwarp_navi = false
  L13_16 = Fn_missionViewWait
  L14_17 = "ep06_00121"
  L13_16(L14_17)
  L13_16 = Fn_captionView
  L14_17 = "ep06_00122"
  L13_16(L14_17)
  L13_16 = invokeTask
  function L14_17()
    while not L8_11 do
      if Fn_getDistanceToPlayer(L12_15) > 20 then
        if L6_9 >= 30 and L6_9 < 31 then
          Fn_captionView("ep06_00123")
          L7_10 = L7_10 + 1
        elseif L6_9 >= 60 and L6_9 < 61 then
          Fn_captionView("ep06_00124")
          L7_10 = L7_10 + 1
        elseif L6_9 >= 90 and L6_9 < 91 then
          Fn_captionView("ep06_00125")
          L7_10 = L7_10 + 1
        end
        waitSeconds(1)
        L6_9 = L6_9 + 1
      end
      wait()
    end
  end
  L13_16(L14_17)
  L13_16 = invokeTask
  function L14_17()
    if Fn_getDistanceToPlayer(L12_15) <= 20 and Fn_isInSightTarget("locator2_balloon_01", 1) then
      while not L8_11 do
        Fn_captionViewWait("ep06_00126")
        wait()
        if not L9_12 then
          Fn_naviSet(findGameObject2("Node", "locator2_balloon_01"))
        end
        L8_11 = true
        do break end
        wait()
      end
    end
  end
  L13_16 = L13_16(L14_17)
  L14_17 = Mv_waitPhase
  L14_17()
  L14_17 = Mv_safeTaskAbort
  L15_18 = L13_16
  L14_17 = L14_17(L15_18)
  L13_16 = L14_17
  L14_17 = Mv_safeTaskAbort
  L15_18 = L3_6
  L14_17 = L14_17(L15_18)
  L3_6 = L14_17
  L14_17 = Mv_safeTaskAbort
  L15_18 = L4_7
  L14_17 = L14_17(L15_18)
  L4_7 = L14_17
  L14_17 = Fn_naviKill
  L14_17()
  L14_17 = Fn_blackout
  L14_17()
  L14_17 = Fn_userCtrlAllOff
  L14_17()
  L14_17 = Fn_resetPcPos
  L15_18 = "locator2_baloon_reset_01"
  L14_17(L15_18)
  L14_17 = Fn_warpNpc
  L15_18 = "rich_01_child"
  L16_19 = "locator2_reset_child"
  L14_17(L15_18, L16_19)
  L14_17 = Fn_warpNpc
  L15_18 = "rich_01_mam"
  L16_19 = "locator2_reset_mam"
  L14_17(L15_18, L16_19)
  L14_17 = _balloon
  L15_18 = L14_17
  L14_17 = L14_17.attachJoint
  L16_19 = _global
  L16_19 = L16_19.puppet_tbl
  L16_19 = L16_19.rich_01_child
  L14_17(L15_18, L16_19, "loc_l_hand")
  L14_17 = Fn_playMotionNpc
  L15_18 = "rich_01_child"
  L16_19 = "balloon_stay"
  L14_17(L15_18, L16_19, false)
  L14_17 = Fn_playMotionNpc
  L15_18 = "rich_01_mam"
  L16_19 = "stay"
  L14_17(L15_18, L16_19, false)
  L14_17 = waitSeconds
  L15_18 = 1
  L14_17(L15_18)
  L14_17 = Fn_fadein
  L14_17()
  L14_17 = Sound
  L15_18 = L14_17
  L14_17 = L14_17.playSE
  L16_19 = "w10_919a"
  L14_17(L15_18, L16_19, 1, "", _global.puppet_tbl.rich_01_child)
  L14_17 = waitSeconds
  L15_18 = 1
  L14_17(L15_18)
  L14_17 = Fn_kaiwaDemoView
  L15_18 = "ep06_00120k"
  L14_17(L15_18)
  L14_17 = Fn_userCtrlOn
  L14_17()
  L14_17 = {}
  L14_17.isStop = true
  L14_17.animBlendDuration = 0.25
  L15_18 = invokeTask
  function L16_19()
    local L0_20
    L0_20 = {
      "talk_02",
      "reply_yes",
      "wom01_talk_agree_00"
    }
    Fn_turnNpc("rich_01_mam", _global.puppet_tbl.rich_01_child)
    while true do
      for _FORV_4_ = 1, #L0_20 do
        Fn_playMotionNpc("rich_01_mam", L0_20[_FORV_4_], true, L14_17)
      end
      _FOR_()
    end
  end
  L15_18 = L15_18(L16_19)
  L16_19 = invokeTask
  L16_19 = L16_19(function()
    local L0_21
    L0_21 = {
      "chi01_balloon_glad_00",
      "chi01_balloon_talk_00",
      "chi01_balloon_talk_00"
    }
    Fn_turnNpc("rich_01_child", _global.puppet_tbl.rich_01_mam)
    while true do
      for _FORV_4_ = 1, #L0_21 do
        Fn_playMotionNpc("rich_01_child", L0_21[_FORV_4_], true, L14_17)
      end
      _FOR_()
    end
  end)
  Fn_captionViewWait("ep06_00133")
  Fn_missionView("ep06_00114")
  waitSeconds(NAVI_WAIT)
  Fn_setNpcActive("rich_02", true)
  Fn_playMotionNpc("rich_02", "stay_03", false)
  Fn_naviSet(findGameObject2("Node", "locator2_rich_02_01"))
  Fn_pcSensorOff("pccubesensor2_warp_warning_01")
  Fn_pcSensorOff("pccubesensor2_warp_area_01")
  Fn_pcSensorOn("pccubesensor2_warp_warning_02")
  Fn_pcSensorOn("pccubesensor2_warp_area_02")
  Fn_pcSensorOn("pccubesensor2_rich_02_01")
  Mv_waitPhase()
  L15_18 = Mv_safeTaskAbort(L15_18)
  L16_19 = Mv_safeTaskAbort(L16_19)
  Fn_setNpcActive("rich_01_child", false)
  Fn_setNpcActive("rich_01_mam", false)
  Fn_pcSensorOff("pccubesensor2_rich_02_01")
  Fn_naviKill()
  Fn_turnNpc("rich_02")
  Fn_playMotionNpc("rich_02", "stay_03", false)
  Fn_kaiwaDemoView("ep06_00130k")
  Fn_sendEventComSb("setPrevPhaseContinue", true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_22, L1_23
end
function pccubesensor2_talk_01_OnEnter()
  _global.cid_talk = true
  print("pccubesensor2_talk_01_OnEnter")
end
function pccubesensor2_talk_01_OnLeave()
  _global.cid_talk = false
  print("pccubesensor2_talk_01_OnLeave")
  Fn_captionViewEnd()
end
function pccubesensor2_rich_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_balloon_search_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "pccubesensor2_balloon_search_01"))
  Fn_captionView("ep06_00131")
end
function pccubesensor2_balloon_search_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_balloon_clear_01_OnEnter()
  Mv_gotoNextPhase()
  Fn_pcSensorOff("pccubesensor2_balloon_clear_01")
end
function pccubesensor2_rich_01_home_01_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_rich_01_home")
  notFoundMsg()
end
function pccubesensor2_rich_01_home_01_OnLeave()
  local L0_24, L1_25
end
function pccubesensor2_rich_02_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_warp_warning_01_OnLeave()
  invokeTask(function()
    if _global.catwarp_navi == true then
      Fn_naviSet(findGameObject2("Node", "pccubesensor2_balloon_search_01"))
    end
    Player:setStay(true)
    Fn_captionViewWait("ep06_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_warning_01_OnEnter()
  if _global.catwarp_navi == true then
    Fn_naviKill()
  end
end
function pccubesensor2_warp_warning_02_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep06_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_area_01_OnLeave()
  runCatWarp()
end
function pccubesensor2_warp_area_02_OnLeave()
  runCatWarp()
end
function notFoundMsg()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_rich_01_home")
    Fn_captionViewWait("ep06_00150")
    Fn_captionViewWait("ep06_00151")
    _global.catwarp_navi = true
  end)
end
function raceOutrangeOnLeave()
  runCatWarp()
end
