dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Debug/ShortcutKey/user_test_stage.lua")
dofile("/Game/TestScript/action_review_common.lua")
dofile("/Game/Misc/sdemo.lua")
import("Camera")
import("Font")
__puppet_tbl = {}
__next_phase = false
__view_pos = nil
BEFORE_DISP_NAVI_WAIT = 0.2
__crate_cap_wait = 20
__enemy_cnt = 0
__navi09_on_enter = false
__stop_cap = false
__time_cnt = 0
__gemtime_cnt = 0
__gemset = false
__ars_cat_warp = false
__ars_cat_warp_inrange = 1
enmgen2_battle_a_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_a_01",
      name = "speciala01"
    },
    {
      type = "stalker",
      locator = "locator_ene_a_02",
      name = "speciala02"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_9)
  end
}
enmgen2_battle_a_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_a_03",
      name = "speciala03"
    },
    {
      type = "runner",
      locator = "locator_ene_a_04",
      name = "speciala04"
    },
    {
      type = "stalker",
      locator = "locator_ene_a_05",
      name = "speciala05"
    }
  },
  onUpdate = function(A0_10)
    local L1_11
  end,
  onEnter = function(A0_12)
    local L1_13
  end,
  onLeave = function(A0_14)
    local L1_15
  end,
  onObjectDead = function(A0_16, A1_17)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
    lowlife_gemset(A1_17)
  end
}
function Initialize()
  local L0_18, L1_19, L2_20, L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27
  L0_18 = Fn_setCatWarp
  L1_19 = false
  L0_18(L1_19)
  L0_18 = mother2
  L1_19 = L0_18
  L0_18 = L0_18.sendEvent
  L2_20 = "getBackgroundElement2Handle"
  L0_18 = L0_18(L1_19, L2_20, L3_21)
  L1_19 = loadFileAsset
  L2_20 = "evb"
  L1_19 = L1_19(L2_20, L3_21)
  L2_20 = L1_19.wait
  L2_20(L3_21)
  L2_20 = EventData
  L2_20 = L2_20.create
  L9_27 = L6_24(L7_25)
  L2_20(L3_21, L4_22, L5_23, L6_24, L7_25, L8_26, L9_27, L6_24(L7_25))
  L2_20 = {L3_21}
  L3_21.name = "npc_dus01"
  L3_21.type = "dus01"
  L3_21.node = "locator2_dusty_01"
  L3_21(L4_22)
  _chi_pupp = L3_21
  for L6_24, L7_25 in L3_21(L4_22) do
    L9_27 = L7_25.name
    L9_27 = __puppet_tbl
    L9_27[L7_25.name] = L8_26:getPuppet()
  end
  cam_hdl = L3_21
  L3_21(L4_22, L5_23)
  cam_node = L3_21
  L3_21(L4_22, L5_23)
  L3_21(L4_22, L5_23)
  aim_node = L3_21
  L3_21(L4_22, L5_23)
  _sdemo = L5_23
  L5_23(L6_24, L7_25, L8_26)
  sim_hdl = L6_24
  L6_24(L7_25, L8_26)
  L6_24(L7_25, L8_26)
  L9_27 = 0
  L9_27 = L8_26(L9_27, -6, 0)
  L6_24(L7_25, L8_26, L9_27, L8_26(L9_27, -6, 0))
  L6_24(L7_25, L8_26)
  L6_24(L7_25, L8_26)
  for L9_27 = 1, 9 do
    GemSetDisp(L9_27, false)
  end
  L6_24()
