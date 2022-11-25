dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm20_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13
  L0_2 = Fn_findNpcPuppet
  L1_3 = "sm20_dog_01"
  L0_2 = L0_2(L1_3)
  L1_3 = Fn_findNpcPuppet
  L2_4 = "girl01"
  L1_3 = L1_3(L2_4)
  L2_4 = Fn_findNpcPuppet
  L3_5 = "sm20_client"
  L2_4 = L2_4(L3_5)
  L3_5 = createGameObject2
  L4_6 = "Node"
  L3_5 = L3_5(L4_6)
  L4_6 = createGameObject2
  L5_7 = "Node"
  L4_6 = L4_6(L5_7)
  L6_8 = L3_5
  L5_7 = L3_5.setName
  L7_9 = "client_face_node"
  L5_7(L6_8, L7_9)
  L6_8 = L2_4
  L5_7 = L2_4.appendChild
  L7_9 = L3_5
  L5_7(L6_8, L7_9)
  L6_8 = L3_5
  L5_7 = L3_5.setPos
  L7_9 = Vector
  L8_10 = 0
  L9_11 = 1.4
  L10_12 = 0
  L11_13 = L7_9(L8_10, L9_11, L10_12)
  L5_7(L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L7_9(L8_10, L9_11, L10_12))
  L6_8 = L3_5
  L5_7 = L3_5.setForceMove
  L5_7(L6_8)
  L6_8 = L3_5
  L5_7 = L3_5.try_init
  L5_7(L6_8)
  L6_8 = L3_5
  L5_7 = L3_5.waitForReady
  L5_7(L6_8)
  L6_8 = L3_5
  L5_7 = L3_5.try_start
  L5_7(L6_8)
  L6_8 = L4_6
  L5_7 = L4_6.setName
  L7_9 = "girl_face_node"
  L5_7(L6_8, L7_9)
  if L1_3 ~= nil then
    L6_8 = L1_3
    L5_7 = L1_3.appendChild
    L7_9 = L4_6
    L5_7(L6_8, L7_9)
  end
  L6_8 = L4_6
  L5_7 = L4_6.setPos
  L7_9 = Vector
  L8_10 = 0
  L9_11 = 1
  L10_12 = 0
  L11_13 = L7_9(L8_10, L9_11, L10_12)
  L5_7(L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L7_9(L8_10, L9_11, L10_12))
  L6_8 = L4_6
  L5_7 = L4_6.setForceMove
  L5_7(L6_8)
  L6_8 = L4_6
  L5_7 = L4_6.try_init
  L5_7(L6_8)
  L6_8 = L4_6
  L5_7 = L4_6.waitForReady
  L5_7(L6_8)
  L6_8 = L4_6
  L5_7 = L4_6.try_start
  L5_7(L6_8)
  L5_7 = start_game_obj
  L5_7()
  L5_7 = {}
  L5_7.degree_h = 90
  L5_7.degree_v = 90
  L5_7.in_length = 100
  L5_7.out_length = 100
  L5_7.target = L4_6
  L5_7.valid = true
  L5_7.watchTarget = true
  L6_8 = {}
  L6_8.degree_h = 90
  L6_8.degree_v = 90
  L6_8.in_length = 100
  L6_8.out_length = 100
  L6_8.target = L3_5
  L6_8.valid = true
  L6_8.watchTarget = true
  L7_9 = Fn_findNpc
  L8_10 = "sm20_client"
  L7_9 = L7_9(L8_10)
  L8_10 = Fn_findNpc
  L9_11 = "girl01"
  L8_10 = L8_10(L9_11)
  L10_12 = L7_9
  L9_11 = L7_9.setSightParam
  L11_13 = L5_7
  L9_11(L10_12, L11_13)
  if L8_10 ~= nil then
    L10_12 = L8_10
    L9_11 = L8_10.setSightParam
    L11_13 = L6_8
    L9_11(L10_12, L11_13)
  end
  L9_11 = Fn_playMotionNpc
  L10_12 = "sm20_client"
  L11_13 = {"talk_00"}
  L9_11 = L9_11(L10_12, L11_13, false, {isRandom = true, isRepeat = true})
  L10_12 = Fn_repeatPlayMotion
  L11_13 = "girl01"
  L10_12 = L10_12(L11_13, "talk_00", {
    "talk_laugh_00"
  }, 10, 20)
  L11_13 = barkStart
  L11_13()
  L11_13 = waitSeconds
  L11_13(10)
  L11_13 = barkEnd
  L11_13()
  L11_13 = Fn_playMotionNpc
  L11_13("sm20_dog_01", "sit_in", true)
  L11_13 = Fn_playMotionNpc
  L11_13 = L11_13("sm20_dog_01", {"sit"}, false, {isRandom = true, isRepeat = true})
  while true do
    if Fn_isValidNpc("sm20_client", 40) == false then
      L9_11 = Mv_safeTaskAbort(L9_11)
      L10_12 = Mv_safeTaskAbort(L10_12)
      L11_13 = Mv_safeTaskAbort(L11_13)
      Fn_disappearNpc("sm20_dog_01")
      Fn_disappearNpc("girl01")
      Fn_disappearNpc("sm20_client")
      break
    end
    waitSeconds(1)
  end
end
function Finalize()
  local L0_14, L1_15
end
