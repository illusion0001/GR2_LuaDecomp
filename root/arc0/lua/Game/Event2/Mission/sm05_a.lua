dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_puppet_tbl = {}
_newsp_in_sensor = false
_box_newsp_first_hdl = nil
_dym_obj = nil
_dnode_hdl = nil
_is_catwarp = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_guide_cap_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warning_area_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_away_from_marcket_01")
  L0_0 = {
    {
      name = "postman_01",
      type = "man63",
      node = "locator2_postman_01"
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm05_c_cut01")
  Player:setForcedNormalGrab(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = Fn_createGimmickBg
  L1_2 = "locator2_newsp_first"
  L2_3 = "newsp_first"
  L3_4 = "cinewspaper01_base"
  L4_5 = true
  L0_1 = L0_1(L1_2, L2_3, L3_4, L4_5)
  _box_newsp_first_hdl = L0_1
  L0_1 = _box_newsp_first_hdl
  L1_2 = L0_1
  L0_1 = L0_1.setEventListener
  L2_3 = "dynamic"
  function L3_4(A0_9)
    A0_9:getDynamicObject():setName("dynamic_obj")
  end
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setGrabExceptionalObject
  L2_3 = {L3_4, L4_5}
  L3_4 = "newsp_first"
  L4_5 = "dynamic_obj"
  L0_1(L1_2, L2_3)
  L0_1 = invokeTask
  function L1_2()
    while true do
      if not _is_catwarp then
        if Player:getEnergy(Player.kEnergy_Gravity) <= 0.01 then
          _box_newsp_first_hdl:setGrabReleasePermission(false)
        end
        if not false and Player:getEnergy(Player.kEnergy_Gravity) > 0.01 then
          _box_newsp_first_hdl:setGrabReleasePermission(true)
        end
      end
      wait()
    end
  end
  L0_1(L1_2)
  L0_1 = {}
  L0_1.fence_stay_00 = "man01_fence_stay_00"
  L0_1.fence_greet_00 = "man01_fence_greet_00"
  L1_2 = Fn_loadNpcEventMotion
  L2_3 = "postman_01"
  L3_4 = L0_1
  L1_2(L2_3, L3_4)
  L1_2 = Fn_playNpcEventMotion
  L2_3 = "postman_01"
  L3_4 = L0_1.fence_stay_00
  L4_5 = -1
  L5_6 = 0.1
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = Camera
  L2_3 = L1_2
  L1_2 = L1_2.lookTo
  L3_4 = findGameObject2
  L4_5 = "Node"
  L5_6 = "locator2_first_view_pos"
  L3_4 = L3_4(L4_5, L5_6)
  L4_5 = L3_4
  L3_4 = L3_4.getWorldPos
  L3_4 = L3_4(L4_5)
  L4_5 = 2
  L5_6 = 2
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = waitSeconds
  L2_3 = 2
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm05_00100k"
  L1_2(L2_3)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setLookAtIk
  L3_4 = true
  L4_5 = 1
  L5_6 = _puppet_tbl
  L5_6 = L5_6.postman_01
  L6_7 = L5_6
  L5_6 = L5_6.getWorldPos
  L5_6 = L5_6(L6_7)
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = waitSeconds
  L2_3 = 2
  L1_2(L2_3)
  L1_2 = _sdemo_cut01
  L2_3 = L1_2
  L1_2 = L1_2.set
  L3_4 = "locator2_demo_greeting_camera_01"
  L4_5 = "locator2_demo_greeting_aim_01"
  L5_6 = false
  L1_2(L2_3, L3_4, L4_5, L5_6)
  L1_2 = _sdemo_cut01
  L2_3 = L1_2
  L1_2 = L1_2.play
  L1_2(L2_3)
  L1_2 = Sound
  L2_3 = L1_2
  L1_2 = L1_2.playSE
  L3_4 = "m02_013"
  L1_2(L2_3, L3_4)
  L1_2 = Fn_playNpcEventMotion
  L2_3 = "postman_01"
  L3_4 = L0_1.fence_greet_00
  L4_5 = 0
  L5_6 = 0.1
  L6_7 = true
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm05_00200k"
  L1_2(L2_3)
  L1_2 = _sdemo_cut01
  L2_3 = L1_2
  L1_2 = L1_2.stop
  L1_2(L2_3)
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_setCatWarpCheckPoint
  L2_3 = "locator2_pc_start_pos"
  L1_2(L2_3)
  L1_2 = Player
  L2_3 = L1_2
  L1_2 = L1_2.setLookAtIk
  L3_4 = false
  L4_5 = 1
  L5_6 = Vector
  L6_7 = 0
  L7_8 = 0
  L7_8 = L5_6(L6_7, L7_8, 0)
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L5_6(L6_7, L7_8, 0))
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_guide_cap_area_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_warning_area_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOn
  L2_3 = "pccubesensor2_away_from_marcket_01"
  L1_2(L2_3)
  while true do
    while true do
      L1_2 = createGameObject2
      L2_3 = "PlayerSensor"
      L1_2 = L1_2(L2_3)
      L3_4 = L1_2
      L2_3 = L1_2.setDetectBehavior
      L4_5 = 1
      L2_3(L3_4, L4_5)
      L3_4 = L1_2
      L2_3 = L1_2.addBox
      L4_5 = Vector
      L5_6 = 6
      L6_7 = 5
      L7_8 = 6
      L7_8 = L4_5(L5_6, L6_7, L7_8)
      L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L4_5(L5_6, L6_7, L7_8))
      L3_4 = L1_2
      L2_3 = L1_2.setPos
      L4_5 = Vector
      L5_6 = 0
      L6_7 = 1.5
      L7_8 = 0
      L7_8 = L4_5(L5_6, L6_7, L7_8)
      L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L4_5(L5_6, L6_7, L7_8))
      L3_4 = L1_2
      L2_3 = L1_2.setOnEnter
      L4_5 = "newsp_sensorOnEnter"
      L2_3(L3_4, L4_5)
      L3_4 = L1_2
      L2_3 = L1_2.setOnLeave
      L4_5 = "newsp_sensorOnLeave"
      L2_3(L3_4, L4_5)
      L3_4 = L1_2
      L2_3 = L1_2.setActive
      L4_5 = false
      L2_3(L3_4, L4_5)
      L2_3 = _box_newsp_first_hdl
      L3_4 = L2_3
      L2_3 = L2_3.appendChild
      L4_5 = L1_2
      L2_3(L3_4, L4_5)
      L3_4 = L1_2
      L2_3 = L1_2.try_init
      L2_3(L3_4)
      L3_4 = L1_2
      L2_3 = L1_2.waitForReady
      L2_3(L3_4)
      L3_4 = L1_2
      L2_3 = L1_2.try_start
      L2_3(L3_4)
      L2_3 = Fn_missionView
      L3_4 = "sm05_00100"
      L2_3(L3_4)
      L2_3 = waitSeconds
      L3_4 = 1.3
      L2_3(L3_4)
      L2_3 = invokeTask
      function L3_4()
        while true do
          if _box_newsp_first_hdl:isBroken() then
            _box_newsp_first_hdl:requestRestoreForce()
            print("_box_newsp_first_hdl:requestRestore()\227\130\185\227\130\191\227\131\188\227\131\136")
            Fn_naviSet(_box_newsp_first_hdl)
          end
          wait()
        end
      end
      L2_3 = L2_3(L3_4)
      L3_4 = invokeTask
      function L4_5()
        local L0_10
        while true do
          L0_10 = _box_newsp_first_hdl
          L0_10 = L0_10.getDynamicObject
          L0_10 = L0_10(L0_10)
          if L0_10 ~= nil then
            Fn_naviSet(L0_10)
            break
          end
          wait()
        end
      end
      L3_4 = L3_4(L4_5)
      L4_5 = grabWait2
      L5_6 = _box_newsp_first_hdl
      L6_7 = L1_2
      L4_5(L5_6, L6_7)
      if L2_3 ~= nil then
        L5_6 = L2_3
        L4_5 = L2_3.abort
        L4_5(L5_6)
        L2_3 = nil
      end
      if L3_4 ~= nil then
        L5_6 = L3_4
        L4_5 = L3_4.abort
        L4_5(L5_6)
        L3_4 = nil
      end
      L4_5 = _box_newsp_first_hdl
      L5_6 = L4_5
      L4_5 = L4_5.getDynamicObject
      L4_5 = L4_5(L5_6)
      _dym_obj = L4_5
      L4_5 = createGameObject2
      L5_6 = "DNode"
      L4_5 = L4_5(L5_6)
      _dnode_hdl = L4_5
      L4_5 = _dnode_hdl
      L5_6 = L4_5
      L4_5 = L4_5.setAsBox
      L6_7 = Vector
      L7_8 = 1
      L7_8 = L6_7(L7_8, 1, 1)
      L4_5(L5_6, L6_7, L7_8, L6_7(L7_8, 1, 1))
      L4_5 = _dym_obj
      L5_6 = L4_5
      L4_5 = L4_5.appendChild
      L6_7 = _dnode_hdl
      L4_5(L5_6, L6_7)
      L4_5 = _dnode_hdl
      L5_6 = L4_5
      L4_5 = L4_5.try_init
      L4_5(L5_6)
      L4_5 = _dnode_hdl
      L5_6 = L4_5
      L4_5 = L4_5.waitForReady
      L4_5(L5_6)
      L4_5 = _dnode_hdl
      L5_6 = L4_5
      L4_5 = L4_5.try_start
      L4_5(L5_6)
      L4_5 = false
      L5_6 = invokeTask
      function L6_7()
        local L0_11
        while true do
          L0_11 = L4_5
          if L0_11 == false then
            L0_11 = _box_newsp_first_hdl
            L0_11 = L0_11.isGrabbed
            L0_11 = L0_11(L0_11)
            if L0_11 then
              L0_11 = L1_2
              if L0_11 ~= nil then
                L0_11 = L1_2
                L0_11 = L0_11.kill
                L0_11(L0_11)
                L0_11 = nil
                L1_2 = L0_11
                L0_11 = Fn_naviKill
                L0_11()
                L0_11 = Fn_captionViewEnd
                L0_11()
                L0_11 = createGameObject2
                L0_11 = L0_11("Node")
                L0_11:setPos(Vector(0, 1.2, 0))
                _puppet_tbl.postman_01:appendChild(L0_11)
                start_game_obj()
                Fn_naviSet(L0_11)
                _dym_obj = _box_newsp_first_hdl:getDynamicObject()
                _dym_obj:appendChild(_dnode_hdl)
              end
            end
            L0_11 = wait
            L0_11()
          end
        end
      end
      L5_6 = L5_6(L6_7)
      L6_7 = createGameObject2
      L7_8 = "Sensor"
      L6_7 = L6_7(L7_8)
      L7_8 = L6_7.setFilterType
      L7_8(L6_7, "DNode")
      L7_8 = L6_7.setDetectBehavior
      L7_8(L6_7, 1)
      L7_8 = L6_7.addBox
      L7_8(L6_7, Vector(2, 2, 3))
      L7_8 = L6_7.setPos
      L7_8(L6_7, Vector(0, 1.5, 1))
      L7_8 = L6_7.setOnEnter
      L7_8(L6_7, "target_sensorOnEnter")
      L7_8 = L6_7.setOnLeave
      L7_8(L6_7, "target_sensorOnLeave")
      L7_8 = L6_7.setActive
      L7_8(L6_7, true)
      L7_8 = _puppet_tbl
      L7_8 = L7_8.postman_01
      L7_8 = L7_8.appendChild
      L7_8(L7_8, L6_7)
      L7_8 = createGameObject2
      L7_8 = L7_8("GimmickBg")
      L7_8:setName("dummy.name")
      L7_8:setPos(Vector(0, 1.2, 0))
      _puppet_tbl.postman_01:appendChild(L7_8)
      L7_8:setLockonPermission(true)
      start_game_obj()
      Fn_captionViewWait("sm05_00101")
      wait()
      Fn_tutorialCaption("throw")
      while true do
        if _box_newsp_first_hdl:isGrabbed() and 2 > Fn_getDistanceToPlayer("locator2_postman_01") or _newsp_in_sensor == true then
          L6_7:kill()
          L6_7 = nil
          if _box_newsp_first_hdl:isBroken() == false then
            _dym_obj:requestBreak(Vector(10, 1, 0), 1)
          end
          Sound:pulse("sm34_flyer")
          Sound:pulse("success")
          L4_5 = true
          break
        end
        if Player:getGrabStatus() ~= Player.kGrabStatus_Holding then
          Fn_tutorialCaptionKill()
        end
        if _box_newsp_first_hdl:isBroken() and not _is_catwarp then
          wait()
          Fn_userCtrlOff()
          Fn_captionViewWait("sm05_00104")
          break
        end
        wait()
      end
      if L5_6 ~= nil then
        L5_6:abort()
        L5_6 = nil
      end
      Fn_captionViewEnd()
      L7_8:setLockonPermission(false)
      Fn_tutorialCaptionKill()
      waitSeconds(0.5)
      if not L4_5 then
        Fn_blackout()
        Fn_naviKill()
        _box_newsp_first_hdl:requestRestoreForce()
        Fn_resetPcPos("locator2_pc_start_pos")
        Fn_fadein()
        Fn_userCtrlOn()
      end
    end
  end
  L1_2 = Fn_naviKill
  L1_2()
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_guide_cap_area_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_warning_area_01"
  L1_2(L2_3)
  L1_2 = Fn_pcSensorOff
  L2_3 = "pccubesensor2_away_from_marcket_01"
  L1_2(L2_3)
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "sm05_00300k"
  L1_2(L2_3)
  L1_2 = Fn_userCtrlOff
  L1_2()
  L1_2 = Fn_blackout
  L1_2()
  L1_2 = Fn_setNpcActive
  L2_3 = "postman_01"
  L3_4 = false
  L1_2(L2_3, L3_4)
  L1_2 = waitSeconds
  L2_3 = 1.5
  L1_2(L2_3)
  L1_2 = Fn_setKeepPlayerPos
  L1_2()
  L1_2 = Fn_setNextMissionFlag
  L1_2()
  L1_2 = Fn_nextMission
  L1_2()
  L1_2 = Fn_exitSandbox
  L1_2()
