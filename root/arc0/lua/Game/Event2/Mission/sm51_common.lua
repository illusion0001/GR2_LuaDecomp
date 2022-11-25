local L1_1
durability = 100
durability_max = 100
durability_restoration = 50
durability_damage = 4
durability_jump = 1
durability_lunajump = 1
clow_chase_event = false
_is_in_catwarp = false
_sm51_sweersbox_model = "box_ms_02"
L0_0 = {}
check_point_sensor = L0_0
function L0_0(A0_2, A1_3, A2_4)
  if A2_4 == nil then
    A2_4 = 1
  end
  HUD:counter99_99AddNum(1)
  Fn_sendEventComSb("setReceivedFlag", A0_2, 1)
  Fn_naviKill()
  Fn_userCtrlAllOff()
  waitSeconds(1)
  Fn_kaiwaDemoView(A1_3)
  Fn_userCtrlOn()
  Fn_sendEventComSb("setReceivedFlag", A0_2, 2)
end
sm51_Delivery_Finished = L0_0
function L0_0(A0_5, A1_6, A2_7, A3_8, A4_9)
  if A3_8 == nil then
    A3_8 = 1.3
  end
  if A4_9 == nil then
    A4_9 = 2.5
  end
  Fn_missionView(A0_5)
  waitSeconds(A3_8)
  Fn_naviSet(findGameObject2("Node", A1_6))
  waitSeconds(A4_9)
  Fn_captionView(A2_7)
end
sm51_MissionTarget = L0_0
function L0_0(A0_10, A1_11, A2_12, A3_13, A4_14)
  local L5_15, L6_16, L7_17, L8_18, L9_19, L10_20
  L5_15 = false
  L6_16[A0_10] = false
  check_course_out = false
  L6_16(L7_17)
  check_point_restart = A1_11
  check_point_box_restart = A2_12
  if A3_13 == true then
    while true do
      if L6_16 ~= false then
      elseif L6_16 ~= L7_17 then
        L6_16()
        L6_16()
        while true do
          else
            if L6_16 == false then
              L6_16()
              if A4_14 == true then
                for L9_19 = L6_16 + 1, #L7_17 do
                  L10_20 = findGameObject2
                  L10_20 = L10_20("Node", check_point_phase_list[L9_19])
                  if L10_20 == nil then
                    L10_20 = Fn_sendEventComSb("findComGameNode", check_point_phase_list[L9_19])
                  end
                  if Fn_getDistanceToPlayer(L10_20) < 15 then
                    L5_15 = true
                    check_point_phase = L9_19 + 1
                    print("SKIP PHASE >> " .. check_point_phase)
                    break
                  end
                end
              end
            end
            if not L5_15 then
              L6_16()
            end
          end
        end
      end
    end
  if not L5_15 then
    check_point_phase = L6_16
    L6_16(L7_17)
  end
  L6_16[A0_10] = false
  check_course_out = false
  L6_16(L7_17)
end
sm51_NextPointEnter = L0_0
function L0_0(A0_21)
  local L1_22
  check_point_restart = A0_21
end
sm51_setCatwarpPoint = L0_0
function L0_0(A0_23, A1_24)
  Fn_captionView(A1_24)
end
sm51_NextPointLook = L0_0
function L0_0()
  if check_course_out == true then
    if _puppet_crow ~= nil then
      _puppet_crow:getBrain():setIdling(true)
    end
    _is_in_catwarp = true
    if durability > 0 then
      Fn_captionViewWait("sm51_09002")
    end
    Fn_userCtrlAllOff()
    if durability <= 0 then
      Fn_scriptGameOver()
    else
      Fn_catWarpIn()
      Fn_setCatWarpCheckPoint(check_point_restart)
      Fn_catWarpCheckPoint()
      Fn_sendEventComSb("SweetsboxDropObject")
      wait()
      Fn_sendEventComSb("SweetsboxWarpRecreateObject", check_point_box_restart)
      Fn_catWarpOut()
      while Fn_sendEventComSb("GetSweetsboxIsGrabed") == false do
        Fn_sendEventComSb("SweetsboxGrabObject")
        wait()
      end
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
      if _puppet_crow ~= nil then
        invokeTask(function()
          waitSeconds(1)
          _puppet_crow:getBrain():setIdling(false)
        end)
      end
      check_course_out = false
      _is_in_catwarp = false
    end
  end
