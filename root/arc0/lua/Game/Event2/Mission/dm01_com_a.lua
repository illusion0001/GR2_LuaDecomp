dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
POLICE_CAPTION_TBL = {
  A = "dm01_09007",
  B = "dm01_09008",
  C = "dm01_09009",
  D = "dm01_09010",
  E = "dm01_09011",
  F = "dm01_09012",
  G = "dm01_09013",
  H = "dm01_09014",
  I = "dm01_09015",
  J = "dm01_09016",
  K = "dm01_09017",
  L = "dm01_09018"
}
_ark_wing_01_hdl = nil
_ark_wing_02_hdl = nil
_ark_wing_03_hdl = nil
_ark_wing_04_hdl = nil
_ark_head_hdl = nil
_is_tutorial = nil
function Initialize()
  local L0_0, L1_1
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "bg2_ark_01")
  L1_1 = L0_0
  L0_0 = L0_0.setVisibleBlockEnable
  L0_0(L1_1, false)
  L0_0 = findGameObject2
  L1_1 = "Node"
  L0_0 = L0_0(L1_1, "bg2_ark_01")
  _ark_body_hdl = L0_0
  L0_0 = "g1_ark_pd_01_wing"
  L1_1 = "g1_ark_pd_01_head"
  _ark_wing_01_hdl = createGameObject2("GimmickBg")
  _ark_wing_01_hdl:setName("ark_wing_01")
  _ark_wing_01_hdl:setDrawModelName(L0_0)
  _ark_wing_01_hdl:setCollisionName(L0_0)
  _ark_wing_01_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_01_hdl)
  _ark_wing_01_hdl:setVisibleBlockEnable(false)
  _ark_wing_02_hdl = createGameObject2("GimmickBg")
  _ark_wing_02_hdl:setName("ark_wing_02")
  _ark_wing_02_hdl:setDrawModelName(L0_0)
  _ark_wing_02_hdl:setCollisionName(L0_0)
  _ark_wing_02_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_02_hdl)
  _ark_wing_02_hdl:setVisibleBlockEnable(false)
  _ark_wing_03_hdl = createGameObject2("GimmickBg")
  _ark_wing_03_hdl:setName("ark_wing_03")
  _ark_wing_03_hdl:setDrawModelName(L0_0)
  _ark_wing_03_hdl:setCollisionName(L0_0)
  _ark_wing_03_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_03_hdl)
  _ark_wing_03_hdl:setVisibleBlockEnable(false)
  _ark_wing_04_hdl = createGameObject2("GimmickBg")
  _ark_wing_04_hdl:setName("ark_wing_04")
  _ark_wing_04_hdl:setDrawModelName(L0_0)
  _ark_wing_04_hdl:setCollisionName(L0_0)
  _ark_wing_04_hdl:setAttributeName(L0_0)
  _ark_body_hdl:appendChild(_ark_wing_04_hdl)
  _ark_wing_04_hdl:setVisibleBlockEnable(false)
  _ark_head_hdl = createGameObject2("GimmickBg")
  _ark_head_hdl:setName("ark_head")
  _ark_head_hdl:setDrawModelName(L1_1)
  _ark_head_hdl:setCollisionName(L1_1)
  _ark_head_hdl:setAttributeName(L1_1)
  _ark_body_hdl:appendChild(_ark_head_hdl)
  _ark_head_hdl:setVisibleBlockEnable(false)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12
  L0_2 = 1
  while true do
    L1_3 = findGameObject2
    L2_4 = "GimmickBg"
    L3_5 = "bg2_machine_"
    L4_6 = string
    L4_6 = L4_6.format
    L5_7 = "%02d"
    L6_8 = L0_2
    L4_6 = L4_6(L5_7, L6_8)
    L3_5 = L3_5 .. L4_6
    L1_3 = L1_3(L2_4, L3_5)
    if L1_3 ~= nil then
      L3_5 = L1_3
      L2_4 = L1_3.setVisibleBlockEnable
      L4_6 = false
      L2_4(L3_5, L4_6)
      L3_5 = L1_3
      L2_4 = L1_3.setIgnoreGrab
      L4_6 = true
      L2_4(L3_5, L4_6)
      L3_5 = L1_3
      L2_4 = L1_3.setMoveThreshold
      L4_6 = 0
      L2_4(L3_5, L4_6)
      L0_2 = L0_2 + 1
    end
  end
  L1_3 = _ark_body_hdl
  L2_4 = L1_3
  L1_3 = L1_3.getNodePosRot
  L3_5 = "move_wing_01"
  L4_6 = true
  L2_4 = L1_3(L2_4, L3_5, L4_6)
  L3_5 = _ark_body_hdl
  L4_6 = L3_5
  L3_5 = L3_5.getNodePosRot
  L5_7 = "move_wing_02"
  L6_8 = true
  L4_6 = L3_5(L4_6, L5_7, L6_8)
  L5_7 = _ark_body_hdl
  L6_8 = L5_7
  L5_7 = L5_7.getNodePosRot
  L7_9 = "move_wing_03"
  L8_10 = true
  L6_8 = L5_7(L6_8, L7_9, L8_10)
  L7_9 = _ark_body_hdl
  L8_10 = L7_9
  L7_9 = L7_9.getNodePosRot
  L9_11 = "move_wing_04"
  L10_12 = true
  L8_10 = L7_9(L8_10, L9_11, L10_12)
  L9_11 = _ark_body_hdl
  L10_12 = L9_11
  L9_11 = L9_11.getNodePosRot
  L10_12 = L9_11(L10_12, "move_head", true)
  _ark_wing_01_hdl:setTransform(L1_3, L2_4)
  _ark_wing_02_hdl:setTransform(L3_5, L4_6)
  _ark_wing_03_hdl:setTransform(L5_7, L6_8)
  _ark_wing_04_hdl:setTransform(L7_9, L8_10)
  _ark_head_hdl:setTransform(L9_11, L10_12)
