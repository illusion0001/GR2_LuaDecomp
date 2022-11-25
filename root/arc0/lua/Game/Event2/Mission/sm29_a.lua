dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm29_common.lua")
ADVICE_DIST = 30
BRIDGE_DIST = 20
RAYCAST_DIST = 40
BRIDGE_CAPTION_WAIT_TIME = 20
PHOTO_PARAM = {
  NEAR = 6,
  FAR = 18,
  LEFT = -0.3,
  RIGHT = 0.3,
  TOP = -0.2,
  BOTTOM = 0.2
}
_photo_area = false
_bridge_flag = false
_client_advice_flag = false
function Initialize()
  Fn_pcSensorOff("pccubesensor2_catwarp_guide_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_warning_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_area_01")
  Fn_pcSensorOff("pccubesensor2_photo_area_01")
  Fn_pcSensorOff("pccubesensormulti2_photo_advice_01")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  boy_puppet = Fn_findNpcPuppet("sm29_client")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_guide_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_warning_01"
  L0_0(L1_1)
  L0_0 = Fn_pcSensorOn
  L1_1 = "pccubesensor2_catwarp_area_01"
  L0_0(L1_1)
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm29_00100k"
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
  L2_2 = "pccubesensor2_photo_area_01"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pccubesensormulti2_photo_advice_01"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 0.5
  L1_1(L2_2)
  L1_1 = HUD
  L2_2 = L1_1
  L1_1 = L1_1.info
  L3_3 = "sm29_info_01"
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = {}
  L2_2 = {}
  L2_2.in_game_preview = "k_photo_sm2901"
  L1_1.view = L2_2
  L2_2 = Fn_gamePreviewView
  L3_3 = L1_1
  L2_2(L3_3)
  L2_2 = invokeTask
  function L3_3()
    local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15
    L0_8 = ADVICE_TIME01
    L0_8 = L0_8 - 5
    L1_9 = 0
    L2_10 = findGameObject2
    L3_11 = "Node"
    L4_12 = "locator2_advice_pos_01"
    L2_10 = L2_10(L3_11, L4_12)
    L3_11 = L2_10
    L2_10 = L2_10.getWorldPos
    L2_10 = L2_10(L3_11)
    L3_11 = findGameObject2
    L4_12 = "Node"
    L5_13 = "locator2_photo_a_01"
    L3_11 = L3_11(L4_12, L5_13)
    L4_12 = L3_11
    L3_11 = L3_11.getWorldPos
    L3_11 = L3_11(L4_12)
    L4_12 = {
      L5_13,
      L6_14,
      L7_15,
      findGameObject2("Node", "locator2_photo_a_02"),
      findGameObject2("Node", "locator2_photo_a_03")
    }
    L5_13 = findGameObject2
    L6_14 = "Node"
    L7_15 = "locator2_raycast_advice_01"
    L5_13 = L5_13(L6_14, L7_15)
    L6_14 = findGameObject2
    L7_15 = "Node"
    L6_14 = L6_14(L7_15, "locator2_raycast_advice_02")
    L7_15 = findGameObject2
    L7_15 = L7_15("Node", "locator2_photo_a_01")
    L5_13 = false
    L6_14 = nil
    while true do
      L7_15 = HUD
      L7_15 = L7_15.isPhotoMode
      L7_15 = L7_15(L7_15)
      if L7_15 == true then
        L7_15 = wait
        L7_15()
      else
        while true do
          L7_15 = getWarningFlag
          L7_15 = L7_15()
          if L7_15 == true then
            L7_15 = wait
            L7_15()
          end
        end
        L7_15 = _photo_area
        if L7_15 == false then
          L7_15 = ADVICE_TIME01
          if L0_8 == L7_15 then
            L7_15 = Fn_captionViewWait
            L7_15("sm29_00101")
          else
            L7_15 = ADVICE_TIME02
            if L0_8 == L7_15 then
              L7_15 = Fn_captionViewWait
              L7_15("sm29_00102")
            else
              L7_15 = ADVICE_TIME03
              if L0_8 == L7_15 then
                L7_15 = Fn_captionViewWait
                L7_15("sm29_00103")
              else
                L7_15 = ADVICE_TIME04
                if L0_8 == L7_15 then
                  L7_15 = Fn_captionViewWait
                  L7_15("sm29_00104")
                  L7_15 = Fn_getDistanceToPlayer
                  L7_15 = L7_15(L2_10)
                  if L7_15 > ADVICE_DIST then
                    L7_15 = Fn_getDistanceToPlayer
                    L7_15 = L7_15(L3_11)
                    if L7_15 > ADVICE_DIST then
                      L7_15 = Mv_viewObj
                      L7_15 = L7_15("locator2_advice_pos_01", 0.3)
                      L6_14 = L7_15
                      L7_15 = comSetNavi
                      L7_15(findGameObject2("Node", "locator2_advice_pos_01"))
                      L7_15 = Fn_captionViewWait
                      L7_15("sm29_00105", 3, 0.5)
                      _bridge_flag = true
                      L7_15 = waitSeconds
                      L7_15(2.5)
                      L7_15 = Mv_safeTaskAbort
                      L7_15 = L7_15(L6_14)
                      L6_14 = L7_15
                    end
                  end
                  L0_8 = 0
                end
              end
            end
          end
          L7_15 = _bridge_flag
          if L7_15 == true then
            L7_15 = Fn_getDistanceToPlayer
            L7_15 = L7_15(L2_10)
            if L7_15 < BRIDGE_DIST then
              _bridge_flag = false
              L7_15 = comKillNavi
              L7_15()
              L7_15 = 0
              invokeTask(function()
                while Fn_getDistanceToPlayer(L2_10) < BRIDGE_DIST do
                  waitSeconds(1)
                  L7_15 = L7_15 + 1
                  if L7_15 % 5 == 0 then
                    print(L7_15 .. "\231\167\146")
                  end
                end
              end)
              while Fn_getDistanceToPlayer(L2_10) < BRIDGE_DIST do
                if L7_15 % BRIDGE_CAPTION_WAIT_TIME == 0 then
                  Fn_captionViewWait("sm29_00119")
                end
                wait()
              end
            end
          else
          end
          L7_15 = waitSeconds
          L7_15(1)
          L0_8 = L0_8 + 1
        else
          L7_15 = _photo_area
          if L7_15 == true then
            if L6_14 == nil then
              L7_15 = NEAR_TIME
              if L1_9 >= L7_15 then
                L7_15 = Fn_captionViewEnd
                L7_15()
                L7_15 = Fn_captionViewWait
                L7_15("sm29_00107")
                L1_9 = 0
              end
              L7_15 = NEAR_TIME
              L7_15 = L7_15 - 3
              if L1_9 >= L7_15 then
                L7_15 = arrayRaycastCheck
                L7_15 = L7_15(L4_12, RAYCAST_DIST)
                if L7_15 ~= true then
                  L7_15 = _client_advice_flag
                elseif L7_15 == true then
                  L7_15 = Mv_viewObj
                  L7_15 = L7_15("locator2_photo_a_01", 0.5)
                  L6_14 = L7_15
                  L7_15 = Fn_captionViewEnd
                  L7_15()
                  L7_15 = Fn_captionViewWait
                  L7_15("sm29_00106")
                  L7_15 = Mv_safeTaskAbort
                  L7_15 = L7_15(L6_14)
                  L6_14 = L7_15
                  L1_9 = 0
                end
              end
            else
            end
            L7_15 = waitSeconds
            L7_15(1)
            L1_9 = L1_9 + 1
          end
        end
        L7_15 = wait
        L7_15()
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
  }, "sm29_user_photo01")
  for L7_7 = 1, PHOTO_TARGET_MAX do
    L3_3:set("locator2_photo_a_" .. string.format("%02d", L7_7))
  end
  while true do
    if L4_4 == false then
      L4_4(L5_5)
      repeat
        L4_4()
      until not L4_4
      if L7_7 == false then
        L7_7("sm29_00108")
      elseif L7_7 == true then
        if L7_7 ~= "table" then
          L7_7("sm29_00109")
        elseif L7_7 == "table" then
          if L7_7 >= PHOTO_TARGET_MAX - 1 then
            for _FORV_10_ = 1, #L6_6 do
              if L6_6[_FORV_10_].state == kPHOTO_OK or L6_6[_FORV_10_].state == kPHOTO_ANGLE then
              else
                break
              end
            end
          else
            L7_7("sm29_00110")
          end
          if L4_4 >= L7_7 then
            L7_7(L7_7, "success")
            photo_success = true
            L2_2 = L7_7
            if L7_7 == true then
              _bridge_flag = false
              L7_7()
            end
            L7_7("sm29_00111")
          elseif L5_5 == L7_7 then
            L7_7("sm29_00112")
          elseif L5_5 == L7_7 then
            L7_7("sm29_00113")
          elseif L5_5 == L7_7 then
            L7_7("sm29_00114")
          elseif L5_5 == L7_7 then
            L7_7("sm29_00115")
          else
            L7_7("sm29_00110")
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
  L4_4()
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
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
end
function pccubesensormulti2_photo_advice_01_OnEnter()
  local L0_16, L1_17
  _client_advice_flag = true
