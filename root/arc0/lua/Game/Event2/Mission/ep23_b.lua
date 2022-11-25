dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/pdemo.lua")
_area_name = "et3_a_01"
_next_area = "et3_a_02"
_tutorial = false
_col_tbl = {}
_cid01_mot = {
  wait = "cid01_stay_03"
}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = Fn_setNoDamageMode
  L0_0(Player.kNoDamage_FromCrash, true)
  L0_0 = {
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_ep23_b_cid",
      attach = false,
      use_gravity = false
    },
    {
      name = "bit01",
      type = "bit01",
      node = "locator2_bit04",
      attach = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(L0_0)
  Fn_loadNpcEventMotion("cid01", _cid01_mot)
  _sdemo = SDemo.create("ep23_b")
  _pdemo = PDemo.create("ep23_a_c01", nil, {camera = false, scene_param = false})
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestComSensorOn"
  L2_3 = "pccubesensor2_over_"
  L3_4 = _area_name
  L2_3 = L2_3 .. L3_4
  L0_1(L1_2, L2_3)
  L0_1 = Fn_sendEventComSb
  L1_2 = "moveTuneGimmick"
  L2_3 = _area_name
  L0_1(L1_2, L2_3)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestCreateTheaterCollision"
  L2_3 = _area_name
  L0_1(L1_2, L2_3)
  L0_1 = Fn_sendEventComSb
  L1_2 = "requestTutorial"
  L0_1(L1_2)
  L0_1 = create_tutorial_coll
  L0_1()
  L0_1 = Fn_sendEventComSb
  L1_2 = "getComGameObject"
  L2_3 = "Node"
  L3_4 = "locator2_"
  L4_5 = _area_name
  L5_6 = "_theater_demo"
  L3_4 = L3_4 .. L4_5 .. L5_6
  L0_1 = L0_1(L1_2, L2_3, L3_4)
  L2_3 = L0_1
  L1_2 = L0_1.appendChild
  L3_4 = _pdemo
  L3_4 = L3_4.pdemo
  L1_2(L2_3, L3_4)
  L1_2 = Fn_findNpc
  L2_3 = "cid01"
  L1_2 = L1_2(L2_3)
  L2_3 = Fn_findNpcPuppet
  L3_4 = L1_2
  L2_3 = L2_3(L3_4)
  L3_4 = Fn_playNpcEventMotion
  L4_5 = L1_2
  L5_6 = _cid01_mot
  L5_6 = L5_6.wait
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9)
  L3_4 = Fn_findNpc
  L4_5 = "bit01"
  L3_4 = L3_4(L4_5)
  L4_5 = Fn_findNpcPuppet
  L5_6 = L3_4
  L4_5 = L4_5(L5_6)
  L5_6 = Fn_setNpcAlpha
  L5_6(L6_7, L7_8, L8_9)
  L5_6 = Fn_missionStart
  L5_6()
  L5_6 = Fn_kaiwaDemoView
  L5_6(L6_7)
  L5_6 = invokeTask
  L5_6(L6_7)
  L5_6 = Fn_userCtrlOn
  L5_6()
  L5_6 = Fn_captionView
  L5_6(L6_7)
  L5_6 = waitSeconds
  L5_6(L6_7)
  L5_6 = Fn_naviSet
  L9_10 = L6_7(L7_8, L8_9)
  L5_6(L6_7, L7_8, L8_9, L9_10, L6_7(L7_8, L8_9))
  while true do
    L5_6 = _tutorial
    if L5_6 == false then
      L5_6 = wait
      L5_6()
    end
  end
  L5_6 = Fn_naviKill
  L5_6()
  L5_6 = _col_tbl
  L5_6 = L5_6[2]
  L5_6 = L5_6.setCollidablePermission
  L5_6(L6_7, L7_8)
  L5_6 = _col_tbl
  L5_6 = L5_6[3]
  L5_6 = L5_6.setCollidablePermission
  L5_6(L6_7, L7_8)
  L5_6 = false
  while true do
    if L6_7 == true then
      if L6_7 ~= L7_8 then
        if L5_6 == false then
          L9_10 = false
          L6_7(L7_8, L8_9, L9_10)
          L5_6 = true
        end
        elseif L5_6 == true then
          L9_10 = true
          L6_7(L7_8, L8_9, L9_10)
          L5_6 = false
        end
        L6_7()
      end
  end
  L6_7()
  L9_10 = 1
  L6_7(L7_8, L8_9, L9_10, "", L4_5)
  L9_10 = L4_5.getWorldPos
  L9_10 = L9_10(L4_5)
  L9_10 = L9_10 + Vector(0, 0.5, 0)
  L6_7(L7_8, L8_9, L9_10, false)
  L6_7(L7_8, L8_9)
  L9_10 = "Node"
  L9_10 = L8_9
  L9_10 = 2
  L6_7(L7_8, L8_9, L9_10, 2)
  L6_7(L7_8)
  L6_7(L7_8)
  L6_7(L7_8)
  L6_7(L7_8)
  L6_7(L7_8)
  L6_7(L7_8)
  repeat
    L6_7()
  until L6_7
  L6_7()
  L6_7(L7_8)
  L6_7(L7_8)
  L9_10 = "locator2_cut02_aim01"
  L6_7(L7_8, L8_9, L9_10)
  L6_7(L7_8, L8_9)
  L6_7(L7_8)
  L9_10 = {}
  L9_10.pos = "locator2_cut02_cam02"
  L9_10.time = 4
  L9_10.hashfunc = "EaseInOut"
  L9_10 = {
    {
      pos = "locator2_cut02_aim02",
      time = 4,
      hashfunc = "EaseInOut"
    }
  }
  L6_7(L7_8, L8_9, L9_10)
  while true do
    if L6_7 then
      L6_7()
    end
  end
  L6_7(L7_8, L8_9)
  L6_7(L7_8)
  for L9_10, _FORV_10_ in L6_7(L7_8) do
    _FORV_10_:try_term()
  end
  _col_tbl = L6_7
  L6_7()
  L6_7(L7_8)
  L6_7(L7_8)
  while true do
    if L6_7 == false then
      L6_7()
    end
  end
  L6_7(L7_8)
  L6_7(L7_8, L8_9)
  L6_7(L7_8)
  L6_7(L7_8)
  L6_7(L7_8)
  L9_10 = "locator2_"
  L9_10 = L9_10 .. _area_name .. "_goal"
  L7_8(L8_9)
  while true do
    if L7_8 == false then
      L7_8()
    end
  end
  L7_8()
  L9_10 = _area_name
  L7_8(L8_9, L9_10)
  L7_8(L8_9)
  L9_10 = L7_8
  L8_9(L9_10, "et3_blackout_root")
  L8_9()
  while true do
    L9_10 = L8_9
    if L8_9 == false then
      L8_9()
    end
  end
  L9_10 = 1
  L8_9(L9_10)
  L9_10 = "createTheater"
  L9_10 = L8_9.try_init
  L9_10(L8_9)
  L9_10 = L8_9.waitForReady
  L9_10(L8_9)
  L9_10 = L8_9.try_start
  L9_10(L8_9)
  while true do
    L9_10 = _pdemo
    L9_10 = L9_10.isLoading
    L9_10 = L9_10(L9_10)
    if L9_10 == false then
      L9_10 = wait
      L9_10()
    end
  end
  L9_10 = _pdemo
  L9_10 = L9_10.play
  L9_10(L9_10)
  L9_10 = Fn_sendEventComSb
  L9_10("requestCreateSpotlight", _area_name)
  L9_10 = Fn_sendEventComSb
  L9_10("requestCreateNextStage")
  L9_10 = waitSeconds
  L9_10(0.5)
  L9_10 = Camera
  L9_10 = L9_10.lookTo
  L9_10(L9_10, L0_1:getWorldPos(), 2, 2)
  L9_10 = Fn_findNpcPuppet
  L9_10 = L9_10("kit04")
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 40
  Fn_captionView("ep23_01001", 10)
  Sound:playSE("w23_007", 1, "", L9_10)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 130
  Fn_captionView("ep23_01002", 10)
  Sound:playSE("w24_007", 1, "", L9_10)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 220
  Fn_captionView("ep23_01006", 10)
  Sound:playSE("w23_008", 1, "", L9_10)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 280
  Sound:playSE("w23_009", 1, "", L9_10)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 325
  Sound:playSE("w24_008", 1, "", L9_10)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 370
  Fn_captionView("ep23_01003", 6)
  Sound:playSE("ala_021", 1, "", L9_10)
  repeat
    wait()
  until _pdemo:getCurrentFrame() >= 500
  Fn_setBgmPoint("event", "ep23_demo_end")
  Fn_sendEventComSb("requestSpotlightKill")
  invokeTask(function()
    waitSeconds(1.5)
    L7_8:setSceneParameters("et3_a_root")
  end)
  waitSeconds(0.5)
  Fn_sendEventComSb("requestBreakStage", _area_name)
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_" .. _area_name .. "_next_stage")
  repeat
    wait()
  until Fn_sendEventComSb("isNextPhase")
  Fn_sendEventComSb("requestComSensorOn", "pccubesensor2_over_" .. _next_area)
  Fn_sendEventComSb("requestCreateDummyGimmick", _next_area)
  _pdemo:try_term()
  Fn_sendEventComSb("requestPrevStageKill")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Fn_setNoDamageMode(Player.kNoDamage_FromCrash, false)
  end