end
function Finalize()
  _ark_wing_01_hdl:try_term()
  _ark_wing_01_hdl = nil
  _ark_wing_02_hdl:try_term()
  _ark_wing_02_hdl = nil
  _ark_wing_03_hdl:try_term()
  _ark_wing_03_hdl = nil
  _ark_wing_04_hdl:try_term()
  _ark_wing_04_hdl = nil
  _ark_head_hdl:try_term()
  _ark_head_hdl = nil
end
function findMachine01()
  return findGameObject2("GimmickBg", "bg2_machine_01")
end
function setTutorial(A0_13)
  _is_tutorial = A0_13
  if A0_13 == nil then
    Fn_tutorialCaptionKill()
  end
end
function policeGestureAction(A0_14, A1_15)
  local L2_16, L3_17
  function L2_16()
    Fn_userCtrlOff()
    Fn_turnNpc(A0_14)
    Fn_captionView(A1_15)
    A0_14:resetSightParam()
    Fn_userCtrlOn()
    invokeTask(function()
      waitSeconds(3)
      if _is_tutorial ~= nil then
        Fn_tutorialCaption(_is_tutorial)
      end
    end)
  end
  L3_17 = {}
  L3_17.RL = {id = "dm01_09001", func = L2_16}
  Fn_gestureAction(L3_17)
end
function pccubesensor2_police_A_OnEnter(A0_18)
  policeGestureAction(A0_18:getParent(), POLICE_CAPTION_TBL.A)
end
function pccubesensor2_police_B_OnEnter(A0_19)
  policeGestureAction(A0_19:getParent(), POLICE_CAPTION_TBL.B)
end
function pccubesensor2_police_C_OnEnter(A0_20)
  policeGestureAction(A0_20:getParent(), POLICE_CAPTION_TBL.C)
end
function pccubesensor2_police_D_OnEnter(A0_21)
  policeGestureAction(A0_21:getParent(), POLICE_CAPTION_TBL.D)
end
function pccubesensor2_police_E_OnEnter(A0_22)
  policeGestureAction(A0_22:getParent(), POLICE_CAPTION_TBL.E)
end
function pccubesensor2_police_F_OnEnter(A0_23)
  policeGestureAction(A0_23:getParent(), POLICE_CAPTION_TBL.F)
end
function pccubesensor2_police_G_OnEnter(A0_24)
  policeGestureAction(A0_24:getParent(), POLICE_CAPTION_TBL.G)
end
function pccubesensor2_police_H_OnEnter(A0_25)
  policeGestureAction(A0_25:getParent(), POLICE_CAPTION_TBL.H)
end
function pccubesensor2_police_I_OnEnter(A0_26)
  policeGestureAction(A0_26:getParent(), POLICE_CAPTION_TBL.I)
end
function pccubesensor2_police_J_OnEnter(A0_27)
  policeGestureAction(A0_27:getParent(), POLICE_CAPTION_TBL.J)
end
function pccubesensor2_police_K_OnEnter(A0_28)
  policeGestureAction(A0_28:getParent(), POLICE_CAPTION_TBL.K)
end
function pccubesensor2_police_L_OnEnter(A0_29)
  policeGestureAction(A0_29:getParent(), POLICE_CAPTION_TBL.L)
end
function pccubesensor2_police_OnLeave()
  Fn_gestureActionCancel()
end
