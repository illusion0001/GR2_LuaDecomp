dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
_next_phase = false
_wait_navi = false
_cid_move = 0
_cid_move_end = false
_wall_hdls = {}
_jump_vec_cnt = 1
_jump_vec = {
  Vector(-2, 3.5, 3.5),
  Vector(-1, 3, 4),
  Vector(-2, 3, 2)
}
_kit_landing_tbl = {
  pi_a_22 = {
    "locator2_kit_landing_01_01",
    "locator2_kit_landing_01_02",
    "locator2_kit_landing_01_03"
  },
  pi_a_14_01 = {
    "locator2_kit_landing_02_01",
    "locator2_kit_landing_02_02",
    "locator2_kit_landing_02_03"
  }
}
_guide_on = true
_area_pos = Vector(0, 0, 0)
_area_list = {
  "pi_a_22",
  "pi_a_14_01",
  "pi_a_10"
}
MOVE_DIST = 15
EVENT_DIST = 10
JUMP_DIST = 8
_kit_jump = false
function Initialize()
  local L0_0
  L0_0 = Font
  L0_0 = L0_0.openTextSet
  L0_0(L0_0, "Credits")
  L0_0 = Fn_setCatActive
  L0_0(false)
  L0_0 = Fn_sendEventComSb
  L0_0("requestTkgSet")
  L0_0 = Fn_sendEventComSb
  L0_0 = L0_0("requestHandle", "Node", "bg2_gravityore_pi_a_10_01")
  _ore_hdl = L0_0
  L0_0 = {}
  L0_0.RL = {
    id = "ep00_01000",
    func = pcDig
  }
  Fn_setupGestureAction({
    target = _ore_hdl,
    size = Vector(6, 4, 6)
  }, L0_0, nil, false, true)
  _kid_mot_list = {
    hail = "kit01_hail_00",
    dig = "dig_in_00"
  }
  Fn_loadPlayerMotion(_kid_mot_list)
  _wall_hdls[1] = createWall(Fn_findAreaHandle("pi_a_22"), "pi_a_22_wall")
  _wall_hdls[2] = createWall(Fn_findAreaHandle("pi_a_14_01"), "pi_a_14_wall")
  _wall_hdls[3] = createWall(Fn_findAreaHandle("pi_a_10"), "pi_a_10_wall")
  _wall_hdls[2]:setActive(false)
  _wall_hdls[3]:setActive(false)
  Fn_pcSensorOff("pccubesensor2_telop_07")
  Fn_pcSensorOff("pccubesensor2_telop_08")
  Fn_pcSensorOff("pccubesensor2_telop_09")
  Fn_pcSensorOff("pccubesensor2_telop_10")
  Fn_pcSensorOff("pccubesensor2_telop_11")
  Fn_pcSensorOff("pcspheresensor2_telop_12")
  _storms = {}
  _storms[1] = createGravityStorm("gravity_storm_01", "locator2_eff_bk_01_01")
  _pi_a_24_ctrl = AreaController.create("pi_a_24")
  _pi_a_14_01_ctrl = AreaController.create("pi_a_14_01")
  _pi_a_22_ctrl = AreaController.create("pi_a_22")
  Fn_sendEventComSb("lnductionSensor", true)
  _fall_obj_01 = findGameObject2("GimmickBg", "bg2_fall_obj_01")
  _fall_obj_01:setActive(false)
  findGameObject2("GimmickBg", "bg2_fall_obj_02"):setActive(false)
  findGameObject2("GimmickBg", "bg2_fall_obj_03"):setActive(false)
  findGameObject2("GimmickBg", "bg2_fall_obj_04"):setActive(false)
  Player:muteVoice(Player.kVoiceMuteLv_All)
  _pi_a_14_01 = Fn_findAreaHandle("pi_a_14_01")
  _pi_a_14_01:loadMotionFileAsset("ep00_b_move_01")
  while _pi_a_14_01:isMotionLoading() do
    wait()
  end
  _pi_a_14_01:setMoveAnimRatio(0.25)
  _pi_a_24_02 = Fn_findAreaHandle("pi_a_24_02")
  _pi_a_24_02:loadMotionFileAsset("ep00_b_move_02")
  while _pi_a_24_02:isMotionLoading() do
    wait()
  end
  _pi_a_24_02:setMoveAnimRatio(0.5)
  Fn_pcSensorOff("pccubesensor2_recovery_02")
  Fn_pcSensorOff("pccubesensor2_recovery_03")
  Fn_pcSensorOff("pccubesensor2_recovery_04")
  debug_flag = false
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1 = Fn_warpCageMineArea
  L0_1()
  L0_1 = debug_flag
  if L0_1 then
    L0_1 = invokeTask
    function L1_2()
      repeat
        debugDispPrint("isCidActionEnd : " .. tostring(Fn_sendEventComSb("isCidActionEnd")))
        wait()
      until false
    end
    L0_1(L1_2)
  end
  L0_1 = Sound
  L1_2 = L0_1
  L0_1 = L0_1.playSEHandle
  L2_3 = "amb_ep00_002"
  L3_4 = 1
  L0_1 = L0_1(L1_2, L2_3, L3_4)
  _amb_voice = L0_1
  L0_1 = invokeTask
  function L1_2()
    while true do
      if Player:getRecentAreaName() == "pi_a_22" then
        _jump_vec_cnt = 1
      elseif Player:getRecentAreaName() == "pi_a_14_01" then
        _jump_vec_cnt = 2
      elseif Player:getRecentAreaName() == "pi_a_10" then
        _jump_vec_cnt = 3
      end
      wait()
    end
  end
  L0_1(L1_2)
  L0_1, L1_2 = nil, nil
  L2_3 = Fn_missionStart
  L2_3()
  L2_3 = Fn_sendEventComSb
  L3_4 = "requestHandle"
  L4_5 = "Puppet"
  L2_3 = L2_3(L3_4, L4_5, "npcgen2_tkg05_01")
  L4_5 = L2_3
  L3_4 = L2_3.getWorldPos
  L3_4 = L3_4(L4_5)
  L4_5 = invokeTask
  L4_5(function()
    local L0_6
    L0_6 = L3_4
    L0_6.x = L0_6.x + 1.5
    Camera:lookTo(L0_6, 2, 2)
  end)
  L4_5 = Fn_userCtrlOn
  L4_5()
  L4_5 = false
  invokeTask(function()
    repeat
      wait()
    until Fn_getDistanceToPlayer(Fn_sendEventComSb("requestHandle", "Puppet", "npcgen2_tkg05_01")) < 5
    if _start_moving ~= nil then
      _start_moving:abort()
    end
    Player:setSpecialTuning(Player.kSpecialTuning_Ep00FirstPersonView)
    invokeTask(function()
      waitSeconds(0.5)
      _suit_voice = Sound:playSEHandle("pc1_084_suit", 1)
    end)
    _cid_move = 1
    Fn_sendEventComSb("requestCidAction", _cid_move)
    L4_5 = true
  end)
  Sound:playSE("ep00_syd_157", 1)
  Fn_captionViewWait("ep00_01001")
  Sound:playSE("kit_455", 1)
  Fn_captionViewWait("ep00_01002")
  Fn_missionView("ep00_01003")
  _start_moving = invokeTask(function()
    local L0_7, L1_8, L2_9, L3_10, L4_11, L5_12
    L0_7 = 1
    L1_8 = {
      L2_9,
      L3_10,
      L4_11
    }
    L2_9 = "ep00_01052"
    L3_10 = "ep00_01053"
    L4_11 = "ep00_01054"
    L2_9 = {
      L3_10,
      L4_11,
      L5_12
    }
    L3_10 = "ep00_syd016c_radio"
    L4_11 = "ep00_syd_161"
    L5_12 = "ep00_syd_160"
    L3_10 = 0
    L4_11 = 0
    L5_12 = Fn_sendEventComSb
    L5_12 = L5_12("requestHandle", "Puppet", "npcgen2_tkg05_01")
    HUD:naviSetPochiDistanceDensity0(0)
    HUD:naviSetPochiDistanceDensity100(-1)
    wait()
    Fn_naviSet(L5_12)
    repeat
      waitSeconds(7)
      if L0_7 < 4 then
        Sound:playSE(L2_9[L0_7], 1)
        Fn_captionViewWait(L1_8[L0_7])
      else
        repeat
          L4_11 = RandI(3)
          wait()
        until L4_11 ~= L3_10
        Sound:playSE(L2_9[L4_11], 1)
        Fn_captionViewWait(L1_8[L4_11])
        L3_10 = L4_11
      end
      if L0_7 < 4 then
        L0_7 = L0_7 + 1
      end
      wait()
    until Fn_getDistanceToPlayer(L5_12) < 5
  end)
  repeat
    wait()
  until L4_5
  Fn_naviKill()
  if _start_moving ~= nil then
    _start_moving:abort()
  end
  Fn_sendEventComSb("requestCidNavi")
  waitSeconds(1)
  cidDialogue()
  repeat
    wait()
  until Fn_sendEventComSb("isCidActionEnd")
  Fn_sendEventComSb("requestCidJump", _cid_move)
  repeat
    wait()
  until Fn_sendEventComSb("isCidJumpEnd")
  Fn_sendEventComSb("setWaitDist", 8)
  repeat
    wait()
  until Fn_sendEventComSb("isPause") == false
  Fn_sendEventComSb("setWaitDist", 15)
  _cid_move = 2
  Fn_sendEventComSb("requestCidAction", _cid_move)
  repeat
    wait()
  until Fn_sendEventComSb("isCidActionEnd")
  Fn_sendEventComSb("requestCidJump", _cid_move)
  repeat
    wait()
  until Fn_sendEventComSb("isCidJumpEnd")
  Fn_sendEventComSb("setWaitDist", 8)
  repeat
    wait()
  until Fn_sendEventComSb("isPause") == false
  Fn_sendEventComSb("setWaitDist", 15)
  _cid_move = 3
  Fn_sendEventComSb("requestCidAction", _cid_move)
  wait()
  HUD:setPlayableTelop("C")
  repeat
    wait()
  until Fn_sendEventComSb("isCidActionEnd")
  print("********** cid goal **********")
  Fn_sendEventComSb("setWaitDist", 10)
  repeat
    wait()
  until Fn_sendEventComSb("isPause") == false
  Fn_sendEventComSb("cidNaviWait", true)
  Fn_sendEventComSb("requestCidDig")
  Fn_naviSet(findGameObject2("Node", "pcspheresensor2_FirstPersonViewOff"))
  print("waitPhace!!!")
  waitPhace()
  if _amb_voice ~= nil then
    Sound:stopSEHandle(_amb_voice)
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Area:setSceneParametersInterpolateTime()
  Font:closeTextSet("Credits")
  if Fn_getPlayer() then
    Player:setStay(false)
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  Sound:stopSEHandle(_suit_voice)
  Sound:stopSEHandle(_kit_idlling_se)
  Sound:stopSEHandle(_amb_se_hdl)
  Fn_naviKill()
