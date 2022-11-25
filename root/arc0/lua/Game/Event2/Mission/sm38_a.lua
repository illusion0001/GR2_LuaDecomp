dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/sm38_common.lua")
_puppet_tbl = {}
_goto_next_phase = false
_god_warp_node = "locator2_sm38_a_dog"
_is_catwarp = false
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "escape_dog_01",
      type = "dog01",
      node = "locator2_sm38_a_dog",
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_findNpc
  L1_2 = "escape_dog_01"
  L0_1 = L0_1(L1_2)
  function L1_2()
    Fn_warpNpc("escape_dog_01", _god_warp_node)
  end
  L3_4 = L0_1
  L2_3 = L0_1.setEventListener
  L4_5 = "npcFall"
  L5_6 = L1_2
  L2_3(L3_4, L4_5, L5_6)
  L2_3 = false
  L3_4 = Fn_sendEventComSb
  L4_5 = "StartMobTask"
  L3_4(L4_5)
  L3_4 = Fn_missionStart
  L3_4()
  L3_4 = Fn_kaiwaDemoView
  L4_5 = "sm38_00100k"
  L3_4(L4_5)
  L3_4 = Fn_turnNpc
  L4_5 = "sm38_client"
  L5_6 = findGameObject2
  L6_7 = "Node"
  L7_8 = "locator2_pc_turn"
  L5_6 = L5_6(L6_7, L7_8)
  L6_7 = L5_6
  L5_6 = L5_6.getWorldPos
  L14_15 = L5_6(L6_7)
  L3_4(L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L5_6(L6_7))
  L3_4 = Fn_findNpc
  L4_5 = "sm38_client"
  L3_4 = L3_4(L4_5)
  L5_6 = L3_4
  L4_5 = L3_4.turn
  L6_7 = Fn_findNpc
  L7_8 = "escape_dog_01"
  L6_7 = L6_7(L7_8)
  L7_8 = L6_7
  L6_7 = L6_7.getWorldPos
  L14_15 = L6_7(L7_8)
  L4_5(L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L6_7(L7_8))
  L4_5 = invokeTask
  function L5_6()
    Fn_playMotionNpc("sm38_client", "inform_in", true, {animBlendDuration = 0.3})
    Fn_playMotionNpc("sm38_client", "inform_lp", true, {animBlendDuration = 0.3})
    Fn_playMotionNpc("sm38_client", "inform_ed", true, {animBlendDuration = 0.3})
    Fn_playMotionNpc("sm38_client", "stay", false, {animBlendDuration = 0.3})
  end
  L4_5(L5_6)
  L4_5 = findGameObject2
  L5_6 = "Node"
  L6_7 = "locator2_pc_turn"
  L4_5 = L4_5(L5_6, L6_7)
  L5_6 = L4_5
  L4_5 = L4_5.getWorldPos
  L4_5 = L4_5(L5_6)
  L5_6 = Player
  L6_7 = L5_6
  L5_6 = L5_6.setLookAtIk
  L7_8 = true
  L8_9 = 1
  L9_10 = L4_5
  L5_6(L6_7, L7_8, L8_9, L9_10)
  L5_6 = waitSeconds
  L6_7 = 1
  L5_6(L6_7)
  L5_6 = Fn_lookAtObject
  L6_7 = "locator2_sm38_a_dog"
  L5_6 = L5_6(L6_7)
  while true do
    L6_7 = Fn_isInSightTarget
    L7_8 = "locator2_sm38_a_dog"
    L6_7 = L6_7(L7_8)
    if not L6_7 then
      L6_7 = wait
      L6_7()
    end
  end
  L6_7 = waitSeconds
  L7_8 = 1
  L6_7(L7_8)
  if L5_6 ~= nil then
    L7_8 = L5_6
    L6_7 = L5_6.abort
    L6_7(L7_8)
  end
  L6_7 = Player
  L7_8 = L6_7
  L6_7 = L6_7.setLookAtIk
  L8_9 = false
  L9_10 = 1
  L10_11 = L4_5
  L6_7(L7_8, L8_9, L9_10, L10_11)
  L6_7 = waitSeconds
  L7_8 = 1
  L6_7(L7_8)
  L6_7 = Fn_kaiwaDemoView
  L7_8 = "sm38_00200k"
  L6_7(L7_8)
  L6_7 = RAC_setSightParam
  L7_8 = "sm38_client"
  L6_7(L7_8)
  L6_7 = Fn_userCtrlOn
  L6_7()
  L6_7 = HUD
  L7_8 = L6_7
  L6_7 = L6_7.naviSetPochiDistanceDensity0
  L8_9 = 15
  L6_7(L7_8, L8_9)
  L6_7 = HUD
  L7_8 = L6_7
  L6_7 = L6_7.naviSetPochiDistanceDensity100
  L8_9 = 18
  L6_7(L7_8, L8_9)
  L6_7 = RAC_missionNaviCaption
  L7_8 = "sm38_00102"
  L8_9 = _puppet_tbl
  L8_9 = L8_9.escape_dog_01
  L6_7(L7_8, L8_9)
  L6_7 = {}
  L6_7.anim_speed_over = true
  L6_7.anim_run_speed = 1.3
  L6_7.arrivedLength = 0.5
  L6_7.runLength = -1
  L6_7.noTurn = true
  L7_8 = turnDogTask
  L7_8 = L7_8()
  L8_9 = Fn_sendEventComSb
  L9_10 = "setTutorialCaption"
  L8_9(L9_10)
  while true do
    while true do
      L8_9 = Fn_setGrabNpc
      L9_10 = L0_1
      L10_11 = false
      L11_12 = false
      L8_9(L9_10, L10_11, L11_12)
      L8_9 = Fn_getDistanceToPlayer
      L9_10 = _puppet_tbl
      L9_10 = L9_10.escape_dog_01
      L8_9 = L8_9(L9_10)
      if not (L8_9 <= 10) then
        L9_10 = RAC_RaycastEyeSightBase
        L10_11 = _puppet_tbl
        L10_11 = L10_11.escape_dog_01
        L11_12 = Fn_getPlayer
        L11_12 = L11_12()
        L12_13 = 10
        L13_14 = 80
        L14_15 = 1
        L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, 0.5)
        if L9_10 ~= true then
          L10_11 = L0_1
          L9_10 = L0_1.isGrabbed
          L9_10 = L9_10(L10_11)
          if not L9_10 then
            L9_10 = Player
            L10_11 = L9_10
            L9_10 = L9_10.getGrabObjectCount
            L9_10 = L9_10(L10_11)
          end
        end
      elseif L9_10 > 0 then
        L9_10 = {L10_11, L11_12}
        L10_11 = "locator2_sm38_a_dog_esc_pos_02"
        L11_12 = "locator2_sm38_a_dog_esc_pos_04"
        if L7_8 ~= nil then
          L11_12 = L7_8
          L10_11 = L7_8.abort
          L10_11(L11_12)
          L7_8 = nil
        end
        L10_11 = Fn_setGrabReleaseNpc
        L11_12 = "escape_dog_01"
        L10_11(L11_12)
        L10_11 = Fn_moveNpc
        L11_12 = "escape_dog_01"
        L12_13 = L9_10
        L13_14 = L6_7
        L10_11 = L10_11(L11_12, L12_13, L13_14)
        _dog_move_task = L10_11
        L10_11 = Fn_missionViewEnd
        L10_11()
        L10_11 = Fn_sendEventComSb
        L11_12 = "killTutorialCaption"
        L10_11(L11_12)
        L10_11 = Fn_userCtrlAllOff
        L10_11()
        L10_11 = waitSeconds
        L11_12 = 1
        L10_11(L11_12)
        L10_11 = Fn_captionView
        L11_12 = "sm38_00103"
        L10_11(L11_12)
        L10_11 = Fn_lookAtObject
        L11_12 = _puppet_tbl
        L11_12 = L11_12.escape_dog_01
        L10_11 = L10_11(L11_12)
        L11_12 = waitSeconds
        L12_13 = 3
        L11_12(L12_13)
        L12_13 = L10_11
        L11_12 = L10_11.abort
        L11_12(L12_13)
        L10_11 = nil
        break
      end
      L9_10 = wait
      L9_10()
    end
  end
  while true do
    L8_9 = _is_catwarp
    if L8_9 then
      L8_9 = wait
      L8_9()
    end
  end
  L8_9 = Fn_kaiwaDemoView
  L9_10 = "sm38_00300k"
  L8_9(L9_10)
  L8_9 = Player
  L9_10 = L8_9
  L8_9 = L8_9.dropGrabObject
  L8_9(L9_10)
  L8_9 = Fn_setGrabNpc
  L9_10 = L0_1
  L10_11 = true
  L11_12 = true
  L8_9(L9_10, L10_11, L11_12)
  L8_9 = Fn_pcSensorOff
  L9_10 = "pccubesensormulti2_area_out_near_a_prologue"
  L8_9(L9_10)
  L8_9 = Fn_pcSensorOff
  L9_10 = "pccubesensormulti2_area_out_far_a_prologue"
  L8_9(L9_10)
  function L8_9()
    Fn_tutorialCaptionKill()
    L1_2()
  end
  L9_10 = RAC_startCatWarpControl
  L10_11 = "sm38_a_area_out"
  L11_12 = nil
  L12_13 = "pccubesensor2_area_out_near_a_01"
  L13_14 = "pccubesensor2_area_out_far_a_01"
  L14_15 = "locator2_pc_return_pos_a_01"
  L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, nil, "locator2_pc_return_pos_a_01", "sm38_09013", nil, L8_9)
  L9_10 = Fn_missionView
  L10_11 = "sm38_00102"
  L9_10(L10_11)
  L9_10 = Fn_userCtrlOn
  L9_10()
  while true do
    L9_10 = _dog_move_task
    L10_11 = L9_10
    L9_10 = L9_10.isRunning
    L9_10 = L9_10(L10_11)
    if L9_10 then
      L9_10 = wait
      L9_10()
    end
  end
  L9_10 = _dog_move_task
  L10_11 = L9_10
  L9_10 = L9_10.abort
  L9_10(L10_11)
  _dog_move_task = nil
  while true do
    L9_10 = wait
    L9_10()
    L9_10 = false
    L10_11 = Fn_isInSightTarget
    L11_12 = _puppet_tbl
    L11_12 = L11_12.escape_dog_01
    L12_13 = 1
    L10_11 = L10_11(L11_12, L12_13)
    if L10_11 then
      L10_11 = Camera
      L11_12 = L10_11
      L10_11 = L10_11.getEyePos
      L10_11 = L10_11(L11_12)
      L11_12 = _puppet_tbl
      L11_12 = L11_12.escape_dog_01
      L12_13 = L11_12
      L11_12 = L11_12.getWorldPos
      L11_12 = L11_12(L12_13)
      L12_13 = Fn_getDistanceToPlayer
      L13_14 = L11_12
      L12_13 = L12_13(L13_14)
      L13_14 = Query
      L14_15 = L13_14
      L13_14 = L13_14.setEyeSightRange
      L13_14(L14_15, L12_13 + 1)
      L13_14 = _puppet_tbl
      L13_14 = L13_14.escape_dog_01
      L14_15 = L13_14
      L13_14 = L13_14.getWorldTransform
      L14_15 = L13_14(L14_15)
      L13_14.y = L13_14.y + 1
      Query:setEyeSightTransform(L13_14, L14_15)
    end
    if Query:raycastEyeSight(L10_11) ~= nil then
    end
  end
  _god_warp_node = "locator2_sm38_a_dog_esc_pos_04"
  L9_10 = Fn_captionView
  L10_11 = "sm38_00104"
  L9_10(L10_11)
  L9_10 = HUD
  L10_11 = L9_10
  L9_10 = L9_10.naviSetPochiDistanceDensity0
  L11_12 = 10
  L9_10(L10_11, L11_12)
  L9_10 = HUD
  L10_11 = L9_10
  L9_10 = L9_10.naviSetPochiDistanceDensity100
  L11_12 = 12
  L9_10(L10_11, L11_12)
  L9_10 = Fn_lookAtObject
  L10_11 = Fn_findNpcPuppet
  L11_12 = "escape_dog_01"
  L14_15 = L10_11(L11_12)
  L9_10 = L9_10(L10_11, L11_12, L12_13, L13_14, L14_15, L10_11(L11_12))
  L10_11 = Fn_userCtrlAllOff
  L10_11()
  while true do
    L10_11 = Fn_isInSightTarget
    L11_12 = Fn_findNpcPuppet
    L12_13 = "escape_dog_01"
    L11_12 = L11_12(L12_13)
    L12_13 = 0.5
    L10_11 = L10_11(L11_12, L12_13)
    if not L10_11 then
      L10_11 = wait
      L10_11()
    end
  end
  L10_11 = waitSeconds
  L11_12 = 3
  L10_11(L11_12)
  L10_11 = Fn_userCtrlOn
  L10_11()
  L11_12 = L9_10
  L10_11 = L9_10.abort
  L10_11(L11_12)
  L10_11 = Fn_setGrabNpc
  L11_12 = L0_1
  L12_13 = false
  L13_14 = false
  L10_11(L11_12, L12_13, L13_14)
  L10_11 = invokeTask
  function L11_12()
    while true do
      Fn_sendEventComSb("setTutorialCaption")
      wait()
    end
  end
  L10_11 = L10_11(L11_12)
  L11_12 = SM38_initDogAutoFrame
  L12_13 = {L13_14}
  L13_14 = 1
  L11_12(L12_13)
  L11_12 = {L12_13, L13_14}
  L12_13 = {
    L13_14,
    L14_15,
    "sm38_00107"
  }
  L13_14 = "sm38_00105"
  L14_15 = "sm38_00106"
  L13_14 = {
    L14_15,
    "sm38_00109",
    "sm38_00110"
  }
  L14_15 = "sm38_00108"
  L12_13 = {}
  L13_14 = _puppet_tbl
  L13_14 = L13_14.escape_dog_01
  L12_13.puppet = L13_14
  L12_13.per_pos = "locator2_sm38_a_dog_esc_pos_01"
  L13_14 = {}
  L13_14.prefix = "locator2_sm38_a_dog_esc_pos_"
  L14_15 = {
    {"05"},
    {"03"},
    {"04"},
    {"05"},
    {"06"},
    {"07"},
    {"03"}
  }
  L13_14.index_tbl = L14_15
  while true do
    L14_15 = SM38_catchDogLoop
    L14_15 = L14_15(L11_12, L12_13, L13_14, L6_7, "A", nil)
    if L14_15 == false then
    end
  end
  L14_15 = _dog_move_task
  if L14_15 ~= nil then
    L14_15 = _dog_move_task
    L14_15 = L14_15.abort
    L14_15(L14_15)
    _dog_move_task = nil
  end
  L12_13 = L10_11
  L11_12 = L10_11.abort
  L11_12(L12_13)
  L10_11 = nil
  L11_12 = {L12_13, L13_14}
  L12_13 = "locator2_sm38_a_dog_esc_pos_08"
  L13_14 = "locator2_sm38_a_dog_esc_pos_09"
  L12_13 = {}
  L12_13.anim_speed_over = true
  L12_13.anim_run_speed = 1.5
  L12_13.runLength = -1
  L6_7 = L12_13
  L12_13 = Fn_moveNpc
  L13_14 = "escape_dog_01"
  L14_15 = L11_12
  L12_13(L13_14, L14_15, L6_7)
  L12_13 = waitSeconds
  L13_14 = 1
  L12_13(L13_14)
  _god_warp_node = "locator2_sm38_a_dog_esc_pos_09"
  L12_13 = Fn_lookAtObject
  L13_14 = Fn_findNpcPuppet
  L14_15 = "escape_dog_01"
  L14_15 = L13_14(L14_15)
  L12_13 = L12_13(L13_14, L14_15, L13_14(L14_15))
  L13_14 = Fn_userCtrlAllOff
  L13_14()
  while true do
    L13_14 = Fn_isInSightTarget
    L14_15 = Fn_findNpcPuppet
    L14_15 = L14_15("escape_dog_01")
    L13_14 = L13_14(L14_15, 0.5)
    if not L13_14 then
      L13_14 = wait
      L13_14()
    end
  end
  L13_14 = findGameObject2
  L14_15 = "Node"
  L13_14 = L13_14(L14_15, "locator2_sm38_a_dog_esc_pos_09")
  L14_15 = L13_14
  L13_14 = L13_14.getWorldPos
  L13_14 = L13_14(L14_15)
  L14_15 = Player
  L14_15 = L14_15.setLookAtIk
  L14_15(L14_15, true, 1, L13_14)
  L14_15 = waitSeconds
  L14_15(1)
  L14_15 = Fn_captionViewWait
  L14_15("sm38_00111")
  if L12_13 ~= nil then
    L14_15 = L12_13.abort
    L14_15(L12_13)
  end
  L14_15 = Player
  L14_15 = L14_15.setLookAtIk
  L14_15(L14_15, false, 1, L13_14)
  L14_15 = Player
  L14_15 = L14_15.dropGrabObject
  L14_15(L14_15)
  L14_15 = Fn_kaiwaDemoView
  L14_15("sm38_00400k")
  L14_15 = Fn_naviKill
  L14_15()
  L14_15 = RAC_endCatWarpControl
  L14_15("sm38_a_area_out")
  L14_15 = Fn_setKeepPlayerPos
  L14_15()
  L14_15 = Fn_setNextMissionFlag
  L14_15()
  L14_15 = Fn_nextMission
  L14_15()
  L14_15 = Fn_exitSandbox
  L14_15()
