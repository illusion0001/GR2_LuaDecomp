dofile("/Game/Event2/Common/EventCommon.lua")
_cliant_name = "sm92_client"
_owner_name = "sm92_owner"
_cliant = nil
_owner = nil
_hint_reached = false
_point_reached = false
_kaiwa_finished = false
_navi_owner = false
_hint_task = nil
function Initialize()
  local L0_0, L1_1, L2_2
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {L1_1}
  L1_1 = {}
  L2_2 = _owner_name
  L1_1.name = L2_2
  L1_1.type = "man39"
  L1_1.node = "locator2_owner"
  L1_1 = Fn_setupNpc
  L2_2 = L0_0
  L1_1 = L1_1(L2_2)
  L2_2 = Fn_findNpcPuppet
  L2_2 = L2_2(_owner_name)
  _owner = L2_2
  L2_2 = Fn_findNpc
  L2_2 = L2_2(_cliant_name)
  _cliant = L2_2
  function L2_2()
    playerAction()
    L1_1[_owner_name]:setTurnParam(10)
    Fn_turnNpc(L1_1[_owner_name])
    Fn_kaiwaDemoView("sm92_00150k")
    Fn_naviKill()
    _kaiwa_finished = true
    HUD:inGamePreviewExit()
  end
  Fn_setGuideDemo(_owner, L2_2, true, {
    size = Vector(3, 3, 3)
  })
  Fn_pcSensorOff("pccubesensor2_navi_owner_01")
end
function Ingame()
  local L0_3, L1_4, L2_5, L3_6, L4_7, L5_8, L6_9
  L0_3 = false
  L1_4 = Photo
  L1_4 = L1_4.create
  L2_5 = kPHOTO_CAPTION_ON
  L3_6 = kPHOTO_TYPE_ALL
  L4_7 = true
  L5_8 = {}
  L5_8.near = 1.5
  L5_8.far = 18
  L6_9 = nil
  L1_4 = L1_4(L2_5, L3_6, L4_7, L5_8, L6_9, "sm92_user_photo")
  L3_6 = L1_4
  L2_5 = L1_4.set
  L4_7 = "locator2_photo_01"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.set
  L4_7 = "locator2_photo_02"
  L2_5(L3_6, L4_7)
  L3_6 = L1_4
  L2_5 = L1_4.set
  L4_7 = "locator2_photo_03"
  L2_5(L3_6, L4_7)
  L2_5 = Fn_missionStart
  L2_5()
  L2_5 = Fn_turnNpc
  L3_6 = _client_name
  L2_5(L3_6)
  L2_5 = Fn_kaiwaDemoView
  L3_6 = "sm92_00100k"
  L2_5(L3_6)
  L2_5 = Fn_userCtrlOff
  L2_5()
  L2_5 = {}
  L3_6 = {}
  L3_6.info = "sm92_info_01"
  L3_6.mission_target = "sm92_00100"
  L3_6.in_game_preview = "k_photo_sm92"
  L2_5.view = L3_6
  L3_6 = Fn_sideMissionStartView
  L4_7 = L2_5
  L3_6(L4_7)
  L3_6 = clientAction
  L4_7 = 1
  L3_6(L4_7)
  L3_6 = soliloquy
  L3_6 = L3_6()
  L4_7 = Fn_captionViewWait
  L5_8 = "sm92_00130"
  L4_7(L5_8)
  L4_7 = Fn_gestureEventStart
  L5_8 = findGameObject2
  L6_9 = "Node"
  L6_9 = L5_8(L6_9, "locator2_shop")
  L4_7(L5_8, L6_9, L5_8(L6_9, "locator2_shop"))
  repeat
    L4_7 = wait
    L4_7()
    L4_7 = _kaiwa_finished
  until L4_7
  L5_8 = L3_6
  L4_7 = L3_6.abort
  L4_7(L5_8)
  L4_7 = Fn_vctrlOff
  L5_8 = "vctrl2_01"
  L4_7(L5_8)
  L4_7 = Fn_pcSensorOff
  L5_8 = "pccubesensor2_goal"
  L4_7(L5_8)
  L4_7 = Fn_pcSensorOff
  L5_8 = "pccubesensor2_navi_owner_01"
  L4_7(L5_8)
  L4_7 = wait
  L4_7()
  L4_7 = Fn_naviKill
  L4_7()
  function L4_7()
    Fn_gestureEventEnd()
    warpNpc()
  end
  L5_8 = Fn_sceneConversion
  L6_9 = "locator2_warp_pc"
  L5_8(L6_9, L4_7)
  L5_8 = Fn_userCtrlOff
  L5_8()
  L5_8 = HUD
  L6_9 = L5_8
  L5_8 = L5_8.enablePhotoMode
  L5_8(L6_9, true)
  L5_8 = Fn_kaiwaDemoView
  L6_9 = "sm92_00200k"
  L5_8(L6_9)
  L5_8 = clientAction
  L6_9 = 2
  L5_8 = L5_8(L6_9)
  client_task = L5_8
  L5_8 = ownerAction
  L6_9 = 1
  L5_8 = L5_8(L6_9)
  repeat
    L6_9 = wait
    L6_9()
    L6_9 = client_task
    L6_9 = L6_9.isRunning
    L6_9 = L6_9(L6_9)
    if L6_9 then
      L6_9 = L5_8.isRunning
      L6_9 = L6_9(L5_8)
    end
  until not L6_9
  L6_9 = wait
  L6_9(30)
  L6_9 = HUD
  L6_9 = L6_9.info
  L6_9(L6_9, "sm92_info_02", true, 15)
  repeat
    L6_9 = L1_4.run
    L6_9(L1_4)
    repeat
      L6_9 = wait
      L6_9()
      L6_9 = L1_4.isRunning
      L6_9 = L6_9(L1_4)
    until not L6_9
    L6_9 = L1_4.getPhotoState
    L6_9 = L6_9(L1_4)
    if type(L6_9) == "table" and #L6_9 >= 0 then
      for _FORV_10_, _FORV_11_ in ipairs(L6_9) do
        if _FORV_11_.target:getName() == "locator2_photo_01" and _FORV_11_.state == kPHOTO_OK then
          L0_3 = true
          Sound:pulse("success")
          Fn_captionViewWait("sm92_00295")
          HUD:setPhotoMode(false)
          break
        end
      end
    end
    if not L0_3 then
      Fn_captionView("sm92_00296")
    end
    wait()
  until L0_3
  L6_9 = L1_4.kill
  L6_9(L1_4)
  L1_4 = nil
  L6_9 = wait
  L6_9(10)
  L6_9 = Fn_kaiwaDemoView
  L6_9("sm92_00300k")
  L6_9 = Fn_userCtrlOn
  L6_9()
  L6_9 = clientAction
  L6_9 = L6_9()
  client_task = L6_9
  L6_9 = ownerAction
  L6_9 = L6_9()
  L5_8 = L6_9
  L6_9 = waitSeconds
  L6_9(0.5)
  L6_9 = Sound
  L6_9 = L6_9.pulse
  L6_9(L6_9, "mission_clear")
  repeat
    L6_9 = wait
    L6_9()
    L6_9 = client_task
    L6_9 = L6_9.isRunning
    L6_9 = L6_9(L6_9)
    if L6_9 then
      L6_9 = L5_8.isRunning
      L6_9 = L6_9(L5_8)
    end
  until not L6_9
  L6_9 = Fn_setKeepPlayerPos
  L6_9()
  L6_9 = Fn_setNextMissionFlag
  L6_9()
  L6_9 = Fn_nextMission
  L6_9()
  L6_9 = Fn_exitSandbox
  L6_9()