end
function pccubesensor2_pi_a_23_01_OnEnter(A0_13)
  _next_phase = true
  A0_13:setActive(false)
end
_pier_shake_task = nil
_pier_in = true
function pccubesensormulti2_Pier_OnEnter(A0_14)
  pier_area_approach()
  _pier_in = true
  _pier_shake_task = invokeTask(function()
    local L0_15
    L0_15 = false
    repeat
      if Player:getAction() == Player.kAction_Run and L0_15 == false then
        L0_15 = true
        Camera:shake2D(0, 0.06, 1, 0, 1)
      elseif Player:getAction() ~= Player.kAction_Run and L0_15 == true then
        L0_15 = false
        Camera:shake2D(0, 0.03, 0.5, 0, 1)
      end
      wait()
    until false
  end)
end
function pccubesensormulti2_Pier_OnLeave(A0_16)
  _pier_in = false
  if _pier_shake_task ~= nil then
    _pier_shake_task:abort()
  end
  Camera:stopShake(0.1, 1)
end
function cubesensor2_shake_OnEnter(A0_17, A1_18)
  print(A1_18:getName())
  invokeTask(function()
    repeat
      if _pier_in and not false then
      elseif not _pier_in then
        Camera:stopShake(0.1, 2)
      end
      wait()
    until _pi_a_24_ctrl:isMoveEnd()
    Camera:stopShake(0.1, 2)
    Fn_sensorOff(A0_17)
  end)
