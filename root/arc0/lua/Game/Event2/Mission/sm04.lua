dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/photo.lua")
dofile("/Game/Misc/gesture.lua")
PHASE_DATA = {
  {gesture_yes_rate = 0.5, gesture_no_max_count = 1},
  {gesture_yes_rate = 0.4, gesture_no_max_count = 2},
  {gesture_yes_rate = 0.3, gesture_no_max_count = 3},
  {gesture_yes_rate = 0.2, gesture_no_max_count = 4}
}
NPC_MOTION = {
  say = "man01_reaction_goo_00"
}
_puppet_tbl = {}
_gesture = nil
_gesture_ban_cnt = 0
_is_posing = {}
_gesture_no_mob_tbl = {}
_gesture_no_count = 0
_have_gesture_mob_tbl = {}
_photo_pose_task_tbl = {}
function Initialize()
  _puppet_tbl.sm04_client = Fn_findNpcPuppet("sm04_client")
  Fn_loadNpcEventMotion("sm04_client", NPC_MOTION)
  Mob:letStateMode(Mob.StateMode.kNoAccessory, true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12
  L0_0 = Mob
  L1_1 = L0_0
  L0_0 = L0_0.topUpHatchery
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_playMotionNpc
  L1_1 = "sm04_client"
  L2_2 = "stay"
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = 1
  L1_1 = PHASE_DATA
  L1_1 = #L1_1
  function L2_2(A0_13)
    local L1_14, L2_15, L3_16, L4_17, L5_18
    L2_15 = A0_13
    L1_14 = A0_13.getName
    L1_14 = L1_14(L2_15)
    if L1_14 == "sm04_client" then
      L2_15 = Fn_userCtrlOff
      L2_15()
      L3_16 = A0_13
      L2_15 = A0_13.getWorldTransform
      L3_16 = L2_15(L3_16)
      L4_17 = Vector
      L5_18 = 0
      L4_17 = L4_17(L5_18, 1.6, 0)
      L4_17 = L2_15 + L4_17
      L5_18 = Player
      L5_18 = L5_18.setLookAtIk
      L5_18(L5_18, true, 1, L4_17)
      L5_18 = Vector
      L5_18 = L5_18(0, 0, 1)
      L5_18 = L3_16:Apply(L5_18)
      L5_18 = L5_18 + L2_15
      Fn_turnNpc(L1_14)
      Fn_playMotionNpc("sm04_client", NPC_MOTION.say, true, {isStop = true})
      while HUD:captionGetTextId() ~= nil do
        wait()
      end
      Fn_captionViewWait("sm04_00101")
      Fn_turnNpc(L1_14, L5_18)
      Player:setLookAtIk(false, 1, L4_17)
      Fn_userCtrlOn()
      RAC_setSightParam("sm04_client")
    end
  end
  L3_3 = GestureEvent
  L3_3 = L3_3.create
  L4_4 = "ui_event_guide_02"
  L5_5, L6_6 = nil, nil
  L7_7 = L2_2
  L3_3 = L3_3(L4_4, L5_5, L6_6, L7_7)
  _gesture = L3_3
  L3_3 = _gesture
  L4_4 = L3_3
  L3_3 = L3_3.setMobText
  L5_5 = gestureMobText
  L7_7 = L5_5()
  L3_3(L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L5_5())
  L3_3 = _gesture
  L4_4 = L3_3
  L3_3 = L3_3.setOverrideYesFunc
  function L5_5(A0_19)
    local L1_20
    L1_20 = false
    if string.match(A0_19.className, "[a-z]+") == "wom" and A0_19.asSwitchIn == false and A0_19.switchable == true and _gesture_no_mob_tbl[A0_19.pawnId] ~= true and PHASE_DATA[L0_0].gesture_no_max_count <= _gesture_no_count then
      L1_20 = true
    end
    if _have_gesture_mob_tbl[A0_19.pawnId] ~= true then
      _have_gesture_mob_tbl[A0_19.pawnId] = true
      if A0_19.asSwitchIn == false and A0_19.replyId == 0 then
        _gesture_no_count = _gesture_no_count + 1
      end
    end
    if _gesture_no_mob_tbl[A0_19.pawnId] ~= true and A0_19.asSwitchIn == false and A0_19.replyId == 0 and A0_19.switchable == true then
      _gesture_no_mob_tbl[A0_19.pawnId] = true
    end
    return L1_20
  end
  L3_3(L4_4, L5_5)
  L3_3 = {}
  L4_4 = Fn_createChangeMobToNpc
  L5_5 = L3_3
  L6_6 = {}
  L6_6.gesture = true
  L4_4(L5_5, L6_6)
  L4_4 = _gesture
  L5_5 = L4_4
  L4_4 = L4_4.setNpc
  L6_6 = {L7_7}
  L7_7 = _puppet_tbl
  L7_7 = L7_7.sm04_client
  L4_4(L5_5, L6_6)
  L4_4 = _gesture
  L5_5 = L4_4
  L4_4 = L4_4.setAsking
  L6_6 = false
  L4_4(L5_5, L6_6)
  L4_4 = Fn_missionStart
  L4_4()
  L4_4 = Fn_kaiwaDemoView
  L5_5 = "sm04_00100k"
  L4_4(L5_5)
  L4_4 = Fn_userCtrlOn
  L4_4()
  L4_4 = waitSeconds
  L5_5 = 0.5
  L4_4(L5_5)
  L4_4 = RAC_infoView
  L5_5 = "sm04_info_01"
  L6_6 = false
  L4_4(L5_5, L6_6)
  L4_4 = Fn_missionView
  L5_5 = "sm04_00102"
  L4_4(L5_5)
  L4_4 = waitSeconds
  L5_5 = 1.3
  L4_4(L5_5)
  L4_4 = Fn_captionView
  L5_5 = "sm04_00103"
  L4_4(L5_5)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.counter99_99SetTextID
  L6_6 = "sm04_00104"
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.counter99_99SetMax
  L6_6 = L1_1 + 1
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.counter99_99SetNum
  L6_6 = 0
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.counter99_99SetVisible
  L6_6 = true
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.cameraCommonCounter99_99SetTextID
  L6_6 = "sm04_00104"
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.cameraCommonCounter99_99SetMax
  L6_6 = L1_1 + 1
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.cameraCommonCounter99_99SetNum
  L6_6 = 0
  L4_4(L5_5, L6_6)
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.cameraCommonCounter99_99SetVisible
  L6_6 = true
  L4_4(L5_5, L6_6)
  L4_4 = {
    L5_5,
    L6_6,
    L7_7,
    L8_8
  }
  L5_5 = "sm04_00105"
  L6_6 = "sm04_00106"
  L7_7 = "sm04_00107"
  L5_5 = invokePhotoHintTask
  L6_6 = false
  L5_5 = L5_5(L6_6)
  while true do
    if L0_0 <= L1_1 then
      L6_6 = Photo
      L6_6 = L6_6.create
      L7_7 = kPHOTO_CAPTION_OFF
      L10_10.near = 1
      L10_10.far = 4
      L11_11.left = -0.8
      L11_11.right = 0.8
      L11_11.top = -0.8
      L11_11.bottom = 0.8
      L6_6 = L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12)
      L7_7 = _gesture
      L7_7 = L7_7.setNaviTarget
      L11_11.pointing = false
      L11_11.women = true
      L11_11.positiveRate = L12_12
      L11_11.interview = true
      L7_7(L8_8, L9_9, L10_10, L11_11)
      _gesture_no_count = 0
      L7_7 = _gesture
      L7_7 = L7_7.isRunning
      L7_7 = L7_7(L8_8)
      if L7_7 == false then
        L7_7 = _gesture
        L7_7 = L7_7.run
        L7_7(L8_8)
      end
      L7_7 = invokeTask
      L7_7 = L7_7(L8_8)
      while true do
        L8_8(L9_9)
        repeat
          L8_8()
        until not L8_8
        if L8_8 ~= nil then
          if L9_9 == "table" then
            for _FORV_14_, _FORV_15_ in L11_11(L12_12) do
              if _is_posing[_FORV_15_.target:getName()] == true and (L9_9 == nil or L9_9 > Fn_getDistanceToPlayer(_FORV_15_.node)) then
              end
            end
            if L10_10 == nil then
              for _FORV_14_, _FORV_15_ in L11_11(L12_12) do
                if L9_9 == nil or L9_9 > Fn_getDistanceToPlayer(_FORV_15_.node) then
                end
              end
            end
            if L12_12 == true then
              print("photo state = " .. L12_12)
              if L12_12 == kPHOTO_OK then
                Fn_captionView(L4_4[L0_0])
                break
              elseif L12_12 == kPHOTO_NEAR then
                Fn_captionViewWait("sm04_00109")
              elseif L12_12 == kPHOTO_FAR then
                Fn_captionViewWait("sm04_00110")
              elseif L12_12 == kPHOTO_ANGLE or L12_12 == kPHOTO_BACK then
                Fn_captionViewWait("sm04_00111")
              elseif L12_12 == kPHOTO_OUT or L12_12 == kPHOTO_NO_TERGET then
                Fn_captionViewWait("sm04_00112")
              end
            else
              L12_12("sm04_00113")
            end
          elseif L9_9 == "number" then
            L9_9(L10_10)
            if L9_9 == true then
              if L8_8 ~= L9_9 then
              elseif L8_8 == L9_9 then
                L9_9(L10_10)
              end
            else
              L9_9(L10_10)
            end
          end
        end
      end
      for L11_11, L12_12 in L8_8(L9_9) do
        _is_posing[L11_11] = false
      end
      L8_8(L9_9)
      L8_8(L9_9)
      L6_6 = nil
      L8_8(L9_9)
      L7_7 = nil
      L8_8(L9_9, L10_10)
      L8_8(L9_9, L10_10)
      L8_8(L9_9, L10_10, L11_11)
      for L11_11, L12_12 in L8_8(L9_9) do
        _photo_pose_task_tbl[L11_11]:requestEnd()
      end
      for L11_11, L12_12 in L8_8(L9_9) do
        while L12_12:isRunning() do
          wait()
        end
      end
      _photo_pose_task_tbl = L8_8
      L0_0 = L0_0 + 1
    end
  end
  L7_7 = L5_5
  L6_6 = L5_5.abort
  L6_6(L7_7)
  L5_5 = nil
  L6_6 = _gesture
  L7_7 = L6_6
  L6_6 = L6_6.setOverrideYesFunc
  L6_6(L7_7, L8_8)
  L6_6 = _gesture
  L7_7 = L6_6
  L6_6 = L6_6.setNaviTarget
  L10_10.pointing = false
  L10_10.females = true
  L10_10.positiveRate = 0
  L10_10.interview = true
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L6_6 = _gesture
  L7_7 = L6_6
  L6_6 = L6_6.isRunning
  L6_6 = L6_6(L7_7)
  if L6_6 == false then
    L6_6 = _gesture
    L7_7 = L6_6
    L6_6 = L6_6.run
    L6_6(L7_7)
  end
  _gesture_no_count = 0
  while true do
    L6_6 = _gesture_no_count
    if L6_6 < 5 then
      L6_6 = wait
      L6_6()
    end
  end
  L6_6 = _gesture
  L7_7 = L6_6
  L6_6 = L6_6.setInputProhibit
  L6_6(L7_7, L8_8)
  while true do
    L6_6 = _gesture
    L7_7 = L6_6
    L6_6 = L6_6.isInteraction
    L6_6 = L6_6(L7_7)
    if L6_6 == true then
      L6_6 = wait
      L6_6()
    end
  end
  L6_6 = Fn_kaiwaDemoView
  L7_7 = "sm04_00200k"
  L6_6(L7_7)
  L6_6 = _gesture
  L7_7 = L6_6
  L6_6 = L6_6.stop
  L6_6(L7_7)
  L6_6 = waitSeconds
  L7_7 = 0.5
  L6_6(L7_7)
  L6_6 = RAC_infoView
  L7_7 = "sm04_info_02"
  L6_6(L7_7, L8_8)
  L6_6 = Fn_missionView
  L7_7 = "sm04_00114"
  L6_6(L7_7)
  L6_6 = waitSeconds
  L7_7 = 1.3
  L6_6(L7_7)
  L6_6 = invokePhotoHintTask
  L7_7 = true
  L6_6 = L6_6(L7_7)
  L5_5 = L6_6
  L6_6 = Photo
  L6_6 = L6_6.create
  L7_7 = kPHOTO_CAPTION_OFF
  L10_10.near = 0.3
  L10_10.far = 15
  L11_11.left = -0.8
  L11_11.right = 0.8
  L11_11.top = -0.8
  L11_11.bottom = 0.8
  L6_6 = L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12)
  photo = L6_6
  L6_6 = photo
  L7_7 = L6_6
  L6_6 = L6_6.set
  L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L8_8())
  while true do
    L6_6 = photo
    L7_7 = L6_6
    L6_6 = L6_6.run
    L6_6(L7_7)
    repeat
      L6_6 = wait
      L6_6()
      L6_6 = photo
      L7_7 = L6_6
      L6_6 = L6_6.isRunning
      L6_6 = L6_6(L7_7)
    until not L6_6
    L6_6 = photo
    L7_7 = L6_6
    L6_6 = L6_6.getPhotoState
    L6_6 = L6_6(L7_7)
    if L6_6 ~= nil then
      L7_7 = kPHOTO_OK
      if L6_6 == L7_7 then
        L7_7 = Sound
        L7_7 = L7_7.playSE
        L7_7(L8_8, L9_9, L10_10)
        L7_7 = HUD
        L7_7 = L7_7.counter99_99SetNum
        L7_7(L8_8, L9_9)
        L7_7 = HUD
        L7_7 = L7_7.cameraCommonCounter99_99SetNum
        L7_7(L8_8, L9_9)
        break
      else
        L7_7 = kPHOTO_NEAR
        if L6_6 == L7_7 then
          L7_7 = Fn_captionViewWait
          L7_7(L8_8)
        else
          L7_7 = kPHOTO_FAR
          if L6_6 == L7_7 then
            L7_7 = Fn_captionViewWait
            L7_7(L8_8)
          else
            L7_7 = kPHOTO_ANGLE
            if L6_6 ~= L7_7 then
              L7_7 = kPHOTO_BACK
            end
            if L6_6 == L7_7 then
              L7_7 = Fn_captionViewWait
              L7_7(L8_8)
            else
              L7_7 = kPHOTO_OUT
              if L6_6 ~= L7_7 then
                L7_7 = kPHOTO_NO_TERGET
              elseif L6_6 == L7_7 then
                L7_7 = Fn_captionViewWait
                L7_7(L8_8)
              end
            end
          end
        end
      end
    else
      L7_7 = print
      L7_7(L8_8)
    end
  end
  L6_6 = photo
  L7_7 = L6_6
  L6_6 = L6_6.kill
  L6_6(L7_7)
  L7_7 = L5_5
  L6_6 = L5_5.abort
  L6_6(L7_7)
  L5_5 = nil
  L6_6 = Fn_missionViewEnd
  L6_6()
  L6_6 = HUD
  L7_7 = L6_6
  L6_6 = L6_6.counter99_99SetVisible
  L6_6(L7_7, L8_8)
  L6_6 = HUD
  L7_7 = L6_6
  L6_6 = L6_6.cameraCommonCounter99_99SetVisible
  L6_6(L7_7, L8_8)
  L6_6 = Fn_kaiwaDemoView
  L7_7 = "sm04_00300k"
  L6_6(L7_7)
  L6_6 = Fn_blackout
  L6_6()
  L6_6 = Fn_resetPcPos
  L7_7 = "locator2_pc_start_pos"
  L6_6(L7_7)
  L6_6 = Fn_fadein
  L6_6()
  L6_6 = Fn_kaiwaDemoView
  L7_7 = "sm04_00400k"
  L6_6(L7_7)
  L6_6 = Fn_setKeepPlayerPos
  L6_6()
  L6_6 = Fn_setNextMissionFlag
  L6_6()
  L6_6 = Fn_nextMission
  L6_6()
  L6_6 = Fn_exitSandbox
  L6_6()