end
function Ingame()
  local L0_28, L1_29, L2_30, L3_31, L4_32, L5_33, L6_34, L7_35, L8_36
  L0_28 = Debug
  L0_28 = L0_28.setSwitch
  L4_32 = "Console"
  L5_33 = "Script"
  L0_28(L1_29, L2_30, L3_31)
  L0_28 = move_area_po_a_06
  L0_28()
  L0_28 = invokeTask
  L0_28(L1_29)
  L0_28 = {}
  for L4_32 = 1, 8 do
    L5_33 = findGameObject2
    L6_34 = "Node"
    L7_35 = "pccubesensor2_tut_"
    L8_36 = string
    L8_36 = L8_36.format
    L8_36 = L8_36("%02d", L4_32)
    L7_35 = L7_35 .. L8_36
    L5_33 = L5_33(L6_34, L7_35)
    L0_28[L4_32] = L5_33
  end
  L1_29(L2_30)
  L4_32 = true
  L1_29(L2_30, L3_31, L4_32)
  L1_29(L2_30)
  L4_32 = true
  L1_29(L2_30, L3_31, L4_32)
  L1_29(L2_30)
  L4_32 = false
  L1_29(L2_30, L3_31, L4_32)
  L1_29(L2_30)
  __ars_cat_warp_inrange = L1_29
  cat_warp = L1_29
  L4_32 = false
  L1_29(L2_30, L3_31, L4_32)
  L4_32 = Camera
  L4_32 = L4_32.kControl_All
  L5_33 = false
  L1_29(L2_30, L3_31, L4_32, L5_33)
  L3_31.unique = "ui_gaiku_01_16"
  L3_31.section = "ui_gaiku_02_16"
  L3_31.town = "ui_gaiku_03_02"
  L1_29(L2_30, L3_31)
  L5_33 = L1_29
  L4_32 = L1_29.getWorldPos
  L8_36 = L4_32(L5_33)
  L2_30(L3_31, L4_32, L5_33, L6_34, L7_35, L8_36, L4_32(L5_33))
  L2_30(L3_31)
  L4_32 = "locator2_aim_02"
  L4_32 = L3_31
  L6_34 = L2_30
  L5_33 = L2_30.getWorldPos
  L8_36 = L5_33(L6_34)
  L3_31(L4_32, L5_33, L6_34, L7_35, L8_36, L5_33(L6_34))
  L4_32 = L3_31
  L3_31(L4_32)
  L4_32 = L3_31
  L5_33 = aim_node
  L6_34 = Vector
  L7_35 = 5
  L8_36 = 8.5
  L8_36 = L6_34(L7_35, L8_36, 0)
  L3_31(L4_32, L5_33, L6_34, L7_35, L8_36, L6_34(L7_35, L8_36, 0))
  L4_32 = L3_31
  L5_33 = true
  L3_31(L4_32, L5_33)
  L3_31()
  L4_32 = L3_31
  L5_33 = false
  L6_34 = 7.5
  L3_31(L4_32, L5_33, L6_34)
  L4_32 = 7.5
  L3_31(L4_32)
  L4_32 = "ar_00560"
  L5_33 = 3
  L6_34 = true
  L3_31(L4_32, L5_33, L6_34)
  L4_32 = "locator2_dusty_02"
  L4_32 = Fn_moveChara
  L5_33 = "npc_dus01"
  L6_34 = L3_31
  L7_35 = {}
  L7_35.run = -1
  L4_32 = L4_32(L5_33, L6_34, L7_35)
  L5_33 = _sdemo
  L6_34 = L5_33
  L5_33 = L5_33.play
  L5_33(L6_34)
  while true do
    L6_34 = L4_32
    L5_33 = L4_32.isRunning
    L5_33 = L5_33(L6_34)
    if L5_33 then
      L5_33 = wait
      L5_33()
    end
  end
  L4_32 = nil
  L5_33 = Fn_kaiwaDemoView
  L6_34 = "action_review_00100k"
  L5_33(L6_34)
  L5_33 = {L6_34, L7_35}
  L6_34 = "locator2_dusty_08"
  L7_35 = "locator2_dusty_03"
  L6_34 = Fn_moveChara
  L7_35 = "npc_dus01"
  L8_36 = L5_33
  L6_34 = L6_34(L7_35, L8_36, {run = -1}, {run = 1.5})
  L7_35 = waitSeconds
  L8_36 = 2
  L7_35(L8_36)
  L7_35 = _sdemo
  L8_36 = L7_35
  L7_35 = L7_35.stop
  L7_35(L8_36, 2)
  L7_35 = Fn_captionView
  L8_36 = "ar_00570"
  L7_35(L8_36, 3, true)
  L7_35 = Fn_userCtrlGravityOff
  L7_35()
  L7_35 = Player
  L8_36 = L7_35
  L7_35 = L7_35.setControl
  L7_35(L8_36, Player.kControl_All, true)
  L7_35 = Camera
  L8_36 = L7_35
  L7_35 = L7_35.setControl
  L7_35(L8_36, Camera.kPlayer, Camera.kControl_All, true)
  L7_35 = NaviSet_Auto
  L8_36 = findGameObject2
  L8_36 = L8_36("Node", "pccubesensor2_dusty_01")
  L7_35(L8_36, 40, 15)
  L7_35 = Fn_captionView
  L8_36 = "ar_00590"
  L7_35(L8_36, 0, false)
  L7_35 = waitSeconds
  L8_36 = 1.5
  L7_35(L8_36)
  L7_35 = Fn_TutorialStartView
  L8_36 = {}
  L8_36.view = {mission_target = "ar_00580"}
  L7_35(L8_36)
  while true do
    L8_36 = L6_34
    L7_35 = L6_34.isRunning
    L7_35 = L7_35(L8_36)
    if L7_35 then
      L7_35 = wait
      L7_35()
    end
  end
  L6_34 = nil
  L7_35 = waitPhace
  L7_35()
  cap_flag = true
  L7_35 = Sound
  L8_36 = L7_35
  L7_35 = L7_35.pulse
  L7_35(L8_36, "success")
  L7_35 = Fn_kaiwaDemoView
  L8_36 = "action_review_00200k"
  L7_35(L8_36)
  L7_35 = Fn_disappearChara
  L8_36 = "npc_dus01"
  L7_35(L8_36, 0)
  L7_35 = Fn_setCatActive
  L8_36 = true
  L7_35(L8_36)
  L7_35 = Fn_userCtrlOn
  L7_35()
  L7_35 = Player
  L8_36 = L7_35
  L7_35 = L7_35.setAbility
  L7_35(L8_36, Player.kAbility_AttrTuneSwitch, false)
  L7_35 = Player
  L8_36 = L7_35
  L7_35 = L7_35.setAbility
  L7_35(L8_36, Player.kAbility_SpAttack, false)
  L7_35 = Fn_pcSensorOff
  L8_36 = "pccubesensor2_ars_a01"
  L7_35(L8_36)
  L7_35 = Fn_pcSensorOn
  L8_36 = "pccubesensor2_ars_01"
  L7_35(L8_36)
  L7_35 = Fn_setCheckPoint
  L8_36 = "locator2_restart_01"
  L7_35(L8_36)
  L7_35 = Fn_userCtrlOff
  L7_35()
  L7_35 = Camera
  L8_36 = L7_35
  L7_35 = L7_35.setControl
  L7_35(L8_36, Camera.kPlayer, Camera.kControl_All, false)
  L7_35 = findGameObject2
  L8_36 = "Node"
  L7_35 = L7_35(L8_36, "locator2_aim_03")
  L8_36 = L7_35.getWorldPos
  L8_36 = L8_36(L7_35)
  __view_pos = L8_36
  L8_36 = Fn_captionView
  L8_36("ar_00600")
  L8_36 = NaviSet_Auto
  L8_36(L0_28[1], 14, 7)
  L8_36 = GemSetDisp
  L8_36(1, true)
  L8_36 = Fn_TutorialStartView
  L8_36({
    view = {mission_target = "ar_00610"}
  })
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityShift, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityBoost, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityRevert, false)
  L8_36 = Fn_captionView
  L8_36("ar_00612", 0, false)
  L8_36 = pc_gravity_control_mode_wait
  L8_36()
  L8_36 = Sound
  L8_36 = L8_36.pulse
  L8_36(L8_36, "success")
  L8_36 = Fn_captionViewEnd
  L8_36()
  L8_36 = L0_28[1]
  L8_36 = L8_36.getWorldPos
  L8_36 = L8_36(L8_36)
  __view_pos = L8_36
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityShift, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityBoost, false)
  L8_36 = waitSeconds
  L8_36(1)
  L8_36 = Fn_captionView
  L8_36("ar_00617", 0, false)
  L8_36 = Player
  L8_36 = L8_36.setControl
  L8_36(L8_36, Player.kControl_Stick, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityShift, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityBoost, true)
  L8_36 = pc_jump_wait
  L8_36()
  __view_pos = nil
  while true do
    L8_36 = pc_target_near_wait
    L8_36(L0_28[1], 3)
    L8_36 = Player
    L8_36 = L8_36.getAction
    L8_36 = L8_36(L8_36)
    if L8_36 ~= Player.kAction_Idle then
      wait()
    end
  end
  L8_36 = Fn_naviKill
  L8_36()
  L8_36 = Sound
  L8_36 = L8_36.pulse
  L8_36(L8_36, "success")
  L8_36 = Fn_captionViewEnd
  L8_36()
  L8_36 = Player
  L8_36 = L8_36.setControl
  L8_36(L8_36, Player.kControl_Stick, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityShift, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityBoost, false)
  L8_36 = L0_28[2]
  L8_36 = L8_36.getWorldPos
  L8_36 = L8_36(L8_36)
  __view_pos = L8_36
  L8_36 = waitSeconds
  L8_36(BEFORE_DISP_NAVI_WAIT)
  L8_36 = NaviSet_Auto
  L8_36(L0_28[2], 4, 1)
  L8_36 = GemSetDisp
  L8_36(2, true)
  L8_36 = Fn_captionView
  L8_36("ar_00620", 3, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, {
    Player.kAbility_Walk,
    Player.kAbility_Run
  }, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_Jump, true)
  L8_36 = pc_target_near_wait
  L8_36(L0_28[2], 1.5)
  L8_36 = Fn_naviKill
  L8_36()
  L8_36 = Sound
  L8_36 = L8_36.pulse
  L8_36(L8_36, "success")
  L8_36 = Fn_captionViewEnd
  L8_36()
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, {
    Player.kAbility_Walk,
    Player.kAbility_Run
  }, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_Jump, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityShift, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityBoost, true)
  L8_36 = Camera
  L8_36 = L8_36.setControl
  L8_36(L8_36, Camera.kPlayer, Camera.kControl_All, true)
  L8_36 = L0_28[3]
  L8_36 = L8_36.getWorldPos
  L8_36 = L8_36(L8_36)
  __view_pos = L8_36
  L8_36 = waitSeconds
  L8_36(BEFORE_DISP_NAVI_WAIT)
  L8_36 = NaviSet_Auto
  L8_36(L0_28[3], 20, 10)
  L8_36 = GemSetDisp
  L8_36(3, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, {
    Player.kAbility_Walk,
    Player.kAbility_Run
  }, true)
  L8_36 = Fn_captionView
  L8_36("ar_00630", 3, true)
  L8_36 = Fn_tutorialCaption
  L8_36("gravityfirst")
  L8_36 = Fn_pcSensorOff
  L8_36("pccubesensor2_ars_01")
  L8_36 = Fn_pcSensorOn
  L8_36("pccubesensor2_ars_a01")
  L8_36 = cat_warp
  L8_36 = L8_36.abort
  L8_36(L8_36)
  L8_36 = invokeTask
  L8_36 = L8_36(function()
    while true do
      if __ars_cat_warp == true then
        Fn_Common_CatWorp_action()
        __ars_cat_warp = false
      end
      wait()
    end
  end)
  cat_warp = L8_36
  while true do
    L8_36 = L0_28[3]
    L8_36 = L8_36.getWorldPos
    L8_36 = L8_36(L8_36)
    __view_pos = L8_36
    L8_36 = Player
    L8_36 = L8_36.isGravityControlMode
    L8_36 = L8_36(L8_36)
    if L8_36 == true then
      L8_36 = Player
      L8_36 = L8_36.getAction
      L8_36 = L8_36(L8_36)
      if L8_36 ~= Player.kAction_Float then
        L8_36 = Player
        L8_36 = L8_36.getAction
        L8_36 = L8_36(L8_36)
      end
    end
    if L8_36 ~= Player.kAction_Jump then
      L8_36 = wait
      L8_36()
    end
  end
  L8_36 = Player
  L8_36 = L8_36.setControl
  L8_36(L8_36, Player.kControl_Stick, false)
  while true do
    L8_36 = L0_28[3]
    L8_36 = L8_36.getWorldPos
    L8_36 = L8_36(L8_36)
    __view_pos = L8_36
    L8_36 = Fn_get_distance
    L8_36 = L8_36(Fn_getPcPosRot(), L0_28[3]:getWorldPos())
    if not (L8_36 < 6) then
      L8_36 = wait
      L8_36()
    end
  end
  L8_36 = Player
  L8_36 = L8_36.setControl
  L8_36(L8_36, Player.kControl_Stick, true)
  __view_pos = nil
  L8_36 = Fn_naviKill
  L8_36()
  L8_36 = Sound
  L8_36 = L8_36.pulse
  L8_36(L8_36, "success")
  L8_36 = Fn_captionViewEnd
  L8_36()
  L8_36 = Fn_pcSensorOff
  L8_36("pccubesensor2_ars_a01")
  L8_36 = cat_warp
  L8_36 = L8_36.abort
  L8_36(L8_36)
  L8_36 = Fn_setCatWarp
  L8_36(true)
  L8_36 = waitSeconds
  L8_36(1)
  L8_36 = Fn_captionView
  L8_36("ar_00640", 3, true)
  L8_36 = NaviSet_Auto
  L8_36(L0_28[4], 70, 30)
  L8_36 = navi_look_at_target
  L8_36(L0_28[4], 0.5)
  L8_36 = GemSetDisp
  L8_36(4, true)
  L8_36 = Fn_captionView
  L8_36("ar_00650", 0, false)
  L8_36 = Player
  L8_36 = L8_36.getAction
  L8_36 = L8_36(L8_36)
  if L8_36 ~= Player.kAction_Jump then
    L8_36 = pc_gravity_control_mode_wait
    L8_36()
  end
  L8_36 = Fn_tutorialCaptionKill
  L8_36()
  L8_36 = Fn_tutorialCaption
  L8_36("gravitysecond")
  L8_36 = pc_target_near_wait
  L8_36(L0_28[4], 55)
  L8_36 = sm93SetGemPutNaviToKity
  L8_36(L0_28[4], 10)
  L8_36 = pc_target_near_wait
  L8_36(L0_28[4], 3)
  L8_36 = Fn_naviKill
  L8_36()
  L8_36 = Fn_setCheckPoint
  L8_36("pccubesensor2_tut_05")
  L8_36 = Sound
  L8_36 = L8_36.pulse
  L8_36(L8_36, "success")
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityShift, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityBoost, false)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, Player.kAbility_GravityRevert, true)
  L8_36 = Player
  L8_36 = L8_36.setAbility
  L8_36(L8_36, {
    Player.kAbility_Walk,
    Player.kAbility_Run
  }, false)
  L8_36 = Camera
  L8_36 = L8_36.setControl
  L8_36(L8_36, Camera.kPlayer, Camera.kControl_All, true)
  L8_36 = Fn_captionView
  L8_36("ar_00660", 3, false)
  L8_36 = waitSeconds
  L8_36(1)
  L8_36 = NaviSet_Auto
  L8_36(L0_28[5], 14, 7)
  L8_36 = navi_look_at_target
  L8_36(L0_28[5], 0.5)
  L8_36 = GemSetDisp
  L8_36(5, true)
  L8_36 = Fn_captionView
  L8_36("ar_00670", 0, false)
  L8_36 = pc_target_near_wait
  L8_36(L0_28[5], 12)
  L8_36 = waitPhace
  L8_36()
  L8_36 = Fn_userCtrlOn_NoHUD
  L8_36()
  L8_36 = Fn_tutorialCaptionKill
  L8_36()
  L8_36 = Fn_naviKill
  L8_36()
  L8_36 = Sound
  L8_36 = L8_36.pulse
  L8_36(L8_36, "success")
  L8_36 = Fn_captionView
  L8_36("ar_00680", 3, true)
  L8_36 = NaviSet_Auto
  L8_36(L0_28[7], 20, 10)
  L8_36 = navi_look_at_target
  L8_36(L0_28[7], 0.5)
  L8_36 = GemSetDisp
  L8_36(7, true)
  L8_36 = Camera
  L8_36 = L8_36.setControl
  L8_36(L8_36, Camera.kPlayer, Camera.kControl_All, true)
  L8_36 = Fn_tutorialCaption
  L8_36("gravitysecond")
  L8_36 = Fn_TutorialStartView
  L8_36({
    view = {mission_target = "ar_00690"}
  })
  L8_36 = 0
  repeat
    pc_gravity_control_mode_wait()
    if 5 >= Fn_get_distance(Fn_getPcPosRot(), L0_28[7]:getWorldPos()) then
      Fn_tutorialCaptionKill()
      Fn_naviKill()
      Fn_captionView("ar_00700", 3, false)
      Fn_setCheckPoint("pccubesensor2_tut_08")
      Fn_userCtrlOff()
      Sound:pulse("success")
      waitSeconds(3)
      navi_on()
    elseif 15 > Fn_get_distance(Fn_getPcPosRot(), L0_28[7]:getWorldPos()) and __stop_cap == false then
      Fn_tutorialCaptionKill()
      ;({})[0] = function()
        Fn_captionView("ar_00710", 3, false)
        pc_jump_wait()
        L8_36 = L8_36 + 1
      end
      ;({})[1] = function()
        Fn_captionView("ar_00715", 3, false)
        pc_jump_wait()
        L8_36 = L8_36 + 1
      end
      ;({})[2] = function()
        Fn_captionView("ar_00717", 3, false)
        waitSeconds(1.5)
        L8_36 = 0
        Fn_TutorialStartView({
          view = {mission_target = "ar_00690"}
        })
      end
      ;({})[L8_36]()
    end
    wait()
  until __next_phase == true
  __next_phase = false
  NaviSet_Auto(L0_28[8], 20, 10)
  GemSetDisp(8, true)
  Fn_captionView("ar_00670", 0, false)
  Player:setAbility(Player.kAbility_GravityRevert, true)
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  pc_target_near_wait(L0_28[8], 10)
  waitSeconds(1)
  Fn_userCtrlOn_NoHUD()
  Fn_naviKill()
  Fn_captionViewEnd()
  Sound:pulse("success")
  Fn_userCtrlOff()
  __view_pos = findGameObject2("Node", "locator2_aim_a1"):getWorldPos()
  Fn_disableCityBlockBgm()
  Fn_changeBgm("bgm23")
  if findGameObject2("EnemyGenerator", "enmgen2_a_01") ~= nil then
    __enemy_cnt = 2
    findGameObject2("EnemyGenerator", "enmgen2_a_01"):requestSpawn()
  end
  Fn_captionView("ar_00720", 3, false)
  Fn_userCtrlOn_NoHUD()
  waitSeconds(3)
  enemy_cnt = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 2)
      wait()
    end
  end)
  Fn_missionView("ar_00730")
  __view_pos = nil
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
  Fn_tutorialCaption("attack")
  while 0 < __enemy_cnt do
    waitSeconds(1)
    __time_cnt = __time_cnt + 1
    if __gemtime_cnt + 5 <= __time_cnt then
      __gemset = false
    end
    print("time" .. __time_cnt)
  end
  Fn_tutorialCaptionKill()
  enemy_cnt:abort()
  if findGameObject2("EnemyGenerator", "enmgen2_a_02") ~= nil then
    __enemy_cnt = 3
    findGameObject2("EnemyGenerator", "enmgen2_a_02"):requestSpawn()
  end
  enemy_cnt = invokeTask(function()
    while true do
      Font:asciiPrint(100, 1000, "enemy " .. __enemy_cnt .. "/" .. 3)
      wait()
    end
  end)
  Fn_tutorialCaption("escape")
  while 0 < __enemy_cnt do
    waitSeconds(1)
    __time_cnt = __time_cnt + 1
    if __gemtime_cnt + 5 <= __time_cnt then
      __gemset = false
    end
    print("time" .. __time_cnt)
  end
  Fn_tutorialCaptionKill()
  enemy_cnt:abort()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_37, L1_38
