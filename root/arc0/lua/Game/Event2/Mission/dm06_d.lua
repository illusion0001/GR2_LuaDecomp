dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
FALL_START_SPEED = 0.6
FALL_NORMAL_SPEED = 0.48
FALL_SLOW_SPEED = 0.38
FALL_FAST_SPEED = 0.7
FALL_SPEED_CORRECT_RATE = 0.5
AUTO_HOMING_START_TIME = 30
AUTO_HOMING_MAX_TIME = 100
SIDE_RANDOM_MOVE_RATE = 0.008
SIDE_HOMING_MOVE_RATE = 0.008
dm06_bus_catch = false
dm06_bus_draft = false
loc_start = nil
loc_end = nil
loc_player_reset = nil
dm06_bus = nil
dm06_fall_vector = Vector(0, -FALL_START_SPEED, 0)
function Initialize()
  local L0_0
  L0_0 = mother2
  L0_0 = L0_0.sendEvent
  L0_0 = L0_0(L0_0, "getBackgroundElement2Handle", "maze")
  bg_root_area = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_02")
  bg_island_02 = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_03")
  bg_island_03 = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_04")
  bg_island_04 = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_05")
  bg_island_05 = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_06")
  bg_island_06 = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_07")
  bg_island_07 = L0_0
  L0_0 = bg_root_area
  L0_0 = L0_0.findSubArea
  L0_0 = L0_0(L0_0, "az5_a_08")
  bg_island_08 = L0_0
  L0_0 = bg_island_02
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_03
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_04
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_05
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_06
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_07
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_08
  L0_0 = L0_0.setPhasePos
  L0_0(L0_0, Vector(-300000, -300000, -300000))
  L0_0 = bg_island_02
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = bg_island_03
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = bg_island_04
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = bg_island_05
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = bg_island_06
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = bg_island_07
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = bg_island_08
  L0_0 = L0_0.setForceMove
  L0_0(L0_0)
  L0_0 = {
    {
      name = "bit_01",
      type = "bit02",
      node = "locator2_bit",
      use_gravity = false,
      use_fall = false,
      disable_collision = true
    }
  }
  Fn_setupNpc(L0_0)
  loc_start = findGameObject2("Node", "locator2_start")
  loc_end = findGameObject2("Node", "locator2_end")
  loc_player_reset = findGameObject2("Node", "locator2_player_reset")
  Fn_pcSensorOff("pcspheresensor2_bus_01")
  Fn_userCtrlGravityOff()
  dm06_bus = findGameObject2("Node", "bg2_bus")
end
function Ingame()
  Fn_userCtrlAllOff()
  Player:shiftGravity(Vector(0, 1, 0), 0)
  Fn_findNpcPuppet("bit_01"):setWorldTransform(findGameObject2("Node", "locator2_bit"):getWorldTransform())
  Fn_missionStart()
  Fn_kaiwaDemoView("dm06_00310k")
  RAC_disappearSPNpc("bit_01")
  dropBus()
  while dm06_bus_catch == false do
    wait()
  end
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_1, L1_2
end
function pcspheresensor2_bus_01_OnEnter()
  print("---------- pcspheresensor2_bus_01_OnEnter() --------")
  invokeTask(function()
    Fn_naviKill()
    dm06_bus_catch = true
  end)
  Fn_pcSensorOff("pcspheresensor2_bus_01")
end
function pccubesensor2_target_OnEnter()
  dm06_bus_draft = true
  print("pccubesensor2_target_OnEnter.." .. tostring(dm06_bus_draft))
end
function pccubesensor2_target_OnLeave()
  dm06_bus_draft = false
  print("pccubesensor2_target_OnLeave.." .. tostring(dm06_bus_draft))
