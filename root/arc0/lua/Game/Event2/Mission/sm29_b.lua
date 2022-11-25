dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm29_common.lua")
PHOTO_PARAM = {
  NEAR = 26,
  FAR = 45,
  LEFT = -0.3,
  RIGHT = 0.3,
  TOP = -0.3,
  BOTTOM = 0.2
}
ADVICE_DIST = 60
RAYCAST_DIST = 70
_photo_area = false
_client_advice_flag = false
_photo_back_area = false
function Initialize()
  Fn_pcSensorOff("pccubesensor2_catwarp_guide_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_02")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_02")
  Fn_pcSensorOff("pccubesensor2_photo_area_02")
  Fn_pcSensorOff("pccubesensor2_photo_back_area_b_01")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  boy_puppet = Fn_findNpcPuppet("sm29_client")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_warpNpc
  L1_1 = "sm29_client"
  L2_2 = "locator2_boy_start_pos_02"
  L0_0(L1_1, L2_2)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_guide_02"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_warning_02"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_area_02"
  L0_0(L1_1)
  L0_0 = switchTutorialCap
  L1_1 = false
  L0_0(L1_1)
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_setGrabNpc
  L1_1 = "sm29_client"
  L2_2 = false
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Mv_createNpcGrabSensor
  L1_1 = "sm29_client"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setActive
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = Fn_missionView
  L2_2 = "sm29_00100"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1.3
  L1_1(L2_2)
  L1_1 = comSetNavi
  L2_2 = boy_puppet
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = switchTutorialCap
  L2_2 = true
  L1_1(L2_2)
  L1_1 = boy_puppet
  L2_2 = L1_1
  L1_1 = L1_1.isGrabbed
  L1_1 = L1_1(L2_2)
  if not L1_1 then
    L1_1 = inPcGrabSensor
    L1_1 = L1_1()
    if L1_1 then
      L1_1 = Fn_tutorialCaption
      L2_2 = "grab"
      L1_1(L2_2)
    end
  end
  L1_1 = Mv_NpcGrabCheckWait
  L2_2 = "sm29_client"
  L1_1(L2_2)
  L1_1 = comKillNavi
  L1_1()
  L2_2 = L0_0
  L1_1 = L0_0.setActive
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_photo_area_02"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_photo_advice_b_01"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensor2_photo_back_area_b_01"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = {}
  L2_2 = {}
  L2_2.in_game_preview = "k_photo_sm2902"
  L1_1.view = L2_2
  L2_2 = Fn_gamePreviewView
  L3_3 = L1_1
  L2_2(L3_3)
  L2_2 = invokeTask
  function L3_3()
    local L0_8, L1_9, L2_10, L3_11
    L0_8 = ADVICE_TIME01
    L0_8 = L0_8 - 5
    L1_9 = ADVICE_TIME01
    L1_9 = L1_9 - 5
    L2_10 = nil
    L3_11 = {
      findGameObject2("Node", "locator2_raycast_advice_03"),
      findGameObject2("Node", "locator2_raycast_advice_04"),
      findGameObject2("Node", "locator2_photo_b_01"),
      findGameObject2("Node", "locator2_photo_b_02"),
      findGameObject2("Node", "locator2_photo_b_03")
    }
    while true do
      if HUD:isPhotoMode() == true then
        wait()
      else
        while getWarningFlag() == true do
          wait()
        end
        if _photo_area == false then
          if L0_8 == ADVICE_TIME01 then
            Fn_captionViewWait("sm29_01001")
          elseif L0_8 == ADVICE_TIME02 then
            Fn_captionViewWait("sm29_01002")
          elseif L0_8 == ADVICE_TIME03 then
            Fn_captionViewWait("sm29_01003")
          elseif L0_8 == ADVICE_TIME04 then
            Fn_captionViewWait("sm29_01004")
            if Fn_getDistanceToPlayer(findGameObject2("Node", "locator2_advice_pos_02"):getWorldPos()) > ADVICE_DIST then
              L2_10 = Mv_viewObj("locator2_advice_pos_02", 0.3)
              Fn_captionViewWait("sm29_01005", 3, 0.5)
              waitSeconds(2.5)
              L2_10 = Mv_safeTaskAbort(L2_10)
            end
            L0_8 = 0
          end
          waitSeconds(1)
          L0_8 = L0_8 + 1
          L1_9 = 0
        elseif _photo_area == true then
          if L2_10 == nil then
            if L1_9 >= NEAR_TIME then
              Fn_captionViewEnd()
              Fn_captionViewWait("sm29_01007")
              L1_9 = 0
            end
            if L1_9 >= NEAR_TIME - 3 and (arrayRaycastCheck(L3_11, RAYCAST_DIST) == true or _client_advice_flag == true) then
              L2_10 = Mv_viewObj("locator2_photo_b_01", 0.5)
              Fn_captionViewEnd()
              Fn_captionViewWait("sm29_01006")
              L2_10 = Mv_safeTaskAbort(L2_10)
              L1_9 = 0
            end
          else
          end
          waitSeconds(1)
          L1_9 = L1_9 + 1
          L0_8 = 0
        end
        wait()
      end
    end
  end
  L2_2 = L2_2(L3_3)
  photo_success = false
  L3_3 = Photo
  L3_3 = L3_3.create
  L7_7.near = PHOTO_PARAM.NEAR
  L7_7.far = PHOTO_PARAM.FAR
  L3_3 = L3_3(L4_4, L5_5, L6_6, L7_7, {
    left = PHOTO_PARAM.LEFT,
    right = PHOTO_PARAM.RIGHT,
    top = PHOTO_PARAM.TOP,
    bottom = PHOTO_PARAM.BOTTOM
  }, "sm29_user_photo02")
  for L7_7 = 1, PHOTO_TARGET_MAX do
    L3_3:set("locator2_photo_b_" .. string.format("%02d", L7_7))
  end
  while true do
    if L4_4 == false then
      L4_4(L5_5)
      repeat
        L4_4()
      until not L4_4
      L7_7(L6_6)
      if L7_7 == true then
        L7_7("sm29_01009")
      elseif L7_7 == false then
        L7_7("sm29_01008")
      elseif L7_7 == true then
        if L7_7 ~= "table" then
          L7_7("sm29_01009")
        elseif L7_7 == "table" then
          if L7_7 >= PHOTO_TARGET_MAX - 1 then
            for _FORV_10_ = 1, #L6_6 do
              if L6_6[_FORV_10_].state == kPHOTO_OK or L6_6[_FORV_10_].state == kPHOTO_ANGLE then
              else
                break
              end
            end
          else
            L7_7("sm29_01010")
          end
          if L4_4 >= L7_7 then
            L7_7(L7_7, "success")
            photo_success = true
            L2_2 = L7_7
            L7_7("sm29_01011")
          elseif L5_5 == L7_7 then
            L7_7("sm29_01012")
          elseif L5_5 == L7_7 then
            L7_7("sm29_01013")
          elseif L5_5 == L7_7 then
            L7_7("sm29_01014")
          elseif L5_5 == L7_7 then
            L7_7("sm29_01015")
          else
            L7_7("sm29_01010")
          end
        end
      end
      L7_7()
    end
  end
  L4_4(L5_5, L6_6)
  L3_3 = nil
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4()
  L4_4()
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4(L5_5, L6_6)
  L4_4(L5_5)
  L4_4(L5_5)
  L4_4()
  L4_4()
  L4_4()
  L4_4()
  L4_4()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensor2_photo_area_02_OnEnter()
  _photo_area = true
  invokeAdviceMessage("locator2_photo_b_03", "sm29_01018")