end
function cubesensor2_shake_OnLeave(A0_19, A1_20)
  Fn_sensorOff(A0_19)
  Camera:stopShake(0.1, 2)
end
function pier_area_approach()
  invokeTask(function()
    local L0_21, L1_22, L2_23
    L0_21 = findGameObject2
    L1_22 = "Node"
    L2_23 = "locator2_shake"
    L0_21 = L0_21(L1_22, L2_23)
    L1_22 = createGameObject2
    L2_23 = "DNode"
    L1_22 = L1_22(L2_23)
    L2_23 = L1_22.setName
    L2_23(L1_22, "DNode_locator2_shake")
    L2_23 = L1_22.setAsSphere
    L2_23(L1_22, 1)
    L2_23 = L0_21.appendChild
    L2_23(L0_21, L1_22)
    L2_23 = L1_22.try_init
    L2_23(L1_22)
    L2_23 = L1_22.waitForReady
    L2_23(L1_22)
    L2_23 = L1_22.try_start
    L2_23(L1_22)
    L2_23 = _pi_a_24_02
    L2_23 = L2_23.playMoveAnim
    L2_23(L2_23, 0)
    L2_23 = Sound
    L2_23 = L2_23.playSEHandle
    L2_23 = L2_23(L2_23, "ep00_ground_move", 1, "", _pi_a_24_02)
    repeat
      wait()
    until _pi_a_24_02:isMoveAnimEnd()
    Sound:stopSEHandle(L2_23)
  end)