end
function pccubesensor2_tutorial_OnEnter(A0_11)
  local L1_12
  _tutorial = true
end
function pccubesensor2_tutorial_OnLeave(A0_13)
  local L1_14
  _tutorial = true
end
function create_tutorial_coll()
  local L0_15
  L0_15 = findGameObject2
  L0_15 = L0_15("Node", "locator2_tutorial_wall")
  _col_tbl[1] = createGameObject2("GimmickBg")
  _col_tbl[1]:setName("col_tutorial_wall")
  _col_tbl[1]:setCollisionName("ep23_walll")
  _col_tbl[1]:setAttributeName("invisible_col")
  _col_tbl[1]:setCollidablePermission(true)
  L0_15:appendChild(_col_tbl[1])
  L0_15 = findGameObject2("Node", "locator2_tutorial_col")
  _col_tbl[2] = createGameObject2("GimmickBg")
  _col_tbl[2]:setName("col_tutorial_col_1")
  _col_tbl[2]:setCollisionName("ep23_col")
  _col_tbl[2]:setAttributeName("invisible_col")
  _col_tbl[2]:setCollidablePermission(false)
  L0_15:appendChild(_col_tbl[2])
  _col_tbl[3] = createGameObject2("GimmickBg")
  _col_tbl[3]:setName("col_tutorial_col_2")
  _col_tbl[3]:setCollisionName("ep23_col")
  _col_tbl[3]:setAttributeName("invisible_col")
  _col_tbl[3]:setCollidablePermission(false)
  _col_tbl[3]:setPos(0, 3, 0)
  L0_15:appendChild(_col_tbl[3])
  start_game_obj()
end
