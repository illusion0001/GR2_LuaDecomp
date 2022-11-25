dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Mission/dm03_common.lua")
NAVI_SHOW_RANGE = 15
NAVI_DIS_RANGE = 10
DUSTY_CALL_RANGE = 40
DUSTY_FOUND_CAPTION = {
  "dm03_00150",
  "dm03_00151",
  "dm03_00152"
}
DUSTY_FOUND_SE = {
  "cro_258a",
  "cro_258c",
  "cro_258c"
}
CROW_CAPTION_TBL = {
  {
    "dm03_00102",
    "dm03_00128",
    "dm03_00130",
    "dm03_00105"
  },
  {
    "dm03_00111",
    "dm03_00131",
    "dm03_00130",
    "dm03_00134"
  },
  {"dm03_00113", "dm03_00135"}
}
MOB_DISAPPEAR_CAPTION = {
  {cnt = 3, cap = "3\228\186\186"},
  {cnt = 10, cap = "10\228\186\186"}
}
dm03_kat_found = false
dm03_dusty_found = false
dm03_dusty_npc = nil
dm03_dusty_puppet = nil
npc_table = {}
navi_flag = false
part_step = 0
sdemo_dm03_a = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "cat_01",
      type = "dus01",
      node = "locator2_dusty"
    },
    {
      name = "bit_01",
      type = "bit02",
      node = "locator2_bit"
    }
  }
  Fn_setupNpc(L0_0)
  dm04_bit = Fn_findNpcPuppet("bit_01")
  dm04_bit:setActive(false)
  Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
  Fn_pcSensorOff("pccubesensor2_kat")
  RAC_startCatWarpControl("dm03_a_area_out", "pccubesensor2_outrange_near_01", "pccubesensor2_outrange_near_01", "pccubesensor2_outrange_far_01", "locator2_pc_start_pos", nil, "locator2_pc_start_pos", "dm03_00147")
  sdemo_dm03_a = SDemo.create("dm03_a")
  GameDatabase:set(ggd.DlcFlags__TimeStopSituation, true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6
  L0_1 = Fn_userCtrlAllOff
  L0_1()
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = Fn_setCatActive
  L1_2 = false
  L0_1(L1_2)
  L0_1 = Fn_findNpc
  L1_2 = "cat_01"
  L0_1 = L0_1(L1_2)
  dm03_dusty_npc = L0_1
  L0_1 = Fn_findNpcPuppet
  L1_2 = "cat_01"
  L0_1 = L0_1(L1_2)
  dm03_dusty_puppet = L0_1
  L0_1 = {L1_2, L2_3}
  L1_2 = "locator2_dusty_01"
  L2_3 = "locator2_dusty_02"
  L1_2 = {
    L2_3,
    L3_4,
    L4_5
  }
  L2_3 = "locator2_dusty_11"
  L3_4 = "locator2_dusty_12"
  L4_5 = "locator2_dusty_13"
  L2_3 = {
    L3_4,
    L4_5,
    L5_6,
    "locator2_dusty_24"
  }
  L3_4 = "locator2_dusty_21"
  L4_5 = "locator2_dusty_22"
  L5_6 = "locator2_dusty_23"
  L3_4 = Fn_captionViewWait
  L4_5 = "dm03_00100"
  L3_4(L4_5)
  part_step = 1
  L3_4 = dustySee
  L3_4 = L3_4()
  L4_5 = invokeTask
  L5_6 = dustyCry
  L4_5(L5_6)
  L4_5 = Fn_missionView
  L5_6 = "dm03_00101"
  L4_5(L5_6)
  L4_5 = waitSeconds
  L5_6 = 1.3
  L4_5(L5_6)
  L4_5 = dm03_dusty_found
  if L4_5 == false then
    L4_5 = Fn_captionView
    L5_6 = "dm03_00126"
    L4_5(L5_6)
  end
  while true do
    L4_5 = dm03_dusty_found
    if L4_5 == false then
      L4_5 = wait
      L4_5()
    end
  end
  L4_5 = {
    L5_6,
    "locator2_crow_reset_02"
  }
  L5_6 = "locator2_crow_reset_01"
  L5_6 = {
    {idx = 2, cap = "dm03_00129"}
  }
  found_dusty_game(L4_5, L0_1, "locator2_dusty_10", L5_6, "cro_259a")
  L4_5 = {
    nil,
    "locator2_crow_reset_03"
  }
  L5_6 = {
    {
      idx = 2,
      cap = "dm03_00132",
      se = "cro_257"
    },
    {idx = 3, cap = "dm03_00133"}
  }
  found_dusty_game(L4_5, L1_2, "locator2_dusty_20", L5_6, "cro_259b")
  L4_5 = {
    "locator2_crow_reset_04",
    nil
  }
  L5_6 = {
    {idx = 2, cap = "dm03_00136"},
    {idx = 4, cap = "dm03_00137"}
  }
  found_dusty_game(L4_5, L2_3, nil, L5_6, nil, true)
  if L3_4 ~= nil then
    L3_4:abort()
    L3_4 = nil
  end
  Fn_naviKill()
  Fn_pcSensorOn("pccubesensor2_kat")
  Fn_naviKill()
  while dm03_kat_found == false do
    wait()
  end
  Player:setStay(true)
  Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
  sdemo_dm03_a:reset()
  sdemo_dm03_a:set("locator2_kat_view_cam", "locator2_kat_view_aim", false, Vector(0, 0, 0))
  sdemo_dm03_a:play()
  Fn_resetPcPos("locator2_warp_crow")
  Sound:playSEHandle("cro027c", 1)
  Fn_captionViewWait("dm03_00138")
  Fn_captionViewWait("dm03_00139")
  Fn_captionViewWait("dm03_00140")
  sdemo_dm03_a:set("locator2_bit_view_cam", "locator2_bit_view_aim", false, Vector(0, 0, 0))
  sdemo_dm03_a:play()
  waitSeconds(1)
  RAC_showSPNpc("bit_01")
  waitSeconds(2)
  Fn_kaiwaDemoView("dm03_00210k")
  Sound:playSEHandle("cro_258b", 1)
  Fn_captionViewWait("dm03_00141")
  Fn_captionView("dm03_00142")
  RAC_disappearSPNpc("bit_01")
  Fn_disappearNpc("cat_01", 60)
  waitSeconds(2)
  sdemo_dm03_a:stop()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_7, L1_8
end
function pccubesensor2_ark_OnEnter()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_ark")
    Fn_captionView("dm03_00117")
  end)
