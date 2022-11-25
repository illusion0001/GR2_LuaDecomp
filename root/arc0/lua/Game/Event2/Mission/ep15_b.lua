dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
GRI02_EVENT_DIST01 = 10
GRI02_SPEED = 0.9
_puppet_tbl = {}
_sdemo = nil
_grigo_failed = false
_grigo_move_task = nil
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    {
      name = "gri02",
      type = "mcgri",
      node = "locator2_grigoB_st_01"
    },
    {
      name = "kaji",
      type = "kaj01",
      node = "locator2_kaji_pos",
      active = true
    },
    {
      name = "police1",
      type = "man31",
      node = "locator2_police1_pos",
      active = true
    },
    {
      name = "police2",
      type = "man31",
      node = "locator2_police2_pos",
      active = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  setNpcSenser(_puppet_tbl.gri02, Vector(2, 2, 2), "pccubesensor2_grigoB_01")
  Fn_pcSensorOff("pccubesensor2_grigoB_01")
  Fn_pcSensorOff("pccubesensor2_plaza_grigoB_event_01")
  Fn_setNpcActive("gri02", false)
  Mob:letStateMode(Mob.StateMode.kGrigoSuspend, true)
  _sdemo = SDemo.create("ep15_b_sdemo")
  Mob:restrictNav_ep15_00(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7
  L0_1 = Fn_setNpcActive
  L1_2 = "ep15_pol_01"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_setNpcActive
  L1_2 = "bulbosa"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = GameDatabase
  L1_2 = L0_1
  L0_1 = L0_1.get
  L2_3 = ggd
  L2_3 = L2_3.EventFlags__ep15__flag01
  L0_1 = L0_1(L1_2, L2_3)
  if L0_1 == 0 then
    L0_1 = Fn_kaiwaDemoView
    L1_2 = "ep15_00111k"
    L0_1(L1_2)
  end
  L0_1 = Fn_sendEventComSb
  L1_2 = "changeCatWarpPoint"
  L2_3 = "locator2_restart_b_01"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setStay
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = findGameObject2
  L1_2 = "Node"
  L2_3 = "locator2_grigoB_event_navi_01"
  L0_1 = L0_1(L1_2, L2_3)
  L1_2 = RAC_missionNaviCaptionWait
  L2_3 = "ep15_01000"
  L3_4 = L0_1
  L4_5 = nil
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = invokeTask
  function L2_3()
    local L0_8
    while true do
      L0_8 = Fn_getDistanceToPlayer
      L0_8 = L0_8(L0_1)
      if L0_8 < GRI02_EVENT_DIST01 then
        L0_8 = Fn_naviKill
        L0_8()
        L0_8 = Mob
        L0_8 = L0_8.makeSituationPanic
        L0_8(L0_8, false)
        L0_8 = Fn_captionViewWait
        L0_8("ep15_01001")
        L0_8 = findGameObject2
        L0_8 = L0_8("Node", "locator2_plaza_viewpoint_01")
        RAC_LookAtObjectWait(L0_8, nil, DEF_RATIO)
        waitSeconds(1.5)
        Fn_kaiwaDemoView("ep15_00112k")
        _gotoNextPhase()
        break
      end
      L0_8 = wait
      L0_8()
    end
  end
  L1_2(L2_3)
  L1_2 = _waitPhase
  L1_2()
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_plaza_grigoB_event_01"
  L1_2(L2_3)
  L1_2 = RAC_missionNaviCaptionWait
  L2_3 = "ep15_01002"
  L3_4 = "locator2_plaza_navi_01"
  L4_5 = nil
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = _waitPhase
  L1_2()
  L1_2 = Fn_naviKill
  L1_2()
  L1_2 = invokeGrigoMove
  L1_2 = L1_2()
  L2_3 = invokeGrigoWarningStart
  L3_4 = _puppet_tbl
  L3_4 = L3_4.gri02
  L2_3 = L2_3(L3_4)
  L3_4 = playerCoerctionStop
  L4_5 = false
  L3_4(L4_5)
  L3_4 = Fn_captionViewWait
  L4_5 = "ep15_01003"
  L3_4(L4_5)
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.reset
  L3_4(L4_5)
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.set
  L5_6 = "locator2_plaza_cam_pos"
  L6_7 = "locator2_plaza_aim_pos"
  L3_4(L4_5, L5_6, L6_7, false, Vector(0, 0, 0))
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.play
  L3_4(L4_5)
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.zoomIn
  L5_6 = 1.3
  L6_7 = {}
  L6_7.deg = 25
  L3_4(L4_5, L5_6, L6_7, "easeOut")
  L3_4 = waitSeconds
  L4_5 = 3
  L3_4(L4_5)
  L3_4 = Fn_kaiwaDemoView2
  L4_5 = "ep15_00113k"
  function L5_6()
    Fn_resetPcPos("locator2_pc_reset_pos")
  end
  L6_7 = true
  L3_4(L4_5, L5_6, L6_7)
  L3_4 = _sdemo
  L4_5 = L3_4
  L3_4 = L3_4.stop
  L5_6 = 1
  L3_4(L4_5, L5_6)
  L3_4 = Fn_sendEventComSb
  L4_5 = "changeCatWarpPoint"
  L5_6 = "locator2_restart_b_02"
  L3_4(L4_5, L5_6)
  L3_4 = Fn_userCtrlOn
  L3_4()
  L3_4 = Fn_missionView
  L4_5 = "ep15_01004"
  L3_4(L4_5)
  L3_4 = Fn_findNpc
  L4_5 = "gri02"
  L3_4 = L3_4(L4_5)
  L5_6 = L3_4
  L4_5 = L3_4.setDamage
  L6_7 = false
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.enableHomingTarget
  L6_7 = true
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.changeDamageType
  L6_7 = 2
  L4_5(L5_6, L6_7)
  L5_6 = L3_4
  L4_5 = L3_4.setEventListener
  L6_7 = "npcDamaged"
  L4_5(L5_6, L6_7, function()
    L3_4:changeDamageType(0)
    L3_4:setEventListener("npcDamaged", nil)
    if not _grigo_failed then
      _gotoNextPhase()
      if _grigo_move_task ~= nil then
        _grigo_move_task:abort()
        _grigo_move_task = nil
      end
    end
  end)
  while true do
    L4_5 = _isGotoNextPhase
    L4_5 = L4_5()
    if not L4_5 then
      L4_5 = _grigo_failed
      if L4_5 then
        L4_5 = Fn_findNpc
        L5_6 = "gri02"
        L4_5 = L4_5(L5_6)
        L5_6 = Fn_pcSensorOff
        L6_7 = "pccubesensor2_grigoB_01"
        L5_6(L6_7)
        L5_6 = playerCoerctionStop
        L6_7 = true
        L5_6(L6_7)
        L6_7 = L4_5
        L5_6 = L4_5.changeDamageType
        L5_6(L6_7, 1)
        L6_7 = L4_5
        L5_6 = L4_5.setDamage
        L5_6(L6_7, true)
        L6_7 = L4_5
        L5_6 = L4_5.enableHomingTarget
        L5_6(L6_7, false)
        L5_6 = Sound
        L6_7 = L5_6
        L5_6 = L5_6.pulse
        L5_6(L6_7, "w12_011")
        L5_6 = Fn_captionViewWait
        L6_7 = "ep15_01007"
        L5_6(L6_7)
        L5_6 = waitSeconds
        L6_7 = 0.5
        L5_6(L6_7)
        L5_6 = Fn_createEffect
        L6_7 = "exp"
        L5_6 = L5_6(L6_7, "ef_com_exp_01", _puppet_tbl.gri02:getWorldPos(), true)
        L6_7 = Sound
        L6_7 = L6_7.playSE
        L6_7(L6_7, "ene_bot_suicide", 1, "", L5_6)
        L6_7 = Fn_disappearNpc
        L6_7("gri02")
        L6_7 = Fn_whiteout
        L6_7()
        while true do
          L6_7 = HUD
          L6_7 = L6_7.faderStability
          L6_7 = L6_7(L6_7)
          if not L6_7 then
            L6_7 = wait
            L6_7()
          end
        end
        L6_7 = GameDatabase
        L6_7 = L6_7.set
        L6_7(L6_7, ggd.EventFlags__ep15__flag01, 1)
        L6_7 = Fn_fadein
        L6_7(nil, false)
        L6_7 = Fn_scriptGameOver
        L6_7(true)
        while true do
          L6_7 = wait
          L6_7()
        end
      end
      L4_5 = wait
      L4_5()
    end
  end
  if L2_3 ~= nil then
    L4_5 = invokeGrigoWarningStop
    L4_5()
    L5_6 = L2_3
    L4_5 = L2_3.abort
    L4_5(L5_6)
    L2_3 = nil
  end
  L4_5 = Player
  L5_6 = L4_5
  L4_5 = L4_5.getEnergy
  L6_7 = Player
  L6_7 = L6_7.kEnergy_Life
  L4_5 = L4_5(L5_6, L6_7)
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.getEnergyMax
  L5_6 = L5_6(L6_7, Player.kEnergy_Life)
  if L1_2 ~= nil then
    L6_7 = L1_2.abort
    L6_7(L1_2)
    L1_2 = nil
  end
  L6_7 = Fn_createEffect
  L6_7 = L6_7("exp", "ef_com_exp_01", _puppet_tbl.gri02:getWorldPos(), false)
  Sound:playSE("ene_bot_suicide", 1, "", L6_7)
  Fn_disappearNpc("gri02")
  RAC_setBulletShockwave(_puppet_tbl.gri02:getWorldPos(), GRIGO_BLAST.DAMAGE, GRIGO_BLAST.RADIUS, "ene_robot_missile_hit")
  waitSeconds(0.5)
  waitSeconds(1.5)
  if L4_5 > Player:getEnergy(Player.kEnergy_Life) then
    Fn_captionViewWait("ep15_01005")
  else
    Fn_captionViewWait("ep15_01006")
  end
  waitSeconds(0.5)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:restrictNav_ep15_00(false)
  Mob:letStateMode(Mob.StateMode.kGrigoSuspend, false)
end
function pccubesensor2_grigoB_01_OnEnter(A0_9)
  _gotoNextPhase()
  Fn_pcSensorOff(A0_9)
end
function pccubesensor2_plaza_grigoB_event_01_OnEnter()
  _gotoNextPhase()
  Fn_pcSensorOff("pccubesensor2_plaza_grigoB_event_01")
end
function invokeGrigoMove()
  local L0_10, L1_11
  L0_10 = Fn_pcSensorOn
  L1_11 = "pccubesensor2_grigoB_01"
  L0_10(L1_11)
  L0_10 = Fn_setNpcActive
  L1_11 = "gri02"
  L0_10(L1_11, true)
  L0_10 = {}
  L1_11 = GRI02_SPEED
  L0_10.anim_walk_speed = L1_11
  L1_11 = {
    "locator2_grigoB_pos_01",
    "locator2_grigoB_pos_02",
    "locator2_grigoB_pos_03",
    "locator2_grigoB_pos_04",
    "locator2_grigoB_pos_05",
    "locator2_grigoB_pos_06",
    "locator2_grigoB_pos_07",
    "locator2_grigoB_pos_08",
    "locator2_grigoB_pos_09",
    "locator2_grigoB_pos_10",
    "locator2_grigoB_pos_11"
  }
  return invokeTask(function()
    _grigo_move_task = Fn_moveNpc("gri02", L1_11, L0_10)
    while true do
      if Fn_findNpc("gri02"):isMoveEnd() == true then
        if _grigo_move_task ~= nil then
          _grigo_move_task:abort()
          _grigo_move_task = nil
        end
        _grigo_failed = true
        break
      end
      wait()
    end
  end)
end