end
function pccubesensor2_dusty_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_dusty_01")
  Fn_naviKill()
  navi_on()
end
function pccubesensor2_tut_05_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_05")
  __next_phase = true
end
function pccubesensor2_tut_06_OnEnter(A0_39)
  __navi06_on_enter = true
  A0_39:setActive(false)
end
function pccubesensor2_tut_08_OnEnter(A0_40)
  Fn_pcSensorOff("pccubesensor2_tut_08")
  Player:setAbility({
    Player.kAbility_Walk,
    Player.kAbility_Run
  }, true)
end
function pc_gravity_control_mode_wait()
  while Player:isGravityControlMode() ~= true or Player:getAction() ~= Player.kAction_Float do
    wait()
  end
end
function pc_jump_wait()
  while Player:getAction() ~= Player.kAction_Jump do
    wait()
  end
end
function pc_target_near_wait(A0_41, A1_42)
  while A1_42 < Fn_get_distance(Fn_getPcPosRot(), A0_41:getWorldPos()) do
    wait()
  end
end
function pc_tune_mars_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Mars do
    wait()
  end
end
function pc_tune_normal_mode_wait()
  while Player:getAttrTune() ~= Player.kAttrTune_Normal do
    wait()
  end
end
function pccubesensor2_tut_05_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_05")
  Fn_naviKill()
  __next_phase = true