end
function pccubesensormulti2_photo_advice_01_OnLeave()
  local L0_18, L1_19
  _client_advice_flag = false
end
function pccubesensor2_photo_area_01_OnEnter()
  _photo_area = true
  invokeAdviceMessage("locator2_photo_a_03", "sm29_00118")
end
function pccubesensor2_photo_area_01_OnLeave()
  local L0_20, L1_21
  _photo_area = false
end
function pccubesensor2_catwarp_guide_01_OnLeave()
  if boy_puppet:isGrabbed() then
    Fn_pcSensorOn("pccubesensor2_catwarp_safe_01")
  else
    comCatWarpWarning("sm29_00120", boy_puppet)
  end
  onWarningFlag()
end
function pccubesensor2_catwarp_warning_01_OnLeave()
  if Player:getAction() == Player.kAction_AnyGravKick or Player:getAction() == Player.kAction_Jump then
    Player:setAction(Player.kAction_Float)
  end
  if boy_puppet:isGrabbed() then
    comCatWarpWarning("sm29_00117", "locator2_warning_navi_01")
  else
    Fn_captionView("sm29_09000")
  end
end
function pccubesensor2_catwarp_safe_01_OnEnter(A0_22)
  Fn_pcSensorOff(A0_22)
  if boy_puppet:isGrabbed() then
    comKillNavi()
  end
  offWarningFlag()
end
function pccubesensor2_catwarp_area_01_OnEnter()
  local L0_23, L1_24
end
function pccubesensor2_catwarp_area_01_OnLeave()
  catwarpFunc("locator2_boy_start_pos_01")
end
