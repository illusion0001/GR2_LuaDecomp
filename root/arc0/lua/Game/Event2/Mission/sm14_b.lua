dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm14_common.lua")
CROW_DISTANCE_MAX = 50
GEM_GOAL = 40
CAPTION_TRIGGER_DISTANCE = 100
ADD_ENEMY_TRIGGER_GEM_NUM = 10
_puppet_crow = nil
_brain_crow = nil
enmgen2_add_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  autoRebirthFlag = false,
  autoRebirthIntervalTime = 5,
  spawnSet = {
    {
      name = "sm14_add_enemy_b_01",
      type = "stalker",
      locator = "locator_add_enemy_01"
    },
    {
      name = "sm14_add_enemy_b_02",
      type = "gellyfish",
      locator = "locator_add_enemy_02"
    },
    {
      name = "sm14_add_enemy_b_03",
      type = "gellyfish",
      locator = "locator_add_enemy_03"
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
  _sdemo_cut01 = SDemo.create("sm14_cut_b_01")
  Fn_pcSensorOff("pccubesensor2_mining_b_01")
  Fn_pcSensorOff("pccubesensor2_mining_b_02")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_b_01")
  Fn_pcSensorOff("pccubesensor2_mining_area_warning_b")
  Fn_pcSensorOff("pccubesensor2_mining_area_warp_b")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_b_02")
  Fn_pcSensorOff("pccubesensor2_next_area_warning_b")
  Fn_pcSensorOff("pccubesensor2_next_area_warp_b")
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_10, L1_11, L2_12, L3_13, L4_14, L5_15, L6_16, L7_17, L8_18, L9_19, L10_20, L11_21, L12_22, L13_23, L14_24, L15_25
  L0_10 = nil
  L1_11 = Fn_coercionPoseNomal
  L1_11()
  L1_11 = Fn_warpCageMineArea
  L1_11()
  L1_11 = Fn_setCatWarpCheckPoint
  L2_12 = "locator2_pc_start_pos_d"
  L1_11(L2_12)
  _crow_warp_node = "locator2_crow_start_pos_b"
  L1_11 = Fn_sendEventComSb
  L2_12 = "changeAreaNum"
  L3_13 = 1
  L1_11(L2_12, L3_13)
  L1_11 = Fn_sendEventComSb
  L2_12 = "requestSpawnCrow"
  L3_13 = false
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
    end
  end
  L1_11 = print
  L2_12 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\145\227\131\154\227\131\131\227\131\136\227\131\143\227\131\179\227\131\137\227\131\171"
  L3_13 = _puppet_crow
  L1_11(L2_12, L3_13)
  L1_11 = print
  L2_12 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\131\150\227\131\172\227\130\164\227\131\179\227\131\143\227\131\179\227\131\137\227\131\171"
  L3_13 = _brain_crow
  L1_11(L2_12, L3_13)
  L1_11 = Supporter
  L1_11 = L1_11.Area
  L1_11 = L1_11.sm14_b
  L2_12 = Fn_createSuppotArea
  L3_13 = L1_11
  L4_14 = _brain_crow
  L2_12(L3_13, L4_14)
  L2_12 = findGameObject2
  L3_13 = "Node"
  L4_14 = "locator2_crow_start_pos_b"
  L2_12 = L2_12(L3_13, L4_14)
  L3_13 = _brain_crow
  L4_14 = L3_13
  L3_13 = L3_13.setIdling
  L5_15 = true
  L3_13(L4_14, L5_15)
  L3_13 = _brain_crow
  L4_14 = L3_13
  L3_13 = L3_13.setAbility
  L5_15 = Supporter
  L5_15 = L5_15.Ability
  L5_15 = L5_15.ActionInAir
  L6_16 = false
  L3_13(L4_14, L5_15, L6_16)
  L3_13 = _brain_crow
  L4_14 = L3_13
  L3_13 = L3_13.warpToNode
  L5_15 = L2_12
  L3_13(L4_14, L5_15)
  L3_13 = _brain_crow
  L4_14 = L3_13
  L3_13 = L3_13.setKeepDistanceOfFatal
  L5_15 = 100
  L3_13(L4_14, L5_15)
  L3_13 = Fn_sendEventComSb
  L4_14 = "setOreCaptionActive"
  L5_15 = true
  L3_13(L4_14, L5_15)
  function L3_13()
    local L0_26, L1_27, L2_28
    L0_26 = Fn_sendEventComSb
    L1_27 = "requestChangeEnemyMarker"
    L2_28 = false
    L0_26(L1_27, L2_28)
    L0_26 = Fn_sendEventComSb
    L1_27 = "requestIdleEnemy"
    L2_28 = true
    L0_26(L1_27, L2_28)
    L0_26 = _sdemo_cut01
    L1_27 = L0_26
    L0_26 = L0_26.set
    L2_28 = "locator2_cam_b_01"
    L0_26(L1_27, L2_28, "locator2_aim_b_01", false)
    L0_26 = _sdemo_cut01
    L1_27 = L0_26
    L0_26 = L0_26.play
    L0_26(L1_27)
    L0_26 = Fn_missionStart
    L0_26()
    L0_26 = waitSeconds
    L1_27 = 0.5
    L0_26(L1_27)
    L0_26 = 5
    L1_27 = {
      L2_28,
      {
        pos = "locator2_cam_b_03",
        time = 3
      },
      {
        pos = "locator2_cam_b_04",
        time = 3
      }
    }
    L2_28 = {}
    L2_28.pos = "locator2_cam_b_02"
    L2_28.time = 4
    L2_28 = {
      {
        pos = "locator2_aim_b_02",
        time = 4
      },
      {
        pos = "locator2_aim_b_03",
        time = 3
      },
      {
        pos = "locator2_aim_b_04",
        time = 3
      }
    }
    _sdemo_cut01:play(L1_27, L2_28)
    while _sdemo_cut01:isPlay() do
      wait()
    end
    waitSeconds(1)
    Fn_kaiwaDemoView("sm14_00200k")
    _sdemo_cut01:stop(2)
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
  L4_14 = HUD
  L5_15 = L4_14
  L4_14 = L4_14.menuSetCallback
  L6_16 = HUD
  L6_16 = L6_16.kCallback_Retire
  L7_17 = mission_retire
  L4_14(L5_15, L6_16, L7_17)
  L4_14 = _brain_crow
  L5_15 = L4_14
  L4_14 = L4_14.setAbility
  L6_16 = Supporter
  L6_16 = L6_16.Ability
  L6_16 = L6_16.ActionInAir
  L7_17 = true
  L4_14(L5_15, L6_16, L7_17)
  L4_14 = CrowJumpEnd
  L5_15 = _brain_crow
  L4_14(L5_15)
  L4_14 = Fn_sendEventComSb
  L5_15 = "requestChangeEnemyMarker"
  L6_16 = true
  L4_14(L5_15, L6_16)
  L4_14 = Fn_sendEventComSb
  L5_15 = "requestIdleEnemy"
  L6_16 = false
  L4_14(L5_15, L6_16)
  L4_14 = Mv_warningLeaveArea
  L5_15 = "locator2_navi_mining_b_01"
  L6_16 = "sm14_01000"
  L7_17 = true
  L4_14 = L4_14(L5_15, L6_16, L7_17)
  L5_15 = CrowWarpAroundKit
  L6_16 = _puppet_crow
  L7_17 = _brain_crow
  L8_18 = "locator2_warp_b_"
  L5_15(L6_16, L7_17, L8_18)
  L6_16 = L4_14
  L5_15 = L4_14.abort
  L5_15(L6_16)
  L4_14 = nil
  L5_15 = Fn_pcSensorOff
  L6_16 = "pccubesensor2_mining_b_01"
  L5_15(L6_16)
  L5_15 = Fn_sendEventComSb
  L6_16 = "crowSetMineObjects"
  L5_15(L6_16)
  L5_15 = CrowJumpEnd
  L6_16 = _brain_crow
  L5_15(L6_16)
  L5_15 = wait
  L5_15()
  L5_15 = _brain_crow
  L6_16 = L5_15
  L5_15 = L5_15.startMine
  L5_15(L6_16)
  _crow_mine = true
  L5_15 = SetCounterStart
  L6_16 = GEM_GOAL
  L5_15(L6_16)
  L5_15 = createMineTimer
  L5_15 = L5_15()
  L6_16 = Fn_pcSensorOn
  L7_17 = "pccubesensor2_mining_area_distant_b_01"
  L6_16(L7_17)
  L6_16 = Fn_pcSensorOn
  L7_17 = "pccubesensor2_mining_area_warning_b"
  L6_16(L7_17)
  L6_16 = Fn_pcSensorOn
  L7_17 = "pccubesensor2_mining_area_warp_b"
  L6_16(L7_17)
  L6_16 = Mv_warningLeaveArea
  L7_17 = "locator2_navi_mining_b_01"
  L8_18 = "sm14_01002"
  L9_19 = true
  L6_16 = L6_16(L7_17, L8_18, L9_19)
  L7_17 = Fn_missionViewWait
  L8_18 = "sm14_01001"
  L7_17(L8_18)
  L7_17 = false
  while true do
    L8_18 = GlobalGem
    L9_19 = L8_18
    L8_18 = L8_18.GetOtherPreciousGemNum
    L8_18 = L8_18(L9_19)
    L9_19 = GEM_GOAL
    if not (L8_18 >= L9_19) then
      L8_18 = getMineTime
      L8_18 = L8_18()
      L9_19 = MINE_EXIT_TIME
      if not (L8_18 >= L9_19) then
        if L0_10 == nil then
          L8_18 = GlobalGem
          L9_19 = L8_18
          L8_18 = L8_18.GetOtherPreciousGemNum
          L8_18 = L8_18(L9_19)
          L9_19 = ADD_ENEMY_TRIGGER_GEM_NUM
          if L8_18 >= L9_19 then
            L8_18 = findGameObject2
            L9_19 = "EnemyGenerator"
            L10_20 = "enmgen2_add_b_01"
            L8_18 = L8_18(L9_19, L10_20)
            L0_10 = L8_18
            if L0_10 ~= nil then
              L9_19 = L0_10
              L8_18 = L0_10.setEnemyMarker
              L10_20 = true
              L8_18(L9_19, L10_20)
              L9_19 = L0_10
              L8_18 = L0_10.requestSpawn
              L8_18(L9_19)
              while true do
                L9_19 = L0_10
                L8_18 = L0_10.isPrepared
                L8_18 = L8_18(L9_19)
                if not L8_18 then
                  L8_18 = wait
                  L8_18()
                end
              end
              L9_19 = L0_10
              L8_18 = L0_10.requestIdlingEnemy
              L10_20 = false
              L8_18(L9_19, L10_20)
            end
          end
        end
        L8_18 = Fn_sendEventComSb
        L9_19 = "crowOreBrokenCount"
        L8_18 = L8_18(L9_19)
        L9_19 = Fn_sendEventComSb
        L10_20 = "kitOreBrokenCount"
        L9_19 = L9_19(L10_20)
        L8_18 = L8_18 - L9_19
        L9_19 = RETRY_ORE_GAP
        if L8_18 >= L9_19 then
          L8_18 = Fn_userCtrlAllOff
          L8_18()
          L8_18 = Player
          L9_19 = L8_18
          L8_18 = L8_18.setStay
          L10_20 = true
          L8_18(L9_19, L10_20)
          L8_18 = CrowJumpPrepare
          L9_19 = _brain_crow
          L8_18(L9_19)
          L8_18 = Fn_sendEventComSb
          L9_19 = "requestIdleEnemy"
          L10_20 = true
          L8_18(L9_19, L10_20)
          L8_18 = waitSeconds
          L9_19 = 2
          L8_18(L9_19)
          L8_18 = Fn_kaiwaDemoView
          L9_19 = "sm14_00440k"
          L8_18(L9_19)
          L8_18 = print
          L9_19 = "\227\131\170\227\131\136\227\131\169\227\130\164\229\174\159\232\161\140"
          L8_18(L9_19)
          L8_18 = Fn_missionRetry
          L8_18()
          break
        end
      end
    end
    L8_18 = wait
    L8_18()
  end
  L8_18 = print
  L9_19 = "\230\142\161\230\142\152\231\181\130\228\186\134\239\188\129\239\188\129\239\188\129\239\188\129"
  L8_18(L9_19)
  L8_18 = Mv_safeTaskAbort
  L9_19 = L5_15
  L8_18 = L8_18(L9_19)
  L5_15 = L8_18
  L8_18 = resetMineTime
  L8_18()
  _crow_mine = false
  L8_18 = Fn_sendEventComSb
  L9_19 = "crowEndMine"
  L8_18(L9_19)
  while true do
    L8_18 = _brain_crow
    L9_19 = L8_18
    L8_18 = L8_18.isMineEnd
    L8_18 = L8_18(L9_19)
    if not L8_18 then
      L8_18 = wait
      L8_18()
    end
  end
  L8_18 = CrowWarpAroundKit
  L9_19 = _puppet_crow
  L10_20 = _brain_crow
  L11_21 = "locator2_warp_b_"
  L8_18(L9_19, L10_20, L11_21)
  L8_18 = _brain_crow
  L9_19 = L8_18
  L8_18 = L8_18.setMoveVelocityRatio
  L10_20 = 1.2
  L11_21 = 0.2
  L8_18(L9_19, L10_20, L11_21)
  L8_18 = Fn_sendEventComSb
  L9_19 = "setOreCaptionActive"
  L10_20 = false
  L8_18(L9_19, L10_20)
  L8_18 = SetCounterEnd
  L8_18()
  L8_18 = Fn_captionViewWait
  L9_19 = "sm14_01003"
  L8_18(L9_19)
  L7_17 = true
  L8_18 = Fn_pcSensorOff
  L9_19 = "pccubesensor2_mining_area_distant_b_01"
  L8_18(L9_19)
  L8_18 = Fn_pcSensorOff
  L9_19 = "pccubesensor2_mining_area_warning_b"
  L8_18(L9_19)
  L8_18 = Fn_pcSensorOff
  L9_19 = "pccubesensor2_mining_area_warp_b"
  L8_18(L9_19)
  L8_18 = Fn_sendEventComSb
  L9_19 = "requestChangeEnemyMarker"
  L10_20 = false
  L8_18(L9_19, L10_20)
  L8_18 = Fn_sendEventComSb
  L9_19 = "requestIdleEnemy"
  L10_20 = true
  L8_18(L9_19, L10_20)
  L8_18 = Fn_userCtrlAllOff
  L8_18()
  L8_18 = Player
  L9_19 = L8_18
  L8_18 = L8_18.setStay
  L10_20 = true
  L8_18(L9_19, L10_20)
  L8_18 = false
  L9_19 = 0
  L10_20 = 3
  L11_21 = invokeTask
  function L12_22()
    while true do
      if L9_19 > L10_20 then
        L8_18 = true
      end
      waitSeconds(1)
      L9_19 = L9_19 + 1
    end
  end
  L11_21 = L11_21(L12_22)
  L12_22 = Mv_viewObjWait
  L13_23 = _puppet_crow
  L14_24 = 0.8
  L12_22 = L12_22(L13_23, L14_24)
  while true do
    L13_23 = print
    L14_24 = "\227\130\175\227\131\173\227\130\166\227\129\168\227\129\174\232\183\157\233\155\162 : "
    L15_25 = Fn_getDistanceToPlayer
    L15_25 = L15_25(_puppet_crow)
    L14_24 = L14_24 .. L15_25
    L13_23(L14_24)
    if L7_17 then
      L13_23 = Fn_getDistanceToPlayer
      L14_24 = _puppet_crow
      L13_23 = L13_23(L14_24)
      L14_24 = CROW_NEAR_DISTANCE
      if L13_23 < L14_24 then
        L13_23 = Mv_safeTaskAbort
        L14_24 = L11_21
        L13_23 = L13_23(L14_24)
        L11_21 = L13_23
        L13_23 = _brain_crow
        L14_24 = L13_23
        L13_23 = L13_23.setIdling
        L15_25 = true
        L13_23(L14_24, L15_25)
        L13_23 = waitSeconds
        L14_24 = 1
        L13_23(L14_24)
        break
      end
    end
    L13_23 = _brain_crow
    L14_24 = L13_23
    L13_23 = L13_23.isIdling
    L13_23 = L13_23(L14_24)
    if L13_23 then
      L13_23 = _brain_crow
      L14_24 = L13_23
      L13_23 = L13_23.setIdling
      L15_25 = false
      L13_23(L14_24, L15_25)
    end
    if L8_18 then
      L13_23 = Mv_safeTaskAbort
      L14_24 = L11_21
      L13_23 = L13_23(L14_24)
      L11_21 = L13_23
      break
    end
    L13_23 = wait
    L13_23()
  end
  L13_23 = Mv_safeTaskAbort
  L14_24 = L12_22
  L13_23 = L13_23(L14_24)
  L12_22 = L13_23
  L14_24 = L6_16
  L13_23 = L6_16.abort
  L13_23(L14_24)
  L6_16 = nil
  L13_23 = CrowJumpPrepare
  L14_24 = _brain_crow
  L13_23(L14_24)
  L13_23 = Fn_sendEventComSb
  L14_24 = "requestIdleEnemy"
  L15_25 = true
  L13_23(L14_24, L15_25)
  L13_23 = Fn_kaiwaDemoView
  L14_24 = "sm14_00400k"
  L13_23(L14_24)
  L13_23 = Fn_sendSetOtherPreciousGemNum
  L14_24 = 0
  L13_23(L14_24)
  L13_23 = Player
  L14_24 = L13_23
  L13_23 = L13_23.setStay
  L15_25 = false
  L13_23(L14_24, L15_25)
  L13_23 = Fn_userCtrlOn
  L13_23()
  L13_23 = _brain_crow
  L14_24 = L13_23
  L13_23 = L13_23.setAbility
  L15_25 = Supporter
  L15_25 = L15_25.Ability
  L15_25 = L15_25.ActionInAir
  L13_23(L14_24, L15_25, true)
  L13_23 = _brain_crow
  L14_24 = L13_23
  L13_23 = L13_23.setMoveVelocityRatio
  L15_25 = 1
  L13_23(L14_24, L15_25, 0)
  L13_23 = _brain_crow
  L14_24 = L13_23
  L13_23 = L13_23.setIdling
  L15_25 = false
  L13_23(L14_24, L15_25)
  L13_23 = Fn_sendEventComSb
  L14_24 = "requestIdleEnemy"
  L15_25 = false
  L13_23(L14_24, L15_25)
  L13_23 = Fn_missionView
  L14_24 = "sm14_01005"
  L13_23(L14_24)
  L13_23 = waitSeconds
  L14_24 = 1.3
  L13_23(L14_24)
  L13_23 = Mv_viewObj
  L14_24 = "locator2_navi_mining_b_02"
  L15_25 = 0.3
  L13_23 = L13_23(L14_24, L15_25)
  L14_24 = Fn_naviSet
  L15_25 = findGameObject2
  L15_25 = L15_25("Node", "locator2_navi_mining_b_02")
  L14_24(L15_25, L15_25("Node", "locator2_navi_mining_b_02"))
  L14_24 = Fn_pcSensorOn
  L15_25 = "pccubesensor2_mining_b_02"
  L14_24(L15_25)
  L14_24 = Fn_pcSensorOn
  L15_25 = "pccubesensor2_mining_area_distant_b_02"
  L14_24(L15_25)
  L14_24 = Fn_pcSensorOn
  L15_25 = "pccubesensor2_next_area_warning_b"
  L14_24(L15_25)
  L14_24 = Fn_pcSensorOn
  L15_25 = "pccubesensor2_next_area_warp_b"
  L14_24(L15_25)
  L14_24 = Mv_warningLeaveArea
  L15_25 = "locator2_navi_mining_b_02"
  L14_24 = L14_24(L15_25, "sm14_01004", false)
  L15_25 = Fn_sendEventComSb
  L15_25("requestChangeEnemyMarker", false)
  L15_25 = L0_10.setEnemyMarker
  L15_25(L0_10, false)
  L15_25 = Fn_sendEventComSb
  L15_25("changeAreaNum", 2)
  L15_25 = Fn_sendEventComSb
  L15_25("resetAllCountFlag")
  L15_25 = findGameObject2
  L15_25 = L15_25("Node", "locator2_navi_mining_b_02")
  while not (Fn_getDistanceToPlayer(L15_25) < CAPTION_TRIGGER_DISTANCE) do
    wait()
  end
  Fn_captionViewWait("sm14_01006")
  Fn_captionViewWait("sm14_01007")
  Mv_waitPhase()
  L14_24:abort()
  L14_24 = nil
  CrowWarpAroundKit(_puppet_crow, _brain_crow, "locator2_warp_c1_")
  Mv_warningLeaveArea("locator2_navi_mining_b_02", "sm14_01000", true):abort()
  Fn_pcSensorOff("pccubesensor2_mining_b_02")
  Fn_pcSensorOff("pccubesensor2_mining_area_distant_b_02")
  Fn_pcSensorOff("pccubesensor2_next_area_warning_b")
  Fn_pcSensorOff("pccubesensor2_next_area_warp_b")
  waitSeconds(1)
  Fn_blackout()
  Fn_userCtrlOff()
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
  Mv_setLeaveArea(false)
end
function pccubesensor2_mining_OnLeave()
  Mv_setLeaveArea(true)
end
function pccubesensor2_mining_area_distant_OnEnter()
  Mv_setLeaveArea(false)
end
function pccubesensor2_mining_area_distant_OnLeave()
  Mv_setLeaveArea(true)
end
function pccubesensor2_catwarp_warning_mining_OnLeave()
  warningCatWarp("locator2_navi_mining_b_01")
end
function pccubesensor2_catwarp_warning_next_OnLeave()
  warningCatWarp("locator2_navi_mining_b_02")
end
function pccubesensor2_catwarp_OnLeave()
  catWarp()
end