end
function pccubesensor2_dusty_OnEnter()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_dusty")
    dm03_dusty_found = true
  end)
end
function pccubesensor2_kat_OnEnter()
  invokeTask(function()
    Fn_pcSensorOff("pccubesensor2_kat")
    dm03_kat_found = true
  end)
end
function found_dusty_game(A0_9, A1_10, A2_11, A3_12, A4_13, A5_14)
  local L6_15, L7_16, L8_17
  if A5_14 == nil then
    A5_14 = false
  end
  L6_15 = Fn_userCtrlOff
  L6_15()
  L6_15 = Fn_captionViewWait
  L6_15(L7_16)
  L6_15 = Fn_userCtrlOn
  L6_15()
  L6_15 = Fn_turnNpc
  L6_15(L7_16)
  L6_15 = dm03_dusty_puppet
  L6_15 = L6_15.getWorldPos
  L6_15 = L6_15(L7_16)
  dus_se_pos = L6_15
  L6_15 = Sound
  L6_15 = L6_15.setAudibleRange
  L6_15(L7_16, L8_17, DUSTY_CALL_RANGE)
  L6_15 = A0_9[1]
  if L6_15 ~= nil then
    L6_15 = RAC_changeNodeCatWarpControl
    L6_15(L7_16, L8_17, nil, A0_9[1])
  end
  L6_15 = HUD
  L6_15 = L6_15.naviSetPochiDistanceDensity0
  L6_15(L7_16, L8_17)
  L6_15 = HUD
  L6_15 = L6_15.naviSetPochiDistanceDensity100
  L6_15(L7_16, L8_17)
  L6_15 = Fn_naviSet
  L6_15(L7_16)
  L6_15 = Fn_moveNpc
  L6_15 = L6_15(L7_16, L8_17, {runLength = -1, recast = true})
  L7_16(L8_17)
  L7_16(L8_17)
  L7_16(L8_17)
  for _FORV_10_, _FORV_11_ in L7_16(L8_17) do
    dustyMoveCheckCaption(_FORV_11_.idx, _FORV_11_.cap, _FORV_11_.se)
  end
  L7_16(L8_17)
  if A5_14 == false then
    L7_16()
    L7_16()
    L8_17.eff_name = "ef_ev_ds_out"
    L8_17.world_pos = dm03_dusty_puppet:getWorldPos()
    L7_16(L8_17)
    L7_16(L8_17, A2_11)
    L7_16(L8_17)
    if A4_13 ~= nil then
      L7_16(L8_17, A4_13, 1)
    end
    L7_16(L8_17)
    dm03_dusty_found = false
    L7_16()
    navi_flag = false
    L7_16(L8_17)
    if L7_16 ~= nil then
      RAC_startCatWarpControl("dm03_a_area_out", L7_16, L7_16, L8_17, A0_9[2], nil, A0_9[2], "dm03_00147")
    end
    L7_16(L8_17)
    L7_16(L8_17)
    L7_16(L8_17)
    part_step = L7_16
    repeat
      wait()
    until (dm03_dusty_puppet:getWorldPos() - L7_16):Length() < 5
  end
  dm03_dusty_found = true
