dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_next_phase = false
hint_flag = false
_kaiwa_cnt = 0
_miz_event_mot_list = {
  repair = "miz01_repair_00"
}
_man34_event_mot_list = {
  idle = "man34_idle_00"
}
_sis_event_mot_list = {
  run_afr = "sis01_run_afraid_00"
}
_man32_event_mot_list = {
  idle = "man01_idle_bu_00"
}
_man36_event_mot_list = {
  idle = "man01_stay_01"
}
_wom17_event_mot_list = {
  idle2 = "wom01_watching_soft_00"
}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_findAreaHandle
  L1_1 = "ve_crane_root"
  L0_0 = L0_0(L1_1)
  shiphandle = L0_0
  L0_0 = Fn_setCatActive
  L1_1 = off
  L0_0(L1_1)
  L0_0 = {L1_1}
  L1_1 = {}
  L1_1.name = "sis01"
  L1_1.type = "sis01"
  L1_1.node = "locator2_sis_00"
  L1_1.attach = true
  L1_1 = Fn_setupNpc
  L1_1(L0_0)
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_man36_01")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_01")
  L1_1 = Fn_setKaiwaDemo
  L1_1(Fn_findNpcPuppet("npcgen2_man34_01"), "ep01_00020k", addKaiwaCount, true, nil, nil, nil, "ep01_00020k")
  L1_1 = Fn_setKaiwaDemo
  L1_1(Fn_findNpcPuppet("npcgen2_man32_01"), "ep01_00030k", nil, true, nil, nil, nil, "ep01_00030k")
  L1_1 = Fn_setKaiwaDemo
  L1_1(Fn_findNpcPuppet("npcgen2_wom17_01"), "ep01_00040k", addKaiwaCount, true, nil, nil, nil, "ep01_00040k")
  L1_1 = Fn_setKaiwaDemo
  L1_1(Fn_findNpcPuppet("npcgen2_man36_01"), "ep01_00050k", nil, true, nil, nil, nil, "ep01_00050k")
  L1_1 = Fn_setKaiwaDemo
  L1_1(Fn_findNpcPuppet("sis01"), "ep01_00080k", sisy_end_cap, true, nil, nil, nil, "ep01_00080k")
  L1_1 = Fn_disableKaiwaDemo
  L1_1(Fn_findNpcPuppet("sis01"))
  L1_1 = Fn_loadNpcEventMotion
  L1_1("npcgen2_miz01_01", _miz_event_mot_list)
  L1_1 = Fn_loadNpcEventMotion
  L1_1("npcgen2_man34_01", _man34_event_mot_list)
  L1_1 = Fn_loadNpcEventMotion
  L1_1("npcgen2_man32_01", _man32_event_mot_list)
  L1_1 = Fn_loadNpcEventMotion
  L1_1("npcgen2_man36_01", _man36_event_mot_list)
  L1_1 = Fn_loadNpcEventMotion
  L1_1("npcgen2_wom17_01", _wom17_event_mot_list)
  L1_1 = createGameObject2
  L1_1 = L1_1("GimmickBg")
  _hammer_hdl = L1_1
  L1_1 = _hammer_hdl
  L1_1 = L1_1.setDrawModelName
  L1_1(L1_1, "cihammer01_base")
  L1_1 = _hammer_hdl
  L1_1 = L1_1.setName
  L1_1(L1_1, "cihammer01")
  L1_1 = Fn_findNpcPuppet
  L1_1 = L1_1("npcgen2_miz01_01")
  Fn_attachJoint(_hammer_hdl, L1_1, "loc_r_hand")
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15
  L0_2 = createGameObject2
  L1_3 = "GimmickBg"
  L0_2 = L0_2(L1_3)
  L1_3 = shiphandle
  L2_4 = L1_3
  L1_3 = L1_3.appendChild
  L3_5 = L0_2
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setName
  L3_5 = "ep01_col"
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setCollisionName
  L3_5 = "ep01_col"
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.setAttributeName
  L3_5 = "ep01_col"
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.overrideCollisionFilterLayer
  L3_5 = "Boundary"
  L1_3(L2_4, L3_5)
  L2_4 = L0_2
  L1_3 = L0_2.try_init
  L1_3(L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.waitForReady
  L1_3(L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.try_start
  L1_3(L2_4)
  L1_3 = Fn_playNpcEventMotion
  L2_4 = "npcgen2_miz01_01"
  L3_5 = _miz_event_mot_list
  L3_5 = L3_5.repair
  L4_6 = -1
  L5_7 = 0
  L6_8 = false
  L1_3(L2_4, L3_5, L4_6, L5_7, L6_8)
  L1_3 = Fn_playNpcEventMotion
  L2_4 = "npcgen2_man34_01"
  L3_5 = _man34_event_mot_list
  L3_5 = L3_5.idle
  L4_6 = -1
  L5_7 = 0
  L6_8 = false
  L1_3(L2_4, L3_5, L4_6, L5_7, L6_8)
  L1_3 = Fn_playNpcEventMotion
  L2_4 = "npcgen2_man32_01"
  L3_5 = _man32_event_mot_list
  L3_5 = L3_5.idle
  L4_6 = -1
  L5_7 = 0
  L6_8 = false
  L1_3(L2_4, L3_5, L4_6, L5_7, L6_8)
  L1_3 = Fn_playNpcEventMotion
  L2_4 = "npcgen2_man36_01"
  L3_5 = _man36_event_mot_list
  L3_5 = L3_5.idle
  L4_6 = -1
  L5_7 = 0
  L6_8 = false
  L1_3(L2_4, L3_5, L4_6, L5_7, L6_8)
  L1_3 = Fn_playNpcEventMotion
  L2_4 = "npcgen2_wom17_01"
  L3_5 = _wom17_event_mot_list
  L3_5 = L3_5.idle2
  L4_6 = -1
  L5_7 = 0
  L6_8 = false
  L1_3(L2_4, L3_5, L4_6, L5_7, L6_8)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_01"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 0
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_02"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 0
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_03"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 9
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_04"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 9
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_05"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 15
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_06"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 15
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_07"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 19
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_08"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 19
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_09"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 24
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_10"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 24
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_11"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 28
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_12"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 28
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_13"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 35
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_14"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 35
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_15"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 39
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_16"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 39
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_17"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 42
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_18"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 42
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_19"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 48
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_20"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 48
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_21"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 56
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_22"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 56
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_23"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 60
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_24"
  L3_5 = "stay"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 60
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = Fn_playMotionNpc
  L2_4 = "npcgen2_duck01_25"
  L3_5 = "stay_01"
  L4_6 = false
  L5_7 = {}
  L5_7.animStartFrame = 66
  L1_3(L2_4, L3_5, L4_6, L5_7)
  L1_3 = mother2
  L2_4 = L1_3
  L1_3 = L1_3.sendEvent
  L3_5 = "getBackgroundElement2Handle"
  L4_6 = "bungua"
  L1_3 = L1_3(L2_4, L3_5, L4_6)
  L3_5 = L1_3
  L2_4 = L1_3.findSubArea
  L4_6 = "bu_a_02"
  L2_4 = L2_4(L3_5, L4_6)
  L4_6 = L1_3
  L3_5 = L1_3.findSubArea
  L5_7 = "bu_a_05"
  L3_5 = L3_5(L4_6, L5_7)
  L5_7 = L1_3
  L4_6 = L1_3.findSubArea
  L6_8 = "bu_a_09"
  L4_6 = L4_6(L5_7, L6_8)
  L6_8 = L2_4
  L5_7 = L2_4.setExpandedAabb
  L7_9 = true
  L5_7(L6_8, L7_9)
  L6_8 = L3_5
  L5_7 = L3_5.setExpandedAabb
  L7_9 = true
  L5_7(L6_8, L7_9)
  L6_8 = L4_6
  L5_7 = L4_6.setExpandedAabb
  L7_9 = true
  L5_7(L6_8, L7_9)
  L5_7 = Fn_missionStart
  L5_7()
  L5_7 = invokeTask
  function L6_8()
    local L0_16
    L0_16 = 0
    repeat
      L0_16 = L0_16 + 1
      waitSeconds(1)
    until L0_16 >= 80 and _kaiwa_cnt >= 2
    Fn_captionViewWait("ep01_00103")
    Fn_naviSet(findGameObject2("Node", "locator2_helpnavi_01"))
    if auto_cap ~= nil then
      auto_cap:abort()
      auto_cap = nil
    end
  end
  L5_7 = L5_7(L6_8)
  time_count = L5_7
  L5_7 = Fn_kaiwaDemoView
  L6_8 = "ep01_00010k"
  L5_7(L6_8)
  L5_7 = Fn_captionView
  L6_8 = "ep01_00100"
  L5_7(L6_8)
  L5_7 = waitSeconds
  L6_8 = 1
  L5_7(L6_8)
  L5_7 = {L6_8}
  L6_8 = "locator2_ryz_02"
  L6_8 = Fn_moveNpc
  L7_9 = "npcgen2_ryz01_01"
  L8_10 = L5_7
  L9_11 = {}
  L9_11.runLength = 100
  L6_8 = L6_8(L7_9, L8_10, L9_11)
  L7_9 = waitSeconds
  L8_10 = 2
  L7_9(L8_10)
  L7_9 = Fn_setNpcActive
  L8_10 = "npcgen2_ryz01_01"
  L9_11 = false
  L7_9(L8_10, L9_11)
  L7_9 = Fn_userCtrlOn
  L7_9()
  L7_9 = Fn_missionView
  L8_10 = "ep01_00101"
  L7_9(L8_10)
  L7_9 = waitSeconds
  L8_10 = 3.8
  L7_9(L8_10)
  L7_9 = Fn_captionView
  L8_10 = "ep01_00104"
  L7_9(L8_10)
  L7_9 = 0
  L8_10 = {}
  L9_11 = 0
  auto_cap = L10_12
  L10_12()
  L10_12(L11_13)
  if L10_12 ~= nil then
    L10_12(L11_13)
    mizai_look = nil
  end
  L10_12(L11_13)
  if L10_12 ~= nil then
    L10_12(L11_13)
    auto_cap = nil
  end
  L13_15 = L11_13(L12_14)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14))
  L13_15 = L11_13(L12_14)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14))
  L13_15 = L11_13(L12_14)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14))
  L10_12(L11_13)
  L13_15 = nil
  L10_12(L11_13, L12_14, L13_15, true, "ep01_00035k")
  L13_15 = L11_13(L12_14)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14))
  L10_12(L11_13)
  L10_12(L11_13)
  L10_12()
  L10_12(L11_13)
  L13_15 = 1
  L10_12(L11_13, L12_14, L13_15, Vector(0, 0, 0))
  L10_12()
  L10_12(L11_13)
  L13_15 = "npcgen2_man36_01"
  L13_15 = L11_13(L12_14, L13_15)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14, L13_15))
  L10_12()
  L10_12(L11_13)
  L13_15 = L11_13(L12_14)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14))
  L10_12(L11_13)
  L10_12(L11_13, L12_14)
  for L13_15 = 2, 25 do
    Fn_setNpcActive("npcgen2_duck01_" .. string.format("%02d", L13_15), false)
  end
  L10_12()
  L13_15 = 1
  L10_12(L11_13, L12_14, L13_15, Vector(0, 0, 0))
  L10_12(L11_13)
  L10_12(L11_13)
  L10_12(L11_13)
  L13_15 = "locator2_navi_01"
  L13_15 = L11_13(L12_14, L13_15)
  L10_12(L11_13, L12_14, L13_15, L11_13(L12_14, L13_15))
  L10_12()
  if L10_12 ~= nil then
    L10_12(L11_13)
    sisy_move = nil
  end
  L10_12()
  L10_12()
  L10_12()
  L10_12()
