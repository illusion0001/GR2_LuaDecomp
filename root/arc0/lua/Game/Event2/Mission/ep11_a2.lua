dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep11_common.lua")
_crow = nil
_up_a_02_01_hdl = nil
_up_a_02_brk = {}
_currentMissionText = nil
_cid_kaiwa_ready = false
_npc_shoutman_01 = "npcgen2_shoutman_01"
_npc_mob_a2_01 = "npcgen2_mob_a2_01"
_npc_mob_a2_02 = "npcgen2_mob_a2_02"
_npc_mob_a2_03 = "npcgen2_mob_a2_03"
_sdemo_start = false
_crowTask = nil
_catwarp = false
function Initialize()
  _sdemo = SDemo.create("ep11_a2")
  _up_a_02_01_hdl = Fn_findAreaHandle("up_a_02_01")
  if _up_a_02_01_hdl:isEffectiveness() == false then
    _up_a_02_01_hdl:setEffectiveness(true)
    _up_a_02_01_hdl:setAreaGroup("ji_c_root")
  end
  Fn_pcSensorOff("pccubesensor2_ship_01")
  Fn_pcSensorOff("pccubesensor2_ship_02")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15
  L0_0 = emergency_catwarp_start
  L0_0 = L0_0()
  L1_1 = Fn_sendEventComSb
  L2_2 = "setPlayerSituation"
  L3_3 = Player
  L3_3 = L3_3.kSituation_Normal
  L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7)
  L1_1 = Fn_sendEventComSb
  L2_2 = "setPlayerMuteVoice"
  L3_3 = Player
  L3_3 = L3_3.kVoiceMuteLv_All
  L1_1(L2_2, L3_3)
  L1_1 = Mob
  L2_2 = L1_1
  L1_1 = L1_1.makeSituationPanic
  L3_3 = false
  L1_1(L2_2, L3_3)
  L1_1 = Fn_sendEventComSb
  L2_2 = "setPcSensor"
  L3_3 = "pccubesensor2_safty_area"
  L1_1(L2_2, L3_3, L4_4)
  L1_1 = {}
  L1_1.nursing_00 = "wom01_nursing_00"
  _npcMotions2 = L1_1
  L1_1 = Fn_loadNpcEventMotion
  L2_2 = _npc_mob_a2_02
  L3_3 = _npcMotions2
  L1_1(L2_2, L3_3)
  L1_1 = Fn_setCatWarp
  L2_2 = false
  L1_1(L2_2)
  L1_1 = Fn_setCatWarpCheckPoint
  L2_2 = "locator2_pc_start_pos"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pcspheresensor2_warning_02"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOn
  L2_2 = "pcspheresensor2_outrange_02"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_warning_02_01"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_outrange_02_01"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_warning_02_02"
  L1_1(L2_2)
  L1_1 = Fn_pcSensorOff
  L2_2 = "pccubesensor2_outrange_02_02"
  L1_1(L2_2)
  L1_1 = createUpA02Brk
  L1_1 = L1_1()
  _up_a_02_brk = L1_1
  while true do
    L1_1 = Fn_sendEventComSb
    L2_2 = "isGmReady"
    L1_1 = L1_1(L2_2)
    if not L1_1 then
      L1_1 = print
      L2_2 = "\228\186\161\233\156\138\233\131\189\229\184\130\227\129\174\230\186\150\229\130\153\229\190\133\227\129\161..."
      L1_1(L2_2)
      L1_1 = wait
      L1_1()
    end
  end
  L1_1 = Fn_sendEventComSb
  L2_2 = "getCrowHandle"
  L1_1 = L1_1(L2_2)
  L2_2 = typedef_CrowClass
  L2_2 = L2_2.new
  L3_3 = L1_1
  L2_2 = L2_2(L3_3)
  _crow = L2_2
  L2_2 = Fn_getGameObject
  L3_3 = "com_sb"
  L2_2 = L2_2(L3_3)
  L3_3 = L2_2.findGameObject2
  L3_3 = L3_3(L4_4, L5_5, L6_6)
  if L3_3 ~= nil then
    L4_4(L5_5, L6_6)
    L4_4(L5_5, L6_6)
    L4_4(L5_5, L6_6)
  end
  for L7_7 = 1, 48 do
    L9_9 = L2_2
    L10_10 = "GimmickBg"
    L11_11 = "bg2_up_a_bridge_parts0"
    L12_12 = L7_7
    L11_11 = L11_11 .. L12_12
    if L8_8 ~= nil then
      L10_10 = L8_8
      L9_9 = L8_8.setCollidableBlockEnable
      L11_11 = false
      L9_9(L10_10, L11_11)
      L10_10 = L8_8
      L9_9 = L8_8.setVisibleBlockEnable
      L11_11 = false
      L9_9(L10_10, L11_11)
      L10_10 = L8_8
      L9_9 = L8_8.setLockonPermission
      L11_11 = false
      L9_9(L10_10, L11_11)
    end
  end
  for L8_8 = 1, 16 do
    L10_10 = L4_4
    L9_9 = L4_4.findGameObject2
    L11_11 = "GimmickBg"
    L12_12 = string
    L12_12 = L12_12.format
    L13_13 = "bg2_bom_%02d"
    L14_14 = L8_8
    L15_15 = L12_12(L13_13, L14_14)
    L9_9 = L9_9(L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L12_12(L13_13, L14_14))
    if L9_9 ~= nil then
      L11_11 = L9_9
      L10_10 = L9_9.setIgnoreGrab
      L12_12 = true
      L10_10(L11_11, L12_12)
    end
  end
  L5_5()
  L5_5()
  L5_5()
  _crowTask = L5_5
  L9_9 = nil
  L10_10 = _crow
  L10_10 = L10_10.Puppet
  L5_5(L6_6, L7_7, L8_8, L9_9, L10_10)
  L5_5(L6_6)
  repeat
    L5_5()
  until L5_5
  L5_5(L6_6)
  L6_6(L7_7)
  L6_6(L7_7)
  if L6_6 ~= nil then
    L6_6(L7_7)
    _crowTask = nil
  end
  _crowTask = L6_6
  L6_6(L7_7)
  L6_6(L7_7)
  L9_9 = 1
  L10_10 = nil
  L11_11 = Fn_getPlayer
  L15_15 = L11_11()
  L6_6(L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L14_14, L15_15, L11_11())
  L6_6(L7_7)
  L9_9 = "locator2_sfx_01_01"
  L10_10 = false
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L9_9 = "locator2_sfx_01_02"
  L10_10 = false
  L6_6(L7_7, L8_8, L9_9, L10_10)
  L9_9 = 1
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = 1
  L6_6(L7_7, L8_8, L9_9)
  L9_9 = 0.3
  L10_10 = 25
  L11_11 = 0.05
  L6_6(L7_7, L8_8, L9_9, L10_10, L11_11)
  for L9_9 = 1, 5 do
    L10_10 = string
    L10_10 = L10_10.format
    L11_11 = "locator2_sfx_%02d"
    L12_12 = L9_9
    L10_10 = L10_10(L11_11, L12_12)
    L11_11 = Fn_createEffect
    L12_12 = "ef_ev_brksmk_01"
    L13_13 = "ef_ev_brksmk_01"
    L14_14 = L10_10
    L15_15 = false
    L11_11(L12_12, L13_13, L14_14, L15_15)
  end
  L7_7()
  L7_7(L8_8)
  repeat
    L7_7()
    L9_9 = "absorptionStandby"
  until L7_7
  L7_7(L8_8)
  _currentMissionText = "ep11_00100"
  L9_9 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L7_7(L8_8, L9_9)
  L9_9 = "locator2_navi_01"
  L9_9 = L7_7
  L8_8(L9_9)
  L9_9 = "setPlayerSituation"
  L10_10 = Player
  L10_10 = L10_10.kSituation_Normal
  L11_11 = true
  L12_12 = 1
  L13_13 = true
  L14_14 = false
  L8_8(L9_9, L10_10, L11_11, L12_12, L13_13, L14_14)
  L9_9 = "setPlayerMuteVoice"
  L10_10 = Player
  L10_10 = L10_10.kVoiceMuteLv_NoMute
  L8_8(L9_9, L10_10)
  function L9_9()
    local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21, L6_22, L7_23
    L0_16(L1_17)
    for L3_19 = 1, 5 do
      L5_21 = "locator2_sfx_%02d"
      L6_22 = L3_19
      L5_21 = Fn_createEffect
      L6_22 = "ef_ev_brksmk_01"
      L7_23 = "ef_ev_brksmk_01"
      L5_21(L6_22, L7_23, L4_20, false)
    end
    L0_16(L1_17, L2_18, L3_19)
    L0_16(L1_17, L2_18, L3_19)
    L0_16(L1_17, L2_18, L3_19)
    repeat
      for L5_21, L6_22 in L2_18(L3_19) do
        L7_23 = L6_22.getWorldPos
        L7_23 = L7_23(L6_22)
        if Fn_get_distance(L1_17, L7_23) < 50 then
          if string.find(L6_22:getName(), "up_a_02") ~= nil then
            if L6_22:isEffectiveness() then
              L6_22:setEffectiveness(false)
            end
            invokeTask(function()
              waitSeconds(1)
              L6_22:try_term()
              L6_22 = nil
            end)
          else
            if L6_22:getVisible() then
              L6_22:setVisible(false)
            end
            L6_22:try_term()
            L6_22 = nil
          end
        else
        end
      end
      L2_18()
    until L2_18
  end
  L8_8(L9_9)
  _sdemo_start = false
  L8_8()
  L9_9 = _CAPTION_WAIT_AFTER_MARKER
  L8_8(L9_9)
  L9_9 = "ep11_00101"
  L8_8(L9_9)
  repeat
    L8_8()
    L9_9 = "requestGmAction"
    L10_10 = "absorption"
  until L8_8
  L9_9 = "\229\144\184\227\129\132\232\190\188\227\129\191\229\135\166\231\144\134\233\150\139\229\167\139\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136"
  L8_8(L9_9)
  L9_9 = true
  L10_10 = false
  repeat
    L11_11 = Fn_getDistanceToPlayer
    L12_12 = L7_7
    L11_11 = L11_11(L12_12)
    if L11_11 < 10 then
      if not L10_10 then
        L11_11 = lookAtObject
        L12_12 = findGameObject2
        L13_13 = "Node"
        L14_14 = "locator2_look_at_boss_01"
        L12_12 = L12_12(L13_13, L14_14)
        L13_13 = 3
        L14_14 = 3
        L11_11(L12_12, L13_13, L14_14)
        L11_11 = Player
        L12_12 = L11_11
        L11_11 = L11_11.setEnergy
        L13_13 = Player
        L13_13 = L13_13.kEnergy_Gravity
        L14_14 = Player
        L15_15 = L14_14
        L14_14 = L14_14.getEnergyMax
        L14_14 = L14_14(L15_15, Player.kEnergy_Gravity)
        L15_15 = true
        L11_11(L12_12, L13_13, L14_14, L15_15)
        L10_10 = true
      end
      if L9_9 then
        L11_11 = Fn_naviKill
        L11_11()
        L9_9 = false
      end
    else
      L11_11 = Fn_getDistanceToPlayer
      L12_12 = L7_7
      L11_11 = L11_11(L12_12)
      if L11_11 > 50 and not L9_9 then
        L11_11 = Fn_naviSet
        L12_12 = L7_7
        L11_11(L12_12)
        L9_9 = true
      end
    end
    if L8_8 > 300 then
      L11_11 = createGem
      L12_12 = getNearPos
      L13_13 = L7_7
      L14_14 = 50
      L12_12 = L12_12(L13_13, L14_14)
      L13_13 = _GEM
      L13_13 = L13_13.ENERGY
      L11_11(L12_12, L13_13)
    end
    L11_11 = wait
    L11_11()
    L11_11 = Fn_sendEventComSb
    L12_12 = "isAbsorptionEnd"
    L11_11 = L11_11(L12_12)
  until L11_11
  repeat
    L11_11 = wait
    L11_11()
    L11_11 = Fn_sendEventComSb
    L12_12 = "requestGmAction"
    L13_13 = "absorptionStop"
    L11_11 = L11_11(L12_12, L13_13)
  until L11_11
  L11_11 = print
  L12_12 = "\229\144\184\227\129\132\232\190\188\227\129\191\231\181\130\228\186\134\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136"
  L11_11(L12_12)
  if not L9_9 then
    L11_11 = Fn_naviSet
    L12_12 = L7_7
    L11_11(L12_12)
    L9_9 = true
  end
  repeat
    L11_11 = wait
    L11_11()
    L11_11 = Fn_getDistanceToPlayer
    L12_12 = L7_7
    L11_11 = L11_11(L12_12)
  until L11_11 < 10
  L11_11 = Player
  L12_12 = L11_11
  L11_11 = L11_11.setStay
  L13_13 = true
  L11_11(L12_12, L13_13)
  L11_11 = Fn_userCtrlOff
  L11_11()
  L11_11 = Fn_pcSensorOff
  L12_12 = "pcspheresensor2_warning_02"
  L11_11(L12_12)
  L11_11 = Fn_pcSensorOff
  L12_12 = "pcspheresensor2_outrange_02"
  L11_11(L12_12)
  L11_11 = Fn_pcSensorOn
  L12_12 = "pccubesensor2_warning_02_01"
  L11_11(L12_12)
  L11_11 = Fn_pcSensorOn
  L12_12 = "pccubesensor2_outrange_02_01"
  L11_11(L12_12)
  L11_11 = Fn_setCatWarpCheckPoint
  L12_12 = "locator2_navi_01"
  L11_11(L12_12)
  L11_11 = lookAtObject
  L12_12 = findGameObject2
  L13_13 = "Node"
  L14_14 = "locator2_look_at_boss_01"
  L12_12 = L12_12(L13_13, L14_14)
  L13_13 = 3
  L14_14 = 3
  L11_11(L12_12, L13_13, L14_14)
  L11_11 = Player
  L12_12 = L11_11
  L11_11 = L11_11.setEnergy
  L13_13 = Player
  L13_13 = L13_13.kEnergy_Gravity
  L14_14 = Player
  L15_15 = L14_14
  L14_14 = L14_14.getEnergyMax
  L14_14 = L14_14(L15_15, Player.kEnergy_Gravity)
  L15_15 = true
  L11_11(L12_12, L13_13, L14_14, L15_15)
  L11_11 = Fn_naviKill
  L11_11()
  repeat
    L11_11 = wait
    L11_11()
    L11_11 = Fn_sendEventComSb
    L12_12 = "requestGmAction"
    L13_13 = "appearanceArm"
    L14_14 = "f"
    L11_11 = L11_11(L12_12, L13_13, L14_14)
  until L11_11
  L11_11 = print
  L12_12 = "\232\133\149\231\148\159\227\129\136\227\130\139\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136"
  L11_11(L12_12)
  L11_11 = waitSeconds
  L12_12 = 12
  L11_11(L12_12)
  L11_11 = Fn_captionViewWait
  L12_12 = "ep11_09008"
  L13_13 = 3
  L14_14 = 5
  L11_11(L12_12, L13_13, L14_14)
  L11_11 = Fn_kaiwaDemoView
  L12_12 = "ep11_00230k"
  L11_11(L12_12)
  L11_11 = Player
  L12_12 = L11_11
  L11_11 = L11_11.setStay
  L13_13 = false
  L11_11(L12_12, L13_13)
  L11_11 = Fn_userCtrlOn
  L11_11()
  L11_11 = print
  L12_12 = "\228\186\161\233\156\138\233\131\189\229\184\130\227\129\171\231\167\187\229\139\149\227\129\174\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136"
  L11_11(L12_12)
  repeat
    L11_11 = wait
    L11_11()
    L11_11 = Fn_sendEventComSb
    L12_12 = "requestGmAction"
    L13_13 = "move"
    L14_14 = "locator2_boss_start_ep11_b"
    L11_11 = L11_11(L12_12, L13_13, L14_14)
  until L11_11
  L11_11 = _crowTask
  if L11_11 ~= nil then
    L11_11 = _crowTask
    L12_12 = L11_11
    L11_11 = L11_11.abort
    L11_11(L12_12)
    _crowTask = nil
  end
  L11_11 = invokeTask
  L12_12 = crowMove3
  L11_11 = L11_11(L12_12)
  _crowTask = L11_11
  _sdemo_start = false
  L11_11 = Fn_missionView
  L12_12 = "ep11_09009"
  L11_11(L12_12)
  _currentMissionText = "ep11_09009"
  L11_11 = waitSeconds
  L12_12 = _MARKER_WAIT_AFTER_MISSION_VIEW
  L11_11(L12_12)
  L11_11 = findGameObject2
  L12_12 = "Node"
  L13_13 = "locator2_navi_02"
  L11_11 = L11_11(L12_12, L13_13)
  L12_12 = Fn_naviSet
  L13_13 = L11_11
  L12_12(L13_13)
  L12_12 = Fn_sendEventComSb
  L13_13 = "startGmScream"
  L12_12(L13_13)
  repeat
    L12_12 = wait
    L12_12()
    L12_12 = Fn_getDistanceToPlayer
    L13_13 = L11_11
    L12_12 = L12_12(L13_13)
  until L12_12 < 10
  L12_12 = Player
  L13_13 = L12_12
  L12_12 = L12_12.setStay
  L14_14 = true
  L12_12(L13_13, L14_14)
  L12_12 = Fn_userCtrlOff
  L12_12()
  L12_12 = Fn_naviKill
  L12_12()
  L12_12 = Fn_pcSensorOff
  L13_13 = "pccubesensor2_warning_02_01"
  L12_12(L13_13)
  L12_12 = Fn_pcSensorOff
  L13_13 = "pccubesensor2_outrange_02_01"
  L12_12(L13_13)
  L12_12 = Fn_pcSensorOn
  L13_13 = "pccubesensor2_warning_02_02"
  L12_12(L13_13)
  L12_12 = Fn_pcSensorOn
  L13_13 = "pccubesensor2_outrange_02_02"
  L12_12(L13_13)
  L12_12 = Fn_setCatWarpCheckPoint
  L13_13 = "locator2_navi_02"
  L12_12(L13_13)
  _sdemo_start = true
  L12_12 = _sdemo
  L13_13 = L12_12
  L12_12 = L12_12.zoomIn
  L14_14 = 1
  L15_15 = {}
  L15_15.deg = 30
  L12_12(L13_13, L14_14, L15_15, "easeIn")
  L12_12 = _sdemo
  L13_13 = L12_12
  L12_12 = L12_12.set
  L14_14 = "locator2_sdemo_a2_camera_01"
  L15_15 = "locator2_sdemo_a2_aim_01"
  L12_12(L13_13, L14_14, L15_15, false)
  L12_12 = {L13_13, L14_14}
  L13_13 = {}
  L13_13.pos = "locator2_sdemo_a2_aim_02"
  L13_13.time = 3
  L13_13.hashfunc = "EaseInOut"
  L14_14 = {}
  L14_14.pos = "locator2_sdemo_a2_aim_03"
  L14_14.time = 4
  L14_14.hashfunc = "EaseInOut"
  L13_13 = _sdemo
  L14_14 = L13_13
  L13_13 = L13_13.play
  L13_13(L14_14)
  L13_13 = waitSeconds
  L14_14 = 1
  L13_13(L14_14)
  L13_13 = _sdemo
  L14_14 = L13_13
  L13_13 = L13_13.play
  L15_15 = nil
  L13_13(L14_14, L15_15, L12_12)
  L13_13 = Fn_findAreaHandle
  L14_14 = "ve_lo_a"
  L13_13 = L13_13(L14_14)
  L15_15 = L13_13
  L14_14 = L13_13.setEffectiveness
  L14_14(L15_15, true)
  L15_15 = L13_13
  L14_14 = L13_13.setAreaGroup
  L14_14(L15_15, "ji_c_root")
  L14_14 = Fn_sendEventComSb
  L15_15 = "setBomActive"
  L14_14(L15_15, true)
  L14_14 = Fn_sendEventComSb
  L15_15 = "setNpcActive"
  L14_14(L15_15, {"sis01", "cid01"}, true)
  L14_14 = Fn_sendEventComSb
  L15_15 = "setNpcMotion"
  L14_14(L15_15)
  L14_14 = waitSeconds
  L15_15 = 8
  L14_14(L15_15)
  L14_14 = _sdemo
  L15_15 = L14_14
  L14_14 = L14_14.stop
  L14_14(L15_15, 0)
  L14_14 = Fn_captionViewWait
  L15_15 = "ep11_09010"
  L14_14(L15_15)
  L14_14 = waitSeconds
  L15_15 = 1
  L14_14(L15_15)
  L14_14 = Sound
  L15_15 = L14_14
  L14_14 = L14_14.playSE
  L14_14(L15_15, "syd001", 0.8, "")
  L14_14 = waitSeconds
  L15_15 = 1
  L14_14(L15_15)
  L14_14 = lookAtObject
  L15_15 = findGameObject2
  L15_15 = L15_15("Node", "locator2_navi_ship_01")
  L14_14(L15_15, 3, 3)
  L14_14 = Fn_captionViewWait
  L15_15 = "ep11_09012"
  L14_14(L15_15)
  L14_14 = Player
  L15_15 = L14_14
  L14_14 = L14_14.setStay
  L14_14(L15_15, false)
  L14_14 = Fn_userCtrlOn
  L14_14()
  L14_14 = findGameObject2
  L15_15 = "Node"
  L14_14 = L14_14(L15_15, "locator2_navi_ship_01")
  L15_15 = Fn_naviSet
  L15_15(L14_14)
  _cid_kaiwa_ready = false
  L15_15 = Fn_pcSensorOn
  L15_15("pccubesensor2_ship_01")
  L15_15 = Fn_pcSensorOn
  L15_15("pccubesensor2_ship_02")
  repeat
    L15_15 = wait
    L15_15()
    L15_15 = _cid_kaiwa_ready
  until L15_15
  L15_15 = {
    Player.kAbility_Grab,
    Player.kAbility_ExGrab,
    Player.kAbility_Throw
  }
  Fn_lockPlayerAbility(L15_15, nil)
  Fn_sendEventComSb("requestSpawn", {"enmgen2_01", "enmgen2_02"})
  Fn_naviKill()
  Fn_kaiwaDemoView("ep11_00240k")
  Fn_sendEventComSb("stopGmScream")
  if L0_0 then
    L0_0:abort()
  end
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function pccubesensor2_ship_a2_OnEnter(A0_24)
  Fn_pcSensorOff(A0_24)
  invokeTask(function()
    Player:setStay(true, true)
    Fn_userCtrlOff()
    Player:setStay(false)
    Fn_coercionGravityRevert()
    waitSeconds(1)
    _cid_kaiwa_ready = true
    Fn_userCtrlOn()
  end)
