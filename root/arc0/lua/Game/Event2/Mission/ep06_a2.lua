import("HUD")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
_global = {
  puppet_tbl = {},
  water_act_rich2 = false,
  catwarp_navi = false
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_rich_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_water_area")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_warning_04")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_warp_area_04")
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = {
    {
      name = "rich_02",
      type = "wom29",
      node = "locator2_rich_02",
      active = true,
      reset = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _global.puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _global.puppet_tbl.ep06_madam_01 = Fn_findNpcPuppet("ep06_madam_01")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19
  L0_1 = Fn_setCatWarp
  L1_2 = false
  L0_1(L1_2)
  L0_1 = anoterCatWarp
  L0_1()
  L0_1 = Fn_setCatWarpCheckPoint
  L1_2 = "locator2_pc_start_pos"
  L0_1(L1_2)
  L0_1 = Fn_pcSensorOff
  L1_2 = "pccubesensor2_next_part_02"
  L0_1(L1_2)
  L0_1 = Fn_playMotionNpc
  L1_2 = "rich_02"
  L2_3 = "stay_03"
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1 = Fn_missionStart
  L0_1()
  L0_1 = Fn_sendEventComSb
  L1_2 = "getPrevPhaseContinue"
  L0_1 = L0_1(L1_2)
  if L0_1 == false then
    L0_1 = Fn_kaiwaDemoView
    L1_2 = "ep06_00130k"
    L0_1(L1_2)
    L0_1 = Fn_playMotionNpc
    L1_2 = "rich_02"
    L2_3 = "stay_03"
    L3_4 = false
    L0_1(L1_2, L2_3, L3_4)
  end
  L0_1 = Fn_loadNpcEventMotion
  L1_2 = "rich_02"
  L2_3 = {}
  L2_3.tp = "wom01_trouble_00"
  L0_1(L1_2, L2_3)
  L0_1 = Fn_userCtrlOn
  L0_1()
  L0_1 = 0
  L1_2 = 1
  L2_3 = 4
  L3_4 = 8
  L4_5 = 12
  L5_6 = {}
  L6_7 = 12
  L7_8 = {}
  L8_9 = {}
  function L9_10(A0_20, A1_21)
    if A1_21 == "water" then
      for _FORV_6_, _FORV_7_ in pairs(L5_6) do
        if A0_20:getName() == _FORV_7_:getName() then
          Sound:pulse("success")
          if L7_8[_FORV_6_] ~= nil then
            L7_8[_FORV_6_]:setActive(false)
            L7_8[_FORV_6_]:del()
            L7_8[_FORV_6_] = nil
            L5_6[_FORV_6_]:setLockonPermission(false)
            L5_6[_FORV_6_]:setActive(false)
            L0_1 = L0_1 + 1
          end
          break
        end
      end
    end
  end
  function L10_11(A0_22, A1_23)
    local L2_24, L3_25, L4_26
    L3_25 = A0_22
    L2_24 = A0_22.getName
    L2_24 = L2_24(L3_25)
    if A1_23 == "water" then
      L3_25 = _global
      L3_25.water_act_rich2 = true
      L3_25 = findGameObject2
      L4_26 = "Node"
      L3_25 = L3_25(L4_26, "locator2_rich_02")
      L4_26 = L3_25.getWorldPos
      L4_26 = L4_26(L3_25)
      _global.puppet_tbl.rich_02:setWorldPos(L4_26)
      Fn_playMotionNpc("rich_02", "surprise_00", false)
    end
  end
  L11_12 = invokeTask
  function L12_13()
    while true do
      if _global.water_act_rich2 then
        waitSeconds(1.5)
        Fn_turnNpc("rich_02")
        Fn_playMotionNpc("rich_02", "talk_angry_00", false)
        Fn_captionViewWait("ep06_00152")
        waitSeconds(2.5)
        Fn_playMotionNpc("rich_02", "stay", false, {animBlendDuration = 1})
        _global.water_act_rich2 = false
      end
      wait()
    end
  end
  L11_12 = L11_12(L12_13)
  L12_13 = {}
  for L16_17 = 1, 12 do
    L18_19 = string
    L18_19 = L18_19.format
    L18_19 = L18_19("%02d", L16_17)
    L12_13[L16_17] = L17_18
  end
  L5_6 = L13_14
  for L16_17 = 1, 12 do
    L18_19 = L17_18
    L17_18(L18_19, "damage", L9_10)
  end
  rich_col = L14_15
  L14_15(L15_16, L16_17, L17_18)
  L14_15(L15_16, L16_17)
  L14_15(L15_16, L16_17)
  L14_15(L15_16, L16_17)
  L14_15(L15_16)
  L15_16(L16_17)
  L15_16()
  L15_16()
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16()
  L15_16(L16_17, L17_18)
  L15_16(L16_17, L17_18)
  L15_16(L16_17, L17_18)
  L15_16()
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  for L18_19 = 1, L2_3 do
    L5_6[L18_19]:setActive(true)
    L7_8[L18_19] = HUD:mnaviNew({
      name = "mnavi_" .. L18_19,
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    })
    L7_8[L18_19]:setTarget(L5_6[L18_19])
    L5_6[L18_19]:setLockonPermission(true)
  end
  L15_16(L16_17)
  for L18_19, _FORV_19_ in L15_16(L16_17) do
    L7_8[L18_19]:setActive(true)
  end
  while true do
    L15_16(L16_17, L17_18)
    L15_16(L16_17, L17_18)
    for L18_19 = 1, L6_7 do
      if L5_6[L18_19] ~= nil and L5_6[L18_19]:isBroken() and L7_8[L18_19] ~= nil then
        L7_8[L18_19]:setActive(false)
        L7_8[L18_19]:del()
        L7_8[L18_19] = nil
        L0_1 = L0_1 + 1
      end
    end
    if L0_1 >= 3 and L1_2 == 1 then
      L1_2 = 2
      for L18_19 = 5, L3_4 do
        L5_6[L18_19]:setActive(true)
        L7_8[L18_19] = HUD:mnaviNew({
          name = "mnavi_" .. L18_19,
          PochFadeLen0 = 5,
          PochFadeLen100 = 20
        })
        L7_8[L18_19]:setTarget(L5_6[L18_19])
        L5_6[L18_19]:setLockonPermission(true)
        L7_8[L18_19]:setActive(true)
      end
      L15_16(L16_17)
      L15_16(L16_17)
    elseif L0_1 >= 7 and L1_2 == 2 then
      L1_2 = 3
      for L18_19 = 9, L4_5 do
        L5_6[L18_19]:setActive(true)
        L7_8[L18_19] = HUD:mnaviNew({
          name = "mnavi_" .. L18_19,
          PochFadeLen0 = 5,
          PochFadeLen100 = 20
        })
        L7_8[L18_19]:setTarget(L5_6[L18_19])
        L5_6[L18_19]:setLockonPermission(true)
        L7_8[L18_19]:setActive(true)
      end
      L15_16(L16_17)
      L15_16(L16_17)
    end
    if L0_1 ~= L6_7 then
      L15_16()
    end
  end
  L15_16(L16_17, L17_18)
  L15_16(L16_17)
  L15_16(L16_17)
  if L15_16 ~= nil then
    L15_16(L16_17, L17_18)
    L15_16(L16_17, L17_18)
    L15_16[1] = nil
  end
  L18_19 = "locator2_rich_02"
  L18_19 = L16_17(L17_18, L18_19)
  L15_16(L16_17, L17_18, L18_19, L16_17(L17_18, L18_19))
  L15_16(L16_17)
  L15_16()
  L15_16()
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L11_12 = L15_16
  for L18_19 = 1, 12 do
    if L5_6[L18_19] ~= nil then
      L5_6[L18_19]:setLockonPermission(false)
      L5_6[L18_19] = nil
    end
  end
  L15_16()
  L15_16(L16_17, L17_18)
  L18_19 = false
  L15_16(L16_17, L17_18, L18_19)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L18_19 = "locator2_rich_03_home_01"
  L18_19 = L16_17(L17_18, L18_19)
  L15_16(L16_17, L17_18, L18_19, L16_17(L17_18, L18_19))
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16()
  L15_16(L16_17, L17_18)
  L15_16(L16_17)
  L15_16(L16_17, L17_18)
  while true do
    if not L15_16 then
      L15_16()
    end
  end
  L15_16(L16_17)
  while true do
    if not L15_16 then
      L15_16()
    end
  end
  L15_16()
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17)
  while true do
    if not L15_16 then
      L15_16()
    end
  end
  L15_16.catwarp_navi = false
  L15_16(L16_17)
  L15_16(L16_17)
  L15_16(L16_17, L17_18)
  L15_16()
  L15_16()
  L15_16()
  L15_16()
end
function Finalize()
  local L0_27, L1_28
end
function pccubesensor2_water_area_OnEnter()
  Fn_tutorialCaption("grab")
end
function pccubesensor2_water_area_OnLeave()
  Fn_tutorialCaptionKill()
end
function pccubesensor2_rich_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_next_part_02_OnLeave()
  Mv_gotoNextPhase()
end
function pccubesensor2_rich_03_home_OnEnter()
  Fn_naviKill()
  Fn_pcSensorOff("pccubesensor2_rich_03_home")
  notFoundMsg()
end
function pccubesensor2_warp_warning_03_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep06_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_warning_04_OnLeave()
  invokeTask(function()
    if _global.catwarp_navi == true then
      Fn_naviSet(findGameObject2("Node", "locator2_rich_03_home_01"))
    end
    Player:setStay(true)
    Fn_captionViewWait("ep06_09000", nil, false)
    Player:setStay(false)
  end)
end
function pccubesensor2_warp_warning_04_OnEnter()
  if _global.catwarp_navi == true then
    Fn_naviKill()
  end
end
function pccubesensor2_warp_area_03_OnLeave()
  runCatWarp()
end
function pccubesensor2_warp_area_04_OnLeave()
  runCatWarp()
end
function notFoundMsg()
  invokeTask(function()
    _global.catwarp_navi = true
    Fn_setCatWarpCheckPoint("locator2_rich_03_home_01")
    Fn_captionViewWait("ep06_00150")
    Fn_captionViewWait("ep06_00151")
  end)
end
