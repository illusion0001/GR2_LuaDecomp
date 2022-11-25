import("Wind")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
function Initialize()
  Fn_pcSensorOff("pccubesensor2_hint_01")
  Fn_pcSensorOff("pccubesensor2_door_01")
  Fn_userCtrlOff()
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = print
  L1_1 = "B\227\131\145\227\131\188\227\131\136\233\150\139\229\167\139++++++++++++++++++++++++++++++++++++++++++"
  L0_0(L1_1)
  L0_0 = Wind
  L1_1 = L0_0
  L0_0 = L0_0.setIntensity
  L2_2 = 0
  L0_0(L1_1, L2_2)
  L0_0 = Fn_disableCostumeChange
  L1_1 = true
  L0_0(L1_1)
  L0_0 = Player
  L1_1 = L0_0
  L0_0 = L0_0.setAbility
  L2_2 = Player
  L2_2 = L2_2.kAbility_TalismanEffect
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = GameDatabase
  L1_1 = L0_0
  L0_0 = L0_0.set
  L2_2 = ggd
  L2_2 = L2_2.Savedata__Menu__MenuUnlock__TopMenuTalisman
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_setCatActive
  L1_1 = false
  L0_0(L1_1)
  _mbox_hdl = nil
  while true do
    L0_0 = _mbox_hdl
    if L0_0 == nil then
      L0_0 = Fn_findAreaHandle
      L1_1 = "et2_a_root"
      L0_0 = L0_0(L1_1)
      L1_1 = L0_0
      L0_0 = L0_0.findChildNode
      L2_2 = "musicbox_md_01"
      L3_3 = true
      L0_0 = L0_0(L1_1, L2_2, L3_3)
      _mbox_hdl = L0_0
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = _mbox_hdl
  L1_1 = L0_0
  L0_0 = L0_0.setVisible
  L2_2 = false
  L0_0(L1_1, L2_2)
  _mbox_hdl = nil
  while true do
    L0_0 = _mbox_hdl
    if L0_0 == nil then
      L0_0 = Fn_findAreaHandle
      L1_1 = "et2_a_root"
      L0_0 = L0_0(L1_1)
      L1_1 = L0_0
      L0_0 = L0_0.findChildNode
      L2_2 = "musicbox_md_01b"
      L3_3 = true
      L0_0 = L0_0(L1_1, L2_2, L3_3)
      _mbox_hdl = L0_0
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = _mbox_hdl
  L1_1 = L0_0
  L0_0 = L0_0.setVisible
  L2_2 = true
  L0_0(L1_1, L2_2)
  L0_0 = Fn_findAreaHandle
  L1_1 = "et2_a_root"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.findChildNode
  L3_3 = "et2_door_oc_03_02"
  L1_1 = L1_1(L2_2, L3_3, true)
  L3_3 = L0_0
  L2_2 = L0_0.findChildNode
  L2_2 = L2_2(L3_3, "et2_door_oc_04_02", true)
  L3_3 = L1_1.setRot
  L3_3(L1_1, XYZRotQuaternionEular(0, 220, 0))
  L3_3 = L2_2.setRot
  L3_3(L2_2, XYZRotQuaternionEular(0, -40, 0))
  L3_3 = Fn_switchDayAndNight
  L3_3(false)
  L3_3 = print
  L3_3("\229\164\156\227\129\171\227\129\151\227\129\159\239\188\129\239\188\129\239\188\129\239\188\129\239\188\129")
  L3_3 = Fn_resetPcPos
  L3_3("locator2_pc_start_pos")
  L3_3 = Sound
  L3_3 = L3_3.pulse
  L3_3(L3_3, "ali_014")
  L3_3 = Fn_captionViewWait
  L3_3("ep22_01000", 3, 3, Font.kLayerFront)
  L3_3 = waitSeconds
  L3_3(1)
  L3_3 = Sound
  L3_3 = L3_3.playSEHandle
  L3_3 = L3_3(L3_3, "ep22_music_box", 1, "", _mbox_hdl)
  _mbox_se_hdl = L3_3
  L3_3 = waitSeconds
  L3_3(2)
  L3_3 = Fn_missionStart
  L3_3()
  L3_3 = Sound
  L3_3 = L3_3.setAudibleRange
  L3_3(L3_3, _mbox_se_hdl, 100)
  L3_3 = Fn_userCtrlOn
  L3_3()
  L3_3 = waitSeconds
  L3_3(2)
  L3_3 = Fn_captionViewWait
  L3_3("ep22_01001")
  L3_3 = Mv_waitPhase
  L3_3()
  L3_3 = Fn_captionViewWait
  L3_3("ep22_01007")
  L3_3 = Mv_waitPhase
  L3_3()
  L3_3 = Fn_captionViewWait
  L3_3("ep22_01002")
  L3_3 = Mv_waitPhase
  L3_3()
  L3_3 = Fn_captionViewWait
  L3_3("ep22_01003")
  L3_3 = waitSeconds
  L3_3(1.5)
  L3_3 = Fn_captionView
  L3_3("ep22_01004")
  L3_3 = Fn_pcSensorOn
  L3_3("pccubesensor2_hint_01")
  L3_3 = Mv_waitPhase
  L3_3()
  L3_3 = Sound
  L3_3 = L3_3.pulse
  L3_3(L3_3, "ep22_dusty_call")
  L3_3 = waitSeconds
  L3_3(1)
  L3_3 = Fn_userCtrlAllOff
  L3_3()
  L3_3 = Mv_viewObj
  L3_3 = L3_3("pccubesensor2_door_01", 0.5)
  Player:setLookAtIk(true, 1, findGameObject2("Node", "pccubesensor2_door_01"):getWorldPos())
  Fn_captionViewWait("ep22_01005")
  L3_3 = Mv_safeTaskAbort(L3_3)
  Player:setLookAtIk(false, 1, findGameObject2("Node", "pccubesensor2_door_01"):getWorldPos())
  Fn_userCtrlOn()
  Fn_pcSensorOn("pccubesensor2_door_01")
  Mv_waitPhase()
  Fn_blackout()
  Sound:stopSEHandle(_mbox_se_hdl)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Wind:setWind()
  Fn_disableCostumeChange(false)
  if Fn_getPlayer() then
    Player:setAbility(Player.kAbility_TalismanEffect, true)
  end
  GameDatabase:set(ggd.Savedata__Menu__MenuUnlock__TopMenuTalisman, true)
end
function pccubesensor2_desk_OnEnter()
  local L0_4
  L0_4 = {}
  L0_4.RL = {
    id = "ui_event_guide_14",
    func = musicBoxFunc
  }
  Fn_gestureAction(L0_4)
end
function pccubesensor2_desk_OnLeave()
  Fn_gestureActionCancel()
end
function musicBoxFunc()
  Fn_captionView("ep22_01006")
end
function pccubesensor2_bedroom_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_bedroom_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_comment_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_comment_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_alone_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_alone_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_hint_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_hint_01")
  Mv_gotoNextPhase()
end
function pccubesensor2_door_01_OnEnter()
  local L0_5
  L0_5 = {}
  L0_5.RL = {
    id = "ui_event_guide_04",
    func = yes_func
  }
  Fn_gestureAction(L0_5)
end
function pccubesensor2_door_01_OnLeave()
  Fn_gestureActionCancel()
end
function yes_func()
  Mv_gotoNextPhase()
  Fn_gestureActionCancel()
end
