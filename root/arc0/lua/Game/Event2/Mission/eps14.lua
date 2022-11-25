dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
_puppet_tbl = {}
_npc_tbl = {}
_pc_puppet = nil
_kit_mot = {}
_eqotask = nil
_yakata_pos = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "auj01",
      type = "auj01",
      node = "locator2_auj01"
    },
    {
      name = "eug01",
      type = "eug01",
      node = "locator2_eug01"
    },
    {
      name = "new01",
      type = "new01",
      node = "locator2_new01"
    },
    {
      name = "eqo01",
      type = "eqo01",
      node = "locator2_eqo01"
    }
  }
  _npc_tbl = Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _yakata_pos = findGameObject2("Node", "locator2_aki01")
  _pc_puppet = Fn_getPlayer()
  _kit_mot = {
    byebye = "kit01_greeting_00"
  }
  Fn_loadPlayerMotion(_kit_mot)
  Fn_pcSensorOff("pccubesensor2_ed_01")
  Fn_pcSensorOff("pccubesensor2_ed_02")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4
  while true do
    L0_1 = _npc_tbl
    L0_1 = L0_1.auj01
    L1_2 = L0_1
    L0_1 = L0_1.isReadyNpc
    L0_1 = L0_1(L1_2)
    if L0_1 ~= false then
      L0_1 = _npc_tbl
      L0_1 = L0_1.eug01
      L1_2 = L0_1
      L0_1 = L0_1.isReadyNpc
      L0_1 = L0_1(L1_2)
    end
    if L0_1 == false then
      L0_1 = wait
      L0_1()
    end
  end
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "eps14_00010k"
  L0_1(L1_2)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = invokeTask
  function L1_2()
    local L0_5
    L0_5 = "locator2_eug01"
    Fn_turnNpc("auj01", L0_5)
    Fn_repeatPlayMotion("auj01", "talk_04", {"talk_01", "talk_02"}, 10, 20)
  end
  L0_1(L1_2)
  L0_1 = invokeTask
  function L1_2()
    local L0_6
    L0_6 = Fn_playMotionNpc
    L0_6("eug01", "talk_sad_02")
    L0_6 = "locator2_auj01"
    Fn_turnNpc("eug01", L0_6)
    Fn_playLoopMotionInsert("eug01", "stay", {"reply_no", "talk_03"}, 5, 10)
  end
  L0_1(L1_2)
  L0_1 = Fn_watchNpc
  L1_2 = "auj01"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_watchNpc
  L1_2 = "eug01"
  L2_3 = false
  L0_1(L1_2, L2_3)
  L0_1 = Fn_captionViewWait
  L1_2 = "ep14_00001"
  L0_1(L1_2)
  L0_1 = Fn_missionView
  L1_2 = "ep14_00002"
  L0_1(L1_2)
  L0_1 = waitSeconds
  L1_2 = 1
  L0_1(L1_2)
  L0_1 = findGameObject2
  L1_2 = "Node"
  L2_3 = "locator2_ed_navi"
  L0_1 = L0_1(L1_2, L2_3)
  L1_2 = Fn_naviSet
  L2_3 = L0_1
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_ed_01"
  L1_2(L2_3)
  L1_2 = waitPhase
  L1_2()
  L1_2 = Fn_naviKill
  L1_2()
  L1_2 = Fn_missionView
  L2_3 = "ep14_00004"
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 1.3
  L1_2(L2_3)
  L1_2 = Fn_naviSet
  L2_3 = _yakata_pos
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 2.5
  L1_2(L2_3)
  L1_2 = Fn_captionView
  L2_3 = "ep14_00003"
  L1_2(L2_3)
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "eqo01"
  L3_4 = "talk_00"
  L1_2 = L1_2(L2_3, L3_4, {
    "talk_cid_00",
    "talk_cid_01"
  }, 5, 10)
  L2_3 = Fn_repeatPlayMotion
  L3_4 = "new01"
  L2_3 = L2_3(L3_4, "talk_00", {
    "talk_laugh_00"
  }, 4, 10)
  while true do
    L3_4 = rayCheck
    L3_4 = L3_4(_puppet_tbl.new01, 50, 1.5)
    if L3_4 == false then
      L3_4 = wait
      L3_4()
    end
  end
  L3_4 = pcStayCamStopOn
  L3_4()
  L3_4 = Fn_naviKill
  L3_4()
  L3_4 = Fn_captionView
  L3_4("ep14_00005")
  L3_4 = waitSeconds
  L3_4(1)
  L3_4 = viewControl
  L3_4(_puppet_tbl.new01, 1, 1.5)
  L3_4 = HUD
  L3_4 = L3_4.naviSetPochiDistanceDensity0
  L3_4(L3_4, 50)
  L3_4 = HUD
  L3_4 = L3_4.naviSetPochiDistanceDensity100
  L3_4(L3_4, 55)
  L3_4 = Fn_naviSet
  L3_4(findGameObject2("Node", "locator2_neweqo_navi"))
  L3_4 = Fn_captionView
  L3_4("ep14_00006")
  L3_4 = pcStayCamStopOff
  L3_4()
  repeat
    L3_4 = wait
    L3_4()
    L3_4 = Fn_getDistanceToPlayer
    L3_4 = L3_4(_puppet_tbl.new01)
  until L3_4 < 3
  L3_4 = Fn_naviKill
  L3_4()
  L3_4 = Fn_blackout
  L3_4()
  L3_4 = pcStayCamStopOn
  L3_4()
  L3_4 = L1_2.abort
  L3_4(L1_2)
  L1_2 = nil
  L3_4 = L2_3.abort
  L3_4(L2_3)
  L2_3 = nil
  L3_4 = invokeTask
  L3_4 = L3_4(function()
    Fn_turnNpc("new01")
  end)
  new_turn = L3_4
  L3_4 = Fn_resetPcPos
  L3_4("locator2_pc_reset_pos")
  L3_4 = Fn_turnNpc
  L3_4("eqo01")
  L3_4 = Fn_fadein
  L3_4()
  L3_4 = Fn_kaiwaDemoView
  L3_4("eps14_00015k")
  L3_4 = _npc_tbl
  L3_4 = L3_4.new01
  L3_4 = L3_4.resetSightParam
  L3_4(L3_4)
  L3_4 = _npc_tbl
  L3_4 = L3_4.eqo01
  L3_4 = L3_4.resetSightParam
  L3_4(L3_4)
  L3_4 = {}
  L3_4.valid = false
  L3_4.watchTarget = false
  param = L3_4
  L3_4 = _npc_tbl
  L3_4 = L3_4.new01
  L3_4 = L3_4.setSightParam
  L3_4(L3_4, param)
  L3_4 = _npc_tbl
  L3_4 = L3_4.eqo01
  L3_4 = L3_4.setSightParam
  L3_4(L3_4, param)
  L3_4 = createGameObject2
  L3_4 = L3_4("Node")
  L3_4:setPos(Vector(0, 0, -0.5))
  _puppet_tbl.eqo01:appendChild(L3_4)
  L3_4:try_init()
  L3_4:waitForReady()
  L3_4:try_start()
  invokeTask(function()
    local L0_7
    L0_7 = Fn_playMotionNpc
    L0_7("eqo01", "greeting")
    L0_7 = {
      "locator2_eqo_pos_01",
      "locator2_eqo_pos_02",
      "locator2_eqo_pos_03",
      "locator2_eqo_pos_04"
    }
    _eqotask = Fn_moveNpc("eqo01", L0_7, {anim_walk_speed = 0.7})
  end)
  waitSeconds(0.3)
  invokeTask(function()
    local L0_8
    L0_8 = Fn_playMotionNpc
    L0_8("new01", "greeting", true)
    L0_8 = waitSeconds
    L0_8(0.4)
    L0_8 = Fn_turnNpc
    L0_8("new01", _puppet_tbl.eqo01)
    L0_8 = {}
    L0_8.target = _puppet_tbl.eqo01
    L0_8.watchTarget = true
    L0_8.targetJoint = "bn_head"
    Fn_findNpc("new01"):setSightParam(L0_8)
    waitSeconds(1)
    while _eqotask:isRunning() do
      while Fn_moveNpc("new01", {L3_4}, {
        anim_walk_speed = 0.8,
        runLength = 2,
        arrivedLength = -1,
        goalDirection = true,
        loop = true
      }):isRunning() do
        wait()
      end
    end
  end)
  waitSeconds(0.6)
  Fn_playPlayerMotionWait(_kit_mot.byebye, 0)
  waitSeconds(0.5)
  Fn_captionViewWait("ep14_00007")
  waitSeconds(1)
  Fn_kaiwaDemoView("eps14_00020k")
  Fn_disappearNpc("new01")
  Fn_disappearNpc("eqo01")
  waitSeconds(0.5)
  HUD:info("eps14_info_01", false)
  pcStayCamStopOff()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10
end