end
function dropBus()
  local L0_3
  L0_3 = Fn_pcSensorOff
  L0_3("pccubesensor2_outrange")
  L0_3 = moveTowardLocation
  L0_3 = L0_3(dm06_bus, loc_start, 3)
  Sound:playSE("cro_272", 1, "")
  Fn_captionViewWait("dm06_03001")
  if Fn_lookAtObject(dm06_bus) ~= nil then
    Fn_lookAtObject(dm06_bus):abort()
  end
  pcSetGravityVector(Vector(0, -1, 0), 0.5)
  Fn_userCtrlOn()
  RAC_missionNaviCaption("dm06_03002", dm06_bus, "dm06_03000")
  Fn_pcSensorOn("pcspheresensor2_bus_01")
  if L0_3 ~= nil then
    L0_3:abort()
    L0_3 = nil
  end
  L0_3 = invokeTask(function()
    local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11, L8_12, L9_13
    L0_4 = 0
    L1_5 = 1
    L2_6 = Vector
    L3_7 = 0
    L4_8 = 0
    L5_9 = 0
    L2_6 = L2_6(L3_7, L4_8, L5_9)
    while true do
      L3_7 = dm06_bus_catch
      if L3_7 == false then
        L3_7 = Fn_getPlayerWorldPos
        L3_7 = L3_7()
        L4_8 = dm06_bus
        L5_9 = L4_8
        L4_8 = L4_8.getWorldPos
        L4_8 = L4_8(L5_9)
        L5_9 = Fn_getDistanceToPlayer
        L6_10 = dm06_bus
        L5_9 = L5_9(L6_10)
        L6_10 = Fn_getDistanceToPlayerXZ
        L7_11 = dm06_bus
        L6_10 = L6_10(L7_11)
        L7_11 = L0_4 / 30
        if L5_9 > 30 then
          L8_12 = Fn_naviSet
          L9_13 = dm06_bus
          L8_12(L9_13)
        elseif L5_9 < 25 then
          L8_12 = Fn_naviKill
          L8_12()
        end
        L8_12 = dm06_fall_vector
        L9_13 = L4_8.y
        if L9_13 > L3_7.y then
          L9_13 = FALL_FAST_SPEED
          L9_13 = -L9_13
          L8_12.y = L9_13
        else
          L9_13 = dm06_bus_draft
          if L9_13 == true then
            L9_13 = FALL_SLOW_SPEED
            L9_13 = -L9_13
            L8_12.y = L9_13
          else
            L9_13 = FALL_NORMAL_SPEED
            L9_13 = -L9_13
            L8_12.y = L9_13
          end
        end
        L9_13 = L4_8.y
        if not (L9_13 > L3_7.y) then
          L9_13 = AUTO_HOMING_START_TIME
        else
          if L7_11 > L9_13 or L6_10 > 30 then
            L9_13 = Vector
            L9_13 = L9_13(L3_7.x - L4_8.x, 0, L3_7.z - L4_8.z)
            L9_13 = NormalizeVector(L9_13) * 0
            L8_12.x = L9_13.x
            L8_12.z = L9_13.z
        end
        else
          L9_13 = AUTO_HOMING_START_TIME
          if L7_11 <= L9_13 then
            L9_13 = L1_5 * 5
            if L7_11 >= L9_13 then
              L9_13 = Vector
              L9_13 = L9_13(RandF(-30, 30), 0, RandF(-30, 30))
              L2_6 = L9_13
              L9_13 = NormalizeVector
              L9_13 = L9_13(L2_6)
              L2_6 = L9_13 * math.min(math.max(L2_6:Length() * SIDE_RANDOM_MOVE_RATE, 0.1), 1)
              L1_5 = L1_5 + 1
            end
            L9_13 = L8_12.x
            L9_13 = L9_13 * (2 - FALL_SPEED_CORRECT_RATE)
            L9_13 = L9_13 + L2_6.x * FALL_SPEED_CORRECT_RATE
            L9_13 = L9_13 * 0.5
            L8_12.x = L9_13
            L9_13 = L8_12.z
            L9_13 = L9_13 * (2 - FALL_SPEED_CORRECT_RATE)
            L9_13 = L9_13 + L2_6.z * FALL_SPEED_CORRECT_RATE
            L9_13 = L9_13 * 0.5
            L8_12.z = L9_13
          end
        end
        L9_13 = Vector
        L9_13 = L9_13(L8_12.x, (dm06_fall_vector.y * (2 - FALL_SPEED_CORRECT_RATE) + L8_12.y * FALL_SPEED_CORRECT_RATE) * 0.5, L8_12.z)
        dm06_fall_vector = L9_13
        L9_13 = moveTowardVector
        L9_13(dm06_bus, dm06_fall_vector)
        L0_4 = L0_4 + 1
        L9_13 = wait
        L9_13()
      end
    end
  end)
end
function moveTowardLocation(A0_14, A1_15, A2_16)
  return invokeTask(function()
    local L0_17, L1_18, L2_19, L3_20, L4_21, L5_22, L6_23
    L0_17 = A0_14
    if L0_17 ~= nil then
      L0_17 = A1_15
      if L0_17 ~= nil then
        L0_17 = A2_16
        if L0_17 ~= nil then
          L0_17 = A0_14
          L1_18 = L0_17
          L0_17 = L0_17.getWorldPos
          L0_17 = L0_17(L1_18)
          L1_18 = A0_14
          L2_19 = L1_18
          L1_18 = L1_18.getWorldRot
          L1_18 = L1_18(L2_19)
          L2_19 = A1_15
          L3_20 = L2_19
          L2_19 = L2_19.getWorldPos
          L2_19 = L2_19(L3_20)
          L3_20 = A1_15
          L4_21 = L3_20
          L3_20 = L3_20.getWorldRot
          L3_20 = L3_20(L4_21)
          L4_21 = A2_16
          L4_21 = L4_21 * 30
          L5_22 = get_move_pos
          L6_23 = L0_17
          L5_22 = L5_22(L6_23, L2_19, L4_21)
          L6_23 = 0
          while true do
            L6_23 = math.min(L6_23 + 1, L4_21)
            A0_14:setWorldTransform(A0_14:getWorldPos() + L5_22, SlerpQuat(L6_23 / L4_21, L1_18, L3_20))
            wait()
          end
        end
      end
    end
  end)
end
function pcSetGravityVector(A0_24, A1_25)
  if A0_24 ~= nil then
    if A1_25 ~= nil then
      Player:shiftGravity(A0_24, A1_25)
    else
      Player:shiftGravity(A0_24, 0)
    end
  elseif A1_25 ~= nil then
    Player:shiftGravity(Vector(0, -1, 0), A1_25)
  else
    Player:shiftGravity(Vector(0, -1, 0), 0)
  end
end
function moveTowardVector(A0_26, A1_27)
  local L2_28, L3_29
  if A0_26 ~= nil then
    L3_29 = A0_26
    L2_28 = A0_26.getWorldPos
    L2_28 = L2_28(L3_29)
    L3_29 = A0_26.getWorldRot
    L3_29 = L3_29(A0_26)
    A0_26:setWorldTransform(L2_28 + A1_27, L3_29)
    findGameObject2("Node", "locator2_target"):setWorldPos(L2_28 + A1_27)
  end
end
function pccubesensor2_outrange_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    Fn_captionView("dm06_03003")
  end)
end
