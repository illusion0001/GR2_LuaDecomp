dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
MOTHER_NOTICED_DISTANCE = 2.5
PHOTO_NEAR = 5
PHOTO_FAR = 20
RETRY_STATE = {
  NONE = 0,
  FRONT = 1,
  CAMERA = 2
}
SHIP_FIND_DISTANCE = 90
_puppet_tbl = {}
_npc_tbl = {}
_sdemo_watching = nil
_photo = nil
_photo_area = false
_more_important_navi_view = false
_cat_navi_view = false
_phase = 1
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_driver_look_pc_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_driver_demo_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_a2_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_a2_phase02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_a2_phase03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a2_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a2_phase01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a2_phase02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a2_phase02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarning_a2_phase03")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_a2_phase02")
  L0_0 = {
    {
      name = "sm16_mother",
      type = "wom20",
      node = "locator2_mother_path_01",
      reset = false
    },
    {
      name = "sm16_driver",
      type = "man49",
      node = "locator2_driver",
      reset = false
    },
    {
      name = "sm16_dock_answer",
      type = "man45",
      node = "locator2_dock_answer",
      reset = false
    },
    {
      name = "sm16_talk_man",
      type = "man33",
      node = "locator2_talk_man",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _npc_tbl[_FORV_5_.name] = Fn_findNpc(_FORV_5_.name)
  end
  _puppet_tbl.sm16_client = Fn_findNpcPuppet("sm16_client")
  _sdemo_watching = SDemo.create("sm16_a_sdemo_watching")
  Fn_userCtrlAllOff()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = Fn_sendEventComSb
  L1_2 = "motherShipSetActive"
  L2_3 = true
  L0_1(L1_2, L2_3)
  L0_1, L1_2 = nil, nil
  L2_3 = Fn_playLoopMotionInsert
  L3_4 = "sm16_mother"
  L4_5 = "talk_03"
  L5_6 = {"talk_02"}
  L2_3 = L2_3(L3_4, L4_5, L5_6, 3, 3)
  L0_1 = L2_3
  L2_3 = Fn_playLoopMotionInsert
  L3_4 = "sm16_driver"
  L4_5 = "talk_03"
  L5_6 = {"stay"}
  L2_3 = L2_3(L3_4, L4_5, L5_6, 2, 2)
  L1_2 = L2_3
  L2_3 = Fn_turnNpc
  L3_4 = "sm16_mother"
  L4_5 = _puppet_tbl
  L4_5 = L4_5.sm16_driver
  L2_3(L3_4, L4_5)
  L2_3 = Fn_missionStart
  L2_3()
  _phase = 1
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_guide_a2_phase01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarning_a2_phase01"
  L2_3(L3_4)
  L2_3 = Fn_pcSensorOn
  L3_4 = "pccubesensor2_catwarp_a2_phase01"
  L2_3(L3_4)
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_pc_start_pos"
  L2_3(L3_4)
  L2_3 = Fn_userCtrlOn
  L2_3()
  L2_3 = Camera
  L3_4 = L2_3
  L2_3 = L2_3.setControl
  L4_5 = Camera
  L4_5 = L4_5.kPlayer
  L5_6 = Camera
  L5_6 = L5_6.kControl_All
  L2_3(L3_4, L4_5, L5_6, true)
  L2_3 = invokeTask
  function L3_4()
    _npc_tbl.sm16_dock_answer:resetDirection()
    repeat
      wait()
    until _npc_tbl.sm16_dock_answer:isTurnEnd()
    wait()
    Fn_playMotionNpc("sm16_dock_answer", "stay_01", false)
  end
  L2_3(L3_4)
  L2_3 = Fn_missionView
  L3_4 = "sm16_00109"
  L2_3(L3_4)
  L2_3 = Photo
  L2_3 = L2_3.create
  L3_4 = kPHOTO_CAPTION_ON
  L4_5 = kPHOTO_TYPE_ONCE
  L5_6 = true
  L2_3 = L2_3(L3_4, L4_5, L5_6, {
    near = PHOTO_NEAR,
    far = PHOTO_FAR
  })
  _photo = L2_3
  L2_3 = _photo
  L3_4 = L2_3
  L2_3 = L2_3.set
  L4_5 = _puppet_tbl
  L4_5 = L4_5.sm16_mother
  L5_6 = "loc_head"
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = RETRY_STATE
  L2_3 = L2_3.NONE
  L3_4 = false
  L4_5 = invokeTask
  function L5_6()
    while not L3_4 do
      if Mv_isEyesight(Fn_findNpcPuppet("sm16_mother"), Fn_getPlayer(), 45, 15, Vector(0, 1.5, 0)) then
        L2_3 = RETRY_STATE.FRONT
      elseif Fn_getDistanceToPlayer(_puppet_tbl.sm16_mother) <= MOTHER_NOTICED_DISTANCE and HUD:isPhotoMode() then
        L2_3 = RETRY_STATE.CAMERA
      end
      if L2_3 ~= RETRY_STATE.NONE then
        Fn_missionViewEnd()
        _photo = Mv_safeObjectKill(_photo)
        Fn_captionViewEnd()
        L0_1:abort()
        L1_2:abort()
        Player:setStay(true)
        Fn_userCtrlOff()
        Fn_turnNpc("sm16_mother")
        Fn_playMotionNpc("sm16_mother", "talk_angry_00", false)
        if L2_3 == RETRY_STATE.FRONT then
          Fn_captionViewWait("sm16_00110")
        elseif L2_3 == RETRY_STATE.CAMERA then
          Fn_captionViewWait("sm16_00111")
        end
        Fn_captionViewWait("sm16_00112")
        Mv_sceneSwitchFade(function()
          Fn_warpNpc("sm16_mother", "locator2_mother_reset")
          if HUD:isPhotoMode() then
            HUD:setPhotoMode(false)
          end
          Fn_resetPcPos("locator2_pc_restart_dock_pos")
          L0_1 = Fn_playLoopMotionInsert("sm16_mother", "talk_03", {"talk_02"}, 3, 3)
          L1_2 = Fn_playLoopMotionInsert("sm16_driver", "talk_03", {"stay"}, 2, 2)
          L2_3 = RETRY_STATE.NONE
        end)
        Player:setStay(false)
        Fn_userCtrlOn()
        Fn_missionView("sm16_00109")
        _photo = Photo.create(kPHOTO_CAPTION_ON, kPHOTO_TYPE_ONCE, true, {
          near = PHOTO_NEAR,
          far = PHOTO_FAR
        })
        _photo:set(_puppet_tbl.sm16_mother, "loc_head")
      end
      wait()
    end
  end
  L4_5 = L4_5(L5_6)
  while not L3_4 do
    L5_6 = _photo_area
    if L5_6 then
      L5_6 = _photo
      L5_6 = L5_6.run
      L5_6(L5_6)
      repeat
        L5_6 = wait
        L5_6()
        while true do
          L5_6 = _photo
          if L5_6 == nil then
            L5_6 = wait
            L5_6()
          end
        end
        L5_6 = _photo_area
        if L5_6 ~= false then
          L5_6 = _photo
          L5_6 = L5_6.isRunning
          L5_6 = L5_6(L5_6)
        end
      until not L5_6
      L5_6 = _photo_area
      if L5_6 == true then
        L5_6 = RETRY_STATE
        L5_6 = L5_6.NONE
        if L2_3 == L5_6 then
          L5_6 = _photo
          L5_6 = L5_6.getPhotoState
          L5_6 = L5_6(L5_6)
          if L5_6 == kPHOTO_OK or L5_6 == kPHOTO_NEAR or L5_6 == kPHOTO_ANGLE then
            L4_5 = Mv_safeTaskAbort(L4_5)
            Sound:pulse("success")
            Fn_pcSensorOff("pccubesensor2_guide_a2_phase01")
            Fn_pcSensorOff("pccubesensor2_catwarning_a2_phase01")
            Fn_pcSensorOff("pccubesensor2_catwarp_a2_phase01")
            Fn_captionViewWait("sm16_00114")
            L3_4 = true
            break
          elseif L5_6 == kPHOTO_FAR then
            Fn_captionView("sm16_00115")
          elseif L5_6 == kPHOTO_OUT then
            Fn_captionView("sm16_00116")
          elseif L5_6 == kPHOTO_BACK then
            Fn_captionView("sm16_00117")
          end
        end
      end
    end
    L5_6 = wait
    L5_6()
  end
  L5_6 = Mv_safeObjectKill
  L5_6 = L5_6(_photo)
  _photo = L5_6
  _photo_area = false
  L5_6 = waitSeconds
  L5_6(1)
  L5_6 = Fn_userCtrlAllOff
  L5_6()
  L5_6 = Camera
  L5_6 = L5_6.setControl
  L5_6(L5_6, Camera.kPlayer, Camera.kControl_All, false)
  L5_6 = Mv_sceneSwitchFade
  L5_6(function()
    L1_2 = Mv_safeTaskAbort(L1_2)
    Fn_resetPcPos("locator2_pc_sdemo_dock_pos_01")
    _sdemo_watching:set("locator2_sdemo_watching_cam_pos_01", "locator2_sdemo_watching_aim_pos_01")
    _sdemo_watching:play()
    Fn_warpNpc("sm16_driver", "locator2_driver_pos")
    Fn_playMotionNpc("sm16_driver", "stay_01", false)
    waitSeconds(1)
  end)
  L5_6 = waitSeconds
  L5_6(1.5)
  L5_6 = _sdemo_watching
  L5_6 = L5_6.play
  L5_6(L5_6, {
    {
      pos = "locator2_sdemo_watching_cam_pos_02",
      time = 2
    }
  }, {
    {
      pos = "locator2_sdemo_watching_aim_pos_02",
      time = 2
    }
  })
  L5_6 = waitSeconds
  L5_6(2.5)
  L5_6 = Fn_appendNpcArea
  L5_6("sm16_mother", "locator2_mother_pos")
  L5_6 = Fn_warpNpc
  L5_6("sm16_mother", "locator2_mother_pos")
  L5_6 = Fn_sendEventComSb
  L5_6("motherShipSetActive", false)
  L5_6 = Mv_safeObjectKill
  L5_6 = L5_6(ship_hdl)
  ship_hdl = L5_6
  L5_6 = Fn_kaiwaDemoView
  L5_6("sm16_00320k")
  L5_6 = waitSeconds
  L5_6(0.5)
  L5_6 = _sdemo_watching
  L5_6 = L5_6.play
  L5_6(L5_6, {
    {
      pos = "locator2_sdemo_watching_cam_pos_03",
      time = 2
    }
  }, {
    {
      pos = "locator2_sdemo_watching_aim_pos_03",
      time = 2
    }
  })
  L5_6 = waitSeconds
  L5_6(2.5)
  L5_6 = Sound
  L5_6 = L5_6.playSE
  L5_6(L5_6, "kit_586")
  L5_6 = Fn_captionViewWait
  L5_6("sm16_00119")
  L5_6 = waitSeconds
  L5_6(0.5)
  _phase = 2
  L5_6 = Fn_pcSensorOn
  L5_6("pccubesensor2_guide_a2_phase02")
  L5_6 = Fn_pcSensorOn
  L5_6("pccubesensor2_catwarning_a2_phase02")
  L5_6 = Fn_pcSensorOn
  L5_6("pccubesensor2_catwarp_a2_phase02")
  L5_6 = Fn_setCatWarpCheckPoint
  L5_6("locator2_navi_dock")
  L5_6 = Fn_kaiwaDemoView
  L5_6("sm16_00330k")
  L5_6 = _sdemo_watching
  L5_6 = L5_6.stop
  L5_6(L5_6, 1)
  L5_6 = waitSeconds
  L5_6(1)
  L5_6 = Fn_userCtrlOn
  L5_6()
  L5_6 = Camera
  L5_6 = L5_6.setControl
  L5_6(L5_6, Camera.kPlayer, Camera.kControl_All, true)
  L5_6 = Fn_naviSet
  L5_6(_puppet_tbl.sm16_driver)
  _more_important_navi_view = true
  L5_6 = Fn_captionView
  L5_6("sm16_00120")
  L5_6 = Fn_pcSensorOn
  L5_6("pccubesensor2_driver_look_pc_01")
  L5_6 = Fn_pcSensorOn
  L5_6("pccubesensor2_driver_demo_01")
  L5_6 = Mv_waitPhase
  L5_6()
  L5_6 = Fn_kaiwaDemoView
  L5_6("sm16_00340k")
  L5_6 = Fn_naviKill
  L5_6()
  _more_important_navi_view = false
  L5_6 = Fn_pcSensorOff
  L5_6("pccubesensor2_driver_look_pc_01")
  L5_6 = Fn_pcSensorOff
  L5_6("pccubesensor2_driver_demo_01")
  L5_6 = Fn_createGimmickBg
  L5_6 = L5_6("locator2_ship_01", "ve_lo_b", "ve_lo_b")
  L5_6:setVisibleBlockEnable(false)
  Fn_setNpcActive("sm16_talk_man", true)
  Fn_playLoopMotionInsert("sm16_talk_man", "talk_03", {"stay"}, 2, 2)
  Fn_naviSet(findGameObject2("Node", "locator2_navi_water_park"))
  _more_important_navi_view = true
  _phase = 3
  Fn_pcSensorOff("pccubesensor2_guide_a2_phase02")
  Fn_pcSensorOff("pccubesensor2_catwarning_a2_phase02")
  Fn_pcSensorOff("pccubesensor2_catwarp_a2_phase02")
  Fn_pcSensorOn("pccubesensor2_guide_a2_phase03")
  Fn_pcSensorOn("pccubesensor2_catwarning_a2_phase03")
  Fn_pcSensorOn("pccubesensor2_catwarp_a2_phase03")
  Fn_setCatWarpCheckPoint("locator2_resetpos_dock_edge")
  Fn_captionViewWait("sm16_00121")
  Fn_missionViewWait("sm16_00122")
  while Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_navi_dock")) <= 70 do
    wait()
  end
  invokeTask(function()
    local L0_7
    L0_7 = 0
    while Mv_isWaitPhase() do
      if L0_7 == 100 then
        Fn_captionViewWait("sm16_00123")
      elseif L0_7 == 200 then
        Fn_captionViewWait("sm16_00124")
      elseif L0_7 == 300 then
        Fn_captionViewWait("sm16_00125")
      elseif L0_7 == 400 then
        Fn_captionViewWait("sm16_00126")
      end
      if L0_7 >= 500 then
        Fn_captionViewEnd()
        break
      end
      L0_7 = L0_7 + 1
      wait()
    end
  end)
  repeat
    while not (Fn_getDistanceToPlayer(L5_6) <= SHIP_FIND_DISTANCE) or not Mv_isThroughRay(Fn_getPlayer(), L5_6, Vector(0, 0, 1.5)) do
      wait()
    end
  until false
  Fn_naviKill()
  _more_important_navi_view = false
  if Player:getEnergy(Player.kEnergy_Gravity) == 0 then
    print("\233\135\141\229\138\155\227\130\168\227\131\138\227\130\184\227\131\188\227\129\1400\227\129\167\227\129\153")
    Player:setEnergy(Player.kEnergy_Gravity, 0.3)
    Fn_coercionGravityShift()
  end
  Fn_userCtrlAllOff()
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
  Player:setStay(true)
  Fn_captionViewWait("sm16_00132")
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
  Fn_naviSet(findGameObject2("Node", "locator2_ship_01"))
  _more_important_navi_view = true
  Fn_captionViewWait("sm16_00127")
  waitSeconds(1)
  Fn_blackout()
  Player:setStay(false)
  Fn_disappearNpc("sm16_dock_answer")
  Fn_disappearNpc("sm16_driver")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_8, L1_9
end
function pccubesensor2_driver_look_pc_01_OnEnter()
  invokeTask(function()
    Fn_turnNpc("sm16_driver")
  end)
end
function pccubesensor2_driver_demo_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_driver_demo_01")
  Fn_captionViewEnd()
  Mv_gotoNextPhase()
end
function pccubesensor2_guide_OnLeave()
  local L0_10
  L0_10 = print
  L0_10("\232\170\152\229\176\142\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\227\129\167\227\129\159\239\188\129\239\188\129")
  L0_10 = _more_important_navi_view
  if not L0_10 then
    L0_10 = nil
    if _phase == 1 then
      L0_10 = "locator2_mother_reset"
    elseif _phase == 2 then
      L0_10 = "locator2_driver_pos"
    end
    if L0_10 ~= nil then
      Fn_naviSet(findGameObject2("Node", L0_10))
      _cat_navi_view = true
    end
  end
  L0_10 = _phase
  if L0_10 == 1 then
    _photo_area = false
    L0_10 = Fn_captionView
    L0_10("sm16_00131")
  else
    L0_10 = _phase
    if L0_10 == 2 then
      L0_10 = Fn_captionView
      L0_10("sm16_00130")
    else
      L0_10 = _phase
      if L0_10 == 3 then
        L0_10 = Fn_captionView
        L0_10("sm16_00135")
      end
    end
  end
end
function pccubesensor2_guide_OnEnter()
  print("\232\170\152\229\176\142\227\130\187\227\131\179\227\130\181\227\131\188\227\129\171\229\133\165\227\129\163\227\129\159\239\188\129\239\188\129")
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
  if _phase == 1 then
    _photo_area = true
    if _photo ~= nil then
      invokeTask(function()
        _photo:resetCaption()
        print("\227\131\149\227\130\169\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\131\170\227\130\187\227\131\131\227\131\136\239\188\129")
      end)
    end
  end
end
function pccubesensor2_catwarning_OnLeave()
  print("\232\173\166\229\145\138\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\159\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    if Player:isGravityControlMode() or Player:getAction() == Player.kAction_Jump then
      Player:setStay(true)
    end
    if _more_important_navi_view == false then
    end
    Fn_captionViewWait("sm16_09000")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_OnLeave()
  print("\227\131\175\227\131\188\227\131\151\227\130\187\227\131\179\227\130\181\227\131\188\227\129\139\227\130\137\229\135\186\227\129\159\239\188\129\239\188\129\239\188\129")
  invokeTask(function()
    Fn_catWarp()
    if _phase == 1 then
      invokeTask(function()
        _photo:resetCaption()
        print("\227\131\149\227\130\169\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\131\170\227\130\187\227\131\131\227\131\136\239\188\129")
      end)
    end
  end)
end