end
function pccubesensor2_ars_a01_OnEnter()
  __ars_cat_warp_inrange = __ars_cat_warp_inrange + 1
  print(__ars_cat_warp)
end
function pccubesensor2_ars_a01_OnLeave()
  __ars_cat_warp_inrange = __ars_cat_warp_inrange - 1
  if __ars_cat_warp_inrange <= 0 then
    __ars_cat_warp = true
    print(__ars_cat_warp)
  end
end
function pccubesensor2_ars_01_OnEnter()
  __ars_cat_warp_inrange = __ars_cat_warp_inrange - 1
  if __ars_cat_warp_inrange <= 0 then
    __ars_cat_warp = true
    print(__ars_cat_warp)
  end
end
function sm93GetVector(A0_43, A1_44)
  return A1_44 - A0_43
end
function sm93GetNormalize(A0_45)
  local L1_46, L2_47
  L1_46 = Vector
  L2_47 = 0
  L1_46 = L1_46(L2_47, 0, 0)
  L2_47 = nil
  L2_47 = (A0_45 - L1_46):Length()
  if L2_47 == 0 then
    return nil
  end
  L1_46.x = A0_45.x / L2_47
  L1_46.y = A0_45.y / L2_47
  L1_46.z = A0_45.z / L2_47
  return L1_46
