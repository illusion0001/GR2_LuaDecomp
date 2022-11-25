import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
puppets = {}
puppet_task = {}
SM28_GEM_MAX = 50
SM28_GEM_LIMIT = 99
_sm28_caption_task = nil
_zoom_rate = nil
_sm28_obj_talk = {
  "sm28_00311k",
  "sm28_00312k",
  "sm28_00313k",
  "sm28_00314k",
  "sm28_00315k",
  "sm28_00316k"
}
function Initialize()
  puppets.man73 = Fn_findNpcPuppet("man73")
  Fn_setNpcActive("man73", false)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18
  L0_0 = Fn_setCrewActive
  L1_1 = false
  L0_0(L1_1)
  L0_0 = Fn_setMineGravityStorm
  L0_0()
  L0_0 = Fn_warpCageMineArea
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "sm28_setStopAreaWarp"
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Fn_RestorBaseGravityOre
  L0_0()
  L0_0 = Fn_waitCageMoveEnd
  L0_0()
  L0_0 = Fn_setCageMoveSkip
  L1_1 = false
  L0_0(L1_1)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "sm28_setStopAreaWarp"
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm28_00300k"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "sm28_spawnIndexEnemy"
  L2_2 = 7
  L0_0(L1_1, L2_2)
  L0_0 = GlobalGem
  L1_1 = L0_0
  L0_0 = L0_0.SetOtherPreciousGemCountEnable
  L2_2 = false
  L0_0(L1_1, L2_2)
  L0_0 = GlobalGem
  L1_1 = L0_0
  L0_0 = L0_0.SetOtherPreciousGemCountEnable
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = GlobalGem
  L1_1 = L0_0
  L0_0 = L0_0.SetOtherPreciousGemCountMaxNum
  L2_2 = SM28_GEM_LIMIT
  L0_0(L1_1, L2_2)
  L0_0 = Fn_missionView
  L1_1 = "sm28_02000"
  L0_0(L1_1)
  L0_0 = waitSeconds
  L1_1 = RAC_NAVI_DELAY_DEFAULT
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "sm28_getOreBroken"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0
  L2_2 = {
    L3_3,
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17
  }
  L3_3 = "locator2_photo01_wa_a_01_"
  L4_4 = "locator2_photo01_wa_a_02_"
  L5_5 = "locator2_photo01_wa_a_03_"
  L6_6 = "locator2_photo01_wa_a_04_"
  L7_7 = "locator2_photo01_wa_a_05_"
  L8_8 = "locator2_photo01_wa_a_06_"
  L9_9 = "locator2_photo01_wa_a_07_"
  L13_13 = "locator2_photo01_wa_a_11_"
  L17_17 = "locator2_wa_a_21_01_"
  L3_3 = {
    L4_4,
    L5_5,
    L6_6,
    L7_7,
    L8_8,
    L9_9,
    L10_10,
    L11_11,
    L12_12,
    L13_13,
    L14_14,
    L15_15,
    L16_16,
    L17_17,
    L18_18
  }
  L4_4 = "gravityore_wa_a_01_"
  L5_5 = "gravityore_wa_a_02_"
  L6_6 = "gravityore_wa_a_03_"
  L7_7 = "gravityore_wa_a_04_"
  L8_8 = "gravityore_wa_a_05_"
  L9_9 = "gravityore_wa_a_06_"
  L13_13 = "gravityore_wa_a_10_"
  L17_17 = "gravityore_wa_a_20_01_"
  L18_18 = "gravityore_wa_a_21_01_"
  while true do
    L4_4 = Photo
    L4_4 = L4_4.create
    L5_5 = kPHOTO_CAPTION_ON
    L6_6 = kPHOTO_TYPE_ANY
    L7_7 = true
    L8_8 = {}
    L8_8.near = 2
    L8_8.far = 15
    L9_9 = {}
    L9_9.left = -1
    L9_9.right = 1
    L9_9.top = -1
    L9_9.bottom = 1
    L4_4 = L4_4(L5_5, L6_6, L7_7, L8_8, L9_9, L10_10)
    L5_5 = 1
    while true do
      L6_6 = 1
      L7_7 = L2_2[L5_5]
      L8_8 = string
      L8_8 = L8_8.format
      L9_9 = "%02d"
      L8_8 = L8_8(L9_9, L10_10)
      L7_7 = L7_7 .. L8_8
      L8_8 = findGameObject2
      L9_9 = "Node"
      L8_8 = L8_8(L9_9, L10_10)
      if L8_8 ~= nil then
        L9_9 = Fn_sendEventComSb
        L13_13 = "%02d"
        L9_9 = L9_9(L10_10, L11_11)
        if not L9_9 then
          L9_9 = L4_4.set
          L9_9(L10_10, L11_11)
        else
        end
        while true do
          L9_9 = L2_2[L5_5]
          L7_7 = L9_9 .. L10_10
          L9_9 = findGameObject2
          L9_9 = L9_9(L10_10, L11_11)
          L8_8 = L9_9
          if L8_8 ~= nil then
            L9_9 = Fn_sendEventComSb
            L13_13 = "%02d"
            L9_9 = L9_9(L10_10, L11_11)
            if not L9_9 then
              L9_9 = L4_4.set
              L9_9(L10_10, L11_11)
            else
            end
            L6_6 = L6_6 + 1
          end
        end
        L5_5 = L5_5 + 1
        L9_9 = #L2_2
      end
      if not (L5_5 > L9_9) then
        L9_9 = wait
        L9_9()
      end
    end
    L6_6 = L4_4
    L5_5 = L4_4.run
    L5_5(L6_6)
    while true do
      L6_6 = L4_4
      L5_5 = L4_4.isRunning
      L5_5 = L5_5(L6_6)
      if L5_5 then
        L5_5 = Fn_sendEventComSb
        L6_6 = "sm28_getOreBroken"
        L5_5 = L5_5(L6_6)
        L1_1 = L5_5
        L5_5 = HUD
        L6_6 = L5_5
        L5_5 = L5_5.isPhotoMode
        L5_5 = L5_5(L6_6)
        if L5_5 then
          L5_5 = HUD
          L6_6 = L5_5
          L5_5 = L5_5.getPhotoZoomRate
          L5_5 = L5_5(L6_6)
          _zoom_rate = L5_5
        end
      end
      if L0_0 == L1_1 then
        L5_5 = ObjectTalk
        L5_5()
        L5_5 = wait
        L5_5()
      end
    end
    if L0_0 ~= L1_1 then
      L0_0 = L1_1
      L4_4 = nil
      L5_5 = HUD
      L6_6 = L5_5
      L5_5 = L5_5.enablePhotoMode
      L7_7 = false
      L5_5(L6_6, L7_7)
      L5_5 = RAC_disablePhotoMode
      L6_6 = 0.5
      L5_5(L6_6)
      L5_5 = Fn_userCtrlAllOff
      L5_5()
      L5_5 = Player
      L6_6 = L5_5
      L5_5 = L5_5.setStay
      L7_7 = true
      L5_5(L6_6, L7_7)
      L5_5 = Player
      L6_6 = L5_5
      L5_5 = L5_5.playVoice
      L7_7 = {L8_8}
      L8_8 = "pc1_019"
      L5_5(L6_6, L7_7)
      L5_5 = Fn_captionViewWait
      L6_6 = "sm28_02001"
      L5_5(L6_6)
      L5_5 = Fn_blackout
      L5_5()
      L5_5 = Fn_resetPcPos
      L6_6 = "locator2_pc_start_pos"
      L5_5(L6_6)
      L5_5 = Player
      L6_6 = L5_5
      L5_5 = L5_5.setStay
      L7_7 = false
      L5_5(L6_6, L7_7)
      L5_5 = Fn_sendEventComSb
      L6_6 = "sm28_requestRestoreForce"
      L5_5(L6_6)
      L5_5 = Fn_sendEventComSb
      L6_6 = "sm28_getOreBroken"
      L5_5 = L5_5(L6_6)
      L0_0 = L5_5
      L1_1 = L0_0
      L5_5 = GlobalGem
      L6_6 = L5_5
      L5_5 = L5_5.SetOtherPreciousGemCountEnable
      L7_7 = false
      L5_5(L6_6, L7_7)
      L5_5 = GlobalGem
      L6_6 = L5_5
      L5_5 = L5_5.SetOtherPreciousGemCountEnable
      L7_7 = true
      L5_5(L6_6, L7_7)
      L5_5 = GlobalGem
      L6_6 = L5_5
      L5_5 = L5_5.SetOtherPreciousGemCountMaxNum
      L7_7 = SM28_GEM_LIMIT
      L5_5(L6_6, L7_7)
      L5_5 = Fn_fadein
      L5_5()
      L5_5 = Fn_userCtrlOn
      L5_5()
      L5_5 = HUD
      L6_6 = L5_5
      L5_5 = L5_5.enablePhotoMode
      L7_7 = false
      L5_5(L6_6, L7_7)
      L5_5 = Fn_missionView
      L6_6 = "sm28_02000"
      L5_5(L6_6)
      L5_5 = Player
      L6_6 = L5_5
      L5_5 = L5_5.playVoice
      L7_7 = {L8_8}
      L8_8 = "kit036a"
      L5_5(L6_6, L7_7)
      L5_5 = Fn_captionViewWait
      L6_6 = "sm28_02002"
      L5_5(L6_6)
    else
      L6_6 = L4_4
      L5_5 = L4_4.getPhotoState
      L5_5 = L5_5(L6_6)
      L6_6 = false
      L7_7 = kPHOTO_NO_TERGET
      if L5_5 ~= nil then
        L8_8 = type
        L9_9 = L5_5
        L8_8 = L8_8(L9_9)
        if L8_8 == "number" then
          L8_8 = print
          L9_9 = "results="
          L9_9 = L9_9 .. L10_10
          L8_8(L9_9)
          L7_7 = L5_5
        else
          L8_8 = type
          L9_9 = L5_5
          L8_8 = L8_8(L9_9)
          if L8_8 == "table" then
            L8_8 = 1
            L9_9 = L5_5[L8_8]
            L9_9 = L9_9.dist
            for L13_13 = 1, #L5_5 do
              L17_17 = L16_16
              L18_18 = L16_16(L17_17)
              L14_14(L15_15, L16_16, L17_17, L18_18, L16_16(L17_17))
              for L17_17, L18_18 in L14_14(L15_15) do
                print(L17_17, L18_18)
              end
              if L9_9 > L14_14 then
                L9_9 = L14_14.dist
                L8_8 = L13_13
              end
            end
            if L10_10 ~= L11_11 then
              if L10_10 ~= L11_11 then
              end
            elseif L10_10 == L11_11 then
              if L11_11 == L12_12 then
                if L11_11 ~= nil then
                  L13_13 = L12_12
                end
              end
              if L10_10 then
                L11_11()
                L4_4 = nil
                L11_11()
                L11_11(L12_12)
                break
              end
            end
          end
        end
      end
      L9_9 = L4_4
      L8_8 = L4_4.kill
      L8_8(L9_9)
      L4_4 = nil
      L8_8 = HUD
      L9_9 = L8_8
      L8_8 = L8_8.enablePhotoMode
      L8_8(L9_9, L10_10)
      L8_8 = RAC_disablePhotoMode
      L9_9 = 0.5
      L8_8(L9_9)
      L8_8 = Player
      L9_9 = L8_8
      L8_8 = L8_8.playVoice
      L8_8(L9_9, L10_10)
      L8_8 = Fn_captionViewWait
      L9_9 = "sm28_02003"
      L8_8(L9_9)
    end
    L5_5 = HUD
    L6_6 = L5_5
    L5_5 = L5_5.enablePhotoMode
    L7_7 = true
    L5_5(L6_6, L7_7)
  end
  L4_4 = Fn_kaiwaDemoView
  L5_5 = "sm28_00330k"
  L4_4(L5_5)
  L4_4 = GlobalGem
  L5_5 = L4_4
  L4_4 = L4_4.GetOtherPreciousGemNum
  L4_4 = L4_4(L5_5)
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = Fn_missionView
  L6_6 = "sm28_02004"
  L5_5(L6_6)
  while true do
    L5_5 = GlobalGem
    L6_6 = L5_5
    L5_5 = L5_5.GetOtherPreciousGemNum
    L5_5 = L5_5(L6_6)
    if L4_4 < L5_5 then
      L6_6 = waitSeconds
      L7_7 = 1
      L6_6(L7_7)
      L6_6 = Fn_userCtrlAllOff
      L6_6()
      break
    end
    L6_6 = ObjectTalk
    L6_6()
    L6_6 = wait
    L6_6()
  end
  L5_5 = Fn_missionViewEnd
  L5_5()
  L4_4 = Fn_kaiwaDemoView
  L5_5 = "sm28_00340k"
  L4_4(L5_5)
  L4_4 = GlobalGem
  L5_5 = L4_4
  L4_4 = L4_4.GetOtherPreciousGemNum
  L4_4 = L4_4(L5_5)
  L5_5 = Fn_userCtrlOn
  L5_5()
  L5_5 = Fn_missionViewWait
  L6_6 = "sm28_02005"
  L5_5(L6_6)
  L5_5 = HUD
  L6_6 = L5_5
  L5_5 = L5_5.counter999SetTextID
  L7_7 = "sm28_02006"
  L5_5(L6_6, L7_7)
  L5_5 = HUD
  L6_6 = L5_5
  L5_5 = L5_5.counter999SetNum
  L7_7 = GlobalGem
  L8_8 = L7_7
  L7_7 = L7_7.GetOtherPreciousGemNum
  L18_18 = L7_7(L8_8)
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L16_16, L17_17, L18_18, L7_7(L8_8))
  L5_5 = HUD
  L6_6 = L5_5
  L5_5 = L5_5.counter999SetVisible
  L7_7 = true
  L5_5(L6_6, L7_7)
  while true do
    L5_5 = GlobalGem
    L6_6 = L5_5
    L5_5 = L5_5.GetOtherPreciousGemNum
    L5_5 = L5_5(L6_6)
    L6_6 = HUD
    L7_7 = L6_6
    L6_6 = L6_6.counter999SetNum
    L8_8 = L5_5
    L6_6(L7_7, L8_8)
    if L4_4 < L5_5 then
      if L5_5 >= 5 and L4_4 < 5 then
        L6_6 = mineCaptionTask
        function L7_7()
          Player:playVoice({"kit032a"})
          Fn_captionViewWait("sm28_02007")
        end
        L6_6(L7_7)
      elseif L5_5 >= 10 and L4_4 < 10 then
        L6_6 = mineCaptionTask
        function L7_7()
          Sound:playSE("m29_909a", 1, "")
          Fn_captionViewWait("sm28_02008")
          Player:playVoice({"kit036b"})
          Fn_captionViewWait("sm28_02009")
        end
        L6_6(L7_7)
      elseif L5_5 >= 25 and L4_4 < 25 then
        L6_6 = mineCaptionTask
        function L7_7()
          Player:playVoice({"kit036a"})
          Fn_captionViewWait("sm28_02010")
        end
        L6_6(L7_7)
      elseif L5_5 >= 35 and L4_4 < 35 then
        L6_6 = mineCaptionTask
        function L7_7()
          Player:playVoice({"kit038c"})
          Fn_captionViewWait("sm28_02011")
        end
        L6_6(L7_7)
      else
        L6_6 = SM28_GEM_MAX
        L6_6 = L6_6 - 5
        if L5_5 >= L6_6 then
          L6_6 = SM28_GEM_MAX
          L6_6 = L6_6 - 5
          if L4_4 < L6_6 then
            L6_6 = mineCaptionTask
            function L7_7()
              Player:playVoice({"kit037a"})
              Fn_captionViewWait("sm28_02012")
            end
            L6_6(L7_7)
          end
        else
          L6_6 = SM28_GEM_MAX
          if L5_5 >= L6_6 then
            L6_6 = Player
            L7_7 = L6_6
            L6_6 = L6_6.playVoice
            L8_8 = {L9_9}
            L9_9 = "kit055b"
            L6_6(L7_7, L8_8)
            break
          end
        end
      end
      L4_4 = L5_5
    end
    L6_6 = ObjectTalk
    L6_6()
    L6_6 = wait
    L6_6()
  end
  L4_4 = HUD
  L5_5 = L4_4
  L4_4 = L4_4.counter999SetVisible
  L6_6 = false
  L4_4(L5_5, L6_6)
  L4_4 = GlobalGem
  L5_5 = L4_4
  L4_4 = L4_4.SetOtherPreciousGemCountEnable
  L6_6 = false
  L4_4(L5_5, L6_6)
  L4_4 = Fn_setKeepPlayerPos
  L4_4()
  L4_4 = Fn_setNextMissionFlag
  L4_4()
  L4_4 = Fn_nextMission
  L4_4()
  L4_4 = Fn_exitSandbox
  L4_4()
