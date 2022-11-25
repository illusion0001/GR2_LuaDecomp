dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Mob/mob_event_util.lua")
import("Area")
_npc_tbl = {}
_pupp_tbl = {}
_sensors = {}
_grid = {}
_customers = {}
_buying_ok = false
_buying_fin = false
_arrived = false
_is_in_sensor = false
_arrivalshop = false
_line = false
function Initialize()
  Fn_pcSensorOff("pccubesensor2_00")
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  Fn_pcSensorOff("pccubesensor2_customer_area_add")
  Fn_pcSensorOff("pccubesensor2_shop_near")
  Mob:restrictOnNav__ed_a_root(true)
  Fn_sendEventComSb("arrivalshop", false)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = Fn_missionStart
  L0_0()
  L0_0 = Fn_userCtrlOn
  L0_0()
  L0_0 = Fn_missionView
  L1_1 = "ep14_02000"
  L0_0(L1_1)
  L0_0 = waitSeconds
  L1_1 = 1
  L0_0(L1_1)
  L0_0 = Fn_tutorialCaption
  L1_1 = "grab"
  L0_0(L1_1)
  L0_0 = Fn_sendEventComSb
  L1_1 = "brahmanControl"
  L0_0(L1_1)
  L0_0 = invokeTask
  function L1_1()
    while not _arrivalshop do
      if Fn_sendEventComSb("isGrabbedBrahman") then
        if findGameObject2("PlayerSensor", "pccubesensor2_shop_near"):getActive() == false then
          Fn_pcSensorOn("pccubesensor2_shop_near")
        end
      elseif findGameObject2("PlayerSensor", "pccubesensor2_shop_near"):getActive() then
        Fn_pcSensorOff("pccubesensor2_shop_near")
      end
      wait()
    end
    Fn_pcSensorOff("pccubesensor2_shop_near")
  end
  L0_0(L1_1)
  while true do
    L0_0 = Fn_sendEventComSb
    L1_1 = "nowBraPhase"
    L0_0 = L0_0(L1_1)
    if L0_0 ~= 2 then
      L0_0 = wait
      L0_0()
    end
  end
  L0_0 = Fn_tutorialCaptionKill
  L0_0()
  L0_0 = wait
  L1_1 = 5
  L0_0(L1_1)
  L0_0 = Fn_captionViewWait
  L1_1 = "ep14_02001"
  L2_2 = 2
  L0_0(L1_1, L2_2)
  L0_0 = Fn_missionView
  L1_1 = "ep14_02007"
  L0_0(L1_1)
  L0_0 = findGameObject2
  L1_1 = "Node"
  L2_2 = "locator2_navi_shop"
  L0_0 = L0_0(L1_1, L2_2)
  L1_1 = Fn_naviSet
  L2_2 = L0_0
  L1_1(L2_2)
  L1_1 = Fn_sendEventComSb
  L2_2 = "shopStart"
  L1_1(L2_2)
  L1_1 = waitSeconds
  L2_2 = 1
  L1_1(L2_2)
  L1_1 = Fn_captionView
  L2_2 = "ep14_02002"
  L1_1(L2_2)
  L1_1 = Sound
  L2_2 = L1_1
  L1_1 = L1_1.playSE
  L3_3 = "bra_910c"
  L4_4 = 1
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = Fn_sendEventComSb
  L2_2 = "addBraPhase"
  L1_1(L2_2)
  L1_1 = waitPhase
  L1_1()
  _arrivalshop = true
  L1_1 = Fn_sendEventComSb
  L2_2 = "arrivalshop"
  L3_3 = true
  L1_1(L2_2, L3_3)
  while true do
    L1_1 = Fn_isCaptionView
    L1_1 = L1_1()
    if L1_1 then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = Fn_naviKill
  L1_1()
  while true do
    L1_1 = Fn_sendEventComSb
    L2_2 = "ep14_c_checkPcJoin"
    L1_1 = L1_1(L2_2)
    if L1_1 == false then
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = findGameObject2
  L2_2 = "Node"
  L3_3 = "locator2_shop_last"
  L1_1 = L1_1(L2_2, L3_3)
  L2_2 = findGameObject2
  L3_3 = "Node"
  L4_4 = "locator2_shop_mid"
  L2_2 = L2_2(L3_3, L4_4)
  L3_3 = Fn_naviSet
  L4_4 = L1_1
  L3_3(L4_4)
  while true do
    L3_3 = rayCheck
    L4_4 = L1_1
    L5_5 = 60
    L3_3 = L3_3(L4_4, L5_5, 2)
    if L3_3 == false then
      L3_3 = rayCheck
      L4_4 = L2_2
      L5_5 = 60
      L3_3 = L3_3(L4_4, L5_5)
    end
    if L3_3 == false then
      L3_3 = wait
      L3_3()
    end
  end
  L3_3 = pcStayCamStopOn
  L3_3()
  L3_3 = Fn_captionView
  L4_4 = "ep14_02008"
  L5_5 = 2.3
  L3_3(L4_4, L5_5)
  L3_3 = Fn_getDistanceToPlayer
  L4_4 = L1_1
  L3_3 = L3_3(L4_4)
  if L3_3 > 3 then
    L3_3 = viewControl
    L4_4 = L1_1
    L5_5 = 1
    L3_3(L4_4, L5_5, 1.5)
  end
  while true do
    L3_3 = Fn_isCaptionView
    L3_3 = L3_3()
    if L3_3 then
      L3_3 = wait
      L3_3()
    end
  end
  L3_3 = pcStayCamStopOff
  L3_3()
  L3_3 = invokeTask
  function L4_4()
    while not _line do
      if Fn_sendEventComSb("isGrabbedBrahman") then
        if findGameObject2("PlayerSensor", "pccubesensor2_00"):getActive() == false then
          Fn_pcSensorOn("pccubesensor2_00")
        end
      elseif findGameObject2("PlayerSensor", "pccubesensor2_00"):getActive() then
        Fn_pcSensorOff("pccubesensor2_00")
      end
      wait()
    end
    Fn_pcSensorOff("pccubesensor2_00")
  end
  L3_3(L4_4)
  L3_3 = waitPhase
  L3_3()
  _line = true
  L3_3 = Fn_naviKill
  L3_3()
  L3_3 = pcStayCamStopOn
  L3_3()
  L3_3 = inSensorGravityCtrlModeOff
  L3_3()
  L3_3 = Fn_isNormalStyle
  L3_3 = L3_3()
  if not L3_3 then
    L3_3 = Player
    L4_4 = L3_3
    L3_3 = L3_3.setAttrTune
    L5_5 = Player
    L5_5 = L5_5.kAttrTune_Normal
    L3_3(L4_4, L5_5, true)
    L3_3 = wait
    L4_4 = 3
    L3_3(L4_4)
  end
  L3_3 = Fn_setCatWarpCheckPoint
  L4_4 = "locator2_warp_brahman"
  L3_3(L4_4)
  L3_3 = Fn_kaiwaDemoView
  L4_4 = "ep14_00140k"
  L3_3(L4_4)
  L3_3 = pcStayCamStopOff
  L3_3()
  L3_3 = Fn_sendEventComSb
  L4_4 = "addBraPhase"
  L3_3(L4_4)
  L3_3 = Fn_sendEventComSb
  L4_4 = "sensorsAllOn"
  L3_3(L4_4)
  L3_3 = Fn_sendEventComSb
  L4_4 = "pcJoin"
  L3_3(L4_4)
  L3_3 = Fn_sendEventComSb
  L4_4 = "buyingOk"
  L3_3(L4_4)
  L3_3 = Fn_missionView
  L4_4 = "ep14_02010"
  L3_3(L4_4)
  L3_3 = 0
  while L3_3 < 114 do
    L4_4 = Fn_sendEventComSb
    L5_5 = "isPauseCaptionTime"
    L4_4 = L4_4(L5_5)
    if L4_4 == false then
      L3_3 = L3_3 + 1
    end
    L4_4 = wait
    L4_4()
  end
  L3_3 = 0
  L4_4 = Fn_captionView
  L5_5 = "ep14_02011"
  L4_4(L5_5, 4)
  while L3_3 < 180 do
    L4_4 = Fn_sendEventComSb
    L5_5 = "isPauseCaptionTime"
    L4_4 = L4_4(L5_5)
    if L4_4 == false then
      L3_3 = L3_3 + 1
    end
    L4_4 = wait
    L4_4()
  end
  L3_3 = 0
  L4_4 = Fn_captionView
  L5_5 = "ep14_02012"
  L4_4(L5_5, 4)
  while L3_3 < 150 do
    L4_4 = Fn_sendEventComSb
    L5_5 = "isPauseCaptionTime"
    L4_4 = L4_4(L5_5)
    if L4_4 == false then
      L3_3 = L3_3 + 1
    end
    L4_4 = wait
    L4_4()
  end
  while true do
    L4_4 = Fn_sendEventComSb
    L5_5 = "checkQuizPhase"
    L4_4 = L4_4(L5_5)
    if L4_4 ~= 2 then
      L4_4 = wait
      L4_4()
    end
  end
  L4_4 = Fn_kaiwaDemoView
  L5_5 = "ep14_00145k"
  L4_4(L5_5)
  L4_4 = Fn_userCtrlOff
  L4_4()
  L4_4 = {
    L5_5,
    {
      text = "ep14_02025",
      btn = Pad.kButton_RD
    },
    {
      text = "ep14_02026",
      btn = Pad.kButton_RR
    }
  }
  L5_5 = {}
  L5_5.text = "ep14_02024"
  L5_5.btn = Pad.kButton_RL
  L5_5 = HUD
  L5_5 = L5_5.selectionOpen
  L5_5(L5_5, "ep14_02027", L4_4)
  L5_5 = nil
  while true do
    L5_5 = HUD:selectionResult()
    if L5_5 ~= nil then
      if L5_5 == Pad.kButton_RL then
        Fn_captionView("ep14_02028")
      elseif L5_5 == Pad.kButton_RD then
        Fn_captionView("ep14_02029")
      elseif L5_5 == Pad.kButton_RR then
        Fn_captionView("ep14_02030")
      end
      print("kButton:" .. L5_5)
      waitSeconds(1)
      break
    end
    wait()
  end
  Fn_sendEventComSb("quizNextPhase")
  waitSeconds(2)
  Fn_captionView("ep14_02031")
  while Fn_sendEventComSb("checkQuizPhase") ~= 4 do
    wait()
  end
  Fn_captionView("ep14_02032")
  Fn_userCtrlOn()
  Fn_sendEventComSb("quizNextPhase")
  while Fn_sendEventComSb("get_pc_goal") == false do
    wait()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Mob:restrictOnNav__ed_a_root(false)
end
function pcJoinOnEnter()
  local L0_6, L1_7
  _is_in_sensor = true
end
function pcJoinOnLeave()
  local L0_8, L1_9
  _is_in_sensor = false
end
function copyTable(A0_10)
  for _FORV_5_, _FORV_6_ in pairs(A0_10) do
    ;({})[_FORV_5_] = _FORV_6_
  end
  return {}
end