end
function sm93SetGemPutNaviToKity(A0_48, A1_49, A2_50)
  local L3_51, L4_52, L5_53, L6_54
  L3_51 = Fn_getPlayer
  L3_51 = L3_51()
  L5_53 = A0_48
  L4_52 = A0_48.getWorldPos
  L4_52 = L4_52(L5_53)
  L6_54 = L3_51
  L5_53 = L3_51.getWorldPos
  L5_53 = L5_53(L6_54)
  L6_54 = sm93GetVector
  L6_54 = L6_54(L4_52, L5_53)
  if A2_50 == nil then
    A2_50 = 4
  end
  L4_52 = L4_52 + sm93GetNormalize(L6_54) * A2_50
  for _FORV_11_ = 1, A1_49 do
    createGameObject2("Gem"):setGemModelNo(1)
    L6_54 = L4_52 + sm93GetNormalize(L6_54) * (_FORV_11_ * 1.5)
    createGameObject2("Gem"):setWorldPos(L6_54)
  end
  _FOR_()
end
function navi_on()
  local L0_55, L1_56
  __next_phase = true
end
function waitPhace()
  while not __next_phase do
    wait()
  end
  __next_phase = false
end
function NaviSet_Auto(A0_57, A1_58, A2_59)
  Fn_naviSet(A0_57)
  if A1_58 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_58)
    HUD:naviSetPochiDistanceDensity0(A2_59)
  end
  Sound:pulse("navi_set")
end
function move_area_po_a_06()
  Fn_getPlayer():setCollidable(false)
  Time:setInGameDeltaSec(0)
  wait()
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_06"):setWorldTransform(findGameObject2("Node", "locator2_po_a_06"):getWorldTransform())
  mother2:sendEvent("getBackgroundElement2Handle", "port"):findSubArea("po_a_06"):setForceMove()
  wait()
  Time:resetInGameDeltaSec()
  wait()
  Fn_getPlayer():setCollidable(true)
end
function Fn_Common_CatWorp_action()
  Fn_userCtrlOff()
  Fn_Common_CatWorp_In_blackout()
  Fn_catWarpCheckPoint()
  Fn_Common_CatWorp_Out()
  Fn_userCtrlOn_NoHUD()
end
function Fn_Common_CatWorp_In_blackout()
  HUD:blackout(1)
  while not HUD:faderStability() do
    wait()
  end
end
