dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/sm03_common.lua")
function Initialize()
  local L0_0
  L0_0 = {}
  L0_0.label01 = "chi01_magichand_00"
  L0_0.label02 = "chi01_sq_magichand_00"
  Fn_loadNpcEventMotion("hum_03", L0_0)
  Fn_loadNpcEventMotion("hum_04", L0_0)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10
  L0_1 = Fn_findNpcPuppet
  L1_2 = "sm03_client"
  L0_1 = L0_1(L1_2)
  L1_2 = {}
  for L5_6 = 1, 5 do
    L1_2[L5_6] = L6_7
  end
  L5_6 = false
  L6_7.isRandom = true
  L6_7.isRepeat = true
  L6_7.animBlendDuration = 0.5
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L5_6 = false
  L6_7.isRandom = true
  L6_7.isRepeat = true
  L6_7.animBlendDuration = 0.5
  L2_3(L3_4, L4_5, L5_6, L6_7)
  while true do
    if L2_3 == false then
      L5_6 = "GimmickBg"
      if L3_4 ~= nil then
        L5_6 = L3_4
        L4_5(L5_6)
      end
      L5_6 = L2_3
      if L4_5 ~= nil then
        L5_6 = L4_5.kill
        L5_6(L6_7)
      end
      L5_6 = L2_3.findGameObject2
      L5_6 = L5_6(L6_7, L7_8, L8_9)
      if L5_6 ~= nil then
        L6_7(L7_8)
      end
      for L9_10, _FORV_10_ in L6_7(L7_8) do
        Fn_disappearNpc("hum_0" .. L9_10)
      end
      L6_7(L7_8)
      break
    end
    L2_3(L3_4)
  end
end
function Finalize()
  local L0_11, L1_12
end