end
function Finalize()
  _puppet_tbl.sm04_client = nil
  Mob:letStateMode(Mob.StateMode.kNoAccessory, false)
end
function gestureMobText()
  local L0_21, L1_22, L2_23, L3_24, L4_25
  L0_21 = {}
  L3_24.text = "sm04_00100"
  L2_23.listen = L3_24
  L3_24.text = "sm04_00117"
  L3_24.time = 2
  L2_23.reply_yes = L3_24
  L3_24.text = "sm04_00118"
  L3_24.time = 2
  L2_23.reply_no = L3_24
  L4_25 = {}
  L4_25.text = "sm04_00119"
  L3_24.listen = L4_25
  L4_25 = {}
  L4_25.text = "sm04_00120"
  L4_25.time = 2
  L3_24.reply_yes = L4_25
  L4_25 = {}
  L4_25.text = "sm04_00121"
  L4_25.time = 2
  L3_24.reply_no = L4_25
  L0_21.other = L1_22
  L2_23.text = "sm04_00100"
  L1_22.listen = L2_23
  L2_23.text = nil
  L2_23.time = nil
  L1_22.reply_yes = L2_23
  L2_23.text = "sm04_00122"
  L2_23.time = 2
  L1_22.reply_no = L2_23
  L0_21.chi12 = L1_22
  L2_23.text = "sm04_00100"
  L1_22.listen = L2_23
  L2_23.text = nil
  L2_23.time = nil
  L1_22.reply_yes = L2_23
  L2_23.text = "sm04_00122"
  L2_23.time = 2
  L1_22.reply_no = L2_23
  L0_21.chi14 = L1_22
  L2_23.text = "sm04_00100"
  L1_22.listen = L2_23
  L2_23.text = nil
  L2_23.time = nil
  L1_22.reply_yes = L2_23
  L2_23.text = "sm04_00122"
  L2_23.time = 2
  L1_22.reply_no = L2_23
  L0_21.chi16 = L1_22
  L2_23.text = "sm04_00100"
  L1_22.listen = L2_23
  L2_23.text = nil
  L2_23.time = nil
  L1_22.reply_yes = L2_23
  L2_23.text = "sm04_00122"
  L2_23.time = 2
  L1_22.reply_no = L2_23
  L0_21.chi11 = L1_22
  L2_23.text = "sm04_00100"
  L1_22.listen = L2_23
  L2_23.text = nil
  L2_23.time = nil
  L1_22.reply_yes = L2_23
  L2_23.text = "sm04_00122"
  L2_23.time = 2
  L1_22.reply_no = L2_23
  L0_21.chi13 = L1_22
  L2_23.text = "sm04_00100"
  L1_22.listen = L2_23
  L2_23.text = nil
  L2_23.time = nil
  L1_22.reply_yes = L2_23
  L2_23.text = "sm04_00122"
  L2_23.time = 2
  L1_22.reply_no = L2_23
  L0_21.chi15 = L1_22
  for L4_25 = 1, 90 do
    L0_21["man" .. string.format("%02d", L4_25)] = {
      listen = {text = "sm04_00100"},
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm04_00122", time = 2}
    }
  end
  return L0_21