end
function Finalize()
  if _crowTask ~= nil then
    _crowTask:abort()
    _crowTask = nil
  end
  Camera:stopShake(0.5)
  Mob:makeSituationPanic(false)
end
function createUpA02Brk()
  local L0_25, L1_26, L2_27, L3_28, L4_29, L5_30, L6_31, L7_32, L8_33
  L0_25 = {}
  L0_25.up_a_02_brk_01_01 = "up_a_02_brk_01"
  L0_25.up_a_02_brk_02_01 = "up_a_02_brk_02"
  L0_25.up_a_02_brk_03_01 = "up_a_02_brk_03"
  L0_25.up_a_02_brk_04_01 = "up_a_02_brk_04"
  L0_25.up_a_02_brk_05_01 = "up_a_02_brk_05"
  L0_25.up_a_02_brk_06_01 = "up_a_02_brk_06"
  L0_25.up_a_02_brk_07_01 = "up_a_02_brk_07"
  L0_25.up_a_02_brk_08_01 = "up_a_02_brk_08"
  L0_25.up_a_02_brk_09_01 = "up_a_02_brk_09"
  L0_25.up_a_02_brk_10_01 = "up_a_02_brk_10"
  L0_25.up_a_02_brk_11_01 = "up_a_02_brk_11"
  L0_25.up_a_02_brk_12_01 = "up_a_02_brk_12"
  L0_25.up_a_02_brk_13_01 = "up_a_02_brk_13"
  L0_25.up_a_02_brk_14_01 = "up_a_02_brk_14"
  L0_25.up_a_02_brk_15_01 = "up_a_02_brk_15"
  L0_25.construction_sk_01_01 = "construction_sk_01"
  L0_25.construction_sk_01_02 = "construction_sk_01"
  L0_25.construction_sk_01_03 = "construction_sk_01"
  L0_25.construction_sk_01_04 = "construction_sk_01"
  L0_25.construction_sk_01_05 = "construction_sk_01"
  L0_25.construction_sk_01_08 = "construction_sk_01"
  L0_25.construction_sk_01_07 = "construction_sk_01"
  L0_25.construction_sk_01_017 = "construction_sk_01"
  L0_25.construction_sk_01_018 = "construction_sk_01"
  L0_25.construction_sk_04_01 = "construction_sk_04"
  L0_25.construction_sk_04_10 = "construction_sk_04"
  L0_25.construction_sk_04_11 = "construction_sk_04"
  L0_25.construction_sk_04_13 = "construction_sk_04"
  L0_25.rock_sk_05_02 = "rock_sk_05"
  L0_25.rock_sk_05_03 = "rock_sk_05"
  L0_25.rock_sk_05_07 = "rock_sk_05"
  L0_25.rock_sk_05_011 = "rock_sk_05"
  L0_25.rock_sk_05_016 = "rock_sk_05"
  L0_25.rock_sk_06_18 = "rock_sk_06"
  L0_25.rock_sk_06_19 = "rock_sk_06"
  L0_25.rock_sk_06_22 = "rock_sk_06"
  L0_25.rock_sk_06_23 = "rock_sk_06"
  L0_25.rock_sk_06_24 = "rock_sk_06"
  L0_25.rock_sk_06_25 = "rock_sk_06"
  L0_25.rock_sk_07_01 = "rock_sk_07"
  L0_25.rock_sk_07_29 = "rock_sk_07"
  L0_25.rock_sk_07_31 = "rock_sk_07"
  L0_25.rock_sk_08_39 = "rock_sk_08"
  L0_25.rock_sk_08_33 = "rock_sk_08"
  L0_25.rock_sk_08_40 = "rock_sk_08"
  L0_25.rock_sk_08_42 = "rock_sk_08"
  L1_26 = createGameObject2
  L2_27 = "Puppet"
  L1_26 = L1_26(L2_27)
  L2_27 = createGameObject2
  L3_28 = "ActorBrain"
  L2_27 = L2_27(L3_28)
  L3_28 = {}
  for L7_32, L8_33 in L4_29(L5_30) do
    if string.sub(L8_33, 1, 7) == "up_a_02" then
      L3_28[L7_32] = createGameObject2("AreaRegularBg")
      L3_28[L7_32]:setName("upa02brk_" .. L7_32)
      L3_28[L7_32]:setModelName(L8_33)
      L3_28[L7_32]:setEventRange(50)
      L3_28[L7_32]:setVisible(false)
      L3_28[L7_32]:setActive(false)
    else
      L3_28[L7_32] = createGameObject2("TerrainBg")
      L3_28[L7_32]:setName("upa02brk_" .. L7_32)
      L3_28[L7_32]:setModelName(L8_33)
      L3_28[L7_32]:setCollisionName(L8_33)
    end
  end
  L5_30(L6_31)
  L5_30.puppet = L1_26
  L5_30.models = L3_28
  return L5_30
