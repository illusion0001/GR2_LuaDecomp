dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm19_common.lua")
import("Vehicle")
_puppet_tbl = {}
CUT_01_CAMERA_MOVE_SEC = 3
ATK_CAP_MAX = 4
_sdemo_cut01 = nil
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_c_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_c_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catnavikill_c_phase01")
  L0_0 = {
    {
      name = BROTHER_ID,
      type = "chi11",
      node = "locator2_brother_01_pos_03c",
      reset = false,
      not_mob = true
    },
    {
      name = SISTER_ID,
      type = "chi12",
      node = "locator2_sister_01_pos_03c",
      reset = false,
      not_mob = true
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm19_c_cut01")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestDestroyEnemy"
  L2_3 = "enmgen2_water"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_sendEventComSb
  L1_2 = "scoreReset"
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestSpawnEnemy"
  L2_3 = "enmgen2_water"
  L0_1(L1_2, L2_3)
  while true do
    L0_1 = Fn_sendEventComSb
    L1_2 = "isSpawnEnemyEnd"
    L2_3 = "enmgen2_water"
    L0_1 = L0_1(L1_2, L2_3)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestSpawnEnemy"
  L2_3 = "enmgen2_luna_only_c"
  L0_1(L1_2, L2_3)
  while true do
    L0_1 = Fn_sendEventComSb
    L1_2 = "isSpawnEnemyEnd"
    L2_3 = "enmgen2_luna_only_c"
    L0_1 = L0_1(L1_2, L2_3)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestSpawnEnemy"
  L2_3 = "enmgen2_center_only_c"
  L0_1(L1_2, L2_3)
  while true do
    L0_1 = Fn_sendEventComSb
    L1_2 = "isSpawnEnemyEnd"
    L2_3 = "enmgen2_center_only_c"
    L0_1 = L0_1(L1_2, L2_3)
    if L0_1 then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestChangeEnemyMarker"
  L2_3 = true
  L3_4 = "enmgen2_center_only_c"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestChangeEnemyMarker"
  L2_3 = true
  L3_4 = "enmgen2_water"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestChangeEnemyMarker"
  L2_3 = true
  L3_4 = "enmgen2_luna_only_c"
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Vehicle
  L1_2 = L0_1
  L0_1 = L0_1.SetPanic
  L2_3 = true
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_end_cam_02"
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = L3_4
  L3_4 = L3_4.getWorldPos
  L11_12 = L3_4(L4_5)
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L3_4(L4_5))
  L0_1 = Fn_setNpcActive
  L1_2 = BROTHER_ID
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = Fn_setNpcActive
  L1_2 = SISTER_ID
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_resetpos_catwarp"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarning_c_phase01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_c_phase01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catnavikill_c_phase01"
  L0_1(L1_2)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setStay
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = false
  L1_2 = Fn_missionView
  L2_3 = "sm19_02000"
  L1_2(L2_3)
  L1_2 = Fn_playMotionNpc
  L2_3 = BROTHER_ID
  L3_4 = "reply_yes"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = Fn_playMotionNpc
  L2_3 = SISTER_ID
  L3_4 = "reply_yes"
  L4_5 = false
  L1_2(L2_3, L3_4, L4_5)
  L1_2 = waitSeconds
  L2_3 = 0.5
  L1_2(L2_3)
  L1_2 = {
    L2_3,
    L3_4,
    L4_5,
    L5_6,
    L6_7
  }
  L2_3 = "locator2_brother_01_hide_04"
  L3_4 = "locator2_brother_01_hide_05"
  L4_5 = "locator2_brother_01_hide_06"
  L5_6 = "locator2_brother_01_hide_07"
  L6_7 = "locator2_brother_01_hide_08"
  L2_3 = {
    L3_4,
    L4_5,
    L5_6,
    L6_7,
    L7_8
  }
  L3_4 = "locator2_sister_02_hide_01"
  L4_5 = "locator2_sister_02_hide_02"
  L5_6 = "locator2_sister_02_hide_03"
  L6_7 = "locator2_sister_02_hide_04"
  L7_8 = "locator2_sister_02_hide_05"
  L3_4 = Fn_moveNpc
  L4_5 = BROTHER_ID
  L5_6 = L1_2
  L6_7 = {}
  L6_7.runLength = -1
  L3_4 = L3_4(L4_5, L5_6, L6_7)
  L4_5 = waitSeconds
  L5_6 = 1
  L4_5(L5_6)
  L4_5 = Fn_moveNpc
  L5_6 = SISTER_ID
  L6_7 = L2_3
  L7_8 = {}
  L7_8.runLength = -1
  L4_5 = L4_5(L5_6, L6_7, L7_8)
  L5_6 = 0
  L6_7 = Fn_get_shuffle_teble
  L7_8 = {
    L8_9,
    L9_10,
    L10_11,
    L11_12,
    "sm19_02007"
  }
  L8_9 = "sm19_02003"
  L9_10 = "sm19_02004"
  L10_11 = "sm19_02005"
  L11_12 = "sm19_02006"
  L6_7 = L6_7(L7_8)
  L7_8 = invokeTask
  function L8_9()
    while true do
      if Player:getLastFrameAttackPoint() > 0 then
        L5_6 = L5_6 + 1
        if L5_6 > ATK_CAP_MAX then
          Sound:playSE("kit_589", 1, "")
          Fn_captionViewWait(L6_7[RandI(1, #L6_7)])
          L5_6 = 0
        end
      end
      wait()
    end
  end
  L7_8 = L7_8(L8_9)
  L8_9 = invokeTask
  function L9_10()
    local L0_13
    L0_13 = Player
    L0_13 = L0_13.getGrabObjectCount
    L0_13 = L0_13(L0_13)
    while true do
      if Player:getGrabObjectCount() > 0 then
        L0_13 = Player:getGrabObjectCount()
        while not Pad:getButton(Pad.kButton_RR) do
          wait()
        end
        while L0_13 == Player.getGrabObjectCount() and not (L0_13 < Player.getGrabObjectCount()) do
          wait()
        end
        L5_6 = L5_6 + 1
        if L5_6 > ATK_CAP_MAX then
          Sound:playSE("kit_589", 1, "")
          Fn_captionViewWait(L6_7[RandI(1, #L6_7)])
          L5_6 = 0
        end
      end
      wait()
    end
  end
  L8_9 = L8_9(L9_10)
  L9_10 = invokeTask
  function L10_11()
    local L0_14, L1_15
    while true do
      while true do
        L0_14 = Mv_isSafeTaskRunning
        L1_15 = L3_4
        L0_14 = L0_14(L1_15)
        if L0_14 == true then
          L0_14 = wait
          L0_14()
        end
      end
    end
    while true do
      L0_14 = Mv_isSafeTaskRunning
      L1_15 = L4_5
      L0_14 = L0_14(L1_15)
      if L0_14 == true then
        L0_14 = wait
        L0_14()
      end
    end
    L0_14 = Fn_turnNpc
    L1_15 = SISTER_ID
    L0_14(L1_15, "locator2_sister_02_hide_turn")
    L0_14 = Fn_turnNpc
    L1_15 = BROTHER_ID
    L0_14(L1_15, "locator2_brother_01_hide_turn")
    L0_14 = Fn_playMotionNpc
    L1_15 = SISTER_ID
    L0_14(L1_15, "sit_floor_in_00", false)
    L0_14 = waitSeconds
    L1_15 = 1.5
    L0_14(L1_15)
    L0_14 = Fn_playLoopMotionRand
    L1_15 = BROTHER_ID
    L0_14 = L0_14(L1_15, {"lookaround"}, 5, 10)
    L1_15 = Fn_playLoopMotionRand
    L1_15 = L1_15(SISTER_ID, {
      "sit_floor_01"
    }, 3, 5)
    while true do
      if Fn_isInSightTarget(_puppet_tbl[BROTHER_ID], 1) == false and Fn_isInSightTarget(_puppet_tbl[SISTER_ID], 1) == false and Fn_getDistanceToPlayer(_puppet_tbl[SISTER_ID]) > 20 then
        L0_14 = Mv_safeTaskAbort(L0_14)
        L1_15 = Mv_safeTaskAbort(L1_15)
        Fn_setNpcActive(BROTHER_ID, false)
        Fn_setNpcActive(SISTER_ID, false)
        break
      end
      if L0_1 then
        L0_14 = Mv_safeTaskAbort(L0_14)
        L1_15 = Mv_safeTaskAbort(L1_15)
        break
      end
      wait()
    end
  end
  L9_10(L10_11)
  L9_10 = false
  while true do
    L10_11 = Fn_sendEventComSb
    L11_12 = "isEnemyGroupAllDead2"
    L10_11 = L10_11(L11_12, "enmgen2_water")
    if L10_11 <= 0 then
      L10_11 = Fn_sendEventComSb
      L11_12 = "isEnemyGroupAllDead2"
      L10_11 = L10_11(L11_12, "enmgen2_center_only_c")
      if L10_11 <= 0 then
        L10_11 = Fn_sendEventComSb
        L11_12 = "isEnemyGroupAllDead2"
        L10_11 = L10_11(L11_12, "enmgen2_luna_only_c")
      end
    end
    if not (L10_11 <= 0) then
      L10_11 = wait
      L10_11()
    end
  end
  L10_11 = Mv_safeTaskAbort
  L11_12 = L7_8
  L10_11 = L10_11(L11_12)
  L7_8 = L10_11
  L10_11 = Mv_safeTaskAbort
  L11_12 = L8_9
  L10_11 = L10_11(L11_12)
  L8_9 = L10_11
  L0_1 = true
  L10_11 = Fn_pcSensorOff
  L11_12 = "pccubesensor2_catwarning_c_phase01"
  L10_11(L11_12)
  L10_11 = Fn_pcSensorOff
  L11_12 = "pccubesensor2_catwarp_c_phase01"
  L10_11(L11_12)
  L10_11 = Fn_pcSensorOff
  L11_12 = "pccubesensor2_catnavikill_c_phase01"
  L10_11(L11_12)
  L10_11 = Fn_captionViewEnd
  L10_11()
  L10_11 = Fn_naviKill
  L10_11()
  L10_11 = waitSeconds
  L11_12 = 0.8
  L10_11(L11_12)
  L10_11 = Fn_captionViewWait
  L11_12 = "sm19_02008"
  L10_11(L11_12)
  L10_11 = setUserCtrlOn
  L11_12 = false
  L10_11(L11_12)
  L10_11 = Fn_blackout
  L10_11()
  L10_11 = waitSeconds
  L11_12 = 1
  L10_11(L11_12)
  L10_11 = Player
  L11_12 = L10_11
  L10_11 = L10_11.setAttrTune
  L10_11(L11_12, Player.kAttrTune_Normal)
  L10_11 = Fn_setNpcActive
  L11_12 = BROTHER_ID
  L10_11(L11_12, true)
  L10_11 = Fn_setNpcActive
  L11_12 = SISTER_ID
  L10_11(L11_12, true)
  L10_11 = Fn_warpNpc
  L11_12 = BROTHER_ID
  L10_11(L11_12, "locator2_brother_01_pos_04")
  L10_11 = Fn_warpNpc
  L11_12 = SISTER_ID
  L10_11(L11_12, "locator2_sister_01_pos_04")
  L10_11 = Fn_resetPcPos
  L11_12 = "locator2_pc_pos_04"
  L10_11(L11_12)
  L10_11 = waitSeconds
  L11_12 = 2.5
  L10_11(L11_12)
  L10_11 = _sdemo_cut01
  L11_12 = L10_11
  L10_11 = L10_11.set
  L10_11(L11_12, "locator2_cam_pos_03", "locator2_aim_pos_03", false)
  L10_11 = _sdemo_cut01
  L11_12 = L10_11
  L10_11 = L10_11.play
  L10_11(L11_12)
  L10_11 = Fn_fadein
  L10_11()
  L10_11 = Fn_captionView
  L11_12 = "sm19_02001"
  L10_11(L11_12)
  L10_11 = Fn_moveNpc
  L11_12 = BROTHER_ID
  L10_11 = L10_11(L11_12, {
    "locator2_brother_01_pos_05"
  }, {runLength = -1}, {goalDirection = true})
  L11_12 = Fn_moveNpc
  L11_12 = L11_12(SISTER_ID, {
    "locator2_sister_01_pos_05"
  }, {runLength = -1}, {goalDirection = true})
  invokeTask(function()
    waitSeconds(2.5)
    Sound:playSE("w09_920", 1, "")
    Fn_captionView("sm19_02002")
    Player:setLookAtIk(true, 1, findGameObject2("Node", "locator2_sister_01_pos_05"):getWorldPos())
  end)
  Camera:lookTo(_puppet_tbl[BROTHER_ID]:getWorldPos(), 0, 0)
  waitSeconds(3)
  _sdemo_cut01:set("locator2_cam_pos_05", "locator2_aim_pos_04", false)
  _sdemo_cut01:play()
  while Mv_isSafeTaskRunning(L10_11) == true do
    wait()
  end
  L10_11 = Mv_safeTaskAbort(L10_11)
  while Mv_isSafeTaskRunning(L11_12) == true do
    wait()
  end
  L11_12 = Mv_safeTaskAbort(L11_12)
  wait()
  Fn_kaiwaDemoView("sm19_00400k")
  Player:setLookAtIk(false, 1, Vector(0, 0, -1))
  setUserCtrlOn(true)
  _sdemo_cut01:stop(1)
  Vehicle:SetPanic(false)
  npc_re_grab_task = Mv_safeTaskAbort(npc_re_grab_task)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_16, L1_17
end
function pccubesensor2_catwarning_OnLeave()
  invokeTask(function()
    if Player:isGravityControlMode() or Player:getAction() == Player.kAction_Jump then
      Player:setStay(true)
    end
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_catwarning_c_phase01"))
    Fn_captionViewWait("sm19_09006")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionView("sm19_09006")
  end)
end
function pccubesensor2_catnavikill_OnEnter()
  Fn_naviKill()
end