end
function invokePhotoPosingTask(A0_26)
  local L1_27, L2_28
  L2_28 = A0_26
  L1_27 = A0_26.getName
  L1_27 = L1_27(L2_28)
  L2_28 = {}
  L2_28.npc_hdl = A0_26
  L2_28.req_end = false
  L2_28.motion_task = nil
  L2_28.gesture_ban = false
  function L2_28.update(A0_29)
    local L1_30
    repeat
      L1_30 = wait
      L1_30()
      L1_30 = A0_29.req_end
      if L1_30 == true then
        return
      end
      L1_30 = A0_29.npc_hdl
      L1_30 = L1_30.isReadyNpc
      L1_30 = L1_30(L1_30)
    until L1_30
    L1_30 = print
    L1_30("mob to npc ready : " .. L1_27)
    L1_30 = _gesture_ban_cnt
    if L1_30 <= 0 then
      L1_30 = _gesture
      L1_30 = L1_30.stop
      L1_30(L1_30)
    end
    L1_30 = _gesture_ban_cnt
    L1_30 = L1_30 + 1
    _gesture_ban_cnt = L1_30
    A0_29.gesture_ban = true
    L1_30 = A0_29.npc_hdl
    L1_30 = L1_30.getPuppet
    L1_30 = L1_30(L1_30)
    _is_posing[L1_27] = true
    A0_29.motion_task = invokeTask(function()
      local L0_31, L1_32
      L0_31 = nil
      L1_32 = {
        "photo_00",
        "photo_02",
        "photo_03"
      }
      L0_31 = L1_32
      function L1_32(A0_33)
        local L1_34
        L1_34 = L0_31[A0_33]
        L0_31[A0_33] = L0_31[1]
        L0_31[1] = L1_34
        Fn_playMotionNpc(A0_29.npc_hdl, L0_31[1], false)
      end
      L1_32(RandI(1, #L0_31))
      while true do
        waitSeconds(5)
        L1_32(RandI(2, #L0_31))
      end
    end)
    while _is_posing[L1_27] == true and Fn_getDistanceToPlayer(L1_30) <= 10 do
      wait()
      if A0_29.req_end == true then
        return
      end
    end
    A0_29.motion_task:abort()
    A0_29.motion_task = nil
    _is_posing[L1_27] = false
    _gesture_ban_cnt = _gesture_ban_cnt - 1
    if _gesture_ban_cnt <= 0 then
      _gesture:run()
    end
    A0_29.gesture_ban = false
    Fn_playMotionNpc(A0_29.npc_hdl, "stay", false)
    Fn_changeNpcToMob(A0_29.npc_hdl)
    A0_29.npc_hdl = nil
  end
  function L2_28.destructor(A0_35)
    if A0_35.motion_task ~= nil then
      A0_35.motion_task:abort()
      A0_35.motion_task = nil
    end
    if A0_35.npc_hdl ~= nil then
      Fn_changeNpcToMob(A0_35.npc_hdl)
      A0_35.npc_hdl = nil
    end
    if A0_35.gesture_ban == true then
      _gesture_ban_cnt = _gesture_ban_cnt - 1
      if _gesture_ban_cnt <= 0 then
        _gesture:run()
      end
      A0_35.gesture_ban = false
    end
    _photo_pose_task_tbl[L1_27] = nil
  end
  RAC_InvokeTaskWithDestractor(L2_28.update, L2_28.destructor, L2_28).requestEnd = function(A0_36)
    local L1_37
    L2_28.req_end = true
  end
  _photo_pose_task_tbl[L1_27] = RAC_InvokeTaskWithDestractor(L2_28.update, L2_28.destructor, L2_28)
  return (RAC_InvokeTaskWithDestractor(L2_28.update, L2_28.destructor, L2_28))
end
function isPosingSomeone()
  for _FORV_3_, _FORV_4_ in pairs(_is_posing) do
    if _FORV_4_ == true then
      return true
    end
  end
  return false
end
function invokePhotoHintTask(A0_38)
  return invokeTask(function()
    local L0_39
    L0_39 = "ic_camera_00100"
    while true do
      if (A0_38 == true or isPosingSomeone() == true) and HUD:isPhotoMode() == false and HUD:isPhotoModePlayingAnim() == false then
        if HUD:captionGetTextId() == nil then
          Fn_captionView(L0_39, 0)
        end
      elseif HUD:captionGetTextId() == nil or HUD:captionGetTextId() == L0_39 then
        Fn_captionViewEnd()
      end
      wait()
    end
  end)
end