end
function crowMove()
  _crow.setIdling(false)
  _crow.clearMovePoint()
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_a2_01"), Supporter.MovePoint.Takeoff, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_a2_01"), Supporter.MovePoint.Air, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_a2_02"), Supporter.MovePoint.Air, 5)
  _crow.startMove()
  print("CROW\231\167\187\229\139\149\233\150\139\229\167\139")
  repeat
    wait()
  until _crow.isMoveEnd()
  _crow.setIdling(true)
  print("CROW\231\167\187\229\139\149\229\174\140\228\186\134")
end
function crowMove2()
  _crow.setIdling(false)
  _crow.clearMovePoint()
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_a2_03"), Supporter.MovePoint.Air, 10)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_a2_04"), Supporter.MovePoint.Air, 5)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_a2_05"), Supporter.MovePoint.Air, 25)
  _crow.startMove()
  print("CROW\231\167\187\229\139\149\233\150\139\229\167\139")
  repeat
    wait()
  until _crow.isMoveEnd()
  _crow.setIdling(true)
  print("CROW\231\167\187\229\139\149\229\174\140\228\186\134")
end
function crowMove3()
  _crow.setIdling(false)
  _crow.clearMovePoint()
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_01"), Supporter.MovePoint.Takeoff, 20)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_01"), Supporter.MovePoint.Air, 20)
  _crow.addMovePoint(ep11GetLocatorPos("locator2_crow_path_02"), Supporter.MovePoint.Air, 20)
  _crow.startMove()
  print("CROW\231\167\187\229\139\149\233\150\139\229\167\139")
  repeat
    wait()
  until _crow.isMoveEnd()
  _crow.setIdling(true)
  _crow.warpToNode("locator2_crow_path_02")
  print("CROW\231\167\187\229\139\149\229\174\140\228\186\134")
