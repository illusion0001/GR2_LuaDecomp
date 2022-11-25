dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5
  L0_2 = Fn_findNpc
  L1_3 = "ep18_kaji"
  L0_2 = L0_2(L1_3)
  repeat
    L1_3 = wait
    L1_3()
    L2_4 = L0_2
    L1_3 = L0_2.isReadyNpc
    L1_3 = L1_3(L2_4)
  until L1_3
  L1_3 = Fn_findNpcPuppet
  L2_4 = "ep18_kaji"
  L1_3 = L1_3(L2_4)
  L2_4 = false
  L3_5 = {}
  L3_5.base = L1_3
  L3_5.target = Fn_getPlayer()
  L3_5.angle = 15
  L3_5.dist = 15
  L3_5.size = 0.1
  while HUD:faderAlpha() > 0 do
    wait()
  end
  while true do
    if Fn_findNpcPuppet("ep18_kaji") then
      if 15 >= Fn_getDistanceToPlayer(L1_3) and Fn_isEyeSight(L3_5) == false or Fn_getDistanceToPlayer(L1_3) <= 2 and Fn_isEyeSight(L3_5) == false then
        Fn_turnNpc("ep18_kaji")
      end
      if 15 >= Fn_getDistanceToPlayer(L1_3) and L2_4 == false then
        Fn_playMotionNpc("ep18_kaji", "greeting", true)
        L2_4 = true
      end
      if Fn_getDistanceToPlayer(L1_3) >= 20 and L2_4 == true then
        Fn_playMotionNpc("ep18_kaji", "call_00", true)
        L2_4 = false
      end
    end
    wait(10)
  end
end
function Finalize()
  local L0_6
  L0_6 = {"ep18_kaji"}
  Fn_finalizeNpcKill("ep18", L0_6)
end