end
function waitPhace()
  repeat
    wait()
  until _next_phase
  _next_phase = false
end
function pcJump(A0_24)
  invokeTask(function()
    local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32
    _kit_jump = true
    L0_25 = Player
    L1_26 = L0_25
    L0_25 = L0_25.setStay
    L2_27 = true
    L0_25(L1_26, L2_27)
    L0_25 = A0_24
    L1_26 = L0_25
    L0_25 = L0_25.setActive
    L2_27 = false
    L0_25(L1_26, L2_27)
    L0_25 = Player
    L1_26 = L0_25
    L0_25 = L0_25.getRecentAreaName
    L0_25 = L0_25(L1_26)
    repeat
      L1_26 = wait
      L1_26()
      L1_26 = Fn_sendEventComSb
      L2_27 = "isCidJumpEnd"
      L1_26 = L1_26(L2_27)
    until L1_26
    L1_26 = 1
    L2_27 = 999
    for L6_31, L7_32 in L3_28(L4_29) do
      if L2_27 > Fn_getDistanceToPlayer(L7_32) then
        L2_27 = Fn_getDistanceToPlayer(L7_32)
        L1_26 = L6_31
      end
    end
    L6_31 = NormalizeVector
    L6_31 = L6_31(L7_32)
    L6_31.x = L7_32
    L6_31.y = L7_32
    L6_31.z = L7_32
    L7_32(tostring(L6_31))
    if L7_32 then
      for _FORV_10_, _FORV_11_ in L7_32(_wall_hdls) do
        _FORV_11_:setActive(false)
      end
      L7_32(function()
        local L0_33
        L0_33 = nil
        while true do
          L0_33 = Player:getRecentAreaName()
          print("old area : " .. L0_25 .. " > new area : " .. (L0_33 and L0_33 or "nil"))
          if L0_25 == L0_33 or L0_33 == nil then
            wait()
          end
        end
        if L0_33 == "pi_a_14_01" then
          _wall_hdls[2]:setActive(true)
        elseif L0_33 == "pi_a_10" then
          _wall_hdls[3]:setActive(true)
        else
          for _FORV_4_, _FORV_5_ in pairs(_wall_hdls) do
            _FORV_5_:setActive(false)
          end
        end
        Player:setStay(false)
      end)
    end
  end)