end
function Finalize()
  local L0_16, L1_17
end
function turnDogTask()
  return invokeTask(function()
    while true do
      Fn_turnNpc("escape_dog_01")
    end
  end)
end
function pccubesensormulti2_area_out_near_a_prologue_OnLeave()
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setStay(true)
    RAC_LookAtObject("locator2_pc_return_pos_a_01", 0, 0.2)
    Fn_tutorialCaptionKill()
    RAC_missionNaviCaption(nil, nil, "sm38_09013")
    invokeTask(function()
      waitSeconds(3)
      Fn_tutorialCaption("grab")
    end)
    Player:setStay(false)
    Fn_userCtrlOn()
  end)
end
function pccubesensormulti2_area_out_far_a_prologue_OnLeave()
  invokeTask(function()
    _is_catwarp = true
    Fn_userCtrlAllOff()
    Fn_catWarpIn()
    Fn_setCatWarpCheckPoint("locator2_pc_return_pos_a_01")
    Fn_catWarpCheckPoint()
    wait()
    Fn_tutorialCaptionKill()
    Fn_warpNpc("escape_dog_01", _god_warp_node)
    Fn_catWarpOut()
    while not HUD:faderStability() do
      wait()
    end
    wait(15)
    Fn_tutorialCaption("grab")
    Fn_userCtrlOn()
    waitSeconds(1)
    _is_catwarp = false
  end)
end
