dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm14_common.lua")
_puppet_crow = nil
_brain_crow = nil
CROW_CAPTION_CHANGE_DISTANCE = 15
CROW_DISTANCE_MAX = 50
ENEMY_POP_INTERVAL = {
  10,
  10,
  10
}
CROW_DISTANT_VALUE = 30
GONDOLA_ACCESS_VALUE = 480
WARNING_DISTANCE_VALUE = 570
function Initialize()
  Fn_pcSensorOff("pccubesensor2_battle_area_warning_d")
  Fn_pcSensorOff("pccubesensor2_battle_area_warp_d")
  Fn_pcSensorOff("pccubesensor2_guide_01")
  Fn_pcSensorOff("pccubesensor2_warning_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_01")
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
  L0_0 = Fn_setCatWarpCheckPoint
  L1_1 = "locator2_pc_reset_pos_d"
  L0_0(L1_1)
  _crow_warp_node = "locator2_crow_reset_pos_d"
  L0_0 = Fn_warpCageMineArea
  L0_0()
  L0_0 = Fn_coercionPoseNomal
  L0_0()
  L0_0 = Fn_sendEventComSb
  L1_1 = "isSpawnCrow"
  L0_0 = L0_0(L1_1)
  if not L0_0 then
    L0_0 = Fn_sendEventComSb
    L1_1 = "requestSpawnCrow"
    L0_0(L1_1)
    while true do
      L0_0 = _puppet_crow
      if L0_0 == nil then
        L0_0 = _brain_crow
      end
      if L0_0 == nil then
        L0_0 = print
        L1_1 = "\227\130\175\227\131\173\227\130\166\228\189\156\227\130\137\227\130\140\227\129\166\227\129\170\227\129\132"
        L0_0(L1_1)
        L0_0 = Fn_sendEventComSb
        L1_1 = "crowPuppetHandle"
        L0_0 = L0_0(L1_1)
        _puppet_crow = L0_0
        L0_0 = Fn_sendEventComSb
        L1_1 = "crowBrainHandle"
        L0_0 = L0_0(L1_1)
        _brain_crow = L0_0
        L0_0 = wait
        L0_0()
        else
          L0_0 = Fn_sendEventComSb
          L1_1 = "crowPuppetHandle"
          L0_0 = L0_0(L1_1)
          _puppet_crow = L0_0
          L0_0 = Fn_sendEventComSb
          L1_1 = "crowBrainHandle"
          L0_0 = L0_0(L1_1)
          _brain_crow = L0_0
          L0_0 = print
          L1_1 = "\227\130\130\227\129\134\227\130\175\227\131\173\227\130\166\228\189\156\227\129\163\227\129\166\227\130\139"
          L0_0(L1_1)
        end
      end
    end
  L0_0 = print
  L1_1 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\145\227\131\154\227\131\131\227\131\136\227\131\143\227\131\179\227\131\137\227\131\171"
  L2_2 = _puppet_crow
  L0_0(L1_1, L2_2)
  L0_0 = print
  L1_1 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\150\227\131\172\227\130\164\227\131\179\227\131\143\227\131\179\227\131\137\227\131\171"
  L2_2 = _brain_crow
  L0_0(L1_1, L2_2)
  L0_0 = Supporter
  L0_0 = L0_0.Area
  L0_0 = L0_0.sm14_c
  L1_1 = Fn_createSuppotArea
  L2_2 = L0_0
  L3_3 = _brain_crow
  L1_1(L2_2, L3_3)
  L1_1 = CrowJumpPrepare
  L2_2 = _brain_crow
  L1_1(L2_2)
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_crow_start_pos"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setIdling
  L4_4 = true
  L2_2(L3_3, L4_4)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.warpToNode
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.lockToWarp
  L4_4 = L1_1
  L2_2(L3_3, L4_4)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setKeepDistanceOfFatal
  L4_4 = 100
  L2_2(L3_3, L4_4)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setAbility
  L4_4 = Supporter
  L4_4 = L4_4.Ability
  L4_4 = L4_4.Parallel
  L4_4 = L4_4.Normal
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setAbility
  L4_4 = Supporter
  L4_4 = L4_4.Ability
  L4_4 = L4_4.Parallel
  L4_4 = L4_4.Mars
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setAbility
  L4_4 = Supporter
  L4_4 = L4_4.Ability
  L4_4 = L4_4.Parallel
  L4_4 = L4_4.Jupiter
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setAbility
  L4_4 = Supporter
  L4_4 = L4_4.Ability
  L4_4 = L4_4.Parallel
  L4_4 = L4_4.NormalSp
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setAbility
  L4_4 = Supporter
  L4_4 = L4_4.Ability
  L4_4 = L4_4.Parallel
  L4_4 = L4_4.MarsSp
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = _brain_crow
  L3_3 = L2_2
  L2_2 = L2_2.setAbility
  L4_4 = Supporter
  L4_4 = L4_4.Ability
  L4_4 = L4_4.Parallel
  L4_4 = L4_4.JupiterSp
  L5_5 = false
  L2_2(L3_3, L4_4, L5_5)
  L2_2 = Fn_sendEventComSb
  L3_3 = "requestDestroyEnemy"
  L2_2(L3_3)
  L2_2 = Fn_sendEventComSb
  L3_3 = "setOreCaptionActive"
  L4_4 = false
  L2_2(L3_3, L4_4)
  L2_2 = Player
  L3_3 = L2_2
  L2_2 = L2_2.setTargetingPriority
  L4_4 = Player
  L4_4 = L4_4.kTargetingPrio_EnemyFirst
  L2_2(L3_3, L4_4)
  L2_2 = Fn_missionStart
  L2_2()
  L2_2 = Fn_kaiwaDemoView
  L3_3 = "sm14_00500k"
  L2_2(L3_3)
  L2_2 = Fn_sendSetOtherPreciousGemNum
  L3_3 = 0
  L2_2(L3_3)
  L2_2 = Mv_viewObjWait
  L3_3 = "locator2_aim_c_01"
  L2_2 = L2_2(L3_3)
  L3_3 = findGameObject2
  L4_4 = "Node"
  L5_5 = "locator2_pc_turn_target"
  L3_3 = L3_3(L4_4, L5_5)
  L4_4 = L3_3
  L3_3 = L3_3.getWorldPos
  L3_3 = L3_3(L4_4)
  L4_4 = Player
  L5_5 = L4_4
  L4_4 = L4_4.setLookAtIk
  L6_6 = true
  L7_7 = 1
  L8_8 = L3_3
  L4_4(L5_5, L6_6, L7_7, L8_8)
  L4_4 = print
  L5_5 = "\227\130\173\227\131\136\227\130\165\227\131\179\239\188\154\233\187\146\232\153\171\227\129\174\230\150\185\229\144\145\227\129\184\227\130\191\227\131\188\227\131\179"
  L4_4(L5_5)
  L4_4 = Fn_sendEventComSb
  L5_5 = "requestSpawnEnemy"
  L4_4(L5_5)
  L4_4 = Fn_sendEventComSb
  L5_5 = "requestIdleEnemy"
  L6_6 = true
  L4_4(L5_5, L6_6)
  L4_4 = waitSeconds
  L5_5 = 1.5
  L4_4(L5_5)
  L4_4 = Fn_resetCoercionPose
  L4_4()
  L5_5 = L1_1
  L4_4 = L1_1.getWorldPos
  L4_4 = L4_4(L5_5)
  L5_5 = findGameObject2
  L6_6 = "Node"
  L7_7 = "locator2_crow_move_pos_01"
  L5_5 = L5_5(L6_6, L7_7)
  L6_6 = L5_5
  L5_5 = L5_5.getWorldPos
  L5_5 = L5_5(L6_6)
  L6_6 = {L7_7, L8_8}
  L7_7 = {}
  L7_7.pos = L4_4
  L8_8 = Supporter
  L8_8 = L8_8.MovePoint
  L8_8 = L8_8.Ground
  L7_7.action = L8_8
  L7_7.vel = 10
  L8_8 = {}
  L8_8.pos = L5_5
  L9_9 = Supporter
  L9_9 = L9_9.MovePoint
  L9_9 = L9_9.Ground
  L8_8.action = L9_9
  L8_8.vel = 10
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.unlockToWarp
  L7_7(L8_8)
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.setMovePoints
  L9_9 = L6_6
  L7_7(L8_8, L9_9)
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.startMovePoint
  L7_7(L8_8)
  repeat
    L7_7 = wait
    L7_7()
    L7_7 = _brain_crow
    L8_8 = L7_7
    L7_7 = L7_7.isMovePointEnd
    L7_7 = L7_7(L8_8)
  until L7_7
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.clearMovePoint
  L7_7(L8_8)
  L7_7 = waitSeconds
  L8_8 = 2
  L7_7(L8_8)
  L7_7 = Player
  L8_8 = L7_7
  L7_7 = L7_7.setLookAtIk
  L9_9 = false
  L10_10 = 1
  L7_7(L8_8, L9_9, L10_10, L11_11)
  L7_7 = Fn_kaiwaDemoView
  L8_8 = "sm14_00600k"
  L7_7(L8_8)
  L7_7 = Mv_safeTaskAbort
  L8_8 = L2_2
  L7_7 = L7_7(L8_8)
  L2_2 = L7_7
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.setIdling
  L9_9 = false
  L7_7(L8_8, L9_9)
  L7_7 = Fn_userCtrlOn
  L7_7()
  L7_7 = _brain_crow
  L8_8 = L7_7
  L7_7 = L7_7.setAbility
  L9_9 = Supporter
  L9_9 = L9_9.Ability
  L9_9 = L9_9.ActionInAir
  L10_10 = true
  L7_7(L8_8, L9_9, L10_10)
  L7_7 = Fn_sendEventComSb
  L8_8 = "requestChangeEnemyMarker"
  L9_9 = true
  L7_7(L8_8, L9_9)
  L7_7 = Fn_sendEventComSb
  L8_8 = "requestIdleEnemy"
  L9_9 = false
  L7_7(L8_8, L9_9)
  L7_7 = Fn_sendEventComSb
  L8_8 = "changeAreaNum"
  L9_9 = 3
  L7_7(L8_8, L9_9)
  L7_7 = CrowJumpEnd
  L8_8 = _brain_crow
  L7_7(L8_8)
  L7_7 = Fn_missionViewWait
  L8_8 = "sm14_03000"
  L7_7(L8_8)
  L7_7 = Fn_pcSensorOn
  L8_8 = "pccubesensor2_battle_area_warning_d"
  L7_7(L8_8)
  L7_7 = Fn_pcSensorOn
  L8_8 = "pccubesensor2_battle_area_warp_d"
  L7_7(L8_8)
  L7_7 = 0
  L8_8 = 400
  L9_9 = 16
  L10_10 = {}
  for L14_14 = 1, L9_9 do
    L10_10[L14_14] = false
  end
  L11_11(L12_12)
  L12_12(L13_13)
  L14_14 = 1
  L12_12(L13_13, L14_14)
  L12_12(L13_13)
  L14_14 = 2
  L12_12(L13_13, L14_14)
  while true do
    while true do
      if L12_12 >= L13_13 then
        L14_14 = 3
        L12_12(L13_13, L14_14)
        L12_12(L13_13)
        if L12_12 ~= nil then
          L14_14 = L12_12
          L15_15 = 0.8
          L14_14 = Fn_captionViewWait
          L15_15 = "sm14_03020"
          L14_14(L15_15)
          L14_14 = Mv_safeTaskAbort
          L15_15 = L13_13
          L14_14 = L14_14(L15_15)
          break
        end
      end
      L12_12()
    end
  end
  while true do
    if L12_12 then
      L12_12(L13_13)
      break
    end
    L12_12()
  end
  L12_12()
  L12_12(L13_13)
  L12_12(L13_13)
  L14_14 = "locator2_pc_reset_pos_d"
  L15_15 = L12_12
  L13_13(L14_14, L15_15)
  L13_13()
  L14_14 = "pccubesensor2_battle_area_warning_d"
  L13_13(L14_14)
  L14_14 = "pccubesensor2_battle_area_warp_d"
  L13_13(L14_14)
  L14_14 = 1
  L13_13(L14_14)
  L14_14 = "sm14_00700k"
  L13_13(L14_14)
  L13_13()
  L14_14 = "pccubesensor2_catwarp_01"
  L13_13(L14_14)
  L14_14 = "pccubesensor2_guide_01"
  L13_13(L14_14)
  L14_14 = "pccubesensor2_warning_01"
  L13_13(L14_14)
  L14_14 = "requestChangeEnemyMarker"
  L15_15 = false
  L13_13(L14_14, L15_15)
  L14_14 = "sm14_03016"
  L13_13(L14_14)
  L14_14 = 1.3
  L13_13(L14_14)
  L14_14 = "locator2_navi_gondora_d_01"
  L15_15 = 0.3
  L14_14 = Fn_naviSet
  L15_15 = findGameObject2
  L15_15 = L15_15("Node", "locator2_navi_gondora_d_01")
  L14_14(L15_15, L15_15("Node", "locator2_navi_gondora_d_01"))
  L14_14 = _puppet_crow
  L15_15 = L14_14
  L14_14 = L14_14.getWorldPos
  L14_14 = L14_14(L15_15)
  L15_15 = findGameObject2
  L15_15 = L15_15("Node", "locator2_navi_gondora_d_01")
  L15_15 = L15_15.getWorldPos
  L15_15 = L15_15(L15_15)
  while not (Fn_getDistanceToPlayer(L14_14) >= CROW_DISTANT_VALUE) or not (Fn_getDistanceToPlayer(L15_15) <= GONDOLA_ACCESS_VALUE) do
    wait()
  end
  L13_13:abort()
  Fn_kaiwaDemoView("sm14_00800k")
  Fn_blackout()
  Fn_pcSensorOff("pccubesensor2_guide_01")
  Fn_pcSensorOff("pccubesensor2_warning_01")
  Fn_pcSensorOff("pccubesensor2_catwarp_01")
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Player:setTargetingPriority(Player.kTargetingPrio_Default)
  Fn_deleteSuppotArea(_brain_crow)
end
function pccubesensor2_catwarp_warning_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_catwarp_warning_OnLeave()
  warningCatWarp("locator2_navi_battle", "sm14_03001")
end
function pccubesensor2_warning_01_OnLeave()
  warningCatWarp()
end
function pccubesensor2_catwarp_01_OnLeave()
  catWarp()
end
function pccubesensor2_guide_01_OnLeave()
  view_task = Mv_viewObj("locator2_navi_gondora_d_01", 0.3)
  Fn_captionView("sm14_03017")
end
function pccubesensor2_guide_01_OnEnter()
  local L0_16, L1_17
end
function pccubesensor2_catwarp_OnLeave()
  catWarp()
end
