dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm32_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
dofile("/Game/Misc/pdemo.lua")
puppets = {}
_object = nil
_sdemo = nil
sm32_a_c01_pdemo = nil
_NPC_MOTION = {
  kaj_stay_00 = "kaj01_stay_00",
  kaj_stay_01 = "kaj01_stay_01"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = puppets
  L0_0.sm32_client = L1_1
  L0_0 = {L1_1}
  L1_1.name = "_man_01"
  L1_1.type = "kaj01"
  L1_1.node = "locator2_man_02"
  L1_1.attach = false
  L1_1.active = true
  L1_1(L2_2)
  for L4_4, L5_5 in L1_1(L2_2) do
    puppets[L5_5.name] = Fn_findNpcPuppet(L5_5.name)
    Fn_loadNpcEventMotion(L5_5.name, _NPC_MOTION)
  end
  for L4_4, L5_5 in L1_1(L2_2) do
    Fn_disableKaiwaDemo(L5_5)
  end
  _sdemo = L1_1
  L4_4 = "Node"
  L5_5 = "locator2_woodbox"
  L4_4 = {}
  L4_4.camera = true
  L4_4.scene_param = false
  sm32_a_c01_pdemo = L1_1
  L1_1(L2_2, L3_3)
end
function Ingame()
  local L0_6, L1_7, L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14
  L0_6 = CreateWoodbox
  L1_7 = "locator2_woodbox"
  L0_6 = L0_6(L1_7)
  L2_8 = L0_6
  L1_7 = L0_6.setActive
  L1_7(L2_8, L3_9)
  L1_7 = CreateWoodbox
  L2_8 = "locator2_woodbox"
  L1_7 = L1_7(L2_8)
  _object = L1_7
  L1_7 = Fn_userCtrlOff
  L1_7()
  L1_7 = Fn_playLoopMotionInsert
  L2_8 = "_man_01"
  L6_12 = 10
  L1_7(L2_8, L3_9, L4_10, L5_11, L6_12)
  L1_7 = _sdemo
  L2_8 = L1_7
  L1_7 = L1_7.reset
  L1_7(L2_8)
  L1_7 = _sdemo
  L2_8 = L1_7
  L1_7 = L1_7.set
  L6_12 = Vector
  L7_13 = 0
  L8_14 = 0
  L8_14 = L6_12(L7_13, L8_14, 0)
  L1_7(L2_8, L3_9, L4_10, L5_11, L6_12, L7_13, L8_14, L6_12(L7_13, L8_14, 0))
  L1_7 = _sdemo
  L2_8 = L1_7
  L1_7 = L1_7.play
  L1_7(L2_8)
  while true do
    L1_7 = _sdemo
    L2_8 = L1_7
    L1_7 = L1_7.isPlay
    L1_7 = L1_7(L2_8)
    if L1_7 then
      L1_7 = wait
      L1_7()
    end
  end
  L1_7 = Fn_missionStart
  L1_7()
  L1_7 = Fn_kaiwaDemoView
  L2_8 = "sm32_00400k"
  L1_7(L2_8)
  L1_7 = waitSeconds
  L2_8 = 0.5
  L1_7(L2_8)
  L1_7 = _sdemo
  L2_8 = L1_7
  L1_7 = L1_7.play
  L5_11.pos = "locator2_aim_04"
  L5_11.time = 1
  L5_11.hashfunc = "EaseInOut"
  L1_7(L2_8, L3_9, L4_10)
  while true do
    L1_7 = _sdemo
    L2_8 = L1_7
    L1_7 = L1_7.isPlay
    L1_7 = L1_7(L2_8)
    if L1_7 then
      L1_7 = wait
      L1_7()
    end
  end
  L1_7 = waitSeconds
  L2_8 = 0.5
  L1_7(L2_8)
  L1_7 = _object
  L2_8 = L1_7
  L1_7 = L1_7.getWorldPos
  L1_7 = L1_7(L2_8)
  L2_8 = _object
  L2_8 = L2_8.getWorldRot
  L2_8 = L2_8(L3_9)
  L3_9(L4_10)
  for L6_12 = 1, 10 do
    L7_13 = Vector
    L8_14 = RandF
    L8_14 = L8_14(-0.05, 0.05)
    L7_13 = L7_13(L8_14, RandF(0, 0.02), RandF(-0.05, 0.05))
    L7_13 = L1_7 + L7_13
    L8_14 = Fn_add_rot
    L8_14 = L8_14(L2_8, RandF(-3, 3), RandF(-5, 5), RandF(-3, 3))
    _object:appendCurvePoint2(L7_13, L8_14, RandF(0.05, 0.15), "Linear", true)
  end
  L6_12 = L2_8
  L7_13 = RandF
  L8_14 = 0.05
  L7_13 = L7_13(L8_14, 0.15)
  L8_14 = "Linear"
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14, true)
  repeat
    L3_9()
  until L3_9 == false
  L3_9(L4_10)
  L3_9(L4_10)
  L3_9(L4_10, L5_11)
  L6_12 = 0
  L7_13 = 10000
  L8_14 = 0
  L8_14 = L5_11(L6_12, L7_13, L8_14)
  L3_9(L4_10, L5_11, L6_12, L7_13, L8_14, L5_11(L6_12, L7_13, L8_14))
  L3_9(L4_10)
  L3_9(L4_10, L5_11)
  if L3_9 ~= nil then
    L3_9(L4_10)
    while true do
      if not L4_10 then
        if L3_9 == 60 then
          L6_12 = true
          L4_10(L5_11, L6_12)
          L7_13 = L0_6
          L6_12 = L0_6.getWorldPos
          L6_12 = L6_12(L7_13)
          L7_13 = Vector
          L8_14 = 0
          L7_13 = L7_13(L8_14, 0, 10)
          L6_12 = L6_12 + L7_13
          L7_13 = 2
          L4_10(L5_11, L6_12, L7_13)
        end
        L4_10()
      end
    end
  end
  L3_9()
  L3_9()
  L3_9()
  L3_9()
  L3_9()
end
function Finalize()
  sm32_a_c01_pdemo:stop(0)
  sm32_a_c01_pdemo:try_term()
  sm32_a_c01_pdemo = nil
  Mob:restrictStops_sm32_00(false)
end
