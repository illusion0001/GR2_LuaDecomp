import("GameDatabase")
import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm42_common.lua")
MISSION_END_TIME = 2
CAP_TIME01 = 2
CAP_TIME02 = 6
CAP_TIME03 = 10
CAP_TIME04 = 14
EVENT_TIME = 23
_puppet_tbl = {}
_sm49_flag = true
function Initialize()
  Fn_pcSensorOff("pccubesensor2_harbor_area_event_01")
  Fn_pcSensorOff("pccubesensor2_guide_01")
  _chara_table = {
    {
      name = "flag_man78",
      type = "man78",
      node = "locator2_flag_pilot_a_01",
      active = false,
      use_gravity = false
    }
  }
  Fn_setupNpc(_chara_table)
  for _FORV_3_, _FORV_4_ in pairs(_chara_table) do
    _puppet_tbl[_FORV_4_.name] = Fn_findNpcPuppet(_FORV_4_.name)
  end
  if GameDatabase:get(ggd.Savedata__EventFinishedFlags__sm49) == 1 then
    comSetClearEventFlag(true)
    print("-*sm49\227\130\175\227\131\170\227\130\162\230\184\136\227\129\191-*" .. tostring(comGetClearEventFlag()))
  else
    comSetClearEventFlag(false)
  end
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3
  L0_0 = Fn_playMotionNpc
  L1_1 = "sm42_client"
  L2_2 = "lookaround_03"
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = waitSeconds
  L1_1 = 2
  L0_0(L1_1)
  L0_0 = Fn_kaiwaDemoView
  L1_1 = "sm42_00100k"
  L0_0(L1_1)
  L0_0 = Fn_findNpc
  L1_1 = "sm42_client"
  L0_0 = L0_0(L1_1)
  L1_1 = L0_0
  L0_0 = L0_0.turn
  L2_2 = Fn_getPlayer
  L2_2 = L2_2()
  L3_3 = L2_2
  L2_2 = L2_2.getWorldPos
  L3_3 = L2_2(L3_3)
  L0_0(L1_1, L2_2, L3_3, L2_2(L3_3))
  L0_0 = Fn_setGrabNpc
  L1_1 = "sm42_client"
  L2_2 = false
  L3_3 = false
  L0_0(L1_1, L2_2, L3_3)
  L0_0 = Mv_createNpcGrabSensor
  L1_1 = "sm42_client"
  L0_0 = L0_0(L1_1)
  L2_2 = L0_0
  L1_1 = L0_0.setActive
  L3_3 = true
  L1_1(L2_2, L3_3)
  L1_1 = Fn_userCtrlOn
  L1_1()
  L1_1 = Fn_missionView
  L2_2 = "sm42_00100"
  L1_1(L2_2)
  L1_1 = clientGrabWait
  L2_2 = Fn_findNpcPuppet
  L3_3 = "sm42_client"
  L3_3 = L2_2(L3_3)
  L1_1(L2_2, L3_3, L2_2(L3_3))
  L1_1 = Fn_setCatWarpCheckPoint
  L2_2 = "locator2_pc_start_pos"
  L1_1(L2_2)
  L1_1 = setCatWarpClientPos
  L2_2 = "locator2_client_warp_01"
  L1_1(L2_2)
  L1_1 = invokeClientCatwarpCheck
  L2_2 = "sm42_client"
  L1_1 = L1_1(L2_2)
  L3_3 = L0_0
  L2_2 = L0_0.setActive
  L2_2(L3_3, false)
  L2_2 = Fn_tutorialCaptionKill
  L2_2()
  L2_2 = Fn_pcSensorOn
  L3_3 = "pccubesensor2_harbor_area_event_01"
  L2_2(L3_3)
  L2_2 = Fn_pcSensorOn
  L3_3 = "pccubesensor2_guide_01"
  L2_2(L3_3)
  L2_2 = Mv_viewObj
  L3_3 = "locator2_harbor_navi_01"
  L2_2 = L2_2(L3_3)
  L3_3 = Fn_naviSet
  L3_3(findGameObject2("Node", "locator2_harbor_navi_01"))
  L3_3 = invokeTask
  L3_3 = L3_3(function()
    local L0_4, L1_5, L2_6
    L0_4 = 0
    L1_5 = nil
    L2_6 = comGetClearEventFlag
    L2_6 = L2_6()
    if L2_6 == true then
      L2_6 = clearEventFunc
      L2_6()
    end
    while true do
      L2_6 = MISSION_END_TIME
      if L0_4 == L2_6 then
        L2_6 = Fn_missionViewEnd
        L2_6()
        L2_6 = Fn_missionInfoEnd
        L2_6()
      else
        L2_6 = CAP_TIME01
        if L0_4 == L2_6 then
          L2_6 = Fn_captionView
          L2_6("sm42_00101")
        else
          L2_6 = CAP_TIME02
          if L0_4 == L2_6 then
            L2_6 = Fn_captionView
            L2_6("sm42_00102")
          else
            L2_6 = CAP_TIME03
            if L0_4 == L2_6 then
              L2_6 = Fn_captionView
              L2_6("sm42_00103")
            else
              L2_6 = CAP_TIME04
              if L0_4 == L2_6 then
                L2_6 = Fn_captionViewWait
                L2_6("sm42_00104", 3, 3.5)
                L2_6 = Fn_captionView
                L2_6("sm42_00105")
              else
                L2_6 = EVENT_TIME
                if L0_4 == L2_6 then
                  L2_6 = comGetClearEventFlag
                  L2_6 = L2_6()
                  if L2_6 == true then
                    L2_6 = print
                    L2_6("\227\130\175\227\131\170\227\130\162\227\131\149\227\131\169\227\130\176\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139")
                    L2_6 = {"sm42_00106", "sm42_00107"}
                    L1_5 = comInvokeFlagEventGemWait("locator2_flag_gem_a_01", L2_6, "a")
                  end
                end
              end
            end
          end
        end
      end
      L2_6 = waitSeconds
      L2_6(1)
      L2_6 = EVENT_TIME
      L2_6 = L2_6 + 5
      if L0_4 < L2_6 then
        L0_4 = L0_4 + 1
      end
    end
  end)
  Mv_waitPhase()
  Fn_pcSensorOff("pccubesensor2_harbor_area_event_01")
  Fn_pcSensorOff("pccubesensor2_guide_01")
  Fn_naviKill()
  L3_3 = Mv_safeTaskAbort(L3_3)
  L1_1 = Mv_safeTaskAbort(L1_1)
  event_task = Mv_safeTaskAbort(event_task)
  playerCoerctionStop(false)
  Fn_kaiwaDemoView("sm42_00110k")
  Fn_userCtrlOn()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  if Fn_findNpc("flag_man78") ~= nil then
    Fn_disappearNpc("flag_man78")
    if _event_bike.ship ~= nil then
      _event_bike.ship:setVisible(false)
    end
  end