end
function dustyMoveCheckCaption(A0_18, A1_19, A2_20)
  invokeTask(function()
    while true do
      if dm03_dusty_npc:getMoveCurrentIndex() >= A0_18 then
        if A2_20 ~= nil then
          Sound:playSEHandle(A2_20, 1)
        end
        Fn_captionViewWait(A1_19)
        break
      end
      wait()
    end
  end)
end
function dustyCry()
  local L0_21
  L0_21 = {
    "dm03_00143",
    "dm03_00144",
    "dm03_00145"
  }
  while dm03_dusty_found == false do
    for _FORV_4_ = 0, 300 do
      if dm03_dusty_found ~= true then
        wait()
      end
    end
    if _FOR_ == false and navi_flag == false and Fn_isCaptionView() == false then
      dus_se_pos = dm03_dusty_puppet:getWorldPos()
      Sound:setAudibleRange(Sound:playSEHandle("cat_call_4", 1, "", dus_se_pos), DUSTY_CALL_RANGE)
      if dm03_dusty_found ~= true then
        waitSeconds(0.2)
        if Fn_isCaptionView() == false then
          Camera:setControl(Camera.kPlayer, Camera.kControl_All, false)
          Fn_captionView(L0_21[math.random(#L0_21)])
          Fn_lookAtObjectWait(dm03_dusty_puppet, nil, 0.25)
          Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
        end
        wait()
      end
    end
  end
end
function dustySee()
  return invokeTask(function()
    local L0_22, L1_23, L2_24, L3_25, L4_26
    while true do
      L0_22 = dm03_dusty_found
      if L0_22 == false then
        L0_22 = Fn_isInSightTarget
        L1_23 = dm03_dusty_puppet
        L2_24 = 1
        L0_22 = L0_22(L1_23, L2_24)
        if L0_22 then
          L0_22 = Camera
          L1_23 = L0_22
          L0_22 = L0_22.getEyePos
          L0_22 = L0_22(L1_23)
          L1_23 = dm03_dusty_puppet
          L2_24 = L1_23
          L1_23 = L1_23.getWorldPos
          L1_23 = L1_23(L2_24)
          L2_24 = Fn_getDistanceToPlayer
          L3_25 = L1_23
          L2_24 = L2_24(L3_25)
          L3_25 = Query
          L4_26 = L3_25
          L3_25 = L3_25.setEyeSightRange
          L3_25(L4_26, L2_24 + 1)
          L3_25 = dm03_dusty_puppet
          L4_26 = L3_25
          L3_25 = L3_25.getWorldTransform
          L4_26 = L3_25(L4_26)
          L3_25.y = L3_25.y + 1
          Query:setEyeSightTransform(L3_25, L4_26)
          if Query:raycastEyeSight(L0_22) == nil and navi_flag == false and L2_24 <= NAVI_SHOW_RANGE then
            HUD:naviSetPochiDistanceDensity0(NAVI_DIS_RANGE)
            HUD:naviSetPochiDistanceDensity100(NAVI_SHOW_RANGE)
            Fn_naviSet(dm03_dusty_puppet)
            navi_flag = true
            Sound:playSEHandle(DUSTY_FOUND_SE[part_step], 1)
            Fn_captionViewWait(DUSTY_FOUND_CAPTION[part_step])
          end
        end
      end
      L0_22 = wait
      L0_22()
    end
  end)
end
function dustyPauseMove(A0_27)
  local L1_28
  L1_28 = nil
  repeat
    if (dm03_dusty_puppet:getWorldPos() - Fn_getPcPosRot()):Length() > 20 then
      RAC_changeWarningTxtCatWarpControl("dm03_a_area_out", "dm03_00146")
      dm03_dusty_npc:pauseMove(true)
      if L1_28 == nil then
        L1_28 = invokeTask(function()
          Fn_playMotionNpc(dm03_dusty_npc, "stay", false)
          Fn_turnNpc(dm03_dusty_npc)
          while true do
            wait()
          end
        end)
      end
    else
      RAC_changeWarningTxtCatWarpControl("dm03_a_area_out", "dm03_00147")
      dm03_dusty_npc:pauseMove(false)
      if L1_28 ~= nil and L1_28:isRunning() then
        L1_28:abort()
        L1_28 = nil
      end
    end
    wait()
  until not A0_27:isRunning()
end
