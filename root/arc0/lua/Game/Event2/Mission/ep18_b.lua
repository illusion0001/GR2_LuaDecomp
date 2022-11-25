dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_player_pup = nil
_next_phase = false
_kaiwa_cnt = 0
_crow_pup = nil
_brain_crow = nil
_sdemo = nil
_grigo_pup = nil
_warp_caption_flag = false
function Initialize()
  local L0_0, L1_1
  L0_0 = SDemo
  L0_0 = L0_0.create
  L1_1 = "ep18_b"
  L0_0 = L0_0(L1_1)
  _sdemo = L0_0
  L0_0 = Fn_spawnSuppotCrow
  L1_1 = false
  L0_0 = L0_0(L1_1, Supporter.FirstAction.Air)
  _crow_pup = L0_0
  L0_0 = _crow_pup
  L1_1 = L0_0
  L0_0 = L0_0.getBrain
  L0_0 = L0_0(L1_1)
  _brain_crow = L0_0
  L0_0 = _brain_crow
  L1_1 = L0_0
  L0_0 = L0_0.setIdling
  L0_0(L1_1, true)
  L0_0 = _crow_pup
  L1_1 = L0_0
  L0_0 = L0_0.setVisible
  L0_0(L1_1, false)
  L0_0 = Vector
  L1_1 = -430.9
  L0_0 = L0_0(L1_1, 185.6, 38.9)
  L1_1 = Vector
  L1_1 = L1_1(-416.4, 187.2, 25.4)
  _sdemo:set(L0_0, L1_1)
  _sdemo:setCameraParam(nil, 0.1, {deg = 35})
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
end
function Ingame()
  local L0_2
  while true do
    L0_2 = _brain_crow
    if L0_2 == false then
      L0_2 = wait
      L0_2()
    end
  end
  L0_2 = Fn_getPlayer
  L0_2 = L0_2()
  _player_pup = L0_2
  L0_2 = Fn_setBgmPoint
  L0_2("battle")
  function L0_2()
    local L0_3, L1_4
    L0_3 = moveCrow
    L0_3()
    L0_3 = Fn_sendEventComSb
    L1_4 = "begin_b_sdemo_00"
    L0_3(L1_4)
    L0_3 = {L1_4}
    L1_4 = {}
    L1_4.pos = Vector(-416.7, 185.6, 31.3)
    L1_4.time = 3
    L1_4.hashfunc = "EaseOut"
    L1_4 = {
      {
        pos = Vector(-415.5, 188.2, 26),
        time = 3,
        hashfunc = "EaseOut"
      }
    }
    _sdemo:play(L0_3, L1_4)
    invokeTask(function()
      _sdemo:zoomIn(4, {deg = 10}, "easeOut")
    end)
    invokeTask(function()
      _crow_pup:setVisible(true)
    end)
    invokeTask(function()
      Fn_userCtrlOff()
      _player_pup:setVisible(false)
      Fn_resetPcPos("locator2_pc_start_pos")
    end)
  end
  Fn_missionStart(L0_2)
  _brain_crow:setFollowPoint(true, findGameObject2("Node", "locator2_crow_move_point_02"), 10)
  wait(92)
  _player_pup:setVisible(true)
  Fn_sendEventComSb("begin_b_sdemo_01")
  Fn_sendEventComSb("resetDefeatEnemyAndAliveSolCnt")
  Fn_sendEventComSb("enemyReset")
  wait(10)
  Fn_kaiwaDemoView("ep18_00220k")
  Camera:lookTo(Vector(-421.95, 183.09, 40.35), 0, 0)
  _sdemo:stop(0)
  Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  Fn_sendEventComSb("count_sol")
  Fn_sendEventComSb("checkDefeatEnemies")
  repeat
    wait()
  until _brain_crow:isMovePointEnd()
  _brain_crow:clearMovePoint()
  _brain_crow:setIdling(false)
  Fn_userCtrlOn()
  Fn_sendEventComSb("begin_main_b")
  Fn_missionView("ep18_01000")
  invokeTask(function()
    repeat
      wait()
    until Fn_sendEventComSb("checkMissionRetry")
    Sound:playSE("pc1_065")
    Fn_captionViewWait("ep18_01001")
    Fn_kaiwaDemoView("ep18_00225k")
    Fn_userCtrlOff()
    Player:setNoDamageMode(Player.kNoDamage_All, true)
    HUD:blackout(0.5)
    waitSeconds(1)
    Fn_scriptGameOver(true)
  end)
  Fn_disappearNpc("ep18_kaji", 0)
  Area:gravityStorm(Vector(-410, 219, 40), 100)
  repeat
    wait()
  until Fn_sendEventComSb("checkEndPhase")
  Fn_captionViewEnd()
  _brain_crow:setFollowPoint(false, findGameObject2("Node", "locator2_crow_move_point_02"), 10)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function moveCrow()
  local L0_5, L1_6, L2_7, L3_8
  L0_5 = Fn_sendEventComSb
  L1_6 = "getgrigoPuppet"
  L2_7 = "ene_grigo_01"
  L0_5 = L0_5(L1_6, L2_7)
  _grigo_pup = L0_5
  L0_5 = findGameObject2
  L1_6 = "Node"
  L2_7 = "locator2_crow_start_pos"
  L0_5 = L0_5(L1_6, L2_7)
  L1_6 = L0_5
  L0_5 = L0_5.getWorldPos
  L0_5 = L0_5(L1_6)
  L1_6 = findGameObject2
  L2_7 = "Node"
  L3_8 = "locator2_crow_move_point_01"
  L1_6 = L1_6(L2_7, L3_8)
  L2_7 = L1_6
  L1_6 = L1_6.getWorldPos
  L1_6 = L1_6(L2_7)
  L2_7 = findGameObject2
  L3_8 = "Node"
  L2_7 = L2_7(L3_8, "locator2_crow_move_point_02")
  L3_8 = L2_7
  L2_7 = L2_7.getWorldPos
  L2_7 = L2_7(L3_8)
  L3_8 = {
    {
      pos = L1_6,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L2_7,
      action = Supporter.MovePoint.Air,
      vel = 10
    }
  }
  _brain_crow:setMovePoints(L3_8)
  _brain_crow:startMovePoint()
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_9
  L1_9 = _warp_caption_flag
  if L1_9 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep18_01002")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function Finalize()
  Area:gravityStorm()
  if Fn_getPlayer() then
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
    _player_pup:setVisible(true)
  end
end