end
function npcAction()
  invokeTask(function()
    local L0_34, L1_35, L2_36, L3_37, L4_38, L5_39
    L0_34 = Fn_findNpc
    L1_35 = _npc_shoutman_01
    L0_34 = L0_34(L1_35)
    L2_36 = L0_34
    L1_35 = L0_34.setActive
    L3_37 = true
    L1_35(L2_36, L3_37)
    L1_35 = {}
    L1_35.isRepeat = false
    L1_35.isRandom = false
    L1_35.animBlendDuration = 0.5
    L2_36 = {
      L3_37,
      L4_38,
      L5_39,
      "inform_ex_out_00",
      "scared_04"
    }
    L3_37 = "inform_ex_in_00"
    L4_38 = "inform_ex_00"
    L5_39 = "inform_ex_00"
    L4_38 = L0_34
    L3_37 = L0_34.playMotion
    L5_39 = L2_36
    L3_37(L4_38, L5_39, L1_35)
    L3_37 = {L4_38, L5_39}
    L4_38 = "scared_01"
    L5_39 = "scared_02"
    L4_38 = Fn_findNpc
    L5_39 = _npc_mob_a2_01
    L4_38 = L4_38(L5_39)
    L5_39 = L4_38
    L4_38 = L4_38.playMotion
    L4_38(L5_39, L3_37, L1_35)
    L4_38 = {
      L5_39,
      "inform_ex_in_00",
      "inform_ex_00",
      "inform_ex_out_00",
      _npcMotions2.nursing_00
    }
    L5_39 = _npcMotions2
    L5_39 = L5_39.nursing_00
    L5_39 = Fn_findNpc
    L5_39 = L5_39(_npc_mob_a2_02)
    L5_39 = L5_39.playMotion
    L5_39(L5_39, L4_38, L1_35)
    L5_39 = {
      "scared_03",
      "lookaround_03"
    }
    Fn_findNpc(_npc_mob_a2_03):playMotion(L5_39, L1_35)
    repeat
      wait()
    until _sdemo_start
    waitSeconds(1)
    Sound:playSE("m30_011a", 1, "", Fn_findNpcPuppet(_npc_shoutman_01))
    Fn_captionView("ep11_00104")
    waitSeconds(7)
    Fn_findNpc(_npc_shoutman_01):changeMob()
    Fn_findNpc(_npc_mob_a2_01):changeMob()
    Fn_findNpc(_npc_mob_a2_02):changeMob()
    Fn_findNpc(_npc_mob_a2_03):changeMob()
  end)
end
function warning_OnEnter(A0_40)
  local L1_41
end
function warning_OnLeave(A0_42)
  invokeTask(function()
    Fn_captionViewWait("ep11_00103")
  end)
end
function outrange_OnEnter(A0_43)
  local L1_44
end
function outrange_OnLeave(A0_45)
  if _catwarp then
    return
  end
  _catwarp = true
  invokeTask(function()
    Fn_catWarp()
    Fn_captionViewWait("ep11_00103")
    Fn_missionView(_currentMissionText)
    _catwarp = false
  end)
end
function pcspheresensor2_01_OnLeave(A0_46)
  invokeTask(function()
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\228\189\141\231\189\174\227\130\146\229\164\137\230\155\180")
    Fn_setCatWarpCheckPoint(Fn_getPlayer())
  end)
end