end
function cidDialogue()
  invokeTask(function()
    while true do
      if Fn_sendEventComSb("isPause") then
        wait()
      else
        repeat
          if not false then
            if _cid_move == 1 then
              invokeTask(function()
                repeat
                  wait()
                until Fn_sendEventComSb("cidMoveCurrent") >= 20
                _pi_a_14_01:playMoveAnim(0)
              end)
              repeat
                wait()
              until 1 <= Fn_sendEventComSb("cidMoveCurrent")
              lockCialogue()
              Sound:playSE("ep00_syd032a_radio", 1)
              Fn_captionViewWait("ep00_01050")
              Sound:playSE("ep00_syd_158_radio", 1)
              Fn_captionViewWait("ep00_01051")
              lockCialogue()
              Sound:playSE("ep00_syd038_radio", 1)
              Fn_captionViewWait("ep00_01055")
              Sound:playSE("ep00_ryz_924c_radio", 1)
              Fn_captionViewWait("ep00_01056")
              Sound:playSE("ep00_m02_802_radio", 1)
              Fn_captionViewWait("ep00_01057")
              Fn_sendEventComSb("setLockCap", false)
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 16
              lockCialogue()
              Sound:playSE("ep00_syd023b_1_radio", 1)
              Fn_captionViewWait("ep00_01058")
              Sound:playSE("kit034c_radio", 1)
              Fn_captionViewWait("ep00_01059")
              lockCialogue()
              Sound:playSE("kit_458", 1)
              Fn_captionViewWait("ep00_01060")
              Sound:playSE("kit_457", 1)
              Fn_captionViewWait("ep00_01061")
              lockCialogue()
              Sound:playSE("ep00_syd_158_radio", 1)
              Fn_captionViewWait("ep00_01062")
              Fn_sendEventComSb("setLockCap", false)
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 24
              lockCialogue()
              Sound:playSE("kit_460", 1)
              Fn_captionViewWait("ep00_01063")
              Sound:playSE("kit_459", 1)
              Fn_captionViewWait("ep00_01064")
              lockCialogue()
              Sound:playSE("ep00_syd025b_radio", 1)
              Fn_captionViewWait("ep00_01065")
              Sound:playSE("kit_456", 1)
              Fn_captionViewWait("ep00_01066")
              Fn_sendEventComSb("setLockCap", false)
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 26
              invokeTask(function()
                repeat
                  wait()
                until _cid_move ~= 1 or Fn_sendEventComSb("cidMoveCurrent") >= 32
                Fn_sendEventComSb("cidNaviWait", true)
              end)
              lockCialogue()
              Sound:playSE("ep00_syd_159", 1)
              Fn_captionViewWait("ep00_01067")
              Sound:playSE("ep00_syd_157", 1)
              Fn_captionViewWait("ep00_01068")
              lockCialogue()
              Sound:playSE("ep00_syd019c_radio", 1)
              Fn_captionViewWait("ep00_01069")
              Sound:playSE("ep00_syd_162", 1)
              Fn_captionViewWait("ep00_01070")
              Fn_sendEventComSb("setLockCap", false)
            end
          elseif not false then
            if _cid_move == 2 then
              repeat
                wait()
              until Fn_sendEventComSb("isPause") == false
              repeat
                wait()
              until 1 <= Fn_sendEventComSb("cidMoveCurrent")
              lockCialogue()
              Sound:playSE("kit_460", 1)
              Fn_captionViewWait("ep00_01071")
              Sound:playSE("kit_457", 1)
              Fn_captionViewWait("ep00_01072")
              Fn_sendEventComSb("setLockCap", false)
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 4
              Fn_setGravityStorm(false)
              if Fn_findAreaHandle("pi_d_root") then
                _amb_se_hdl = Sound:playSEHandle("amb_ep00_001", 1, "", findGameObject2("Node", "locator2_eff_bk_01_01"))
                Area:setSceneParametersInterpolateTime(5)
                Fn_findAreaHandle("pi_d_root"):setSceneParameters("pi_c_root")
              end
              invokeTask(function()
                repeat
                  wait()
                until _cid_move ~= 2 or Fn_sendEventComSb("cidMoveCurrent") >= 5
                Fn_sendEventComSb("cidNaviWait", true)
              end)
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 5
              Fn_sendEventComSb("tkg_escape_set")
              lockCialogue()
              Sound:playSE("ep00_mis008a_radio", 0.8)
              Fn_captionViewWait("ep00_01080")
              Sound:playSE("ep00_m02_008", 1)
              Fn_captionViewWait("ep00_01081")
              Fn_sendEventComSb("setLockCap", false)
            end
          elseif not false and _cid_move == 3 then
            repeat
              wait()
            until Fn_sendEventComSb("isPause") == false
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 3
            Fn_sendEventComSb("requestTkgEscape01")
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 5
            Fn_sendEventComSb("setWaitDist", 15)
            lockCialogue()
            Sound:playSE("ep00_ryz_914c_radio", 1)
            Fn_captionViewWait("ep00_01082")
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 11
            Fn_sendEventComSb("requestTkgEscape02")
            lockCialogue()
            Sound:playSE("ep00_m03_001", 1, Fn_findNpc("npcgen2_tkg05_11"))
            Fn_captionViewWait("ep00_01083")
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 20
            Fn_sendEventComSb("oreDistCheckStart")
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 22
            Fn_pcSensorOn("pccubesensor2_recovery_02")
            lockCialogue()
            Sound:playSE("ep00_m05_004", 1, Fn_findNpc("npcgen2_tkg05_13"))
            Fn_captionViewWait("ep00_01084")
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 26
            Fn_sendEventComSb("requestTkgEscape03")
            lockCialogue()
            Sound:playSE("ep00_mis017c_radio", 1, Fn_findNpc("npcgen2_tkg05_12"))
            Fn_captionViewWait("ep00_01085")
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 28
            lockCialogue()
            Fn_sendEventComSb("requestMoveStop", true)
            Sound:playSE("ep00_syd029c_radio", 1)
            Fn_captionViewWait("ep00_01073")
            Fn_sendEventComSb("requestMoveStop", false)
            Sound:playSE("kit_458", 1)
            Fn_captionView("ep00_01074")
            waitSeconds(2)
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 30
            invokeTask(function()
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 33
              Fn_pcSensorOn("pccubesensor2_recovery_03")
              repeat
                wait()
              until Fn_sendEventComSb("cidMoveCurrent") >= 36
              Fn_pcSensorOn("pccubesensor2_recovery_04")
            end)
            lockCialogue()
            Sound:playSE("ep00_mis013c_radio", 1, tkg05_11)
            Fn_captionViewWait("ep00_01086")
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 31
            lockCialogue()
            Sound:playSE("ep00_syd_161", 1)
            Fn_captionViewWait("ep00_01075")
            Sound:playSE("kit_459", 1)
            Fn_captionViewWait("ep00_01076")
            Fn_sendEventComSb("setLockCap", false)
            repeat
              wait()
            until Fn_sendEventComSb("cidMoveCurrent") >= 32
            lockCialogue()
            Sound:playSE("ep00_syd_160", 1)
            Fn_captionViewWait("ep00_01077")
            Sound:playSE("kit044b_radio", 1)
            Fn_captionViewWait("ep00_01078")
            Sound:playSE("ep00_syd_157", 1)
            Fn_captionViewWait("ep00_01079")
            Fn_sendEventComSb("setLockCap", false)
            _cid_move_end = true
          end
          wait()
        until false
        wait()
      end
    end
  end)
