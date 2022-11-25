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
function spGemCreate()
  local L0_2, L1_3, L2_4
  L0_2 = createGameObject2
  L1_3 = "Gem"
  L0_2 = L0_2(L1_3)
  L2_4 = L0_2
  L1_3 = L0_2.setGemModelNo
  L1_3(L2_4, 6)
  L1_3 = math
  L1_3 = L1_3.random
  L2_4 = 1
  L1_3 = L1_3(L2_4, 4)
  L2_4 = print
  L2_4(L1_3)
  L2_4 = 0
  if L1_3 == 1 then
    L2_4 = Fn_getPlayerWorldPos() + Vector(3, 1, 0)
  elseif L1_3 == 2 then
    L2_4 = Fn_getPlayerWorldPos() + Vector(-3, 1, 0)
  elseif L1_3 == 3 then
    L2_4 = Fn_getPlayerWorldPos() + Vector(0, 1, 3)
  elseif L1_3 == 4 then
    L2_4 = Fn_getPlayerWorldPos() + Vector(0, 1, -3)
  end
  L0_2:setWorldPos(L2_4)
  L0_2:setForceMove()
  L0_2:setVisible(true)
  L0_2:try_init()
  L0_2:waitForReadyAsync(function()
    L0_2:try_start()
  end)
end
function is_check_eye_node(A0_5, A1_6, A2_7)
  local L3_8, L4_9, L5_10, L6_11
  if A1_6 == nil then
    A1_6 = 40
  end
  if A2_7 == nil then
    A2_7 = 0.1
  end
  L3_8 = false
  L4_9 = Fn_isInSightTarget
  L5_10 = A0_5
  L6_11 = 0.7
  L4_9 = L4_9(L5_10, L6_11)
  if L4_9 then
    L4_9 = Fn_getPcPosRot
    L5_10 = L4_9()
    L6_11 = L4_9.y
    L6_11 = L6_11 + 1.5
    L4_9.y = L6_11
    L6_11 = Query
    L6_11 = L6_11.setEyeSightTransform
    L6_11(L6_11, L4_9, 0)
    L6_11 = Query
    L6_11 = L6_11.setEyeSightAngle
    L6_11(L6_11, Deg2Rad(360))
    L6_11 = Query
    L6_11 = L6_11.setEyeSightRange
    L6_11(L6_11, A1_6)
    L6_11 = A0_5.getWorldPos
    L6_11 = L6_11(A0_5)
    if Query:checkEyeSightSphere(L6_11, A2_7) and Query:raycastEyeSight(L6_11) == nil then
      L3_8 = true
    end
  end
  return L3_8
end
function pcsensor2_nextPhase_OnEnter()
  nextPhase()
end
function pcsensor2_lively_attribute_OnEnter()
  nextPhase()
end
function pcsensor2_lively_attribute_OnLeave()
  local L0_12, L1_13
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
    local L0_14, L1_15, L2_16, L3_17, L4_18
    L0_14 = GameDatabase
    L0_14 = L0_14.get
    L0_14 = L0_14(L1_15, L2_16)
    if not L0_14 then
      L0_14 = Fn_userCtrlAllOff
      L0_14()
      L0_14 = {}
      L1_15(L2_16)
      for L4_18 = 1, enmbra_max do
        L0_14[L4_18] = findGameObject2("EnemyBrain", string.format("enemy_%02d", L4_18))
        if L0_14[L4_18] ~= nil then
          L0_14[L4_18]:setEnableTarget(false)
        end
      end
      if L1_15 then
        L1_15(L2_16)
      end
      L1_15()
      L1_15()
      L1_15()
      while true do
        if not L1_15 then
          L1_15()
        end
      end
      L1_15(L2_16)
      L1_15()
      L1_15(L2_16)
      for L4_18 = 1, enmbra_max do
        if L0_14[L4_18] ~= nil then
          L0_14[L4_18]:setEnableTarget(true)
        end
      end
      if L1_15 then
        L1_15(L2_16)
      end
      enmgen = nil
    else
      L0_14 = print
      L0_14(L1_15)
    end
  end)
end
