dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_puppet_tbl = {}
_is_area_distant = false
function Initialize()
  chara_table = {
    {
      name = "sm22_old_regime",
      type = "man56",
      node = "locator2_old_regime_b",
      reset = false
    },
    {
      name = "sm22_new_regime",
      type = "man57",
      node = "locator2_new_regime_b",
      reset = false,
      color_variation = 1,
      active = false
    },
    {
      name = "sm22_citizen_man32",
      type = "man32",
      node = "locator2_man32_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_man_middle_class",
      type = "man38",
      node = "locator2_man_middle_class_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_citizen_man45",
      type = "man45",
      node = "locator2_man45_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_citizen_wom17",
      type = "wom17",
      node = "locator2_wom17_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_citizen_chi12",
      type = "chi12",
      node = "locator2_chi12_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_man_poor",
      type = "man36",
      node = "locator2_man_poor_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_madam",
      type = "wom27",
      node = "locator2_madam_b",
      reset = false,
      active = false
    },
    {
      name = "sm22_citizen_man48",
      type = "man48",
      node = "locator2_man48_b",
      reset = false,
      active = false
    }
  }
  Fn_setupNpc(chara_table)
  for _FORV_3_, _FORV_4_ in pairs(chara_table) do
    _puppet_tbl[_FORV_4_.name] = Fn_findNpcPuppet(_FORV_4_.name)
  end
  Fn_pcSensorOff("pccubesensor2_area_distant_b_01")
  Fn_pcSensorOff("pccubesensor2_area_distant_b_cat_warp_01")
  _sdemo_cut01 = SDemo.create("sm22_b_cut01")
  _sdemo_cut02 = SDemo.create("sm22_b_cut02")