end
function Finalize()
  if auto_cap ~= nil then
    auto_cap:abort()
    auto_cap = nil
  end
end
function navi_on()
  local L0_17, L1_18
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function addKaiwaCount()
  _kaiwa_cnt = _kaiwa_cnt + 1
  if _kaiwa_cnt >= 2 then
    invokeTask(function()
      local L0_19
      L0_19 = Fn_userCtrlAllOff
      L0_19()
      L0_19 = findGameObject2
      L0_19 = L0_19("Node", "locator2_helpnavi_01")
      view_task = Fn_lookAtObject(L0_19, 0)
      repeat
        wait()
        print("\227\130\171\227\131\161\227\131\169\227\131\173\227\131\131\227\130\175\229\190\133\227\129\161")
      until Fn_isInSightTarget(L0_19, 0.1)
      Fn_captionView("ep01_00121")
      waitSeconds(1.5)
      Fn_userCtrlOn()
      if view_task ~= nil then
        view_task:abort()
        view_task = nil
        print("\227\130\171\227\131\161\227\131\169\232\167\163\233\153\164")
      end
      waitSeconds(1.5)
    end)
  end
end
function pccubesensor2_help_00_OnEnter(A0_20)
  Fn_tutorialCaption("jump")
end
function pccubesensor2_help_00_OnLeave(A0_21)
  Fn_tutorialCaptionKill()