end
function pccubesensor2_photo_area_02_OnLeave()
  local L0_12, L1_13
  _photo_area = false
end
function pccubesensor2_catwarp_safe_02_OnEnter(A0_14)
  Fn_pcSensorOff(A0_14)
  if boy_puppet:isGrabbed() then
    comKillNavi()
  end
  offWarningFlag()
end
function pccubesensor2_catwarp_guide_02_OnLeave()
  Fn_pcSensorOn("pccubesensor2_catwarp_safe_02")
  if boy_puppet:isGrabbed() then
  else
    comCatWarpWarning("sm29_01019", boy_puppet)
  end
  onWarningFlag()
end
function pccubesensor2_catwarp_warning_02_OnLeave()
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  if boy_puppet:isGrabbed() then
    comCatWarpWarning("sm29_01017", "locator2_warning_navi_02")
  else
    Fn_captionView("sm29_09000")
  end
end
function pccubesensor2_catwarp_area_02_OnLeave()
  catwarpFunc("locator2_boy_start_pos_02")
end
function pccubesensor2_photo_advice_b_01_OnEnter()
  local L0_15, L1_16
  _client_advice_flag = true
end
function pccubesensor2_photo_advice_b_01_OnLeave()
  local L0_17, L1_18
  _client_advice_flag = false
end
function pccubesensor2_photo_back_area_b_01_OnEnter()
  local L0_19, L1_20
  _photo_back_area = true
end
function pccubesensor2_photo_back_area_b_01_OnLeave()
  local L0_21, L1_22
  _photo_back_area = false
end