end
_fpv_sensor = false
function pcspheresensor2_FirstPersonViewOff_OnEnter()
  invokeTask(function()
    _fpv_sensor = true
    repeat
      wait()
    until _cid_move_end
    if not _fpv_sensor then
      return
    end
    Fn_naviKill()
    Fn_userCtrlOff()
    waitSeconds(0.3)
    Player:turnTo(_ore_hdl:getWorldPos(), 0.4, false)
    waitSeconds(0.3)
    Sound:stopSEHandle(_suit_voice)
    Player:setSpecialTuning(Player.kSpecialTuning_None)
    Fn_setGestureAction(_ore_hdl, true)
  end)
end
function pcspheresensor2_FirstPersonViewOff_OnLeave()
  local L0_34, L1_35
  _fpv_sensor = false
end
function pcDig()
  invokeTask(function()
    Fn_setGestureAction(_ore_hdl, false)
    Fn_getPlayer():playPoseAnimation("dig_in_00", 0, 0.2)
    _kit_idlling_se = Sound:playSEHandle("npc_drill_idling", 1, "", Fn_getPlayer())
    waitSeconds(1.3)
    _next_phase = true
  end)
end
function createWall(A0_36, A1_37)
  local L2_38
  L2_38 = createGameObject2
  L2_38 = L2_38("GimmickBg")
  L2_38:setName(A1_37)
  L2_38:setCollisionName(A1_37)
  L2_38:setAttributeName("invisible_col")
  L2_38:setMoveThreshold(0)
  L2_38:overrideCollisionFilterLayer("Boundary")
  A0_36:appendChild(L2_38)
  return L2_38
end
function pccubesensor2_telop_06_OnEnter(A0_39)
  A0_39:setActive(false)
  HUD:setPlayableTelop("RT", 12.53, {"ui_job_23"}, {"ui_name_21"})
  HUD:setPlayableTelop("RC", 12.53, {"ui_job_24"}, {"ui_name_22"})
  Fn_pcSensorOn("pccubesensor2_telop_07")
end
function pccubesensor2_telop_07_OnEnter(A0_40)
  A0_40:setActive(false)
  HUD:setPlayableTelop("LT", 12.53, {"ui_job_25"}, {"ui_name_23"})
  HUD:setPlayableTelop("LC", 12.53, {"ui_job_26"}, {"ui_name_24"})
  Fn_pcSensorOn("pccubesensor2_telop_08")
end
function pccubesensor2_telop_08_OnEnter(A0_41)
  A0_41:setActive(false)
  HUD:setPlayableTelop("RT", 12.53, {"ui_job_27"}, {"ui_name_25"})
  HUD:setPlayableTelop("RC", 12.53, {"ui_job_10"}, {"ui_name_8"})
  Fn_pcSensorOn("pccubesensor2_telop_09")
end
function pccubesensor2_telop_09_OnEnter(A0_42)
  A0_42:setActive(false)
  HUD:setPlayableTelop("C", 12.53, {"ui_job_11"}, {"ui_name_9"})
  Fn_pcSensorOn("pccubesensor2_telop_10")
end
function pccubesensor2_telop_10_OnEnter(A0_43)
  A0_43:setActive(false)
  HUD:setPlayableTelop("LT", 12.53, {"ui_job_12"}, {"ui_name_10", "ui_name_11"})
  Fn_pcSensorOn("pccubesensor2_telop_11")
end
function pccubesensor2_telop_11_OnEnter(A0_44)
  A0_44:setActive(false)
  HUD:setPlayableTelop("C", 12.53, {"ui_job_13"}, {"ui_name_12"})
  Fn_pcSensorOn("pcspheresensor2_telop_12")
end
function pcspheresensor2_telop_12_OnEnter(A0_45)
  A0_45:setActive(false)
  HUD:setPlayableTelop("C", 12.53, {"ui_job_14"}, {"ui_name_1"})
end
function pccubesensor2_guide_off_01_OnEnter()
  HUD:setTextCommonCtrlGuide()
  _guide_on = false
end
_objarea_cid = false
function cubesensor2_fall_obj_OnEnter(A0_46, A1_47)
  if A1_47:getName() == "npc_dummy_core" then
    _objarea_cid = true
  end
  if _objarea_cid then
    Fn_sensorOff(A0_46)
    fall_obj("obj_01", 10, 1, true)
  end
