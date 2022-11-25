dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep15_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
GRI01_SPEED = 1.8
GRI01_EVENT_DIST01 = 72
GRI01_EVENT_DIST02 = 3
KAJI_EVENT_DIST01 = 8
_puppet_tbl = {}
_kit_mot_list = {
  surprise = "kit01_surprise_00"
}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "kaji",
      type = "kaj01",
      node = "locator2_kaji_pos",
      active = true
    },
    {
      name = "bulbosa",
      type = "bul01",
      node = "locator2_bulbosa_pos",
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
    },
    {
      name = "gri01",
      type = "mcgri",
      node = "locator2_grigoA_st_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_loadPlayerMotion(_kit_mot_list)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = Fn_sendEventComSb
  L1_2 = "changeCatWarpPoint"
  L2_3 = "locator2_pc_start_pos"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_pcSensorOff
  L1_2 = "pccubesensor2_grigoA_event_01"
  L0_1(L1_2)
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
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "ep15_00110k"
  L0_1(L1_2)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = {}
  L0_1.anim_walk_speed = 1
  L0_1.anim_run_speed = 1
  L0_1.loop = true
  L1_2 = {
    L2_3,
    L3_4,
    L4_5,
    L5_6,
    "locator2_grigoA_pos_02",
    "locator2_grigoA_pos_04",
    "locator2_grigoA_pos_06",
    "locator2_grigoA_pos_08"
  }
  L2_3 = "locator2_grigoA_pos_01"
  L3_4 = "locator2_grigoA_pos_03"
  L4_5 = "locator2_grigoA_pos_05"
  L5_6 = "locator2_grigoA_pos_07"
  L2_3 = Fn_moveNpc
  L3_4 = "gri01"
  L4_5 = L1_2
  L5_6 = L0_1
  L2_3 = L2_3(L3_4, L4_5, L5_6)
  L3_4 = Fn_findNpc
  L4_5 = "gri01"
  L3_4 = L3_4(L4_5)
  L4_5 = L3_4
  L3_4 = L3_4.changeDamageType
  L5_6 = 0
  L3_4(L4_5, L5_6)
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_grigoA_st_01"
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = RAC_missionNaviCaptionWait
  L5_6 = "ep15_00100"
  L4_5(L5_6, L3_4, nil)
  L4_5 = invokeGrigoWarningStart
  L5_6 = _puppet_tbl
  L5_6 = L5_6.gri01
  L4_5 = L4_5(L5_6)
  L5_6 = invokeTask
  L5_6(function()
    while true do
      if Fn_getDistanceToPlayer(L3_4) < GRI01_EVENT_DIST01 and rayCheckPcSetStayVerB(_puppet_tbl.gri01, GRI01_EVENT_DIST01, 5, false) == true then
        _gotoNextPhase()
        break
      end
      if Fn_getDistanceToPlayer(_puppet_tbl.kaji) > KAJI_EVENT_DIST01 and false == false then
        Fn_captionViewWait("ep15_00101")
      end
      wait()
    end
  end)
  L5_6 = _waitPhase
  L5_6()
  L5_6 = RAC_LookAtObjectWait
  L5_6(_puppet_tbl.gri01, nil, DEF_RATIO)
  L5_6 = Fn_naviKill
  L5_6()
  L5_6 = Fn_captionViewWait
  L5_6("ep15_00102")
  L5_6 = Fn_naviSet
  L5_6(_puppet_tbl.gri01)
  L5_6 = invokeTask
  L5_6(function()
    while true do
      if Fn_getDistanceToPlayer(_puppet_tbl.gri01:getWorldPos()) < GRI01_EVENT_DIST02 then
        if L2_3 ~= nil then
          L2_3:abort()
          L2_3 = nil
          RAC_stopNpcMoveTask("gri01")
        end
        invokeTask(function()
          wait()
          Fn_turnNpc("gri01")
          Fn_playMotionNpc("gri01", "stay", false)
        end)
        playerCoerctionStop(false)
        _gotoNextPhase()
        break
      end
      wait()
    end
  end)
  L5_6 = _waitPhase
  L5_6()
  L5_6 = Fn_naviKill
  L5_6()
  L5_6 = invokeTask
  L5_6(function()
    RAC_LookAtObject(_puppet_tbl.gri01, 1, 0.2)
    RAC_playerTurnWait(_puppet_tbl.gri01, 1, 2)
    Fn_playPlayerMotion(_kit_mot_list.surprise)
  end)
  L5_6 = Sound
  L5_6 = L5_6.pulse
  L5_6(L5_6, "w12_011")
  L5_6 = Fn_captionView
  L5_6("ep15_00103")
  L5_6 = waitSeconds
  L5_6(1)
  L5_6 = Fn_sendEventComSb
  L5_6("escapeNpc")
  L5_6 = waitSeconds
  L5_6(2.5)
  L5_6 = Player
  L5_6 = L5_6.setNoDamageMode
  L5_6(L5_6, Player.kNoDamage_All, false)
  L5_6 = Fn_pcSensorOn
  L5_6("pccubesensor2_grigoA_event_01")
  L5_6 = Fn_createEffect
  L5_6 = L5_6("exp", "ef_com_exp_01", _puppet_tbl.gri01:getWorldPos(), false)
  Sound:playSE("ene_bot_suicide", 1, "", L5_6)
  Fn_disappearNpc("gri01")
  RAC_setBulletShockwave(_puppet_tbl.gri01:getWorldPos(), GRIGO_BLAST.DAMAGE, GRIGO_BLAST.RADIUS, "ene_robot_missile_hit")
  if L4_5 ~= nil then
    L4_5:abort()
    L4_5 = nil
  end
  invokeGrigoWarningStop()
  waitSeconds(2)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_7, L1_8
end
function pccubesensor2_grigoA_event_01_OnLeave()
  if Player:getEnergy(Player.kEnergy_Life) > 0 then
    print("pccubesensor2_grigoA_event_01_OnLeave")
    Fn_coercionGravityShift()
    Player:setStay(true, true)
  end
end
