dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9
  L0_2 = Fn_findNpc
  L1_3 = "sm38_client"
  L0_2 = L0_2(L1_3)
  L1_3 = Fn_findNpc
  L2_4 = "escape_dog_02"
  L1_3 = L1_3(L2_4)
  L2_4 = Fn_loadNpcEventMotion
  L3_5 = "sm38_client"
  L4_6 = {
    L5_7,
    L6_8,
    L7_9
  }
  L5_7 = "chi01_stay_tired_00"
  L6_8 = "chi01_wavehand_00"
  L7_9 = "chi01_sad_00"
  L2_4(L3_5, L4_6)
  L2_4 = Fn_loadNpcEventMotion
  L3_5 = "escape_dog_02"
  L4_6 = {L5_7}
  L5_7 = "dog01_sit_00"
  L2_4(L3_5, L4_6)
  if L0_2 ~= nil and L1_3 ~= nil then
    L2_4 = {}
    L2_4.anim_walk_speed = 1
    L2_4.arrivedLength = 0.1
    L2_4.runLength = 100000
    L3_5 = {}
    L3_5.anim_walk_speed = 1
    L3_5.arrivedLength = 0.1
    L3_5.runLength = -1
    while true do
      L4_6 = Fn_get_distance
      L5_7 = Fn_findNpcPuppet
      L6_8 = "sm38_client"
      L5_7 = L5_7(L6_8)
      L6_8 = L5_7
      L5_7 = L5_7.getWorldPos
      L5_7 = L5_7(L6_8)
      L6_8 = Fn_findNpcPuppet
      L7_9 = "escape_dog_02"
      L6_8 = L6_8(L7_9)
      L7_9 = L6_8
      L6_8 = L6_8.getWorldPos
      L7_9 = L6_8(L7_9)
      L4_6 = L4_6(L5_7, L6_8, L7_9, L6_8(L7_9))
      if not (L4_6 < 1) then
        L5_7 = wait
        L5_7()
      end
    end
    L4_6 = {}
    L4_6.name = "escape_dog_02"
    L4_6.hdl = L1_3
    L4_6.locator_prefix = "locator2_dog_move_"
    L4_6.move_opt = L3_5
    L4_6.arrivedLength = 0.5
    L5_7 = {}
    L5_7.name = "sm38_client"
    L5_7.hdl = L0_2
    L5_7.locator_prefix = "locator2_girl_move_"
    L5_7.move_opt = L2_4
    L6_8 = {
      L7_9,
      "locator2_dog_move_03",
      "locator2_dog_move_04",
      "locator2_dog_move_05"
    }
    L7_9 = "locator2_dog_move_02"
    L7_9 = {
      "locator2_girl_move_02",
      "locator2_girl_move_03",
      "locator2_girl_move_04",
      "locator2_girl_move_05"
    }
    while L0_2:isMoveEnd() == false or L1_3:isMoveEnd() == false do
      wait()
    end
    while true do
      if Fn_isValidNpc("sm38_client") == false then
        Fn_disappearNpc("sm38_client")
        Fn_disappearNpc("escape_dog_02")
      else
        waitSeconds(1)
      end
    end
  else
  end
end
function Finalize()
  local L0_10, L1_11
end