end
function Finalize()
  HUD:inGamePreviewExit()
  if _dummy_task ~= nil and _dummy_task:isRunning() == true then
    _dummy_task:abort()
  end
  _dummy_task = nil
end
function pccubesensor2_goal_OnEnter()
  local L0_10, L1_11
  _point_reached = true
end
function pccubesensor2_goal_OnLeave()
  local L0_12, L1_13
  _point_reached = false
end
function pccubesensor2_hint_OnEnter()
  local L0_14, L1_15
  _hint_reached = true
end
function pccubesensor2_hint_OnLeave()
  local L0_16, L1_17
  _hint_reached = false
end
function pccubesensor2_navi_owner_01_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_navi_owner_01_OnLeave()
  Fn_naviSet(_owner)
  if not _navi_owner then
    Fn_captionView("sm92_00280")
    _navi_owner = true
  end
end
function warpNpc()
  _cliant:reset()
  wait()
  Fn_warpNpc(_owner_name, "locator2_warp_owner")
  Fn_warpNpc(_cliant_name, "locator2_warp_cliant")
end
function soliloquy()
  return invokeTask(function()
    local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23
    L0_18 = findGameObject2
    L1_19 = "Node"
    L2_20 = "locator2_shop1"
    L0_18 = L0_18(L1_19, L2_20)
    L1_19 = findGameObject2
    L2_20 = "Node"
    L3_21 = "locator2_navi_01"
    L1_19 = L1_19(L2_20, L3_21)
    L2_20 = nil
    L3_21 = false
    L4_22 = 300
    L5_23 = nil
    while true do
      if not _point_reached then
        if 0 == 0 then
          L5_23 = L5_23 or invokeTask(function()
            waitSeconds(L4_22)
            L3_21 = true
            L4_22 = 30
            L5_23 = nil
          end)
          if L3_21 then
            L3_21 = false
            if _hint_reached == true then
              Fn_captionViewWait("sm92_00210")
              L2_20 = L2_20 or invokeTask(function()
                waitSeconds(30)
                Fn_naviSet(L1_19)
                while true do
                  wait()
                end
              end)
            elseif Player:getRecentAreaName() == "po_a_01" then
              Fn_captionViewWait("sm92_00230")
            else
              Fn_captionViewWait("sm92_00240")
            end
          end
        else
        end
        Fn_vctrlOff("vctrl2_01")
      else
        if L2_20 then
          L2_20:abort()
          L2_20 = nil
          Fn_naviKill()
          Fn_captionViewWait("sm92_00220")
        end
        if Player:isGravityControlMode() == false then
          if 2 == 0 then
            Fn_captionViewWait("sm92_00250")
          elseif 1 == 2 then
            Fn_captionViewWait("sm92_00260")
            Fn_pcSensorOn("pccubesensor2_navi_owner_01")
          end
          Fn_vctrlOn("vctrl2_01")
        else
          Fn_vctrlOff("vctrl2_01")
        end
      end
      wait()
    end
  end)
