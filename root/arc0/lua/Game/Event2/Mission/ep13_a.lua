dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
VIEW_POS_MAX = 2
GRI_MAX = 2
_puppet_tbl = {}
_in_park = true
_mission_view_task = nil
_home_navi = nil
_yakata_navi = nil
_visited_flg = false
_home_act = false
_sdemo = nil
_sdemo2 = nil
_in_yakata_sensor = false
_in_yakata_mask = false
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_park_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_near_yakata_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_near_yakata_mask_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_a_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_a_01")
  L0_0 = {
    {
      name = "gri01",
      type = "mcgri",
      node = "locator2_gri01_01",
      active = false
    },
    {
      name = "gri02",
      type = "mcgri",
      node = "locator2_gri02_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _home_navi = findGameObject2("Node", "locator2_navi_home_01")
  _yakata_navi = findGameObject2("Node", "locator2_navi_yakata")
  _sdemo = SDemo.create("ep13_sdemo")
  _sdemo2 = SDemo.create("ep13_sdemo2")
  HUD:furnitureReconfiguration("ep13")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setSituation
  L2_3 = Player
  L2_3 = L2_3.kSituation_Normal
  L3_4 = true
  L0_1(L1_2, L2_3, L3_4, L4_5, L5_6, L6_7)
  L0_1 = Player
  L1_2 = L0_1
  L0_1 = L0_1.setAttrTune
  L2_3 = Player
  L2_3 = L2_3.kAttrTune_Normal
  L3_4 = true
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_setCatWarp
  L1_2 = false
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_warning_a_01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_catwarp_area_a_01"
  L0_1(L1_2)
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_park_01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_return_home"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_near_yakata_01"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOn
  L1_2 = "pccubesensor2_near_yakata_mask_01"
  L0_1(L1_2)
  L0_1 = Fn_kaiwaDemoView
  L1_2 = "ep13_00110k"
  L0_1(L1_2)
  L0_1 = wait
  L0_1()
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Fn_digoutResultForMission
  L0_1()
  L0_1 = wait
  L0_1()
  L0_1 = HUD
  L1_2 = L0_1
  L0_1 = L0_1.info
  L2_3 = "ep13_info_02"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_sendEventComSb
  L1_2 = "startAttrTuneCheck"
  L0_1(L1_2)
  L0_1 = invokeTask
  function L1_2()
    Fn_missionView("ep13_00106")
    waitSeconds(1.3)
    Fn_naviSet(_home_navi)
    waitSeconds(5.5)
    Fn_captionViewWait("ep13_00105")
    Fn_captionView("ep13_00108", 0)
    invokeTask(function()
      while true do
        if _in_park == false then
          print("\229\133\172\229\156\146\227\129\139\227\130\137\229\135\186\227\129\166\227\129\132\227\130\139\227\129\174\227\129\167\227\128\1295\231\167\146\229\190\140\227\129\171\230\147\141\228\189\156\227\130\172\227\130\164\227\131\137\230\182\136\227\129\136\227\129\190\227\129\153")
          Fn_pcSensorOff("pccubesensor2_park_01")
          waitSeconds(5)
          Fn_captionViewEnd()
          break
        end
        wait()
      end
    end)
  end
  L0_1 = L0_1(L1_2)
  L1_2 = false
  L2_3 = false
  L3_4 = {}
  for L7_8 = 1, VIEW_POS_MAX do
    L10_11 = "locator2_gaze_yakata_"
    L11_12 = string
    L11_12 = L11_12.format
    L12_13 = "%02d"
    L11_12 = L11_12(L12_13, L13_14)
    L10_11 = L10_11 .. L11_12
    L3_4[L7_8] = L8_9
  end
  while true do
    if not L5_6 then
      if L5_6 then
        L5_6()
        L0_1 = L5_6
        L5_6()
        L5_6()
        L5_6(L6_7, L7_8)
        L5_6(L6_7)
        L5_6(L6_7)
        L5_6(L6_7, L7_8)
        L6_7.pos = "locator2_sdemo_home_aim_02"
        L6_7.time = 2.5
        L6_7(L7_8, L8_9, L9_10)
        L6_7(L7_8)
        L6_7(L7_8)
        L6_7(L7_8, L8_9, L9_10)
        while true do
          if L6_7 then
            L6_7()
          end
        end
        L6_7(L7_8)
        L6_7(L7_8, L8_9)
        L6_7()
        _home_act = false
      elseif L1_2 then
        L10_11 = "locator2_gri01_move_03"
        L6_7[1] = L7_8
        L6_7[2] = L7_8
        for L10_11 = 1, GRI_MAX do
          L11_12 = Fn_moveNpc
          L12_13 = "gri"
          L12_13 = L12_13 .. L13_14
          L11_12 = L11_12(L12_13, L13_14)
          L5_6[1] = L11_12
        end
        L7_8()
        L10_11 = "locator2_sdemo2_aim_01"
        L7_8(L8_9, L9_10, L10_11)
        L7_8(L8_9)
        L10_11 = 0
        L11_12 = 0
        L12_13 = 0
        L16_17 = L9_10(L10_11, L11_12, L12_13)
        L7_8(L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L9_10(L10_11, L11_12, L12_13))
        L7_8()
        L7_8(L8_9)
        L9_10.pos = "locator2_sdemo2_cam_02"
        L9_10.time = L7_8
        L10_11 = {}
        L10_11.pos = "locator2_sdemo2_aim_02"
        L10_11.time = L7_8
        L10_11 = _sdemo2
        L11_12 = L10_11
        L10_11 = L10_11.play
        L12_13 = L8_9
        L10_11(L11_12, L12_13, L13_14)
        L10_11 = findGameObject2
        L11_12 = "Node"
        L12_13 = "locator2_pc_bpart_start_pos"
        L10_11 = L10_11(L11_12, L12_13)
        L12_13 = L10_11
        L11_12 = L10_11.getWorldTransform
        L12_13 = L11_12(L12_13)
        L13_14(L14_15, L15_16)
        while true do
          if L13_14 then
            L13_14()
          end
        end
        L13_14(L14_15)
        for L16_17 = 1, GRI_MAX do
          L5_6[L16_17] = Mv_safeTaskAbort(L5_6[L16_17])
          Fn_setNpcActive("gri" .. string.format("%02d", L16_17), false)
        end
        L13_14()
        L13_14(L14_15, L15_16)
        L1_2 = false
      end
      L5_6()
    end
  end
  for L8_9 = 1, GRI_MAX do
    L10_11 = "gri"
    L11_12 = string
    L11_12 = L11_12.format
    L12_13 = "%02d"
    L11_12 = L11_12(L12_13, L13_14)
    L10_11 = L10_11 .. L11_12
    L9_10(L10_11)
  end
  L5_6()
  L5_6()
  L5_6()
  L5_6()
end
function Finalize()
  local L0_18, L1_19
end
function pccubesensor2_park_01_OnEnter()
  local L0_20, L1_21
  _in_park = true
end
function pccubesensor2_park_01_OnLeave()
  local L0_22, L1_23
  _in_park = false
end
function pccubesensor2_near_yakata_01_OnEnter()
  local L0_24, L1_25
  _in_yakata_sensor = true
end
function pccubesensor2_near_yakata_01_OnLeave()
  local L0_26, L1_27
  _in_yakata_sensor = false
end
function pccubesensor2_near_yakata_mask_01_OnEnter()
  local L0_28, L1_29
  _in_yakata_mask = true
end
function pccubesensor2_near_yakata_mask_01_OnLeave()
  local L0_30, L1_31
  _in_yakata_mask = false
end
function pccubesensor2_catwarp_warning_a_01_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep13_00109")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_area_a_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_return_home_OnEnter(A0_32)
  _home_act = true
  Fn_naviKill()
  A0_32:setActive(false)
end
function homeAction()
  if not _visited_flg then
    Fn_kaiwaDemoView("ep13_00120k")
    _visited_flg = true
    _sdemo:stop()
    Player:setStay(false)
    Fn_userCtrlOn()
    waitSeconds(1)
    _mission_view_task = invokeTask(function()
      Fn_missionView("ep13_00101")
      waitSeconds(1.3)
      Fn_naviSet(_yakata_navi)
      waitSeconds(5.5)
      Fn_captionView("ep13_00102")
    end)
  else
    Fn_kaiwaDemoView("ep13_00121k")
    Player:setStay(false)
    Mv_gotoNextPhase()
    _sdemo:stop()
  end
end
function yakataAction()
  Fn_kaiwaDemoView("ep13_00130k")
  Fn_setKittenActive(true)
  Fn_setCatActive(true)
  Player:setStay(false)
  if not _visited_flg then
    Fn_naviSet(_home_navi)
    Fn_captionView("ep13_00103")
    _visited_flg = true
    Fn_userCtrlOn()
  else
    Mv_gotoNextPhase()
  end
end