end
function cubesensor2_fall_obj_02_OnEnter(A0_48, A1_49)
  print(A1_49:getName())
  if A1_49:getName() == "npc_dummy_core" then
    _objarea_cid = true
  end
  if _objarea_cid then
    Fn_sensorOff(A0_48)
    fall_obj("obj_05", 10, 1.5, false)
  end
end
function cubesensor2_fall_obj_03_OnEnter(A0_50, A1_51)
  print(A1_51:getName())
  if A1_51:getName() == "npc_dummy_core" then
    _objarea_cid = true
  end
  if _objarea_cid then
    Fn_sensorOff(A0_50)
    fall_obj("obj_03", 23, 1.5, false)
  end
end
function cubesensor2_fall_obj_04_OnEnter(A0_52, A1_53)
  print(A1_53:getName())
  if A1_53:getName() == "npc_dummy_core" then
    _objarea_cid = true
  end
  if _objarea_cid then
    Fn_sensorOff(A0_52)
    fall_obj("obj_04", 22, 1, false)
  end
end
function fall_obj(A0_54, A1_55, A2_56, A3_57)
  invokeTask(function()
    local L0_58, L1_59, L2_60, L3_61, L4_62, L5_63, L6_64, L7_65
    L0_58 = {}
    L1_59, L2_60 = nil, nil
    for L6_64 = 1, A1_55 do
      L7_65.pos = 0
      L7_65.rot = 0
      L7_65.pos, L7_65.rot = findGameObject2("Node", string.format("locator2_fall_%s_%02d", A0_54, L6_64)):getWorldTransform()
      table.insert(L0_58, L7_65)
    end
    L6_64 = A3_57
    if L6_64 then
      L6_64 = findGameObject2
      L6_64 = L6_64(L7_65, string.format("locator2_fall_%s_hit", A0_54))
      L6_64 = L5_63.getWorldTransform
      L6_64 = L6_64(L7_65)
      hil_point = L6_64
      L6_64 = Fn_createEffect
      L6_64 = L6_64(L7_65, "ef_ev_brkpar_02", L5_63, false, nil, "initonly")
      L1_59 = L6_64
      L6_64 = Fn_createEffect
      L6_64 = L6_64(L7_65, "ef_com_grnhit_03", L5_63, false, nil, "initonly")
      L2_60 = L6_64
    end
    L6_64 = findGameObject2
    L6_64 = L6_64(L7_65, "bg2_fall_" .. A0_54)
    L7_65(L6_64, false)
    L7_65(L6_64, true)
    L7_65(L6_64)
    for _FORV_10_, _FORV_11_ in L7_65(L0_58) do
      L6_64:appendCurvePoint2(_FORV_11_.pos, _FORV_11_.rot, A2_56, "Liner", true)
    end
    repeat
      L7_65()
    until L7_65 == false
    if L7_65 then
      L7_65("obj requestBreak")
      L7_65(L6_64, hil_point, -2.8, 30)
      L7_65(L1_59, L5_63)
      L7_65(L7_65, "ep00_ground_fall", 1, "", L5_63)
      L7_65(L2_60, L5_63)
      L7_65(L1_59, 5)
      L7_65(L2_60, 5)
      L7_65(L7_65, 2, 0.3, 1.25, L5_63:getWorldPos(), 30)
      L7_65(L6_64)
      repeat
        L7_65()
      until L7_65 == false
      L7_65(L6_64)
    end
  end)
end
function cubesensor2_fall_obj_02_hit_OnEnter(A0_66, A1_67)
  print(A1_67:getName())
  invokeTask(function()
    local L0_68, L1_69, L2_70, L3_71
    name = "obj_05"
    L0_68 = Fn_sensorOff
    L1_69 = A0_66
    L0_68(L1_69)
    L0_68 = findGameObject2
    L1_69 = "Node"
    L2_70 = string
    L2_70 = L2_70.format
    L3_71 = "locator2_fall_%s_hit"
    L3_71 = L2_70(L3_71, name)
    L0_68 = L0_68(L1_69, L2_70, L3_71, L2_70(L3_71, name))
    L2_70 = L0_68
    L1_69 = L0_68.getWorldTransform
    L2_70 = L1_69(L2_70)
    L3_71 = Fn_createEffect
    L3_71 = L3_71("obj_break", "ef_ev_brkpar_02", L0_68, false, nil, "initonly")
    print("obj requestBreak")
    A1_67:requestBreak(hil_point, -2.8, 30)
    Fn_startEffect(L3_71, L0_68)
    Sound:playSE("ep00_ground_fall", 1, "", L0_68)
    Fn_finishedTremEffect(L3_71, 5)
    Camera:shake3D(2, 0.3, 1.25, L0_68:getWorldPos(), 30)
  end)