end
function clientAction(A0_24)
  return invokeTask(function()
    local L0_25
    L0_25 = A0_24
    if L0_25 == 1 then
      repeat
        L0_25 = wait
        L0_25()
        L0_25 = Fn_getDistanceToPlayer
        L0_25 = L0_25(_cliant)
      until L0_25 > 6
      L0_25 = {}
      L0_25.anim_in = "sit_in_00"
      L0_25.anim_out = "sit_out_00"
      L0_25.locator = "locator2_sit_01"
      L0_25.length = 1
      L0_25.noNaviMesh = true
      L0_25.sandbox = g_own
      _cliant:sit("sit_00", L0_25)
    else
      L0_25 = A0_24
      if L0_25 == 2 then
        L0_25 = Fn_turnNpc
        L0_25(_cliant_name, "locator2_client_angle_01")
      else
        L0_25 = Fn_turnNpc
        L0_25(_cliant_name, _owner)
        L0_25 = Fn_playMotionNpc
        L0_25(_cliant_name, {
          "talk_00",
          "talk_01",
          "talk_02"
        }, false, {isRepeat = true, isRandom = true})
      end
    end
  end)
end
function ownerAction(A0_26)
  return invokeTask(function()
    if A0_26 == 1 then
      wait()
      repeat
        wait()
      until not Fn_moveNpc(_owner_name, {
        "locator2_owner_move_01"
      }):isRunning()
      Fn_turnNpc(_owner_name, "locator2_owner_angle_01")
    else
      Fn_turnNpc(_owner_name, _cliant)
      Fn_playMotionNpc(_owner_name, {
        "talk_00",
        "talk_01",
        "talk_02"
      }, false, {isRepeat = true, isRandom = true})
    end
  end)
end
function playerAction()
  Player:setStay(true)
  Fn_captionView("sm92_00601")
  waitSeconds(1)
  puppet = Player:getPuppet()
  if puppet ~= nil then
    puppet:playPoseAnimation("lively_action_5")
    wait()
    while not puppet:isPoseAnimEnd() do
      wait()
    end
    puppet:playPoseAnimation("stay")
  end
  Player:setStay(false)
end
function incorrectAnswer()
  Fn_captionView("sm92_00605")
end
function dummyShopHint(A0_27)
  _hint_task = invokeTask(function()
    while Fn_isInSightTarget(A0_27, 0.7) ~= true or Player:getAction() ~= Player.kAction_Idle do
      wait()
    end
    waitSeconds(1)
    Fn_captionViewWait("sm92_00607")
  end)
end
function pccubesensor2_dummy_01_OnEnter()
  local L0_28
  L0_28 = dummyShopHint
  L0_28(findGameObject2("Node", "locator2_dummy_01"))
end
function pccubesensor2_dummy_02_OnEnter()
  local L0_29
  L0_29 = dummyShopHint
  L0_29(findGameObject2("Node", "locator2_dummy_02"))
end
function pccubesensor2_dummy_03_OnEnter()
  local L0_30
  L0_30 = dummyShopHint
  L0_30(findGameObject2("Node", "locator2_dummy_03"))
end
function pccubesensor2_dummy_04_OnEnter()
  local L0_31
  L0_31 = dummyShopHint
  L0_31(findGameObject2("Node", "locator2_dummy_04"))
end
function pccubesensor2_dummy_OnLeave()
  if _hint_task ~= nil and _hint_task:isRunning() == true then
    _hint_task:abort()
  end
  _hint_task = nil
end
