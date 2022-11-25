dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep02_common.lua")
_RYZ_ROAR_WAIT = 20
_RYZ_MESS_COUNT = 3
_next_phase = false
_drop_ready = false
_ryza_move_flag = false
_cageSensorTask = nil
_cageSensorCount = 0
_misaiMotions = {
  edgy_00 = "tkg05_edgy_00",
  idle_00 = "tkg05_idle_00",
  cheer_00 = "tkg05_cheer_00",
  jealousy_00 = "tkg05_jealousy_00"
}
function Initialize()
  local L0_0, L1_1
  _npc_misai = "npcgen2_miz_01"
  _npc_ryza = "npcgen2_ryz_01"
  _npc_worker1 = "npcgen2_worker_01"
  _npc_worker2 = "npcgen2_worker_02"
end
function Ingame()
  local L0_2, L1_3
  L0_2 = Fn_loadNpcEventMotion
  L1_3 = _npc_misai
  L0_2(L1_3, _misaiMotions)
  L0_2 = Fn_pcSensorOff
  L1_3 = "pccubesensor2_01"
  L0_2(L1_3)
  L0_2 = Fn_setCrewActive
  L1_3 = false
  L0_2(L1_3)
  L0_2 = Fn_setCagePos
  L1_3 = -15
  L0_2(L1_3, false)
  L0_2 = Fn_setCageMoveParam
  L1_3 = {}
  L1_3.speed = 4
  L1_3.accel = 0
  L1_3.decel = 3
  L0_2(L1_3)
  L0_2 = setNpcMotion
  L0_2()
  L0_2 = Fn_playMotionNpc
  L1_3 = _npc_worker1
  L0_2(L1_3, "crane", false)
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_cageMove
  L0_2()
  L0_2 = Fn_kaiwaDemoView
  L1_3 = "ep02_00110k"
  L0_2(L1_3)
  L0_2 = rizAction
  L0_2 = L0_2()
  riza_task = L0_2
  L0_2 = Fn_missionView
  L1_3 = "ep02_01010"
  L0_2(L1_3)
  L0_2 = Fn_userCtrlOn
  L0_2()
  L0_2 = waitSeconds
  L1_3 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L0_2(L1_3)
  L0_2 = Fn_naviSet
  L1_3 = Fn_findNpcPuppet
  L1_3 = L1_3(_npc_misai)
  L0_2(L1_3, L1_3(_npc_misai))
  repeat
    L0_2 = wait
    L0_2()
    L0_2 = Fn_getDistanceToPlayer
    L1_3 = Fn_findNpcPuppet
    L1_3 = L1_3(_npc_misai)
    L0_2 = L0_2(L1_3, L1_3(_npc_misai))
  until L0_2 < 2
  L0_2 = Fn_kaiwaDemoView
  L1_3 = "ep02_00120k"
  L0_2(L1_3)
  L0_2 = Fn_naviKill
  L0_2()
  L0_2 = Fn_waitCageMoveEnd
  L0_2()
  L0_2 = Fn_playMotionNpc
  L1_3 = _npc_worker1
  L0_2(L1_3, "sit_00", false)
  L0_2 = {}
  L0_2.anim_walk_speed = 1
  L0_2.recast = true
  L1_3 = {
    {
      pos = "locator2_miz_01",
      opt = L0_2
    },
    {
      pos = "locator2_miz_02",
      opt = L0_2
    }
  }
  Fn_moveNpc(_npc_misai, L1_3, L0_2)
  waitNpcMoveEnd(_npc_misai)
  setNpcPosToCage(_npc_misai)
  Fn_missionView("ep02_01012")
  waitSeconds(_MARKER_WAIT_AFTER_MISSION_VIEW)
  Fn_naviSet(findGameObject2("Node", "locator2_navi_01"))
  Fn_pcSensorOn("pccubesensor2_01")
  repeat
    wait()
  until _drop_ready
  Fn_setInvisibleColltion(true)
  Fn_coercionGravityRevert()
  Fn_lockPlayerAbility(Player.kAbility_GravityShift)
  Fn_pcSensorOff("pccubesensor2_warp_01")
  Fn_pcSensorOff("pccubesensor2_warp_02")
  Fn_naviKill()
  _ryza_move_flag = true
  Sound:playSE("mis001b_radio", 0.8, "", Fn_findNpcPuppet(_npc_misai))
  Fn_captionViewWait("ep02_01001")
  Fn_playMotionNpc(_npc_worker1, "crane", false)
  Fn_setCageMoveParam({
    speed = 4,
    accel = 5,
    decel = 3
  })
  Fn_cageMove(true)
  waitSeconds(6)
  Fn_captionView("ep02_01002", 5.4)
  Sound:playSE("mis_108", 0.8, "", Fn_findNpcPuppet(_npc_misai))
  waitSeconds(6)
  Fn_captionView("ep02_01003", 3.3)
  Sound:playSE("mis_112", 0.8, "", Fn_findNpcPuppet(_npc_misai))
  waitSeconds(6)
  Fn_unLockPlayerAbility(Player.kAbility_GravityShift)
  Fn_blackout(2)
  waitSeconds(2)
  Fn_cageStop()
  Fn_setEffectivenessMineArea(true)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_4, L1_5
