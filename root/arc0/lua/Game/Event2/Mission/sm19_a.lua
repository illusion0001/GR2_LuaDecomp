dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm19_common.lua")
import("Vehicle")
_puppet_tbl = {}
CUT_01_CAMERA_MOVE_SEC = 1
_sdemo_cut01 = nil
_more_important_navi_view = false
_phase = 1
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_area_lo_a_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwnavikill_a_phase02")
  L0_0 = {
    {
      name = RICH_MAN_ID,
      type = "man48",
      node = "locator2_rich_man_pos_01"
    },
    {
      name = BROTHER_ID,
      type = "chi11",
      node = "locator2_brother_01_pos_01"
    },
    {
      name = "escape_01",
      type = "man32",
      node = "locator2_escape_people_01"
    },
    {
      name = "escape_02",
      type = "man38",
      node = "locator2_escape_people_02"
    },
    {
      name = "escape_03",
      type = "wom17",
      node = "locator2_escape_people_03"
    },
    {
      name = "escape_04",
      type = "chi12",
      node = "locator2_escape_people_04"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm19_a_cut01")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20
  L0_1 = {}
  L0_1.label01 = "chi01_scared_nevy_00"
  L1_2 = Fn_loadNpcEventMotion
  L2_3 = BROTHER_ID
  L3_4 = L0_1
  L1_2(L2_3, L3_4)
  L1_2 = {}
  L1_2.label01 = "man48_scared_sm19_00"
  L2_3 = Fn_loadNpcEventMotion
  L3_4 = RICH_MAN_ID
  L4_5 = L1_2
  L2_3(L3_4, L4_5)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestSpawnEnemy"
  L4_5 = "enmgen2_01"
  L2_3(L3_4, L4_5)
  while true do
    L2_3 = Fn_sendEventComSb
    L3_4 = "isSpawnEnemyEnd"
    L4_5 = "enmgen2_01"
    L2_3 = L2_3(L3_4, L4_5)
    if L2_3 then
      L2_3 = wait
      L2_3()
    end
  end
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestIdleEnemy"
  L4_5 = true
  L5_6 = "enmgen2_01"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestChangeEnemyMarker"
  L4_5 = false
  L5_6 = "enmgen2_01"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = invokeTask
  function L3_4()
    Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_center_only_a")
    while Fn_sendEventComSb("isSpawnEnemyEnd", "enmgen2_center_only_a") do
      wait()
    end
    Fn_sendEventComSb("requestIdleEnemy", true, "enmgen2_center_only_a")
    Fn_sendEventComSb("requestChangeEnemyMarker", false, "enmgen2_center_only_a")
  end
  L2_3(L3_4)
  L2_3 = findGameObject2
  L3_4 = "Gem"
  L4_5 = "gem2_vital_03"
  L2_3 = L2_3(L3_4, L4_5)
  if L2_3 ~= nil then
    L4_5 = L2_3
    L3_4 = L2_3.setActive
    L5_6 = false
    L3_4(L4_5, L5_6)
  end
  L3_4 = {
    L4_5,
    L5_6,
    L6_7,
    L7_8
  }
  L4_5 = "locator2_escape01_root_01"
  L5_6 = "locator2_escape01_root_02"
  L6_7 = "locator2_escape01_root_03"
  L7_8 = "locator2_escape01_root_04"
  L4_5 = {
    L5_6,
    L6_7,
    L7_8
  }
  L5_6 = "locator2_escape02_root_01"
  L6_7 = "locator2_escape02_root_02"
  L7_8 = "locator2_escape02_root_03"
  L5_6 = {
    L6_7,
    L7_8,
    L8_9
  }
  L6_7 = "locator2_escape03_root_01"
  L7_8 = "locator2_escape03_root_02"
  L8_9 = "locator2_escape03_root_03"
  L6_7 = {
    L7_8,
    L8_9,
    L9_10
  }
  L7_8 = "locator2_escape04_root_01"
  L8_9 = "locator2_escape04_root_02"
  L9_10 = "locator2_escape04_root_03"
  L7_8 = Vehicle
  L8_9 = L7_8
  L7_8 = L7_8.SetPanic
  L9_10 = true
  L10_11 = findGameObject2
  L10_11 = L10_11(L11_12, L12_13)
  L10_11 = L10_11.getWorldPos
  L19_20 = L10_11(L11_12)
  L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L10_11(L11_12))
  L7_8 = Vehicle
  L8_9 = L7_8
  L7_8 = L7_8.SetPanic
  L9_10 = true
  L10_11 = findGameObject2
  L10_11 = L10_11(L11_12, L12_13)
  L10_11 = L10_11.getWorldPos
  L19_20 = L10_11(L11_12)
  L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L10_11(L11_12))
  L7_8 = Mob
  L8_9 = L7_8
  L7_8 = L7_8.makeSituationPanic
  L9_10 = true
  L7_8(L8_9, L9_10)
  L7_8 = {}
  L8_9 = invokeTask
  function L9_10()
    local L0_21, L1_22, L2_23, L3_24
    L3_24 = {}
    L3_24.runLength = -1
    L3_24.anim_run_speed = 1.1
    L7_8[2] = L0_21
    L3_24 = {}
    L3_24.runLength = -1
    L3_24.anim_run_speed = 1.2
    L7_8[3] = L0_21
    L0_21(L1_22)
    L3_24 = {}
    L3_24.runLength = -1
    L3_24.anim_run_speed = 1.3
    L7_8[1] = L0_21
    L0_21(L1_22)
    L3_24 = {}
    L3_24.runLength = -1
    L3_24.anim_run_speed = 1
    L7_8[4] = L0_21
    for L3_24, _FORV_4_ in L0_21(L1_22) do
      while Mv_isSafeTaskRunning(L7_8[L3_24]) do
        wait()
      end
      L7_8[L3_24] = Mv_safeTaskAbort(L7_8[L3_24])
      wait()
      if L3_24 == 2 then
        Fn_turnNpc("escape_02", "locator2_escape02_root_02")
      elseif L3_24 == 4 then
        Fn_playMotionNpc("escape_04", "cry_00", false)
      else
        Fn_playMotionNpc("escape_0" .. L3_24, "lookaround_01", false)
      end
    end
  end
  L8_9 = L8_9(L9_10)
  L9_10 = Fn_missionStart
  L9_10()
  L9_10 = Fn_sendEventComSb
  L10_11 = "requestGcBrain"
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_catwarning_a_phase01"
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_catwarp_a_phase01"
  L9_10(L10_11)
  L9_10 = Fn_setCatWarpCheckPoint
  L10_11 = "locator2_pc_start_pos"
  L9_10(L10_11)
  L9_10 = setUserCtrlOn
  L10_11 = true
  L9_10(L10_11)
  L9_10 = Sound
  L10_11 = L9_10
  L9_10 = L9_10.playSE
  L9_10(L10_11, L11_12, L12_13, L13_14)
  L9_10 = waitSeconds
  L10_11 = 1
  L9_10(L10_11)
  L9_10 = Sound
  L10_11 = L9_10
  L9_10 = L9_10.playSE
  L9_10(L10_11, L11_12, L12_13, L13_14)
  L9_10 = invokeTask
  function L10_11()
    Fn_missionView("sm19_00106")
    waitSeconds(1.3)
    Fn_naviSet(findGameObject2("Node", "locator2_navi_01"))
    _more_important_navi_view = true
    viewTarget(findGameObject2("Node", "locator2_navi_01"), 0.5, false)
    waitSeconds(2.5)
    Fn_captionView("sm19_00100")
  end
  L9_10 = L9_10(L10_11)
  L10_11 = Fn_pcSensorOn
  L10_11(L11_12)
  L10_11 = invokeTask
  L10_11 = L10_11(L11_12)
  L11_12()
  _more_important_navi_view = false
  L9_10 = L11_12
  L11_12()
  L14_15 = true
  L11_12(L12_13, L13_14, L14_15)
  L8_9 = L11_12
  for L14_15 = 1, 4 do
    L15_16 = Mv_safeTaskAbort
    L16_17 = L7_8[L14_15]
    L15_16 = L15_16(L16_17)
    L7_8[L14_15] = L15_16
    L15_16 = Fn_disappearNpc
    L16_17 = "escape_0"
    L17_18 = L14_15
    L16_17 = L16_17 .. L17_18
    L15_16(L16_17)
  end
  L11_12(L12_13, L13_14)
  L11_12()
  L11_12(L12_13)
  L11_12(L12_13)
  L10_11 = L11_12
  L12_13.pos = "locator2_start_cam_01"
  L12_13.time = 4
  L12_13.hashfunc = "EaseIn"
  L13_14.pos = "locator2_start_aim_move_01"
  L13_14.time = 4
  L13_14.hashfunc = "EaseIn"
  L14_15 = L13_14
  L15_16 = "locator2_start_cam_01"
  L16_17 = "locator2_start_aim_01"
  L17_18 = false
  L13_14(L14_15, L15_16, L16_17, L17_18)
  L14_15 = L13_14
  L15_16 = L11_12
  L16_17 = L12_13
  L13_14(L14_15, L15_16, L16_17)
  L14_15 = "locator2_resetpos_battle_start"
  L13_14(L14_15)
  L14_15 = "sm19_00101"
  L13_14(L14_15)
  function L14_15()
    Sound:playSE("m03_934", 1, "")
    waitSeconds(2)
    Sound:playSE("m08_934", 1, "")
  end
  L13_14(L14_15)
  L14_15 = {}
  L14_15.pos = "locator2_start_cam_01"
  L15_16 = CUT_01_CAMERA_MOVE_SEC
  L14_15.time = L15_16
  L14_15.hashfunc = "EaseOut"
  L14_15 = {L15_16}
  L15_16 = {}
  L15_16.pos = "locator2_start_aim_02"
  L16_17 = CUT_01_CAMERA_MOVE_SEC
  L15_16.time = L16_17
  L15_16.hashfunc = "EaseOut"
  L15_16 = _sdemo_cut01
  L16_17 = L15_16
  L15_16 = L15_16.play
  L17_18 = nil
  L18_19 = L14_15
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_playMotionNpc
  L16_17 = RICH_MAN_ID
  L17_18 = "man48_scared_sm19_00"
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_playMotionNpc
  L16_17 = BROTHER_ID
  L17_18 = "chi01_scared_nevy_00"
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = invokeTask
  function L16_17()
    waitSeconds(0.8)
    Fn_sendEventComSb("playGcMotion")
  end
  L15_16(L16_17)
  while true do
    L15_16 = _sdemo_cut01
    L16_17 = L15_16
    L15_16 = L15_16.isPlay
    L15_16 = L15_16(L16_17)
    if L15_16 then
      L15_16 = wait
      L15_16()
    end
  end
  L15_16 = invokeTask
  function L16_17()
    Fn_sendEventComSb("requestDestroyEnemy", "enmgen2_center_only_a")
    Fn_sendEventComSb("requestDestroyEnemy", "enmgen2_sdemo_play_a")
    Fn_sendEventComSb("requestSpawnEnemy", "enmgen2_sdemo_only_a")
    while Fn_sendEventComSb("isSpawnEnemyEnd", "enmgen2_sdemo_only_a") do
      wait()
    end
    Fn_sendEventComSb("requestIdleEnemy", false, "enmgen2_sdemo_only_a")
    Fn_sendEventComSb("requestChangeEnemyMarker", false, "enmgen2_sdemo_only_a")
    print("SDEMO\231\148\168\227\131\141\227\131\180\227\130\163\231\148\159\230\136\144")
  end
  L15_16(L16_17)
  L15_16 = Fn_captionViewWait
  L16_17 = "sm19_00102"
  L15_16(L16_17)
  L15_16 = Fn_kaiwaDemoView
  L16_17 = "sm19_00100k"
  L15_16(L16_17)
  L15_16 = Fn_pcSensorOn
  L16_17 = "pccubesensor2_area_lo_a_01"
  L15_16(L16_17)
  L15_16 = _sdemo_cut01
  L16_17 = L15_16
  L15_16 = L15_16.stop
  L17_18 = 2
  L15_16(L16_17, L17_18)
  L15_16 = Player
  L16_17 = L15_16
  L15_16 = L15_16.setStay
  L17_18 = false
  L15_16(L16_17, L17_18)
  L15_16 = Fn_sendEventComSb
  L16_17 = "endScriptAction"
  L15_16(L16_17)
  L15_16 = Fn_sendEventComSb
  L16_17 = "requestIdleEnemy"
  L17_18 = false
  L18_19 = "enmgen2_01"
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_sendEventComSb
  L16_17 = "requestChangeEnemyMarker"
  L17_18 = true
  L18_19 = "enmgen2_01"
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Player
  L16_17 = L15_16
  L15_16 = L15_16.setNoDamageMode
  L17_18 = Player
  L17_18 = L17_18.kNoDamage_FromEnemy
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  if L2_3 ~= nil then
    L16_17 = L2_3
    L15_16 = L2_3.setActive
    L17_18 = true
    L15_16(L16_17, L17_18)
  end
  _phase = 2
  L15_16 = Fn_pcSensorOn
  L16_17 = "pccubesensor2_catwnavikill_a_phase02"
  L15_16(L16_17)
  L15_16 = Fn_missionView
  L16_17 = "sm19_00103"
  L15_16(L16_17)
  L15_16 = waitSeconds
  L16_17 = 3.8
  L15_16(L16_17)
  L15_16 = Fn_captionView
  L16_17 = "sm19_00104"
  L15_16(L16_17)
  while true do
    L15_16 = Fn_sendEventComSb
    L16_17 = "requestEnemyCount"
    L17_18 = "enmgen2_01"
    L15_16 = L15_16(L16_17, L17_18)
    if L15_16 > 0 then
      L15_16 = wait
      L15_16()
    end
  end
  L15_16 = Fn_pcSensorOff
  L16_17 = "pccubesensor2_area_lo_a_01"
  L15_16(L16_17)
  L15_16 = Fn_pcSensorOff
  L16_17 = "pccubesensor2_catwarning_a_phase01"
  L15_16(L16_17)
  L15_16 = Fn_pcSensorOff
  L16_17 = "pccubesensor2_catwarp_a_phase01"
  L15_16(L16_17)
  L15_16 = Fn_captionViewWait
  L16_17 = "sm19_02008"
  L15_16(L16_17)
  L15_16 = setUserCtrlOn
  L16_17 = false
  L15_16(L16_17)
  L15_16 = Fn_blackout
  L15_16()
  L15_16 = Fn_sendEventComSb
  L16_17 = "setAutoRevirthSwitch"
  L17_18 = "enmgen2_sdemo_only_a"
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = wait
  L15_16()
  L15_16 = Fn_sendEventComSb
  L16_17 = "requestDestroyEnemy"
  L17_18 = "enmgen2_sdemo_only_a"
  L15_16(L16_17, L17_18)
  L15_16 = Fn_playMotionNpc
  L16_17 = RICH_MAN_ID
  L17_18 = "stay"
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_playMotionNpc
  L16_17 = BROTHER_ID
  L17_18 = "stay"
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16 = Fn_warpNpc
  L16_17 = RICH_MAN_ID
  L17_18 = "locator2_rich_man_pos_02"
  L15_16(L16_17, L17_18)
  L15_16 = Fn_warpNpc
  L16_17 = BROTHER_ID
  L17_18 = "locator2_brother_01_pos_02"
  L15_16(L16_17, L17_18)
  L15_16 = findGameObject2
  L16_17 = "Node"
  L17_18 = "locator2_reset_pos_01"
  L15_16 = L15_16(L16_17, L17_18)
  L17_18 = L15_16
  L16_17 = L15_16.getWorldTransform
  L17_18 = L16_17(L17_18)
  L18_19 = Fn_setPcPosRot
  L19_20 = L16_17
  L18_19(L19_20, L17_18)
  L18_19 = Fn_setKeepPlayerPos
  L18_19()
  L18_19 = Fn_setNextMissionFlag
  L18_19()
  L18_19 = Fn_nextMission
  L18_19()
  L18_19 = Fn_exitSandbox
  L18_19()
end
function Finalize()
  Vehicle:SetPanic(false)
  Mob:makeSituationPanic(false)
end
function pccubesensor2_01_OnEnter()
  Mv_gotoNextPhase()
  Fn_pcSensorOff("pccubesensor2_01")
  Fn_naviKill()
end
function pccubesensor2_catwarning_a_phase01_OnLeave()
  invokeTask(function()
    if Player:isGravityControlMode() or Player:getAction() == Player.kAction_Jump then
      Player:setStay(true)
    end
    if _more_important_navi_view == false then
      Fn_naviSet(findGameObject2("Node", "locator2_rich_man_pos_01"))
    end
    if _phase == 1 then
      Fn_captionViewWait("sm19_09000")
    elseif _phase == 2 then
      Fn_captionViewWait("sm19_09001")
    end
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_a_phase01_OnLeave()
  print("\227\131\175\227\131\188\227\131\151\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\227\129\167\227\129\159")
  invokeTask(function()
    Fn_catWarp()
    if _phase == 1 then
      Fn_captionView("sm19_09000")
    elseif _phase == 2 then
      Fn_captionView("sm19_09001")
    end
  end)
end
function pccubesensor2_catwnavikill_a_phase02_OnEnter()
  Fn_naviKill()
end