end
course_out_check = L0_0
function L0_0()
  return invokeTask(function()
    local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31
    L0_25 = false
    L1_26 = false
    L2_27 = false
    L3_28 = Player
    L3_28 = L3_28.kAction_Unknown
    L4_29 = Player
    L4_29 = L4_29.kJumpStyle_Other
    while true do
      L5_30 = Player
      L6_31 = L5_30
      L5_30 = L5_30.getAction
      L5_30 = L5_30(L6_31)
      L6_31 = Player
      L6_31 = L6_31.kAction_Jump
      if L5_30 == L6_31 then
        L6_31 = Player
        L6_31 = L6_31.getJumpStyle
        L6_31 = L6_31(L6_31)
        if L6_31 ~= L4_29 then
          if L6_31 == Player.kJumpStyle_Freefall then
            print("JUMP STYLE : kJumpStyle_Freefall")
          elseif L3_28 ~= Player.kJumpStyle_FromGround and L6_31 == Player.kJumpStyle_Spring or L6_31 == Player.kJumpStyle_Rocket then
            print("JUMP STYLE : kJumpStyle_Spring or kJumpStyle_Rocket")
            durability = durability - durability_lunajump
            HUD:counter999SetNum(durability)
            L3_28 = L5_30
          elseif L3_28 ~= Player.kJumpStyle_Spring and L6_31 == Player.kJumpStyle_FromGround then
            print("JUMP STYLE : kJumpStyle_FromGround")
            durability = durability - durability_jump
            HUD:counter999SetNum(durability)
            L3_28 = L5_30
          else
            print("JUMP STYLE : unknown.." .. L6_31)
          end
          L4_29 = L6_31
        end
      else
        L6_31 = Player
        L4_29 = L6_31.kJumpStyle_Other
        if L3_28 ~= L5_30 then
          L6_31 = Player
          L6_31 = L6_31.kAction_Dodge
          if L5_30 == L6_31 then
            L6_31 = print
            L6_31("DODGE ACTION : kAction_Dodge")
            L3_28 = L5_30
          else
            L6_31 = Player
            L3_28 = L6_31.kAction_Unknown
          end
        end
      end
      L6_31 = Player
      L6_31 = L6_31.getLastFrameDamagePoint
      L6_31 = L6_31(L6_31)
      if L6_31 > 0 then
        durability = durability - durability_damage
        if durability <= 0 then
          durability = 0
        end
        HUD:counter999SetNum(durability)
      end
      if durability <= 50 and L0_25 == false then
        Fn_captionView("sm51_09004")
        L0_25 = true
      end
      if durability <= 25 and L1_26 == false then
        Fn_captionViewWait("sm51_09005")
        L1_26 = true
      end
      if durability > 50 then
        if L0_25 == true then
          L0_25 = false
        end
        if L1_26 == true then
          L1_26 = false
        end
      end
      if durability <= 0 and L2_27 == false then
        L2_27 = true
        while _is_in_catwarp == true do
          wait()
        end
        Fn_sendEventComSb("SweetsboxBrokenObject")
        Fn_pcSensorOff("pccubesensormulti2_course_out_01")
        Fn_captionViewWait("sm51_09003")
        if clow_chase_event == true then
          Fn_scriptGameOver()
        else
          Fn_userCtrlAllOff()
          Fn_blackout()
          Fn_resetPcPos(check_point_restart)
          Fn_sendEventComSb("SweetsboxDropObject")
          wait()
          Fn_sendEventComSb("SweetsboxWarpRecreateObject", check_point_box_restart)
          durability = durability_max
          L2_27 = false
          L0_25 = false
          L1_26 = false
          HUD:counter999SetNum(durability)
          Fn_fadein()
          while Fn_sendEventComSb("GetSweetsboxIsGrabed") == false do
            Fn_sendEventComSb("SweetsboxGrabObject")
            wait()
          end
          Fn_userCtrlOn()
          Fn_pcSensorOn("pccubesensormulti2_course_out_01")
        end
      end
      wait()
    end
  end)
end
sm51_DurabilityChekcer = L0_0
function L0_0(A0_32)
  local L1_33
  L1_33 = durability
  if L1_33 > 0 then
    L1_33 = check_point_sensor
    L1_33[A0_32:getName()] = true
  end
end
pccubesensor2_check_point_OnEnter = L0_0
function L0_0(A0_34)
  check_point_sensor[A0_34:getName()] = false
end
pccubesensor2_check_point_OnLeave = L0_0
function L0_0()
  local L1_35
  L1_35 = durability
  if L1_35 > 0 then
    check_course_out = true
  end
end
pccubesensormulti2_course_out_OnLeave = L0_0
function L0_0()
  Fn_sendEventComSb("InitializeArea")
  while Fn_sendEventComSb("isInitializedArea") == false do
    wait()
  end
end
sm51_InitializeArea = L0_0