end
function pccubesensor2_client_grab_sensorOnEnter(A0_7)
  Fn_tutorialCaption("grab")
end
function pccubesensor2_client_grab_sensorOnLeave(A0_8)
  Fn_tutorialCaptionKill()
  Fn_captionView("sm42_00108")
end
function pccubesensor2_harbor_area_event_01_OnEnter()
  Mv_gotoNextPhase()
end
function clearEventFunc()
  comInitFlagEventArray("a")
  comInvokeFlagEventInit("ForEp00Viecle", "sm49_bike", "locator2_flag_ship_a_01", "flag_man78", nil)
end
function pccubesensor2_flag_event_kaiwa_sensorOnEnter()
  invokeTask(function()
    _event_bike.kaiwa_flag = true
    _event_bike.sensor:setActive(false)
    Fn_kaiwaDemoView("sm42_00120k")
    _event_bike.pos_route_tbl = _comBike[comGetCreateDirection()][BIKE_ESCAPE]
    comFlagEventReRoute()
  end)
end
function pccubesensormulti2_flag_event_start_area_a_01_OnEnter()
  comOnEventAreaFlag()
end
function pccubesensormulti2_flag_event_start_area_a_01_OnLeave()
  comOffEventAreaFlag()
end
function pccubesensor2_guide_01_OnEnter()
  local L0_9, L1_10
end
function pccubesensor2_guide_01_OnLeave()
  Fn_captionView("sm42_00109")
end
