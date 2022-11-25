dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm14_common.lua")
CAPTION_TRIGGER_DISTANCE = 280
GEM_GOAL = 50
ADD_ENEMY_TRIGGER_GEM_NUM = 10
_puppet_crow = nil
_brain_crow = nil
enmgen2_add_c_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_add_enemy_c_01",
      type = "imp",
      locator = "locator_add_enemy_01"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
  end,
  onObjectAsh = function(A0_8, A1_9)
  end
}
function Initialize()
  Fn_userCtrlAllOff()
  _sdemo_cut01 = SDemo.create("sm14_cut_c_01")
  Fn_pcSensorOff("pccubesensor2_mining_c_01")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_c_01")
  Fn_pcSensorOff("pccubesensor2_mining_area_warning_c")
  Fn_pcSensorOff("pccubesensor2_mining_area_warp_c")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_c_02")
  Fn_pcSensorOff("pccubesensor2_next_area_warning_c")
  Fn_pcSensorOff("pccubesensor2_next_area_warp_c")
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24
  L0_10 = Fn_setCatWarpCheckPoint
  L1_11 = "locator2_pc_start_pos_c"
  L0_10(L1_11)
  _crow_warp_node = "locator2_crow_start_pos_c"
  L0_10 = nil
  L1_11 = Fn_coercionPoseNomal
  L1_11()
  L1_11 = Fn_warpCageMineArea
  L1_11()
  L1_11 = Fn_sendEventComSb
  L2_12 = "changeAreaNum"
  L3_13 = 2
  L1_11(L2_12, L3_13)
  L1_11 = Fn_sendEventComSb
  L2_12 = "resetAllOre"
  L1_11(L2_12)
  L1_11 = Fn_sendEventComSb
  L2_12 = "resetAllCountFlag"
  L1_11(L2_12)
  L1_11 = Fn_sendEventComSb
  L2_12 = "isSpawnCrow"
  L1_11 = L1_11(L2_12)
  if not L1_11 then
    L1_11 = Fn_sendEventComSb
    L2_12 = "requestSpawnCrow"
    L3_13 = true
    L1_11(L2_12, L3_13)
    while true do
      L1_11 = _puppet_crow
      if L1_11 == nil then
        L1_11 = _brain_crow
      end
      if L1_11 == nil then
        L1_11 = print
        L2_12 = "\227\130\175\227\131\173\227\130\166\228\189\156\227\130\137\227\130\140\227\129\166\227\129\170\227\129\132"
        L1_11(L2_12)
        L1_11 = Fn_sendEventComSb
        L2_12 = "crowPuppetHandle"
        L1_11 = L1_11(L2_12)
        _puppet_crow = L1_11
        L1_11 = Fn_sendEventComSb
        L2_12 = "crowBrainHandle"
        L1_11 = L1_11(L2_12)
        _brain_crow = L1_11
        L1_11 = wait
        L1_11()
        else
          L1_11 = Fn_sendEventComSb
          L2_12 = "crowPuppetHandle"
          L1_11 = L1_11(L2_12)
          _puppet_crow = L1_11
          L1_11 = Fn_sendEventComSb
          L2_12 = "crowBrainHandle"
          L1_11 = L1_11(L2_12)
          _brain_crow = L1_11
          L1_11 = print
          L2_12 = "\227\130\130\227\129\134\227\130\175\227\131\173\227\130\166\228\189\156\227\129\163\227\129\166\227\130\139"
          L1_11(L2_12)
        end
      end
    end
  L1_11 = findGameObject2
  L2_12 = "Node"
  L3_13 = "locator2_crow_start_pos"
  L1_11 = L1_11(L2_12, L3_13)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.setIdling
  L4_14 = true
  L2_12(L3_13, L4_14)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.setAbility
  L4_14 = Supporter
  L4_14 = L4_14.Ability
  L4_14 = L4_14.ActionInAir
  L5_15 = false
  L2_12(L3_13, L4_14, L5_15)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.warpToNode
  L4_14 = L1_11
  L5_15 = Supporter
  L5_15 = L5_15.FirstAction
  L5_15 = L5_15.Ground
  L2_12(L3_13, L4_14, L5_15)
  L2_12 = _brain_crow
  L3_13 = L2_12
  L2_12 = L2_12.lockToWarp
  L4_14 = L1_11
  L2_12(L3_13, L4_14)
  L2_12 = Supporter
  L2_12 = L2_12.Area
  L2_12 = L2_12.sm14_c
  L3_13 = Fn_createSuppotArea
  L4_14 = L2_12
  L5_15 = _brain_crow
  L3_13(L4_14, L5_15)
  L3_13 = _brain_crow
  L4_14 = L3_13
  L3_13 = L3_13.requestFatal
  L5_15 = false
  L3_13(L4_14, L5_15)
  L3_13 = print
  L4_14 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\131\145\227\131\169\227\131\172\227\131\171\227\131\149\227\130\167\227\131\188\227\130\191\227\131\171OFF\239\188\129\239\188\129"
  L3_13(L4_14)
  L3_13 = Fn_sendEventComSb
  L4_14 = "requestChangeEnemyMarker"
  L5_15 = false
  L3_13(L4_14, L5_15)
  L3_13 = Fn_sendEventComSb
  L4_14 = "requestIdleEnemy"
  L5_15 = true
  L3_13(L4_14, L5_15)
  function L3_13()
    local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33
    L0_25 = Fn_getGameObject
    L1_26 = "MineManager"
    L0_25 = L0_25(L1_26)
    L1_26 = {}
    L2_27.evarea = nil
    L2_27.aabb = nil
    L1_26.pi_a_16_01 = L2_27
    L2_27.evarea = nil
    L2_27.aabb = nil
    L1_26.pi_a_25 = L2_27
    L2_27.evarea = nil
    L2_27.aabb = nil
    L1_26.pi_a_03_04 = L2_27
    if L0_25 then
      for L5_30, L6_31 in L2_27(L3_28) do
        L6_31.evarea = L7_32
        if L7_32 then
          L6_31.aabb = L7_32
          L7_32.max.x = L6_31.aabb.max.x + L8_33.max.x
          L7_32.max.y = L6_31.aabb.max.y + L8_33.max.y
          L7_32.max.z = L6_31.aabb.max.z + L8_33.max.z
          L7_32.min.x = L6_31.aabb.min.x + L8_33.min.x
          L7_32.min.y = L6_31.aabb.min.y + L8_33.min.y
          L7_32.min.z = L6_31.aabb.min.z + L8_33.min.z
          L6_31.evarea:setLocalAabb(L8_33)
        end
      end
    end
    L5_30 = L2_27
    L4_29(L5_30, L6_31)
    L5_30 = L3_28
    L4_29(L5_30, L6_31)
    L5_30 = L4_29
    L4_29(L5_30, L6_31, L7_32, L8_33)
    L5_30 = L4_29
    L4_29(L5_30)
    L4_29()
    L5_30 = 0.5
    L4_29(L5_30)
    L5_30 = {}
    L5_30.pos = "locator2_cam_c_02"
    L5_30.time = 4
    L6_31.pos = "locator2_cam_c_03"
    L6_31.time = 3.1
    L7_32.pos = "locator2_cam_c_04"
    L7_32.time = 3
    L5_30 = {
      L6_31,
      L7_32,
      L8_33
    }
    L6_31.pos = "locator2_aim_c_02"
    L6_31.time = 4
    L7_32.pos = "locator2_aim_c_03"
    L7_32.time = 3.1
    L8_33.pos = "locator2_aim_c_04"
    L8_33.time = 3
    L6_31(L7_32, L8_33, L5_30)
    while true do
      if L6_31 then
        L6_31()
      end
    end
    L6_31(L7_32)
    L6_31(L7_32)
    L6_31(L7_32, L8_33)
    for _FORV_9_, _FORV_10_ in L6_31(L7_32) do
      if _FORV_10_.evarea then
        _FORV_10_.evarea:setLocalAabb(_FORV_10_.aabb)
      end
    end
    L6_31(L7_32, L8_33)
    L6_31(L7_32, L8_33)
  end
  L4_14 = Fn_skipMissionRetryAtProcessing
  L5_15 = L3_13
  L4_14 = L4_14(L5_15)
  if not L4_14 then
    L4_14 = Fn_missionStart
    L4_14()
  end
  L4_14 = Fn_userCtrlOn
  L4_14()
  L4_14 = Fn_resetCoercionPose
  L4_14()
  L4_14 = Fn_sendEventComSb
  L5_15 = "setOreCaptionActive"
  L6_16 = true
  L4_14(L5_15, L6_16)
  L4_14 = Fn_sendEventComSb
  L5_15 = "crowSetMineObjects"
  L4_14(L5_15)
  L4_14 = wait
  L4_14()
  L4_14 = Fn_sendEventComSb
  L5_15 = "requestChangeEnemyMarker"
  L6_16 = true
  L4_14(L5_15, L6_16)
  L4_14 = Fn_sendEventComSb
  L5_15 = "requestIdleEnemy"
  L6_16 = false
  L4_14(L5_15, L6_16)
  L4_14 = _brain_crow
  L5_15 = L4_14
  L4_14 = L4_14.setDetectEnemyRangeFromMineObject
  L6_16 = 20
  L4_14(L5_15, L6_16)
  L4_14 = _brain_crow
  L5_15 = L4_14
  L4_14 = L4_14.setIdling
  L6_16 = true
  L4_14(L5_15, L6_16)
  L4_14 = SetCounterStart
  L5_15 = GEM_GOAL
  L4_14(L5_15)
  L4_14 = createMineTimer
  L4_14 = L4_14()
  L5_15 = _brain_crow
  L6_16 = L5_15
  L5_15 = L5_15.startMine
  L5_15(L6_16)
  _crow_mine = true
  L5_15 = _brain_crow
  L6_16 = L5_15
  L5_15 = L5_15.unlockToWarp
  L5_15(L6_16)
  L5_15 = _brain_crow
  L6_16 = L5_15
  L5_15 = L5_15.setAbility
  L7_17 = Supporter
  L7_17 = L7_17.Ability
  L7_17 = L7_17.ActionInAir
  L8_18 = true
  L5_15(L6_16, L7_17, L8_18)
  L5_15 = CrowJumpEnd
  L6_16 = _brain_crow
  L5_15(L6_16)
  L5_15 = Fn_pcSensorOn
  L6_16 = "pccubesensor2_mining_area_distant_c_01"
  L5_15(L6_16)
  L5_15 = Fn_pcSensorOn
  L6_16 = "pccubesensor2_mining_area_warning_c"
  L5_15(L6_16)
  L5_15 = Fn_pcSensorOn
  L6_16 = "pccubesensor2_mining_area_warp_c"
  L5_15(L6_16)
  L5_15 = Mv_warningLeaveArea
  L6_16 = "locator2_navi_distant_c_01"
  L7_17 = "sm14_01002"
  L8_18 = true
  L5_15 = L5_15(L6_16, L7_17, L8_18)
  L6_16 = Fn_captionViewWait
  L7_17 = "sm14_02000"
  L6_16(L7_17)
  L6_16 = Fn_missionViewWait
  L7_17 = "sm14_02001"
  L6_16(L7_17)
  L6_16 = false
  while true do
    L7_17 = GlobalGem
    L8_18 = L7_17
    L7_17 = L7_17.GetOtherPreciousGemNum
    L7_17 = L7_17(L8_18)
    L8_18 = GEM_GOAL
    if not (L7_17 >= L8_18) then
      L7_17 = getMineTime
      L7_17 = L7_17()
      L8_18 = MINE_EXIT_TIME
      if not (L7_17 >= L8_18) then
        if L0_10 == nil then
          L7_17 = GlobalGem
          L8_18 = L7_17
          L7_17 = L7_17.GetOtherPreciousGemNum
          L7_17 = L7_17(L8_18)
          L8_18 = ADD_ENEMY_TRIGGER_GEM_NUM
          if L7_17 >= L8_18 then
            L7_17 = findGameObject2
            L8_18 = "EnemyGenerator"
            L9_19 = "enmgen2_add_c_01"
            L7_17 = L7_17(L8_18, L9_19)
            L0_10 = L7_17
            if L0_10 ~= nil then
              L8_18 = L0_10
              L7_17 = L0_10.setEnemyMarker
              L9_19 = true
              L7_17(L8_18, L9_19)
              L8_18 = L0_10
              L7_17 = L0_10.requestSpawn
              L7_17(L8_18)
              while true do
                L8_18 = L0_10
                L7_17 = L0_10.isPrepared
                L7_17 = L7_17(L8_18)
                if not L7_17 then
                  L7_17 = wait
                  L7_17()
                end
              end
              L8_18 = L0_10
              L7_17 = L0_10.requestIdlingEnemy
              L9_19 = false
              L7_17(L8_18, L9_19)
            end
          end
        end
        L7_17 = Fn_sendEventComSb
        L8_18 = "crowOreBrokenCount"
        L7_17 = L7_17(L8_18)
        L8_18 = Fn_sendEventComSb
        L9_19 = "kitOreBrokenCount"
        L8_18 = L8_18(L9_19)
        L7_17 = L7_17 - L8_18
        L8_18 = RETRY_ORE_GAP
        if L7_17 >= L8_18 then
          L7_17 = Fn_userCtrlAllOff
          L7_17()
          L7_17 = Player
          L8_18 = L7_17
          L7_17 = L7_17.setStay
          L9_19 = true
          L7_17(L8_18, L9_19)
          L7_17 = CrowJumpPrepare
          L8_18 = _brain_crow
          L7_17(L8_18)
          L7_17 = Fn_sendEventComSb
          L8_18 = "requestIdleEnemy"
          L9_19 = true
          L7_17(L8_18, L9_19)
          L7_17 = waitSeconds
          L8_18 = 2
          L7_17(L8_18)
          L7_17 = Fn_kaiwaDemoView
          L8_18 = "sm14_00440k"
          L7_17(L8_18)
          L7_17 = print
          L8_18 = "\227\131\170\227\131\136\227\131\169\227\130\164\229\174\159\232\161\140"
          L7_17(L8_18)
          L7_17 = Fn_missionRetry
          L7_17()
          break
        end
      end
    end
    L7_17 = wait
    L7_17()
  end
  L7_17 = Mv_safeTaskAbort
  L8_18 = L4_14
  L7_17 = L7_17(L8_18)
  L4_14 = L7_17
  L7_17 = resetMineTime
  L7_17()
  _crow_mine = false
  L7_17 = Fn_sendEventComSb
  L8_18 = "crowEndMine"
  L7_17(L8_18)
  while true do
    L7_17 = _brain_crow
    L8_18 = L7_17
    L7_17 = L7_17.isMineEnd
    L7_17 = L7_17(L8_18)
    if not L7_17 then
      L7_17 = wait
      L7_17()
    end
  end
  L7_17 = CrowWarpAroundKit
  L8_18 = _puppet_crow
  L9_19 = _brain_crow
  L10_20 = "locator2_warp_c_"
  L7_17(L8_18, L9_19, L10_20)
  L7_17 = _brain_crow
  L8_18 = L7_17
  L7_17 = L7_17.setMoveVelocityRatio
  L9_19 = 1.2
  L10_20 = 0.2
  L7_17(L8_18, L9_19, L10_20)
  L7_17 = Fn_sendEventComSb
  L8_18 = "setOreCaptionActive"
  L9_19 = false
  L7_17(L8_18, L9_19)
  L7_17 = Fn_pcSensorOff
  L8_18 = "pccubesensor2_mining_area_distant_c_01"
  L7_17(L8_18)
  L7_17 = Fn_pcSensorOff
  L8_18 = "pccubesensor2_mining_area_warning_c"
  L7_17(L8_18)
  L7_17 = Fn_pcSensorOff
  L8_18 = "pccubesensor2_mining_area_warp_c"
  L7_17(L8_18)
  L7_17 = SetCounterEnd
  L7_17()
  L7_17 = Fn_captionViewWait
  L8_18 = "sm14_02002"
  L7_17(L8_18)
  L6_16 = true
  L7_17 = Fn_sendEventComSb
  L8_18 = "requestChangeEnemyMarker"
  L9_19 = false
  L7_17(L8_18, L9_19)
  L7_17 = Fn_sendEventComSb
  L8_18 = "requestIdleEnemy"
  L9_19 = true
  L7_17(L8_18, L9_19)
  L7_17 = Fn_userCtrlAllOff
  L7_17()
  L7_17 = Player
  L8_18 = L7_17
  L7_17 = L7_17.setStay
  L9_19 = true
  L7_17(L8_18, L9_19)
  L7_17 = false
  L8_18 = 0
  L9_19 = 3
  L10_20 = invokeTask
  function L11_21()
    while true do
      if L8_18 > L9_19 then
        L7_17 = true
      end
      waitSeconds(1)
      L8_18 = L8_18 + 1
    end
  end
  L10_20 = L10_20(L11_21)
  L11_21 = Mv_viewObjWait
  L12_22 = _puppet_crow
  L13_23 = 0.8
  L11_21 = L11_21(L12_22, L13_23)
  while true do
    L12_22 = print
    L13_23 = "\227\130\175\227\131\173\227\130\166\227\129\168\227\129\174\232\183\157\233\155\162 : "
    L14_24 = Fn_getDistanceToPlayer
    L14_24 = L14_24(_puppet_crow)
    L13_23 = L13_23 .. L14_24
    L12_22(L13_23)
    if L6_16 then
      L12_22 = Fn_getDistanceToPlayer
      L13_23 = _puppet_crow
      L12_22 = L12_22(L13_23)
      L13_23 = CROW_NEAR_DISTANCE
      if L12_22 < L13_23 then
        L12_22 = Mv_safeTaskAbort
        L13_23 = L10_20
        L12_22 = L12_22(L13_23)
        L10_20 = L12_22
        L12_22 = _brain_crow
        L13_23 = L12_22
        L12_22 = L12_22.setIdling
        L14_24 = true
        L12_22(L13_23, L14_24)
        L12_22 = waitSeconds
        L13_23 = 1
        L12_22(L13_23)
        break
      end
    end
    L12_22 = _brain_crow
    L13_23 = L12_22
    L12_22 = L12_22.isIdling
    L12_22 = L12_22(L13_23)
    if L12_22 then
      L12_22 = _brain_crow
      L13_23 = L12_22
      L12_22 = L12_22.setIdling
      L14_24 = false
      L12_22(L13_23, L14_24)
    end
    if L7_17 then
      L12_22 = Mv_safeTaskAbort
      L13_23 = L10_20
      L12_22 = L12_22(L13_23)
      L10_20 = L12_22
      break
    end
    L12_22 = wait
    L12_22()
  end
  L12_22 = Mv_safeTaskAbort
  L13_23 = L11_21
  L12_22 = L12_22(L13_23)
  L11_21 = L12_22
  L13_23 = L5_15
  L12_22 = L5_15.abort
  L12_22(L13_23)
  L5_15 = nil
  L12_22 = Fn_kaiwaDemoView
  L13_23 = "sm14_00450k"
  L12_22(L13_23)
  L12_22 = Fn_sendSetOtherPreciousGemNum
  L13_23 = 0
  L12_22(L13_23)
  L12_22 = Player
  L13_23 = L12_22
  L12_22 = L12_22.setStay
  L14_24 = false
  L12_22(L13_23, L14_24)
  L12_22 = Fn_userCtrlOn
  L12_22()
  L12_22 = _brain_crow
  L13_23 = L12_22
  L12_22 = L12_22.setIdling
  L14_24 = false
  L12_22(L13_23, L14_24)
  L12_22 = _brain_crow
  L13_23 = L12_22
  L12_22 = L12_22.setMoveVelocityRatio
  L14_24 = 1
  L12_22(L13_23, L14_24, 0)
  L12_22 = Fn_sendEventComSb
  L13_23 = "requestIdleEnemy"
  L14_24 = false
  L12_22(L13_23, L14_24)
  L12_22 = _brain_crow
  L13_23 = L12_22
  L12_22 = L12_22.setAbility
  L14_24 = Supporter
  L14_24 = L14_24.Ability
  L14_24 = L14_24.Attack
  L12_22(L13_23, L14_24, false)
  L12_22 = _brain_crow
  L13_23 = L12_22
  L12_22 = L12_22.setIdling
  L14_24 = false
  L12_22(L13_23, L14_24)
  L12_22 = print
  L13_23 = "\227\130\175\227\131\173\227\130\166\231\180\162\230\149\181\232\183\157\233\155\162 : "
  L14_24 = _brain_crow
  L14_24 = L14_24.getDetectThreatDistance
  L14_24 = L14_24(L14_24)
  L13_23 = L13_23 .. L14_24
  L12_22(L13_23)
  L12_22 = Fn_missionView
  L13_23 = "sm14_01005"
  L12_22(L13_23)
  L12_22 = waitSeconds
  L13_23 = 1.3
  L12_22(L13_23)
  L12_22 = Mv_viewObj
  L13_23 = "locator2_navi_mining_c_01"
  L14_24 = 0.3
  L12_22 = L12_22(L13_23, L14_24)
  L13_23 = Fn_naviSet
  L14_24 = findGameObject2
  L14_24 = L14_24("Node", "locator2_navi_mining_c_01")
  L13_23(L14_24, L14_24("Node", "locator2_navi_mining_c_01"))
  L13_23 = Fn_pcSensorOn
  L14_24 = "pccubesensor2_mining_c_01"
  L13_23(L14_24)
  L13_23 = Fn_pcSensorOn
  L14_24 = "pccubesensor2_mining_area_distant_c_02"
  L13_23(L14_24)
  L13_23 = Fn_pcSensorOn
  L14_24 = "pccubesensor2_next_area_warning_c"
  L13_23(L14_24)
  L13_23 = Fn_pcSensorOn
  L14_24 = "pccubesensor2_next_area_warp_c"
  L13_23(L14_24)
  L13_23 = Mv_warningLeaveArea
  L14_24 = "locator2_navi_mining_c_01"
  L13_23 = L13_23(L14_24, "sm14_01004", false)
  L14_24 = Fn_sendEventComSb
  L14_24("requestIdleEnemy", false)
  L14_24 = Fn_sendEventComSb
  L14_24("requestChangeEnemyMarker", false)
  if L0_10 ~= nil then
    L14_24 = L0_10.isPrepared
    L14_24 = L14_24(L0_10)
    if L14_24 == true then
      L14_24 = L0_10.setEnemyMarker
      L14_24(L0_10, false)
    end
  end
  L14_24 = _brain_crow
  L14_24 = L14_24.setKeepDistanceOfFatal
  L14_24(L14_24, 100)
  L14_24 = print
  L14_24("\227\130\175\227\131\173\227\130\166\239\188\154\227\131\145\227\131\169\227\131\172\227\131\171\227\131\149\227\130\167\227\131\188\227\130\191\227\131\171ON\239\188\129\239\188\129")
  L14_24 = Fn_sendEventComSb
  L14_24("requestIdleEnemy", false)
  L14_24 = L12_22.abort
  L14_24(L12_22)
  L14_24 = findGameObject2
  L14_24 = L14_24("Node", "locator2_navi_mining_c_01")
  while not (Fn_getDistanceToPlayer(L14_24) < CAPTION_TRIGGER_DISTANCE) do
    wait()
  end
  Fn_captionViewWait("sm14_02003")
  Fn_captionViewWait("sm14_02004")
  Mv_waitPhase()
  L13_23:abort()
  L13_23 = nil
  CrowWarpAroundKit(_puppet_crow, _brain_crow, "locator2_warp_c2_")
  Mv_warningLeaveArea("locator2_navi_mining_c_01", "sm14_01000", true):abort()
  Fn_pcSensorOff("pccubesensor2_mining_c_01")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_c_02")
  Fn_pcSensorOff("pccubesensor2_next_area_warning_c")
  Fn_pcSensorOff("pccubesensor2_next_area_warp_c")
  waitSeconds(1)
  Fn_userCtrlOff()
  Fn_blackout()
  CrowJumpPrepare(_brain_crow)
  waitSeconds(1)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Fn_deleteSuppotArea(_brain_crow)
end
function pccubesensor2_mining_OnEnter()
  Fn_naviKill()
  Mv_gotoNextPhase()
end
function pccubesensor2_mining_OnLeave()
  local L0_34, L1_35
end
function pccubesensor2_mining_area_distant_OnEnter()
  Mv_setLeaveArea(false)
end
function pccubesensor2_mining_area_distant_OnLeave()
  Mv_setLeaveArea(true)
end
function pccubesensor2_catwarp_warning_mining_OnLeave()
  warningCatWarp("locator2_navi_distant_c_01")
end
function pccubesensor2_catwarp_warning_next_OnLeave()
  warningCatWarp("locator2_navi_mining_c_01")
end
function pccubesensor2_catwarp_OnLeave()
  catWarp()
end