end
function pccubesensor2_00_OnEnter(A0_22)
  A0_22:setActive(false)
  Fn_pcSensorOff("pccubesensor2_help_00")
  Fn_tutorialCaptionKill()
end
function pccubesensor2_01_OnEnter(A0_23)
  A0_23:setActive(false)
  _next_phase = true
end
function pccubesensor2_hint_01_OnEnter(A0_24)
  if _kaiwa_cnt >= 1 then
    A0_24:setActive(false)
    hint_flag = true
  end
end
function pccubesensor2_help_01_OnEnter(A0_25)
  if time_count ~= nil then
    time_count:abort()
    time_count = nil
  end
  A0_25:setActive(false)
  Fn_naviKill()
  if auto_cap ~= nil then
    auto_cap:abort()
    auto_cap = nil
  end
  mizai_look = invokeTask(function()
    Fn_lookAtObjectWait("npcgen2_miz01_01", 0, 0.1)
    Fn_captionView("ep01_00105")
  end)
end
function sisy_end_cap()
  Fn_captionView("ep01_00107")
end
function pccubesensor2_mizai_01_OnEnter(A0_26)
  A0_26:setActive(false)
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setLookAtIk(true, 2, Fn_findNpcPuppet("npcgen2_miz01_01"):getWorldPos())
    print("\229\144\145\227\129\141\229\155\186\229\174\154")
    waitSeconds(1.5)
    Fn_lookAtObject("npcgen2_miz01_01", 1):abort()
    _next_phase = true
  end)
