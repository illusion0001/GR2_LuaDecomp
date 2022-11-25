dofile("/Game/Event2/Mission/mine99_base.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_event_file_name = "floor_026"
_floor_num = 26
_boss_battle_floor = true
_demo01_cut01 = nil
_demo01_cut02 = nil
function InitializeBody()
  _demo01_cut01 = SDemo.create("Mine99_027_Demo01")
  _demo01_cut02 = SDemo.create("Mine99_027_Demo02")
  createPiGate()
  createWindmill()
  createBarn()
  Fn_userCtrlAllOff()
end
function IngameBody()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9
  L0_0 = Fn_getMine99FloorClear
  L0_0 = L0_0()
  if L0_0 then
    L0_0 = Fn_setBgmPoint
    L1_1 = "event"
    L2_2 = "non_boss"
    L0_0(L1_1, L2_2)
    L0_0 = Fn_missionStart
    function L1_1()
      Fn_userCtrlOn()
    end
    L0_0(L1_1)
    L0_0 = Fn_showMineName
    L0_0()
    L0_0 = print
    L1_1 = "\227\129\138\233\161\140\227\129\175\227\130\175\227\131\170\227\130\162\230\184\136\227\129\167\227\129\153"
    L0_0(L1_1)
  else
    L0_0 = Fn_spawnSuppotCrow
    L1_1 = true
    L2_2 = nil
    L3_3 = "locator2_crow_start_pos"
    L4_4 = nil
    L5_5 = true
    L0_0 = L0_0(L1_1, L2_2, L3_3, L4_4, L5_5)
    L2_2 = L0_0
    L1_1 = L0_0.getBrain
    L1_1 = L1_1(L2_2)
    L3_3 = L1_1
    L2_2 = L1_1.getDetectThreatDistance
    L2_2 = L2_2(L3_3)
    L4_4 = L1_1
    L3_3 = L1_1.setDetectThreatDistance
    L5_5 = 0
    L3_3(L4_4, L5_5)
    L4_4 = L1_1
    L3_3 = L1_1.setIdling
    L5_5 = true
    L3_3(L4_4, L5_5)
    L4_4 = L0_0
    L3_3 = L0_0.setVisible
    L5_5 = true
    L3_3(L4_4, L5_5)
    L4_4 = L1_1
    L3_3 = L1_1.setEnemyNavi
    L5_5 = false
    L3_3(L4_4, L5_5)
    L4_4 = L1_1
    L3_3 = L1_1.setLockonNavi
    L5_5 = false
    L3_3(L4_4, L5_5)
    L3_3 = HUD
    L4_4 = L3_3
    L3_3 = L3_3.createBossHpGauge
    L5_5 = {}
    L5_5.obj = L0_0
    L5_5.hp = 1
    L3_3 = L3_3(L4_4, L5_5)
    L5_5 = L3_3
    L4_4 = L3_3.setActive
    L6_6 = false
    L4_4(L5_5, L6_6)
    repeat
      L4_4 = wait
      L4_4()
      L5_5 = L0_0
      L4_4 = L0_0.isRunning
      L4_4 = L4_4(L5_5)
    until L4_4
    L4_4 = _demo01_cut01
    L5_5 = L4_4
    L4_4 = L4_4.reset
    L4_4(L5_5)
    L4_4 = _demo01_cut01
    L5_5 = L4_4
    L4_4 = L4_4.set
    L6_6 = "locator2_cam_eye_01_01"
    L7_7 = "locator2_cam_at_01_01"
    L8_8 = true
    L4_4(L5_5, L6_6, L7_7, L8_8)
    function L4_4()
      Fn_setBgmPoint("event", "boss_battle")
      _demo01_cut01:play({
        {
          pos = "locator2_cam_eye_01_02",
          time = 4
        }
      }, {
        {
          pos = "locator2_cam_at_01_02",
          time = 4
        }
      })
      invokeTask(function()
        waitSeconds(1.8)
        Camera:shake3D(0.85, 0.25, 0.95, findGameObject2("Node", "locator2_crow_randing_pos"):getWorldPos(), 20)
      end)
      invokeTask(function()
        waitSeconds(1)
        Fn_showMineName()
        waitSeconds(3)
        Fn_captionViewWait("ic_pi_mine99_26_001")
        waitSeconds(1)
        Fn_captionView("ic_pi_mine99_26_002")
        waitSeconds(3.5)
        Fn_captionView("ic_pi_monument_00260", 4)
        Fn_missionView("ic_pi_monument_obj_00260", 0, nil, true)
        Sound:playSE("skb_003", 1)
      end)
    end
    L5_5 = Fn_missionStart
    L6_6 = L4_4
    L5_5(L6_6)
    L6_6 = L1_1
    L5_5 = L1_1.clearMovePoint
    L5_5(L6_6)
    L5_5 = 40
    L6_6 = {
      L7_7,
      L8_8,
      L9_9,
      {
        node_pos = findGameObject2("Node", "locator2_crow_randing_pos"),
        action = Supporter.MovePoint.Idle,
        duration = 1
      }
    }
    L7_7 = {}
    L8_8 = findGameObject2
    L9_9 = "Node"
    L8_8 = L8_8(L9_9, "locator2_crow_start_pos")
    L7_7.node_pos = L8_8
    L8_8 = Supporter
    L8_8 = L8_8.MovePoint
    L8_8 = L8_8.Air
    L7_7.action = L8_8
    L7_7.vel = L5_5
    L8_8 = {}
    L9_9 = findGameObject2
    L9_9 = L9_9("Node", "locator2_crow_move_01")
    L8_8.node_pos = L9_9
    L9_9 = Supporter
    L9_9 = L9_9.MovePoint
    L9_9 = L9_9.Air
    L8_8.action = L9_9
    L8_8.vel = L5_5
    L9_9 = {}
    L9_9.node_pos = findGameObject2("Node", "locator2_crow_randing_pos")
    L9_9.action = Supporter.MovePoint.Alight
    L9_9.vel = L5_5
    L8_8 = L1_1
    L7_7 = L1_1.setMovePoints
    L9_9 = L6_6
    L7_7(L8_8, L9_9)
    L8_8 = L1_1
    L7_7 = L1_1.startMovePoint
    L7_7(L8_8)
    repeat
      L7_7 = wait
      L7_7()
      L8_8 = L1_1
      L7_7 = L1_1.isMovePointEnd
      L7_7 = L7_7(L8_8)
    until L7_7
    L8_8 = L1_1
    L7_7 = L1_1.clearMovePoint
    L7_7(L8_8)
    L7_7 = waitSeconds
    L8_8 = 3
    L7_7(L8_8)
    while true do
      L7_7 = _demo01_cut01
      L8_8 = L7_7
      L7_7 = L7_7.isPlay
      L7_7 = L7_7(L8_8)
      if L7_7 then
        L7_7 = wait
        L7_7()
      end
    end
    L7_7 = _demo01_cut01
    L8_8 = L7_7
    L7_7 = L7_7.stop
    L9_9 = 4.5
    L7_7(L8_8, L9_9)
    L7_7 = waitSeconds
    L8_8 = 4.83
    L7_7(L8_8)
    L8_8 = L1_1
    L7_7 = L1_1.setDetectThreatDistance
    L9_9 = L2_2
    L7_7(L8_8, L9_9)
    L8_8 = L1_1
    L7_7 = L1_1.setEnemyNavi
    L9_9 = true
    L7_7(L8_8, L9_9)
    L8_8 = L1_1
    L7_7 = L1_1.setLockonNavi
    L9_9 = true
    L7_7(L8_8, L9_9)
    L8_8 = L3_3
    L7_7 = L3_3.setActive
    L9_9 = true
    L7_7(L8_8, L9_9)
    L8_8 = L1_1
    L7_7 = L1_1.setIdling
    L9_9 = false
    L7_7(L8_8, L9_9)
    L7_7 = Fn_setCatWarp
    L8_8 = true
    L7_7(L8_8)
    L7_7 = Fn_userCtrlOn
    L7_7()
    L8_8 = L1_1
    L7_7 = L1_1.getHealth
    L7_7 = L7_7(L8_8)
    L7_7 = L7_7 / 2
    L8_8 = false
    repeat
      L9_9 = L3_3.setHp
      L9_9(L3_3, L1_1:getHealth() / L1_1:getMaxHealth())
      if false == L8_8 then
        L9_9 = L1_1.getHealth
        L9_9 = L9_9(L1_1)
        if L7_7 > L9_9 then
          L9_9 = Fn_setBgmPoint
          L9_9("event", "boss_battle2")
          L8_8 = true
        end
      end
      L9_9 = wait
      L9_9()
      L9_9 = L1_1.isFatal
      L9_9 = L9_9(L1_1)
    until L9_9
    L9_9 = Fn_userCtrlAllOff
    L9_9()
    L9_9 = Fn_setBgmPoint
    L9_9("event", "boss_battle_end")
    L9_9 = waitSeconds
    L9_9(1)
    L9_9 = Sound
    L9_9 = L9_9.playSE
    L9_9(L9_9, "ene_boss_finish", 1)
    L9_9 = Fn_whiteout
    L9_9()
    L9_9 = Fn_naviKill
    L9_9()
    L9_9 = Fn_TerminateSupporterFromBrain
    L9_9(L1_1)
    L9_9 = Fn_TerminateSupporterFromPuppet
    L9_9(L0_0)
    L0_0, L1_1 = nil, nil
    L9_9 = findGameObject2
    L9_9 = L9_9("Puppet", "_puppet_supporter_raven")
    if L9_9 then
      Fn_TerminateSupporterFromPuppet(L9_9)
      L9_9 = nil
    end
    HUD:deleteBossHpGauge()
    Fn_userCtrlAllOff()
    Fn_resetPcPos("locator2_pc_start_pos")
    Fn_missionInfoEnd()
    Fn_captionViewEnd()
    Fn_fadein()
    wait(10)
    Fn_setMine99FloorClear()
    Sound:playSE("skb_004", 1)
    Fn_captionViewWait("ic_litho_00100", 3, 4.5)
    waitSeconds(1)
    if Fn_rewardMineBoss("boss11") then
      print("\229\136\157\229\155\158\227\130\175\227\131\170\227\130\162\229\160\177\233\133\172\227\130\146\230\184\161\227\129\151\227\129\190\227\129\151\227\129\159")
    else
      Fn_dropGraviryOre("locator2_reward_pos_01")
    end
    Fn_userCtrlOn()
  end
  L0_0 = Fn_setGravityGateActive
  L1_1 = true
  L0_0(L1_1)
  L0_0 = Fn_cageMove
  L0_0()
end
function FinalizeBody()
  local L0_10, L1_11
end
function createPiGate()
  local L0_12, L1_13
  L0_12 = Fn_findAreaHandle
  L1_13 = "po_a_01a"
  L0_12 = L0_12(L1_13)
  L1_13 = createGameObject2
  L1_13 = L1_13("GimmickBg")
  L1_13:setName("gate_md_01")
  L1_13:setDrawModelName("gate_md_01")
  L1_13:setAttributeName("gate_md_01")
  L1_13:setCollisionName("gate_md_01")
  L0_12:appendChild(L1_13)
  L1_13:setTransform(L0_12:getNodeLocalPosRot("gate_md_01_01"))
  return L1_13
end
function createWindmill()
  local L0_14, L1_15, L2_16
  L0_14 = Fn_findAreaHandle
  L1_15 = "bu_a_15"
  L0_14 = L0_14(L1_15)
  if L0_14 then
    L1_15 = createGameObject2
    L2_16 = "GimmickBg"
    L1_15 = L1_15(L2_16)
    L2_16 = L1_15.setName
    L2_16(L1_15, "building_nk_01")
    L2_16 = L1_15.setDrawModelName
    L2_16(L1_15, "building_nk_01")
    L2_16 = L1_15.setAttributeName
    L2_16(L1_15, "building_nk_01")
    L2_16 = L1_15.setCollisionName
    L2_16(L1_15, "building_nk_01")
    L2_16 = L0_14.appendChild
    L2_16(L0_14, L1_15)
    L2_16 = L1_15.setTransform
    L2_16(L1_15, L0_14:getNodeLocalPosRot("building_nk_01_01"))
    L2_16 = L1_15.try_init
    L2_16(L1_15)
    L2_16 = L1_15.waitForReady
    L2_16(L1_15)
    L2_16 = createGameObject2
    L2_16 = L2_16("GimmickBg")
    L2_16:setName("building_nk_01_fan_01")
    L2_16:setDrawModelName("building_nk_01_fan")
    L2_16:setAttributeName("building_nk_01_fan")
    L2_16:setCollisionName("building_nk_01_fan")
    L1_15:appendChild(L2_16)
    L2_16:setTransform(Vector(-0.0135913593654, 13.5852425172, 2.15632985057), XYZRotQuatD(0, 0, 0))
    return L1_15
  end
  L1_15 = nil
  return L1_15
end
function createBarn()
  local L0_17, L1_18
  L0_17 = Fn_findAreaHandle
  L1_18 = "bu_a_02"
  L0_17 = L0_17(L1_18)
  if L0_17 then
    L1_18 = createGameObject2
    L1_18 = L1_18("GimmickBg")
    L1_18:setName("building_nk_08")
    L1_18:setDrawModelName("building_nk_08")
    L1_18:setAttributeName("building_nk_08")
    L1_18:setCollisionName("building_nk_08")
    L0_17:appendChild(L1_18)
    L1_18:setTransform(L0_17:getNodeLocalPosRot("building_nk_08_01"))
    L1_18:try_init()
    L1_18:waitForReady()
    return L1_18
  end
  L1_18 = nil
  return L1_18
end