end
function Finalize()
  Player:setGrabExceptionalObject({})
  Player:setForcedNormalGrab(false)
end
function newsp_sensorOnEnter(A0_12)
  invokeTask(function()
    Fn_captionViewEnd()
    Fn_tutorialCaption("grab")
  end)
end
function newsp_sensorOnLeave(A0_13)
  invokeTask(function()
    Fn_tutorialCaptionKill()
  end)
end
function target_sensorOnEnter(A0_14)
  local L1_15
  _newsp_in_sensor = true
end
function pccubesensor2_guide_cap_area_01_OnLeave()
  invokeTask(function()
    Fn_captionView("sm05_00105")
  end)
end
function pccubesensor2_warning_area_01_OnLeave()
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  Fn_captionView("sm05_00106")
end
function pccubesensor2_away_from_marcket_01_OnLeave()
  invokeTask(function()
    _box_newsp_first_hdl:setGrabReleasePermission(false)
    _is_catwarp = true
    if _box_newsp_first_hdl:isGrabbed() then
      Fn_catWarpIn()
      _box_newsp_first_hdl:requestRestoreForce()
      Fn_catWarpCheckPoint()
      Player:setGrabObject(_box_newsp_first_hdl)
      _dym_obj = _box_newsp_first_hdl:getDynamicObject()
      _dym_obj:appendChild(_dnode_hdl)
      Fn_catWarpOut()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
    else
      Fn_catWarp()
    end
    _is_catwarp = false
    _box_newsp_first_hdl:setGrabReleasePermission(true)
  end)
end
function grabWait2(A0_16, A1_17)
  if A0_16:isGrabbed() == false then
    Fn_naviSet(A0_16)
    A1_17:setActive(true)
  end
  while A0_16:isGrabbed() == false do
    wait()
  end
  Fn_naviKill()
  A1_17:setActive(false)
  Fn_captionViewEnd()
  Fn_tutorialCaptionKill()
end
