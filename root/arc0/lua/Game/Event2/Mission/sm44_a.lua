dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm44_common.lua")
dofile("/Game/Misc/pdemo.lua")
_puppets = {}
_costume_pdemo = nil
_father_sdemo = nil
FATHER_WALK_RATE = 1.2
FATHER_FEINT_RANGE = 8
FATHER_FEINT_NUM = {
  0,
  0,
  0
}
FATHER_FRONT_RANGE = 3
FATHER_FRONT_OUTRANGE = 8
FATHER_FRONT_ANGLE = 30
FATHER_FRONT_DANGER = 3
FATHER_NEAR_RANGE = 3
FATHER_AROUND_RANGE = 2.7
OTHER_CREATE_NUM = 0
PLAYER_MOTION = {
  greeting = "kit01_sm44_greeting_00"
}
NPC_MOTION = {
  talk04 = "man01_talk_04",
  glad00 = "auj01_glad_00"
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = _puppets
  L0_0.sm44_client = Fn_findNpcPuppet("sm44_client")
  L0_0 = {
    {
      name = "father_01",
      type = "auj02",
      node = "locator2_father_01",
      attach = false,
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _puppets.father_01:loadPoseAnimation("stay", "auj01_drunk_stay_00")
  _puppets.father_01:loadPoseAnimation("walk", "auj01_drunk_walk_00")
  Fn_loadNpcEventMotion("father_01", NPC_MOTION)
  sm44_InitGame(1, "father_01", FATHER_WALK_RATE, FATHER_FEINT_RANGE, FATHER_FEINT_NUM, "locator2_player_start", FATHER_FRONT_RANGE, FATHER_FRONT_OUTRANGE, FATHER_FRONT_ANGLE, FATHER_FRONT_DANGER, FATHER_NEAR_RANGE, FATHER_AROUND_RANGE, OTHER_CREATE_NUM)
  _father_sdemo = SDemo.create("sm44_father_sdemo")
  _costume_pdemo = PDemo.create("kit03_dress_00", findGameObject2("Node", "locator2_costume"), {camera = true, scene_param = false})
end
function Ingame()
  sm44_setOtherActive(true)
  sm44_startOther()
  Fn_userCtrlAllOff()
  Fn_sendEventComSb("sm44_startCatWarp", "sm44_a", _puppets.father_01)
  Fn_findNpc("father_01"):ignoreStoop()
  Fn_missionStart()
  Fn_kaiwaDemoView("sm44_00100k")
  ChangeCostume()
  Fn_setNpcActive("sm44_client", false)
  Fn_resetPcPos("locator2_player_start")
  Player:setStay(false)
  Fn_setNpcActive("father_01", true)
  _father_sdemo:reset()
  _father_sdemo:set("locator2_father_cam_01", _puppets.father_01, kSDEMO_APPEND_AIM, Vector(0, 1.5, 0))
  _father_sdemo:play()
  Fn_fadein()
  waitSeconds(4)
  Sound:playSE("auj_013")
  Fn_captionViewWait("sm44_00100")
  waitSeconds(2)
  Fn_kaiwaDemoView("sm44_00300k")
  _father_sdemo:stop(1)
  wait()
  RAC_invokeMoveCharaTaskComSb2("sm44_findGameObject2", "father_01", {
    "locator2_father_start00",
    "locator2_father_start01"
  }, {
    arrivedLength = 0,
    runLength = 99999,
    anim_walk_speed = 1,
    anim_speed_over = true
  }):abort()
  RAC_stopNpcMoveTask("father_01")
  RAC_infoView("sm44_info_01")
  Fn_userCtrlOn()
  Fn_setBgmPoint("event", "chase_start")
  HUD:counter99_99SetTextID("sm44_00101")
  HUD:counter99_99SetMax(#FATHER_FEINT_NUM)
  HUD:counter99_99SetNum(sm44_GetClearNum())
  HUD:counter99_99SetVisible(true)
  Fn_missionViewWait(SM44_MISSION_CAPTION)
  sm44_StartGame()
  while true do
    Fn_sendEventComSb("sm44_stopCatWarp", false)
    if _isRetry then
      RAC_infoView("sm44_info_01")
      Fn_setBgmPoint("event", "chase_start")
      Fn_missionViewWait(SM44_MISSION_CAPTION)
      sm44_MoveFather()
      _isRetry = false
    end
    while sm44_UpdateGame(1) do
      wait()
    end
    while Fn_sendEventComSb("sm44_isBusyCatWarp") do
      wait()
    end
    Fn_sendEventComSb("sm44_stopCatWarp", true)
    sm44_StopGame()
    if not FatherArrivalCheck(1, "father_01", NPC_MOTION.talk04, #FATHER_FEINT_NUM) then
    end
  end
  Fn_blackout()
  HUD:counter99_99SetVisible(false)
  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
  Player:setStay(false)
  sm44_FinalGame()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_disableCostumeChange(false)
end
function ChangeCostume()
  Fn_blackout()
  RAC_setCostumeWait("kit03", "locator2_costume_wait")
  Fn_disableCostumeChange(true)
  Fn_loadPlayerMotion(PLAYER_MOTION)
  Player:setStay(true)
  while _costume_pdemo:isLoading() == false do
    wait()
  end
  _costume_pdemo:play()
  Fn_fadein()
  while _costume_pdemo:isEnd() == false do
    wait()
  end
  Fn_kaiwaDemoView("sm44_00200k")
  Fn_blackout()
  _costume_pdemo:stop(0)
  _costume_pdemo:try_term()
end