end
function pccubesensor2_01_OnEnter()
  _cageSensorTask = invokeTask(function()
    repeat
      _cageSensorCount = _cageSensorCount + 1
      print(_cageSensorCount)
      wait()
    until _cageSensorCount > 30
    Fn_pcSensorOff("pccubesensor2_01")
    _drop_ready = true
  end)
end
function pccubesensor2_01_OnLeave()
  if _cageSensorTask ~= nil and _cageSensorCount <= 30 then
    _cageSensorTask:abort()
    _cageSensorTask = nil
  end
  _cageSensorCount = 0
end
function rizAction()
  local L0_6, L1_7, L2_8, L3_9
  L0_6 = {}
  L0_6.isRepeat = true
  L0_6.isRandom = true
  L1_7 = {}
  L1_7.isRepeat = false
  L1_7.isRandom = false
  L2_8 = 1
  L3_9 = {}
  L3_9[1] = function()
    Fn_captionView("ep02_01004")
    Sound:playSE("ryz_082", 1, "", Fn_findNpcPuppet(_npc_ryza))
  end
  L3_9[2] = function()
    Fn_captionView("ep02_01005")
    Sound:playSE("ryz_082", 1, "", Fn_findNpcPuppet(_npc_ryza))
  end
  L3_9[3] = function()
    Fn_captionView("ep02_01006")
    Sound:playSE("ryz_082", 1, "", Fn_findNpcPuppet(_npc_ryza))
  end
  return invokeTask(function()
    local L0_10, L1_11, L2_12, L3_13, L4_14
    L0_10 = _RYZ_ROAR_WAIT
    L1_11 = {L2_12, L3_13}
    L2_12 = "stay"
    L3_13 = "stay_01"
    while true do
      L2_12 = _ryza_move_flag
      if not L2_12 then
        L0_10 = L0_10 - 1
        if L0_10 < 0 then
          L2_12 = L2_8
          L2_12 = L3_9[L2_12]
          L2_12()
          L2_12 = L2_8
          L2_12 = L2_12 + 1
          L2_8 = L2_12
          L2_12 = L2_8
          L3_13 = _RYZ_MESS_COUNT
          if L2_12 > L3_13 then
            L2_12 = 1
            L2_8 = L2_12
          end
          L0_10 = _RYZ_ROAR_WAIT
        else
          L2_12 = isNpcMotionEnd
          L3_13 = _npc_ryza
          L2_12 = L2_12(L3_13)
          if L2_12 then
            L2_12 = Fn_findNpc
            L3_13 = _npc_ryza
            L2_12 = L2_12(L3_13)
            L4_14 = L2_12
            L3_13 = L2_12.playMotion
            L3_13(L4_14, L1_11, L0_6)
          end
        end
        L2_12 = waitSeconds
        L3_13 = 1
        L2_12(L3_13)
      end
    end
    L2_12 = {}
    L2_12.anim_walk_speed = 1
    L2_12.runLength = 99999
    L2_12.arrivedLength = 0
    L2_12.recast = true
    L3_13 = {}
    L3_13.startIndex = 1
    L3_13.goalDirection = true
    L4_14 = {
      {
        pos = "locator2_ryz_01",
        opt = L2_12
      },
      {
        pos = "locator2_ryz_02",
        opt = L2_12
      }
    }
    Fn_findNpc(_npc_ryza):move(L4_14, L3_13)
  end)
end
function setNpcMotion()
  local L0_15, L1_16
  L0_15 = {}
  L0_15.isRepeat = true
  L0_15.isRandom = true
  L1_16 = {
    _misaiMotions.edgy_00
  }
  Fn_findNpc(_npc_misai):playMotion(L1_16, L0_15)
  Fn_playMotionNpc(_npc_worker1, "sit_00", false)
  Fn_playMotionNpc(_npc_worker2, "check_00", false)
end
function pccubesensor2_warp_OnEnter(A0_17)
  local L1_18
end
function pccubesensor2_warp_OnLeave(A0_19)
  if A0_19:getName() == "pccubesensor2_warp_02" then
    invokeTask(function()
      Fn_captionView("ep02_01007")
    end)
  elseif A0_19:getName() == "pccubesensor2_warp_01" then
    invokeTask(function()
      local L0_20, L1_21
      L0_20 = Fn_userCtrlOff
      L0_20()
      L0_20 = Fn_catWarpIn
      L0_20()
      L0_20 = Fn_getCatWarpCheckPoint
      L0_20 = L0_20()
      L1_21 = Player
      L1_21 = L1_21.kReset_Standing
      Fn_resetPcPos(L0_20, L1_21)
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
    end)
  end
end