end
function Ingame()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_moveNpc
  L1_1 = "sm22_old_regime"
  L2_2 = {
    "locator2_old_regime_b_move_01",
    "locator2_old_regime_b_move_02"
  }
  L0_0(L1_1, L2_2, {runLength = -1})
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.makeSituationPanic
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = invokeTask
  function L1_1()
    while true do
      if Fn_findNpc("sm22_old_regime"):isMoveEnd() then
        Fn_playMotionNpc("sm22_old_regime", "scared_in_00", true)
        Fn_playMotionNpc("sm22_old_regime", "scared_00", false)
        break
      end
      wait()
    end
  end
  L0_0(L1_1)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "isSpawnEnemy"
  L0_0 = L0_0(L1_1)
  if L0_0 then
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestIdleEnemy"
    L2_2 = false
    L0_0(L1_1, L2_2)
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestChangeEnemyMarker"
    L2_2 = true
    L0_0(L1_1, L2_2)
  else
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestSpawnEnemy"
    L2_2 = "enmgen2_landingship"
    L0_0(L1_1, L2_2)
    while true do
      L0_0 = Fn_sendEventComSb
      L1_1 = "isSpawnEnemyEnd"
      L0_0 = L0_0(L1_1)
      if L0_0 then
        L0_0 = wait
        L0_0()
      end
    end
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestSpawnEnemy"
    L2_2 = "enmgen2_a_b_01"
    L0_0(L1_1, L2_2)
    while true do
      L0_0 = Fn_sendEventComSb
      L1_1 = "isSpawnEnemyEnd"
      L0_0 = L0_0(L1_1)
      if L0_0 then
        L0_0 = wait
        L0_0()
      end
    end
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestSpawnEnemy"
    L2_2 = "enmgen2_a_b_02"
    L0_0(L1_1, L2_2)
    while true do
      L0_0 = Fn_sendEventComSb
      L1_1 = "isSpawnEnemyEnd"
      L0_0 = L0_0(L1_1)
      if L0_0 then
        L0_0 = wait
        L0_0()
      end
    end
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestSpawnEnemy"
    L2_2 = "enmgen2_a_b_03"
    L0_0(L1_1, L2_2)
    while true do
      L0_0 = Fn_sendEventComSb
      L1_1 = "isSpawnEnemyEnd"
      L0_0 = L0_0(L1_1)
      if L0_0 then
        L0_0 = wait
        L0_0()
      end
    end
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestChangeShipMarker"
    L2_2 = false
    L0_0(L1_1, L2_2)
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestIdleShip"
    L2_2 = true
    L0_0(L1_1, L2_2)
  end
  L0_0 = Fn_missionViewWait
  L1_1 = "sm22_00100"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_area_distant_b_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_area_distant_b_cat_warp_01"
  L0_0(L1_1)
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_start_pos"
  L0_0(L1_1)
  L0_0 = false
  L1_1 = invokeTask
  function L2_2()
    while not L0_0 do
      if _is_area_distant then
        Fn_naviSet(findGameObject2("Node", "locator2_navi_area_distant_b_01"))
        Player:setAction(Player.kAction_Float)
        Fn_captionViewWait("sm22_00101")
        Mv_viewObj("locator2_navi_area_distant_b_01"):abort()
        while _is_area_distant do
          wait()
        end
        Fn_naviKill()
      end
      wait()
    end
  end
  L1_1(L2_2)
  while not L0_0 do
    L1_1 = Fn_sendEventComSb
    L2_2 = "isEnemyGroupAllDead"
    L1_1 = L1_1(L2_2, "enmgen2_a_b_01")
    if L1_1 then
      L1_1 = Fn_sendEventComSb
      L2_2 = "isEnemyGroupAllDead"
      L1_1 = L1_1(L2_2, "enmgen2_a_b_02")
      if L1_1 then
        L1_1 = Fn_sendEventComSb
        L2_2 = "isEnemyGroupAllDead"
        L1_1 = L1_1(L2_2, "enmgen2_a_b_03")
        if L1_1 then
          L0_0 = true
          break
        end
      end
    end
    L1_1 = wait
    L1_1()
  end
  L1_1 = waitSeconds
  L2_2 = 3
  L1_1(L2_2)
  L1_1 = {}
  function L2_2()
    Fn_setNpcActive("sm22_new_regime", true)
    Fn_setNpcActive("sm22_old_regime", true)
    Fn_setNpcActive("sm22_man_poor", true)
    Fn_setNpcActive("sm22_man_middle_class", true)
    Fn_setNpcActive("sm22_madam", true)
    Fn_setNpcActive("sm22_citizen_man48", true)
    Fn_setNpcActive("sm22_citizen_man32", true)
    Fn_setNpcActive("sm22_citizen_man45", true)
    Fn_setNpcActive("sm22_citizen_wom17", true)
    Fn_setNpcActive("sm22_citizen_chi12", true)
    Fn_warpNpc("sm22_new_regime", "locator2_new_regime_sdemo_b")
    Fn_warpNpc("sm22_old_regime", "locator2_old_regime_sdemo_b")
    Fn_warpNpc("sm22_man_poor", "locator2_man_poor_sdemo_b")
    Fn_warpNpc("sm22_man_middle_class", "locator2_man_middle_class_sdemo_b")
    Fn_warpNpc("sm22_madam", "locator2_madam_sdemo_b")
    Fn_warpNpc("sm22_citizen_man48", "locator2_man48_sdemo_b")
    Fn_warpNpc("sm22_citizen_man32", "locator2_man32_sdemo_b")
    Fn_warpNpc("sm22_citizen_man45", "locator2_man45_sdemo_b")
    Fn_warpNpc("sm22_citizen_wom17", "locator2_wom17_sdemo_b")
    Fn_warpNpc("sm22_citizen_chi12", "locator2_chi12_sdemo_b")
    Fn_setNpcActive("sm22_citizen_wom01", false)
    Fn_setNpcActive("sm22_citizen_man41", false)
    Fn_setNpcActive("sm22_citizen_wom21", false)
    Fn_setNpcActive("sm22_citizen_wom26", false)
    kit_mot_tbl = {
      stay = "kit01_stay_00"
    }
    Fn_loadPlayerMotion(kit_mot_tbl)
    Fn_playPlayerMotionWait(kit_mot_tbl.stay)
  end
  Fn_sceneConversion("locator2_pc_reset_pos_b_01", L2_2)
  Fn_userCtrlAllOff()
  waitSeconds(2)
  Mv_viewObj("locator2_aim"):abort()
  waitSeconds(1)
  Fn_kaiwaDemoView("sm22_00400k")
  Fn_findNpc("sm22_new_regime"):inform(findGameObject2("Node", "locator2_ship"))
  waitSeconds(1)
  waitSeconds(2)
  Mv_viewObj("locator2_ship_look", 0.1):abort()
  Fn_kaiwaDemoView("sm22_00500k")
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:makeSituationPanic(false)
end
function pccubesensor2_area_distant_OnEnter()
  local L0_3, L1_4
  _is_area_distant = false
end
function pccubesensor2_area_distant_OnLeave()
  local L0_5, L1_6
  _is_area_distant = true
end
function pccubesensor2_area_distant_b_cat_warp_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function lamstemp()
  Fn_captionView("sm22_00102")
end
