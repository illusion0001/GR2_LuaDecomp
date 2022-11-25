dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_next_phase = false
_puppet_tbl = {}
_vogo_task = nil
_cid_task = nil
_mot_task = {}
function Initialize()
  local L0_0, L1_1
  L0_0 = Fn_userCtrlAllOff
  L0_0()
  L0_0 = {
    L1_1,
    "evarea2_po_a_02"
  }
  L1_1 = "evarea2_po_a_04"
  L1_1 = Fn_loadEventData
  L1_1("evx/ep90", L0_0, true)
  L1_1 = {
    "evarea2_po_a_04_crate_before",
    "evarea2_po_a_04_crate_dummy"
  }
  L0_0 = L1_1
  L1_1 = Fn_loadEventData
  L1_1("evx/ep90_common", L0_0)
  L1_1 = {
    "evarea2_po_a_04_common",
    "evarea2_po_a_02_common"
  }
  L0_0 = L1_1
  L1_1 = Fn_loadEventData
  L1_1("evx/ep90_common", L0_0, true)
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_04_in")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_04_out")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_02_navi")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_02_in")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_po_a_02_out")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_cid01")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_cid01_navi")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_mutter")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_sys01_vctrl")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_sys01")
  L1_1 = Fn_pcSensorOff
  L1_1("pccubesensor2_sys01_navi")
  L1_1 = {
    {
      name = "ryz01",
      type = "ryz01",
      node = "locator2_ryz01",
      attach = false,
      anim_name = "stay_01"
    },
    {
      name = "phi01",
      type = "phi01",
      node = "locator2_phi01",
      attach = false
    },
    {
      name = "cid01",
      type = "cid01",
      node = "locator2_cid01",
      attach = false
    },
    {
      name = "man_00600k",
      type = "man39",
      node = "locator2_man_00600k",
      attach = false
    },
    {
      name = "po_a_04_mob_01",
      type = "man33",
      node = "locator2_po_a_04_mob_01",
      attach = false
    },
    {
      name = "po_a_04_mob_02",
      type = "man32",
      node = "locator2_po_a_04_mob_02",
      attach = false
    },
    {
      name = "po_a_04_mob_03",
      type = "wom23",
      node = "locator2_po_a_04_mob_03",
      attach = false
    },
    {
      name = "sis01",
      type = "sis01",
      node = "locator2_sis01"
    },
    {
      name = "man_00900k",
      type = "man34",
      node = "locator2_man_00900k",
      anim_name = "sit_00"
    },
    {
      name = "man_01000k",
      type = "man40",
      node = "locator2_man_01000k"
    },
    {
      name = "man_01100k",
      type = "man38",
      node = "locator2_man_01100k",
      anim_name = "stay_02"
    }
  }
  Fn_setupNpc(L1_1)
  for _FORV_5_, _FORV_6_ in pairs(L1_1) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
  end
  Fn_setKaiwaDemo(_puppet_tbl.ryz01, "ep90_00300k", nil, true, nil, nil, nil, "ui_map_msinfo_main_ep90_info03")
  Fn_setKaiwaDemo(_puppet_tbl.phi01, "ep90_00400k", nil, true, nil, nil, nil, "ui_map_msinfo_main_ep90_info04")
  Fn_setKaiwaDemo(_puppet_tbl.man_00600k, "ep90_00600k", nil, true, nil, nil, nil, "ui_map_msinfo_main_ep90_info06")
  Fn_setKaiwaDemo(_puppet_tbl.man_00900k, "ep90_00900k", nil, true, nil, nil, nil, "ui_map_msinfo_main_ep90_info09")
  Fn_setKaiwaDemo(_puppet_tbl.man_01000k, "ep90_01000k", nil, true, nil, nil, nil, "ui_map_msinfo_main_ep90_info10")
  Fn_setKaiwaDemo(_puppet_tbl.man_01100k, "ep90_01100k", nil, true, nil, nil, nil, "ui_map_msinfo_main_ep90_info11")
  Fn_disableKaiwaDemo(_puppet_tbl.man_00900k)
  Fn_disableKaiwaDemo(_puppet_tbl.man_01000k)
  Fn_disableKaiwaDemo(_puppet_tbl.man_01100k)
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8, L7_9, L8_10, L9_11, L10_12, L11_13, L12_14, L13_15, L14_16
  L0_2 = Fn_playLoopMotionInsert
  L1_3 = "cid01"
  L2_4 = "stay"
  L3_5 = {L4_6, L5_7}
  L4_6 = "stay_01"
  L4_6 = 10
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7)
  L0_2 = Fn_playLoopMotionInsert
  L1_3 = "man_00600k"
  L2_4 = "stay"
  L3_5 = {L4_6}
  L4_6 = "lookaround"
  L4_6 = 10
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7)
  L0_2 = Fn_repeatPlayMotion
  L1_3 = "po_a_04_mob_01"
  L2_4 = "talk_03"
  L3_5 = {L4_6}
  L4_6 = "talk_00"
  L4_6 = 10
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7)
  L0_2 = Fn_repeatPlayMotion
  L1_3 = "po_a_04_mob_02"
  L2_4 = "talk_01"
  L3_5 = {L4_6}
  L4_6 = "talk_sad_00"
  L4_6 = 10
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7)
  L0_2 = Fn_repeatPlayMotion
  L1_3 = "po_a_04_mob_03"
  L2_4 = "talk_01"
  L3_5 = {L4_6, L5_7}
  L4_6 = "talk_02"
  L4_6 = 10
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7)
  L0_2 = _mot_task
  L1_3 = Fn_playLoopMotionRand
  L2_4 = "sis01"
  L3_5 = {
    L4_6,
    L5_7,
    L6_8
  }
  L4_6 = "stay"
  L4_6 = 10
  L1_3 = L1_3(L2_4, L3_5, L4_6, L5_7)
  L0_2.sis01 = L1_3
  L0_2 = Fn_playLoopMotionInsert
  L1_3 = "man_01000k"
  L2_4 = "stay"
  L3_5 = {L4_6}
  L4_6 = "stay_01"
  L4_6 = 10
  L0_2(L1_3, L2_4, L3_5, L4_6, L5_7)
  L0_2 = vogo_crate_broken_demo
  L0_2 = L0_2()
  _vogo_task = L0_2
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_userCtrlOn
  L0_2()
  L0_2 = 0
  while true do
    if L0_2 == 0 then
      L1_3 = Fn_setCatWarpCheckPoint
      L2_4 = "locator2_pc_start_pos"
      L1_3(L2_4)
      L1_3 = Fn_kaiwaDemoView
      L2_4 = "ep90_00200k"
      L1_3(L2_4)
      L1_3 = Fn_missionView
      L2_4 = "ep90_00575"
      L1_3(L2_4)
      L1_3 = invokeTask
      function L2_4()
        waitSeconds(2)
        Fn_captionView("ep90_00600")
      end
      L1_3(L2_4)
      L0_2 = 1
    elseif L0_2 == 1 then
      L1_3 = Fn_pcSensorOn
      L2_4 = "pccubesensor2_po_a_04_in"
      L1_3(L2_4)
      L1_3 = Fn_pcSensorOn
      L2_4 = "pccubesensor2_po_a_04_out"
      L1_3(L2_4)
      L1_3 = {}
      L2_4 = {}
      L2_4.in_vol = false
      L2_4.check = false
      L3_5 = findGameObject2
      L4_6 = "Node"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.node_hdl = L3_5
      L2_4.navi_hdl = nil
      L3_5 = findGameObject2
      L4_6 = "PlayerSensor"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.cbv_hdl = L3_5
      L1_3.crate_a = L2_4
      L2_4 = {}
      L2_4.in_vol = false
      L2_4.check = false
      L3_5 = findGameObject2
      L4_6 = "Node"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.node_hdl = L3_5
      L2_4.navi_hdl = nil
      L3_5 = findGameObject2
      L4_6 = "PlayerSensor"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.cbv_hdl = L3_5
      L1_3.crate_b = L2_4
      L2_4 = {}
      L2_4.in_vol = false
      L2_4.check = false
      L3_5 = findGameObject2
      L4_6 = "Node"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.node_hdl = L3_5
      L2_4.navi_hdl = nil
      L3_5 = findGameObject2
      L4_6 = "PlayerSensor"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.cbv_hdl = L3_5
      L1_3.crate_c = L2_4
      L2_4 = {}
      L2_4.in_vol = false
      L2_4.check = false
      L3_5 = findGameObject2
      L4_6 = "Node"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.node_hdl = L3_5
      L2_4.navi_hdl = nil
      L3_5 = findGameObject2
      L4_6 = "PlayerSensor"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.cbv_hdl = L3_5
      L1_3.crate_d = L2_4
      L2_4 = {}
      L2_4.in_vol = false
      L2_4.check = false
      L3_5 = findGameObject2
      L4_6 = "Node"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.node_hdl = L3_5
      L2_4.navi_hdl = nil
      L3_5 = findGameObject2
      L4_6 = "PlayerSensor"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.cbv_hdl = L3_5
      L1_3.crate_e = L2_4
      L2_4 = {}
      L2_4.in_vol = false
      L2_4.check = false
      L3_5 = findGameObject2
      L4_6 = "Node"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.node_hdl = L3_5
      L2_4.navi_hdl = nil
      L3_5 = findGameObject2
      L4_6 = "PlayerSensor"
      L3_5 = L3_5(L4_6, L5_7)
      L2_4.cbv_hdl = L3_5
      L1_3.crate_f = L2_4
      L2_4 = {
        L3_5,
        L4_6,
        L5_7,
        L6_8,
        L7_9,
        L8_10
      }
      L3_5 = "ep90_00621"
      L4_6 = "ep90_00622"
      L8_10 = "ep90_00629"
      L3_5 = 1
      L4_6 = nil
      for L8_10, L9_11 in L5_7(L6_8) do
        L10_12 = "pccubesensor2_"
        L10_12 = L10_12 .. L11_13
        L14_16[L11_13] = function()
          L9_11.in_vol = true
          if L9_11.navi_hdl ~= nil then
            L9_11.navi_hdl:setActive(false)
          end
          L4_6 = invokeTask(function()
            local L0_17
            L0_17 = L9_11.node_hdl
            L0_17 = L0_17.getWorldPos
            L0_17 = L0_17(L0_17)
            while L9_11.in_vol == true do
              if false == false then
                if Player:getAction() == Player.kAction_Idle then
                end
              elseif true == true then
                Camera:setViewControlTarget(L0_17)
                Player:setLookAtIk(true, 1, L0_17)
                if (0 < Pad:getStick(Pad.kStick_Camera) or 0 < Pad:getStick(Pad.kStick_Camera)) and 0 + 1 > 10 then
                  Player:setLookAtIk(false, 1, Vector(0, 0, 0))
                end
              end
              if Fn_isInSightTarget(L9_11.node_hdl, 0.4) == true then
                Fn_actionDialog(L10_12, nil, nil, "ep90_00650", nil, L13_15)
                break
              end
              wait()
            end
            Player:setLookAtIk(false, 1, Vector(0, 0, 0))
          end)
        end
        L14_16[L12_14] = function()
          L9_11.in_vol = false
          Fn_actionDialogCancel(L10_12)
          if L4_6 ~= nil and L4_6:isRunning() == true then
            L4_6:abort()
          end
          L4_6 = nil
          if L9_11.navi_hdl ~= nil and L9_11.check == false then
            L9_11.navi_hdl:setActive(true)
          end
        end
        do break end
        break
      end
      L8_10 = 40
      L9_11 = _G
      function L10_12()
        L8_10 = 100
        L7_9 = false
        if L6_8 == false and L5_7 == true then
          L6_8 = true
          Fn_naviKill()
          Fn_captionView("ep90_00660")
        end
      end
      L9_11.pccubesensor2_crane_OnEnter = L10_12
      L9_11 = _G
      function L10_12()
        local L0_18, L1_19
        L0_18 = 40
        L8_10 = L0_18
        L0_18 = true
        L7_9 = L0_18
      end
      L9_11.pccubesensor2_crane_OnLeave = L10_12
      L9_11 = 0
      L10_12 = findGameObject2
      L10_12 = L10_12(L11_13, L12_14)
      while true do
        if L11_13 == false then
          if L5_7 == false and L9_11 > 90 then
            if L11_13 == false then
              for _FORV_15_, _FORV_16_ in L12_14(L13_15) do
                if _FORV_16_.in_vol == true then
                  break
                end
                if _FORV_16_.navi_hdl ~= nil and _FORV_16_.navi_hdl:getActive() == true then
                  break
                end
              end
              if L11_13 == false then
                L12_14(L13_15)
                L12_14(L13_15)
                L12_14(L13_15)
                L12_14(L13_15)
              end
            end
          end
          for L14_16, _FORV_15_ in L11_13(L12_14) do
            if _FORV_15_.in_vol == false and _FORV_15_.check == false and _FORV_15_.navi_hdl == nil and is_check_eye_node(_FORV_15_.node_hdl, L8_10, 0.7, L7_9) == true then
              _FORV_15_.navi_hdl = HUD:mnaviNew({
                name = "mnavi_" .. L14_16
              })
              _FORV_15_.navi_hdl:setTarget(_FORV_15_.node_hdl)
              _FORV_15_.navi_hdl:setActive(true)
            end
          end
          L9_11 = L9_11 + 0.1
          L11_13(L12_14)
        end
      end
      for L14_16, _FORV_15_ in L11_13(L12_14) do
        if _FORV_15_.navi_hdl ~= nil then
          _FORV_15_.navi_hdl:setActive(false)
          _FORV_15_.navi_hdl:del()
        end
        _FORV_15_.navi_hdl = nil
      end
      L11_13(L12_14)
      L11_13(L12_14)
      L12_14(L13_15)
      L12_14(L13_15, L14_16, 1, "", L11_13:getPuppet())
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15, L14_16)
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      L12_14.pccubesensor2_cid01_OnEnter = L13_15
      L12_14.pccubesensor2_cid01_navi_OnLeave = L13_15
      L12_14()
      L12_14(L13_15)
      L12_14(L13_15, L14_16)
      L12_14(L13_15)
      if L12_14 ~= nil then
        if L12_14 == true then
          L12_14(L13_15)
        end
      end
      _cid_task = nil
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L12_14(L13_15)
      L13_15(L14_16)
      L13_15(L14_16)
      L13_15()
      L0_2 = 2
      break
    else
      if L0_2 == 2 then
        L1_3 = Fn_setCatWarpCheckPoint
        L2_4 = "locator2_ep90_a_market"
        L1_3(L2_4)
        L1_3 = Fn_captionView
        L2_4 = "ep90_00620"
        L1_3(L2_4)
        L1_3 = {L2_4}
        L2_4 = {}
        L2_4.name = "thief"
        L2_4.type = "ep90_thief"
        L2_4.node = "locator2_thief"
        L2_4.start = true
        L2_4 = Fn_setupNpc
        L3_5 = L1_3
        L2_4(L3_5)
        L2_4 = Fn_findNpc
        L3_5 = "thief"
        L2_4 = L2_4(L3_5)
        L4_6 = L2_4
        L3_5 = L2_4.getPuppet
        L3_5 = L3_5(L4_6)
        function L4_6(A0_20)
          if A0_20 == true then
            print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\239\188\154\230\136\144\229\138\159")
          else
            print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\239\188\154\229\164\177\230\149\151")
          end
        end
        L8_10 = 0
        L9_11 = 0.5
        L10_12 = 0
        L8_10 = L4_6
        L9_11 = {}
        L9_11.guide = "ep90_01010"
        L5_7(L6_8, L7_9, L8_10, L9_11)
        L5_7(L6_8, L7_9)
        if L5_7 ~= nil then
          if L5_7 == true then
            L5_7(L6_8)
          end
        end
        L5_7.sis01 = nil
        L5_7(L6_8, L7_9)
        L5_7(L6_8)
        L5_7(L6_8)
        L5_7(L6_8)
        L6_8(L7_9)
        L6_8(L7_9)
        cap_task_kill = L7_9
        L8_10 = _G
        function L9_11()
          if L6_8 == nil then
            L6_8 = invokeTask(function()
              local L0_21, L1_22
              L0_21 = {
                L1_22,
                "ep90_00691",
                "ep90_00692",
                "ep90_00693"
              }
              L1_22 = "ep90_00690"
              L1_22 = 0
              repeat
                L1_22 = L1_22 - 1
                if L1_22 <= 0 then
                  Fn_captionView(L0_21[RandI(1, #L0_21)])
                  L1_22 = RandI(4, 8)
                end
                waitSeconds(1)
              until L7_9
            end)
          end
        end
        L8_10.pccubesensor2_mutter_OnEnter = L9_11
        L8_10 = _G
        function L9_11()
          cap_task_kill()
        end
        L8_10.pccubesensor2_mutter_OnLeave = L9_11
        L8_10 = _G
        function L9_11()
          Fn_pcSensorOff("pccubesensor2_sys01_vctrl")
          invokeTask(function()
            look_at_target_input(_puppet_tbl.sis01, 1.5)
            L7_9 = true
            cap_task_kill()
            Fn_pcSensorOn("pccubesensor2_sys01_navi")
            waitSeconds(1)
            Fn_captionView("ep90_00695")
            waitSeconds(2)
            Fn_setLivelyIcon(_puppet_tbl.sis01, true)
            Fn_pcSensorOn("pccubesensor2_sys01")
          end)
          Fn_gestureEventEnd()
        end
        L8_10.pccubesensor2_sys01_vctrl_OnEnter = L9_11
        L8_10 = _G
        function L9_11()
          invokeTask(function()
            Fn_pcSensorOff("pccubesensor2_sys01_navi")
            look_at_target_input(_puppet_tbl.sis01, 1.5)
            Fn_captionView("ep90_00696")
            Fn_naviSet(_puppet_tbl.sis01)
          end)
        end
        L8_10.pccubesensor2_sys01_navi_OnLeave = L9_11
        L8_10 = _G
        function L9_11()
          Fn_pcSensorOff("pccubesensor2_sys01")
          Fn_naviKill()
          Fn_captionViewEnd()
          nextPhace()
        end
        L8_10.pccubesensor2_sys01_OnEnter = L9_11
        L8_10 = waitPhace
        L8_10()
        L9_11 = L2_4
        L8_10 = L2_4.playMotion
        L10_12 = "stay"
        L11_13.animBlendDuration = L12_14
        L8_10(L9_11, L10_12, L11_13)
        L8_10 = waitSeconds
        L9_11 = 0.5
        L8_10(L9_11)
        L8_10 = Fn_kaiwaDemoView
        L9_11 = "ep90_00800k"
        L8_10(L9_11)
        L8_10 = Fn_setLivelyIcon
        L9_11 = _puppet_tbl
        L9_11 = L9_11.sys01
        L10_12 = false
        L8_10(L9_11, L10_12)
        break
      else
      end
    end
    L1_3 = wait
    L1_3()
  end
  L1_3 = Fn_setKeepPlayerPos
  L1_3()
  L1_3 = Fn_setNextMissionFlag
  L1_3()
  L1_3 = Fn_nextMission
  L1_3()
  L1_3 = Fn_exitSandbox
  L1_3()
end
function Finalize()
  _puppet_tbl = nil
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
end
function nextPhace()
  local L0_23, L1_24
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function pccubesensor2_po_a_02_navi_OnEnter(A0_25)
  Fn_naviKill()
  Fn_pcSensorOff(A0_25)
  _next_phase = true
end
_po_a_04_navi = false
function pccubesensor2_po_a_04_OnEnter()
  if _po_a_04_navi == true then
    Fn_captionView("ep90_00400")
    Fn_naviKill()
    _po_a_04_navi = false
  end
end
function pccubesensor2_po_a_04_OnLeave()
  invokeTask(function()
    Fn_captionView("ep90_00410")
    waitSeconds(1)
    Fn_naviSet(findGameObject2("PlayerSensor", "pccubesensor2_po_a_04_in"))
    _po_a_04_navi = true
  end)
end
_po_a_02_navi = false
function pccubesensor2_po_a_02_OnEnter()
  if _po_a_02_navi == true then
    Fn_captionView("ep90_00420")
    Fn_naviKill()
    _po_a_02_navi = true
  end
end
function pccubesensor2_po_a_02_OnLeave()
  invokeTask(function()
    Fn_captionView("ep90_00430")
    waitSeconds(1)
    Fn_naviSet(findGameObject2("PlayerSensor", "pccubesensor2_po_a_02_in"))
    _po_a_02_navi = true
  end)
end