end
function area_move(A0_72, A1_73, A2_74, A3_75)
  invokeTask(function()
    local L0_76
    L0_76 = {}
    L0_76.velocity = A2_74
    L0_76.move_type = 1
    if A3_75 == nil then
      L0_76.move_type = 1
    elseif A3_75 == true then
      L0_76.move_type = 2
    elseif A3_75 == false then
      L0_76.move_type = 1
    end
    A0_72:setMoveParam(L0_76)
    A0_72:move(A1_73)
  end)
end
function is_area_move_end(A0_77)
  repeat
    wait()
  until A0_77:isMoveEnd()
end
function moveCheck()
  local L0_78, L1_79, L2_80, L3_81
  L0_78 = 0
  L1_79 = 5
  while true do
    L2_80 = Pad
    L3_81 = L2_80
    L2_80 = L2_80.getStick
    L3_81 = L2_80(L3_81, Pad.kStick_Move)
    if (L2_80 or L3_81) ~= 0 then
      L0_78 = L0_78 + 1
    end
    if not (L1_79 < L0_78) then
      wait()
    end
  end
  L2_80 = true
  return L2_80
end
function cid_check_eye()
  local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87
  L0_82 = 20
  L1_83 = Fn_sendEventComSb
  L2_84 = "requestHandle"
  L3_85 = "Puppet"
  L4_86 = "npcgen2_tkg05_01"
  L1_83 = L1_83(L2_84, L3_85, L4_86)
  L2_84 = false
  L3_85 = Fn_isInSightTarget
  L4_86 = L1_83
  L3_85 = L3_85(L4_86)
  if L3_85 == true then
    L3_85 = Fn_getPcPosRot
    L4_86 = L3_85()
    L5_87 = L3_85.y
    L5_87 = L5_87 + 1.5
    L3_85.y = L5_87
    L5_87 = Query
    L5_87 = L5_87.setEyeSightTransform
    L5_87(L5_87, L3_85, L4_86)
    L5_87 = Query
    L5_87 = L5_87.setEyeSightAngle
    L5_87(L5_87, Deg2Rad(360))
    L5_87 = Query
    L5_87 = L5_87.setEyeSightRange
    L5_87(L5_87, L0_82)
    L5_87 = L1_83.getWorldPos
    L5_87 = L5_87(L1_83)
    if Query:checkEyeSightSphere(L5_87, 0.1) == true and Query:raycastEyeSight(L5_87) == nil then
      L2_84 = true
    end
  end
  return L2_84
end
function lockCialogue()
  Fn_sendEventComSb("setLockCap", false)
  repeat
    wait()
  until Fn_sendEventComSb("isPause") == false
  Fn_sendEventComSb("setLockCap", true)
end
_bk_01_01_storm_inside_se = nil
_bk_storm = {}
function createGravityStorm(A0_88, A1_89)
  local L2_90
  L2_90 = {}
  L2_90[1] = createGameObject2("Effect")
  L2_90[1]:setName(A0_88 .. "_01")
  L2_90[1]:setModelName("ef_ev_bk01_par01")
  findGameObject2("Node", A1_89):appendChild(L2_90[1])
  return L2_90
end
function playGravityStorm(A0_91)
  local L1_92, L2_93, L3_94, L4_95
  for L4_95 = 1, 1 do
    if A0_91[L4_95] ~= nil then
      A0_91[L4_95]:play()
      A0_91[L4_95]:setLoop(true)
    end
  end
end
function stopGravityStorm(A0_96)
  local L1_97, L2_98, L3_99, L4_100
  for L4_100 = 1, 1 do
    if A0_96[L4_100] ~= nil then
      A0_96[L4_100]:stop()
    end
  end
end
function sensor_recovery_OnEnter(A0_101, A1_102)
  invokeTask(function()
    local L0_103, L1_104
    L0_103 = Fn_userCtrlOff
    L0_103()
    L0_103 = Fn_sendEventComSb
    L1_104 = "requestHandle"
    L0_103 = L0_103(L1_104, "Puppet", "npcgen2_tkg05_01")
    L1_104 = L0_103.getWorldPos
    L1_104 = L1_104(L0_103)
    L1_104.x = L1_104.x + 1.5
    Camera:lookTo(L1_104, 2, 2)
    Fn_sendEventComSb("requestAreaOut")
    Fn_userCtrlOn()
  end)
end
function sensor_recovery_OnLeave(A0_105, A1_106)
  Fn_pcSensorOff(A0_105)
  EventHelper:timerCallback("recovery sensor on", 5, function()
    Fn_pcSensorOn(A0_105)
  end)
end
