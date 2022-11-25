dofile("/Game/Event2/Common/EnemyCommon.lua")
_next_phase = false
enmbra_max = 30
return_flag = false
function nextPhase()
  local L0_0, L1_1
  _next_phase = true
end
function waitPhase()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function is_check_eye_node(A0_2, A1_3, A2_4)
  local L3_5, L4_6, L5_7, L6_8
  if A1_3 == nil then
    A1_3 = 40
  end
  if A2_4 == nil then
    A2_4 = 0.1
  end
  L3_5 = false
  L4_6 = Fn_isInSightTarget
  L5_7 = A0_2
  L6_8 = 0.7
  L4_6 = L4_6(L5_7, L6_8)
  if L4_6 then
    L4_6 = Fn_getPcPosRot
    L5_7 = L4_6()
    L6_8 = L4_6.y
    L6_8 = L6_8 + 1.5
    L4_6.y = L6_8
    L6_8 = Query
    L6_8 = L6_8.setEyeSightTransform
    L6_8(L6_8, L4_6, 0)
    L6_8 = Query
    L6_8 = L6_8.setEyeSightAngle
    L6_8(L6_8, Deg2Rad(360))
    L6_8 = Query
    L6_8 = L6_8.setEyeSightRange
    L6_8(L6_8, A1_3)
    L6_8 = A0_2.getWorldPos
    L6_8 = L6_8(A0_2)
    if Query:checkEyeSightSphere(L6_8, A2_4) and Query:raycastEyeSight(L6_8) == nil then
      L3_5 = true
    end
  end
  return L3_5
end
function pcsensor2_nextPhase_OnEnter()
  nextPhase()
end
function pccubesensor2_caution_litho_OnLeave()
  print("pccubesensor2_caution_litho_OnLeave")
  invokeTask(function()
    if return_flag == false then
      return_flag = true
      Fn_naviSet(findGameObject2("Node", "locator2_navi_01"))
    end
    if Player:getAbility(Player.kAbility_GravityShift) then
      Fn_coercionGravityShift()
    end
    if not Fn_isCaptionView("ic_warning_00100") then
      Fn_captionViewLock("ic_warning_00100")
    end
  end)
end
function pccubesensor2_catwarp_litho_OnLeave()
  print("pccubesensor2_catwarp_litho_OnLeave")
  invokeTask(function()
    local L0_9, L1_10, L2_11, L3_12, L4_13
    L0_9 = GameDatabase
    L0_9 = L0_9.get
    L0_9 = L0_9(L1_10, L2_11)
    if not L0_9 then
      L0_9 = Fn_userCtrlAllOff
      L0_9()
      L0_9 = {}
      for L4_13 = 1, enmbra_max do
        L0_9[L4_13] = findGameObject2("EnemyBrain", string.format("enemy_%02d", L4_13))
        if L0_9[L4_13] ~= nil then
          L0_9[L4_13]:setEnableTarget(false)
        end
      end
      L1_10()
      L1_10()
      L4_13 = 0.1
      L1_10(L2_11, L3_12, L4_13)
      L1_10(L2_11)
      L1_10()
      while true do
        if not L1_10 then
          L1_10()
        end
      end
      L1_10(L2_11)
      L1_10()
      for L4_13 = 1, enmbra_max do
        if L0_9[L4_13] ~= nil then
          L0_9[L4_13]:setEnableTarget(true)
        end
      end
      enmgen = nil
    else
      L0_9 = print
      L0_9(L1_10)
    end
  end)
end