end
function pccubesensor2_man36_01_OnEnter(A0_27)
  A0_27:setActive(false)
  Fn_naviKill()
  invokeTask(function()
    Fn_userCtrlAllOff()
    Player:setLookAtIk(true, 2, Fn_findNpcPuppet("npcgen2_man36_01"):getWorldPos())
    print("\229\144\145\227\129\141\229\155\186\229\174\154")
    Fn_turnNpc("npcgen2_man36_01", Fn_getPlayer():getWorldPos())
    waitSeconds(1)
    Fn_lookAtObject("npcgen2_man36_01", 1):abort()
    _next_phase = true
  end)
end
function sisymove()
  local L0_28, L1_29
  L0_28 = Fn_findNpc
  L1_29 = "sis01"
  L0_28 = L0_28(L1_29)
  L1_29 = Fn_findNpcPuppet
  L1_29 = L1_29("sis01")
  sisy_move = invokeTask(function()
    local L0_30, L1_31, L2_32, L3_33
    L0_30 = print
    L1_31 = "\231\167\187\229\139\149\233\150\139\229\167\139"
    L0_30(L1_31)
    L0_30 = {
      L1_31,
      L2_32,
      L3_33,
      {
        pos = "locator2_sis_04"
      },
      {
        pos = "locator2_sis_05"
      },
      {
        pos = "locator2_sis_06"
      }
    }
    L1_31 = {}
    L1_31.pos = "locator2_sis_01"
    L2_32 = {}
    L2_32.pos = "locator2_sis_02"
    L3_33 = {}
    L3_33.pos = "locator2_sis_03"
    L1_31 = Fn_moveNpc
    L2_32 = "sis01"
    L3_33 = L0_30
    L1_31 = L1_31(L2_32, L3_33, {runLength = -1})
    L2_32 = findGameObject2
    L3_33 = "Node"
    L2_32 = L2_32(L3_33, "locator2_sis_08_03")
    node_hdl = L2_32
    repeat
      L2_32 = wait
      L2_32()
      L2_32 = Fn_get_distance
      L3_33 = L1_29
      L3_33 = L3_33.getWorldPos
      L3_33 = L3_33(L3_33)
      L2_32 = L2_32(L3_33, node_hdl:getWorldTransform())
    until L2_32 < 4.1
    L1_31 = nil
    L2_32 = L0_28
    L3_33 = L2_32
    L2_32 = L2_32.pauseMove
    L2_32(L3_33, true)
    L2_32 = {}
    L2_32.anim_in = "jump_run_00"
    L2_32.anim_lp = "jump_run_fall_00"
    L2_32.anim_out = "jump_run_land_00"
    L2_32.anim_stay = "stay"
    L2_32.height = 0.5
    L3_33 = L0_28
    L3_33 = L3_33.jump
    L3_33(L3_33, "locator2_sis_08_03", L2_32)
    repeat
      L3_33 = wait
      L3_33()
      L3_33 = L0_28
      L3_33 = L3_33.isJumpEnd
      L3_33 = L3_33(L3_33)
    until L3_33
    L3_33 = L0_28
    L3_33 = L3_33.pauseMove
    L3_33(L3_33, false)
    L3_33 = {
      {
        pos = "locator2_sis_08_04"
      },
      {
        pos = "locator2_sis_08_05"
      },
      {
        pos = "locator2_sis_08_06"
      },
      {
        pos = "locator2_sis_09_01",
        opt = {
          anim_walk = "walk",
          anim_walk_speed = 0.9,
          anim_run = "run2",
          bridge = true
        }
      },
      {
        pos = "locator2_sis_09_02"
      },
      {
        pos = "locator2_sis_09_03"
      },
      {
        pos = "locator2_sis_05_01",
        opt = {
          anim_walk = "walk",
          anim_walk_speed = 0.9,
          anim_run = "run2",
          bridge = true
        }
      },
      {
        pos = "locator2_sis_05_02"
      },
      {
        pos = "locator2_sis_02_01",
        opt = {
          anim_walk = "walk",
          anim_walk_speed = 0.9,
          anim_run = "run2",
          bridge = true
        }
      },
      {
        pos = "locator2_sis_02_02"
      },
      {
        pos = "locator2_sis_02_03"
      }
    }
    while Fn_moveNpc("sis01", L3_33, {runLength = -1}):isRunning() do
      wait()
    end
    print("\231\167\187\229\139\149\231\181\130\228\186\134")
    Fn_enableKaiwaDemo(Fn_findNpcPuppet("sis01"))
  end)
end