end
function Finalize()
  local L0_19, L1_20
end
function mineCaptionTask(A0_21)
  if _sm28_caption_task ~= nil then
    _sm28_caption_task:abort()
    _sm28_caption_task = nil
    Fn_captionViewEnd()
  end
  if A0_21 ~= nil then
    _sm28_caption_task = invokeTask(A0_21)
  end
end
function ObjectTalk(A0_22)
  local L1_23, L2_24
  L1_23 = Fn_sendEventComSb
  L2_24 = "sm28_checkObjectTalk"
  L1_23 = L1_23(L2_24)
  if L1_23 ~= 0 then
    if A0_22 ~= nil then
      L2_24 = A0_22[L1_23]
    elseif L2_24 then
      L2_24 = Player
      L2_24 = L2_24.getAction
      L2_24 = L2_24(L2_24)
      if L2_24 == Player.kAction_Idle then
        L2_24 = mineCaptionTask
        L2_24()
        L2_24 = Fn_kaiwaDemoView
        L2_24(_sm28_obj_talk[L1_23])
        L2_24 = Fn_sendEventComSb
        L2_24("sm28_setObjectTalked", L1_23)
      end
    end
  end
  L2_24 = GameDatabase
  L2_24 = L2_24.get
  L2_24 = L2_24(L2_24, ggd.EventFlags__sm28__flag01)
  if L2_24 ~= 1 then
    L2_24 = findGameObject2
    L2_24 = L2_24("Node", "locator2_find_pos")
    if RAC_RaycastEyeSight(L2_24, 60) and Fn_isInSightTarget(L2_24, 1) then
      RAC_LookAtObject(L2_24:getName(), 0, 0.2)
      Player:playVoice({"kit054a"})
      Fn_captionViewWait("sm28_02013")
      GameDatabase:set(ggd.EventFlags__sm28__flag01, 1)
    end
  end
end
