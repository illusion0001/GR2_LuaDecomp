dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep16_common.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
puppets = {}
_findFirst = false
_BEACON_GENUINE = 7
_BEACON_COUNT = 7
_BEACON_STATUS = {
  INVISIBLE = 1,
  NO_INSIGHT = 2,
  QUARTER_INSIGHT = 3,
  HALF_INSIGHT1 = 4,
  HALF_INSIGHT2 = 5,
  HALF_INSIGHT3 = 6,
  INSIGHT = 7,
  NEAR = 8,
  FIND = 9,
  FINDED = 10,
  BROKEN = 11
}
_detect_se_handle = nil
_beaconStatus = {}
_beaconNaviStatus = {}
_beacon_07_sensor = false
_BEACON_CAPTION_TIMER = 150
_beacon_caption_wait = 0
_beacon_task = nil
_SENSOR_SE_TABLE = {
  {
    dis = 30,
    se = "ep16_becon_react_l",
    vol = 1
  },
  {
    dis = 100,
    se = "ep16_becon_react_m",
    vol = 1
  },
  {
    dis = 200,
    se = "ep16_becon_react_s",
    vol = 1
  }
}
EP16_TERRORIST_MOTION = {
  communicate_00 = "man61_communicate_ep16_00",
  ride_stingray_00 = "man61_ride_stingray_ep16_00"
}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  _npc_stingray = "stingray_01"
  _npc_terrorist = "terrorist_01"
  L0_0 = puppets
  L0_0.ep16_Adicca = L1_1
  L0_0 = {L1_1, L2_2}
  L1_1.name = L2_2
  L1_1.type = "man61"
  L1_1.node = "locator2_terrorist_pos"
  L1_1.attach = false
  L1_1.active = false
  L1_1.use_gravity = false
  L2_2.name = L3_3
  L2_2.type = "mcstg"
  L2_2.node = "locator2_stingray_pos"
  L2_2.attach = false
  L2_2.active = false
  L2_2.use_gravity = false
  L1_1(L2_2)
  for L4_4, _FORV_5_ in L1_1(L2_2) do
    puppets[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  L1_1(L2_2, L3_3)
  for L4_4 = 1, _BEACON_COUNT do
    beaconInitialize(L4_4)
  end
  L1_1(L2_2, L3_3)
  L1_1()
  L4_4 = "pccubesensor2_mission_area01"
  L1_1(L2_2, L3_3, L4_4, "pccubesensor2_mission_area02", "locator2_pc_start_pos", nil, "locator2_pc_start_pos", "ep16_00119")
end
function Ingame()
  Fn_userCtrlAllOff()
  Fn_missionStart()
  Fn_userCtrlOn()
  Fn_missionView("ep16_00100")
  detectGame()
  Player:setStay(true, false)
  Fn_userCtrlAllOff()
  Fn_sendEventComSb("requestSection", "a4")
  Fn_resetPcPos("locator2_sdemo2_pc_01")
  waitSeconds(2)
  Fn_kaiwaDemoView2("ep16_00120k", function()
    Fn_setNpcActive(_npc_stingray, false)
    Fn_setNpcActive(_npc_terrorist, false)
    findGameObject2("GimmickBg", "bg2_beacon_07"):setActive(false)
    Fn_sendEventComSb("requestSection", "a5")
  end, true)
  Fn_captionViewWait("ep16_00101")
  waitSeconds(0)
  Fn_captionView("ep16_00102")
  waitComNextPhase("a5")
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  for _FORV_3_ = 1, _BEACON_COUNT do
    if _beaconNaviStatus[_FORV_3_].se_hdl ~= nil then
      Sound:stopSEHandle(_beaconNaviStatus[_FORV_3_].se_hdl)
      _beaconNaviStatus[_FORV_3_].se_hdl = nil
    end
    if _beaconNaviStatus[_FORV_3_].eff_hdl ~= nil then
      _beaconNaviStatus[_FORV_3_].eff_hdl:abort()
      _beaconNaviStatus[_FORV_3_].eff_hdl = nil
    end
  end
  if _FOR_ ~= nil then
    Sound:stopSEHandle(_detect_se_handle)
    _detect_se_handle = nil
  end
end
function detectGame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19, L15_20, L16_21, L17_22, L18_23, L19_24, L20_25, L21_26, L22_27, L23_28, L24_29, L25_30
  L0_5 = 1
  L1_6 = 0.73
  L2_7 = 0.46
  L3_8 = 0.33
  L4_9 = 0.2
  L5_10 = 1
  L6_11 = 2
  L7_12 = 4
  L8_13 = 6
  L9_14 = 8
  L10_15 = 10
  L11_16 = 30
  L12_17 = 30
  L13_18 = gaugeInit
  L13_18()
  L13_18 = beaconActivate
  L14_19 = 1
  L13_18(L14_19)
  L13_18 = beaconActivate
  L14_19 = 2
  L13_18(L14_19)
  L13_18 = _beaconNaviStatus
  L13_18 = L13_18[1]
  L13_18.navi_wait = 0
  L13_18 = _beaconNaviStatus
  L13_18 = L13_18[2]
  L13_18.navi_wait = 0
  L13_18 = invokeTask
  function L14_19()
    local L0_31, L1_32, L2_33, L3_34, L4_35, L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45
    L0_31 = 0
    while true do
      L1_32 = 0
      L2_33 = nil
      for L6_37 = 1, _BEACON_COUNT do
        L8_39 = "bg2_beacon_%02d"
        L9_40 = L6_37
        L8_39 = findGameObject2
        L9_40 = "GimmickBg"
        L10_41 = L7_38
        L8_39 = L8_39(L9_40, L10_41)
        L9_40 = string
        L9_40 = L9_40.format
        L10_41 = "locator2_beacon_%02d"
        L11_42 = L6_37
        L9_40 = L9_40(L10_41, L11_42)
        L10_41 = findGameObject2
        L11_42 = "Node"
        L12_43 = L9_40
        L10_41 = L10_41(L11_42, L12_43)
        L11_42 = Fn_getDistanceToPlayer
        L12_43 = L8_39
        L11_42 = L11_42(L12_43)
        L12_43 = 0
        L13_44 = _beaconStatus
        L13_44 = L13_44[L7_38]
        L14_45 = _BEACON_STATUS
        L14_45 = L14_45.INVISIBLE
        if L13_44 ~= L14_45 then
          L13_44 = _beaconNaviStatus
          L13_44 = L13_44[L6_37]
          L14_45 = math
          L14_45 = L14_45.max
          L14_45 = L14_45(_beaconNaviStatus[L6_37].navi_wait - 1, 0)
          L13_44.navi_wait = L14_45
        end
        L14_45 = L8_39
        L13_44 = L8_39.isBroken
        L13_44 = L13_44(L14_45)
        if L13_44 then
          L13_44 = _beaconStatus
          L13_44 = L13_44[L7_38]
          L14_45 = _BEACON_STATUS
          L14_45 = L14_45.BROKEN
          if L13_44 ~= L14_45 then
            L13_44 = _beaconNaviStatus
            L13_44 = L13_44[L6_37]
            L13_44 = L13_44.se_hdl
            if L13_44 ~= nil then
              L13_44 = Sound
              L14_45 = L13_44
              L13_44 = L13_44.stopSEHandle
              L13_44(L14_45, _beaconNaviStatus[L6_37].se_hdl)
              L13_44 = _beaconNaviStatus
              L13_44 = L13_44[L6_37]
              L13_44.se_hdl = nil
            end
            L13_44 = _beaconNaviStatus
            L13_44 = L13_44[L6_37]
            L13_44 = L13_44.eff_hdl
            if L13_44 ~= nil then
              L13_44 = _beaconNaviStatus
              L13_44 = L13_44[L6_37]
              L13_44 = L13_44.eff_hdl
              L14_45 = L13_44
              L13_44 = L13_44.abort
              L13_44(L14_45)
              L13_44 = _beaconNaviStatus
              L13_44 = L13_44[L6_37]
              L13_44.eff_hdl = nil
            end
            L13_44 = _beaconStatus
            L14_45 = _BEACON_STATUS
            L14_45 = L14_45.BROKEN
            L13_44[L7_38] = L14_45
          end
        end
        L13_44 = Fn_isInSightTarget
        L14_45 = L10_41
        L13_44 = L13_44(L14_45, L4_9)
        if L13_44 then
          L13_44 = _beaconStatus
          L13_44 = L13_44[L7_38]
          L14_45 = _BEACON_STATUS
          L14_45 = L14_45.FIND
          if L13_44 ~= L14_45 then
            L13_44 = _beaconStatus
            L13_44 = L13_44[L7_38]
            L14_45 = _BEACON_STATUS
            L14_45 = L14_45.FINDED
          else
            if L13_44 == L14_45 then
              L12_43 = L9_14
          end
          else
            L13_44 = _beaconStatus
            L13_44 = L13_44[L7_38]
            L14_45 = _BEACON_STATUS
            L14_45 = L14_45.INVISIBLE
            if L13_44 ~= L14_45 then
              L13_44 = _beaconStatus
              L13_44 = L13_44[L7_38]
              L14_45 = _BEACON_STATUS
              L14_45 = L14_45.BROKEN
              if L13_44 ~= L14_45 then
                L13_44 = _beaconStatus
                L14_45 = _BEACON_STATUS
                L14_45 = L14_45.INSIGHT
                L13_44[L7_38] = L14_45
                L12_43 = L9_14
                L13_44 = _beaconNaviStatus
                L13_44 = L13_44[L6_37]
                L13_44.enable = true
              end
            else
              L13_44 = _beaconNaviStatus
              L13_44 = L13_44[L6_37]
              L13_44.enable = false
            end
          end
        else
          L13_44 = Fn_isInSightTarget
          L14_45 = L10_41
          L13_44 = L13_44(L14_45, L3_8)
          if L13_44 then
            L13_44 = _beaconStatus
            L13_44 = L13_44[L7_38]
            L14_45 = _BEACON_STATUS
            L14_45 = L14_45.FIND
            if L13_44 ~= L14_45 then
              L13_44 = _beaconStatus
              L13_44 = L13_44[L7_38]
              L14_45 = _BEACON_STATUS
              L14_45 = L14_45.FINDED
            else
              if L13_44 == L14_45 then
                L12_43 = L8_13
            end
            else
              L13_44 = _beaconStatus
              L13_44 = L13_44[L7_38]
              L14_45 = _BEACON_STATUS
              L14_45 = L14_45.INVISIBLE
              if L13_44 ~= L14_45 then
                L13_44 = _beaconStatus
                L13_44 = L13_44[L7_38]
                L14_45 = _BEACON_STATUS
                L14_45 = L14_45.BROKEN
                if L13_44 ~= L14_45 then
                  L13_44 = _beaconStatus
                  L14_45 = _BEACON_STATUS
                  L14_45 = L14_45.HALF_INSIGHT3
                  L13_44[L7_38] = L14_45
                  L12_43 = L8_13
                end
              else
                L13_44 = _beaconNaviStatus
                L13_44 = L13_44[L6_37]
                L13_44.enable = false
              end
            end
          else
            L13_44 = Fn_isInSightTarget
            L14_45 = L10_41
            L13_44 = L13_44(L14_45, L2_7)
            if L13_44 then
              L13_44 = _beaconStatus
              L13_44 = L13_44[L7_38]
              L14_45 = _BEACON_STATUS
              L14_45 = L14_45.FIND
              if L13_44 ~= L14_45 then
                L13_44 = _beaconStatus
                L13_44 = L13_44[L7_38]
                L14_45 = _BEACON_STATUS
                L14_45 = L14_45.FINDED
              else
                if L13_44 == L14_45 then
                  L12_43 = L7_12
              end
              else
                L13_44 = _beaconStatus
                L13_44 = L13_44[L7_38]
                L14_45 = _BEACON_STATUS
                L14_45 = L14_45.INVISIBLE
                if L13_44 ~= L14_45 then
                  L13_44 = _beaconStatus
                  L13_44 = L13_44[L7_38]
                  L14_45 = _BEACON_STATUS
                  L14_45 = L14_45.BROKEN
                  if L13_44 ~= L14_45 then
                    L13_44 = _beaconStatus
                    L14_45 = _BEACON_STATUS
                    L14_45 = L14_45.HALF_INSIGHT2
                    L13_44[L7_38] = L14_45
                    L12_43 = L7_12
                  end
                else
                  L13_44 = _beaconNaviStatus
                  L13_44 = L13_44[L6_37]
                  L13_44.enable = false
                end
              end
            else
              L13_44 = Fn_isInSightTarget
              L14_45 = L10_41
              L13_44 = L13_44(L14_45, L1_6)
              if L13_44 then
                L13_44 = _beaconStatus
                L13_44 = L13_44[L7_38]
                L14_45 = _BEACON_STATUS
                L14_45 = L14_45.FIND
                if L13_44 ~= L14_45 then
                  L13_44 = _beaconStatus
                  L13_44 = L13_44[L7_38]
                  L14_45 = _BEACON_STATUS
                  L14_45 = L14_45.FINDED
                else
                  if L13_44 == L14_45 then
                    L12_43 = L6_11
                end
                else
                  L13_44 = _beaconStatus
                  L13_44 = L13_44[L7_38]
                  L14_45 = _BEACON_STATUS
                  L14_45 = L14_45.INVISIBLE
                  if L13_44 ~= L14_45 then
                    L13_44 = _beaconStatus
                    L13_44 = L13_44[L7_38]
                    L14_45 = _BEACON_STATUS
                    L14_45 = L14_45.BROKEN
                    if L13_44 ~= L14_45 then
                      L13_44 = _beaconStatus
                      L14_45 = _BEACON_STATUS
                      L14_45 = L14_45.HALF_INSIGHT1
                      L13_44[L7_38] = L14_45
                      L12_43 = L6_11
                    end
                  else
                  end
                end
                L13_44 = _beaconNaviStatus
                L13_44 = L13_44[L6_37]
                L13_44.enable = false
              else
                L13_44 = Fn_isInSightTarget
                L14_45 = L10_41
                L13_44 = L13_44(L14_45, L0_5)
                if L13_44 then
                  L13_44 = _beaconStatus
                  L13_44 = L13_44[L7_38]
                  L14_45 = _BEACON_STATUS
                  L14_45 = L14_45.FIND
                  if L13_44 ~= L14_45 then
                    L13_44 = _beaconStatus
                    L13_44 = L13_44[L7_38]
                    L14_45 = _BEACON_STATUS
                    L14_45 = L14_45.FINDED
                  else
                    if L13_44 == L14_45 then
                      L12_43 = L5_10
                  end
                  else
                    L13_44 = _beaconStatus
                    L13_44 = L13_44[L7_38]
                    L14_45 = _BEACON_STATUS
                    L14_45 = L14_45.INVISIBLE
                    if L13_44 ~= L14_45 then
                      L13_44 = _beaconStatus
                      L13_44 = L13_44[L7_38]
                      L14_45 = _BEACON_STATUS
                      L14_45 = L14_45.BROKEN
                      if L13_44 ~= L14_45 then
                        L13_44 = _beaconStatus
                        L14_45 = _BEACON_STATUS
                        L14_45 = L14_45.QUARTER_INSIGHT
                        L13_44[L7_38] = L14_45
                        L12_43 = L5_10
                      end
                    else
                    end
                  end
                  L13_44 = _beaconNaviStatus
                  L13_44 = L13_44[L6_37]
                  L13_44.enable = false
                else
                  L13_44 = _beaconNaviStatus
                  L13_44 = L13_44[L6_37]
                  L13_44.enable = false
                end
              end
            end
          end
        end
        L13_44 = _beaconStatus
        L13_44 = L13_44[L7_38]
        L14_45 = _BEACON_STATUS
        L14_45 = L14_45.FINDED
        if L13_44 == L14_45 then
          L13_44 = L11_16
          if L11_42 > L13_44 then
            L13_44 = _beaconNaviStatus
            L13_44 = L13_44[L6_37]
            L13_44.away = true
          end
        else
          L13_44 = _BEACON_GENUINE
          if L6_37 == L13_44 then
            L13_44 = _beacon_07_sensor
            if L13_44 then
              L13_44 = _beaconStatus
              L13_44 = L13_44[L7_38]
              L14_45 = _BEACON_STATUS
              L14_45 = L14_45.INVISIBLE
              if L13_44 ~= L14_45 then
                L13_44 = _beaconStatus
                L13_44 = L13_44[L7_38]
                L14_45 = _BEACON_STATUS
                L14_45 = L14_45.BROKEN
                if L13_44 ~= L14_45 then
                  L13_44 = _beaconStatus
                  L13_44 = L13_44[L7_38]
                  L14_45 = _BEACON_STATUS
                  L14_45 = L14_45.FIND
                  if L13_44 ~= L14_45 then
                    L13_44 = RAC_RaycastEyeSight
                    L14_45 = L10_41
                    L13_44 = L13_44(L14_45, L12_17, nil, nil, 0.5, 0.1)
                    if L13_44 then
                      L13_44 = 1
                      while true do
                        L14_45 = findGameObject2
                        L14_45 = L14_45("Node", L9_40 .. "_" .. string.format("%02d", L13_44))
                        if L14_45 == nil then
                          _beaconStatus[L7_38] = _BEACON_STATUS.FIND
                        elseif RAC_RaycastEyeSight(L14_45, L12_17, nil, nil, 0.5, 0.1) ~= false then
                          L13_44 = L13_44 + 1
                          else
                            L13_44 = L10_15
                            if L11_42 < L13_44 then
                              L13_44 = _beaconStatus
                              L13_44 = L13_44[L7_38]
                              L14_45 = _BEACON_STATUS
                              L14_45 = L14_45.INVISIBLE
                              if L13_44 ~= L14_45 then
                                L13_44 = _beaconStatus
                                L13_44 = L13_44[L7_38]
                                L14_45 = _BEACON_STATUS
                                L14_45 = L14_45.BROKEN
                                if L13_44 ~= L14_45 then
                                  L13_44 = _beaconStatus
                                  L13_44 = L13_44[L7_38]
                                  L14_45 = _BEACON_STATUS
                                  L14_45 = L14_45.FIND
                                  if L13_44 ~= L14_45 then
                                    L13_44 = RAC_RaycastEyeSight
                                    L14_45 = L10_41
                                    L13_44 = L13_44(L14_45, L10_15, nil, nil, 0.5, 0.1)
                                    if L13_44 then
                                      L13_44 = _beaconStatus
                                      L14_45 = _BEACON_STATUS
                                      L14_45 = L14_45.FIND
                                      L13_44[L7_38] = L14_45
                                    end
                                  else
                                    L13_44 = _beaconStatus
                                    L13_44 = L13_44[L7_38]
                                    L14_45 = _BEACON_STATUS
                                    L14_45 = L14_45.NEAR
                                    if L13_44 ~= L14_45 then
                                      L13_44 = _beaconStatus
                                      L14_45 = _BEACON_STATUS
                                      L14_45 = L14_45.NEAR
                                      L13_44[L7_38] = L14_45
                                    end
                                  end
                                  L12_43 = L9_14
                                  L14_45 = L8_39
                                  L13_44 = L8_39.getLockonPermission
                                  L13_44 = L13_44(L14_45)
                                  if not L13_44 then
                                    L14_45 = L8_39
                                    L13_44 = L8_39.setLockonPermission
                                    L13_44(L14_45, true)
                                  end
                                  L13_44 = _beaconNaviStatus
                                  L13_44 = L13_44[L6_37]
                                  L13_44.enable = true
                                end
                              else
                                L13_44 = _beaconNaviStatus
                                L13_44 = L13_44[L6_37]
                                L13_44.enable = false
                              end
                            else
                              L14_45 = L8_39
                              L13_44 = L8_39.getLockonPermission
                              L13_44 = L13_44(L14_45)
                              if L13_44 then
                                L14_45 = L8_39
                                L13_44 = L8_39.setLockonPermission
                                L13_44(L14_45, false)
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
        end
        if L12_43 > 0 and (L2_33 == nil or L2_33 > L11_42) then
          L2_33 = L11_42
        end
        L13_44 = math
        L13_44 = L13_44.max
        L14_45 = L12_43
        L13_44 = L13_44(L14_45, L1_32)
        L1_32 = L13_44
      end
      if L1_32 > 0 then
      end
      L14_45 = L5_36(L6_37, L7_38)
      L4_35(L5_36, L6_37, L7_38, L8_39, L9_40, L10_41, L11_42, L12_43, L13_44, L14_45, L5_36(L6_37, L7_38))
      _beacon_caption_wait = L4_35
      L0_31 = 0
      if L2_33 ~= nil then
        for L8_39, L9_40 in L5_36(L6_37) do
          L10_41 = L9_40.dis
          if L2_33 < L10_41 then
            L0_31 = L8_39
            if L0_31 ~= L4_35 then
              L10_41 = _detect_se_handle
              if L10_41 ~= nil then
                L10_41 = Sound
                L11_42 = L10_41
                L10_41 = L10_41.stopSEHandle
                L12_43 = _detect_se_handle
                L10_41(L11_42, L12_43)
                _detect_se_handle = nil
              end
              L10_41 = Sound
              L11_42 = L10_41
              L10_41 = L10_41.playSEHandle
              L12_43 = L9_40.se
              L13_44 = L9_40.vol
              L10_41 = L10_41(L11_42, L12_43, L13_44)
              _detect_se_handle = L10_41
            end
            break
          end
        end
      end
      if L0_31 == 0 then
        if L5_36 ~= nil then
          L5_36(L6_37, L7_38)
          _detect_se_handle = nil
        end
      end
      L5_36()
    end
  end
  L13_18 = L13_18(L14_19)
  _beacon_task = L13_18
  L13_18 = 0
  L14_19 = 0
  L15_20 = false
  while not L15_20 do
    for L19_24 = 1, _BEACON_COUNT do
      L20_25 = string
      L20_25 = L20_25.format
      L21_26 = "bg2_beacon_%02d"
      L22_27 = L19_24
      L20_25 = L20_25(L21_26, L22_27)
      L21_26 = string
      L21_26 = L21_26.format
      L22_27 = "locator2_beacon_%02d"
      L23_28 = L19_24
      L21_26 = L21_26(L22_27, L23_28)
      L22_27 = findGameObject2
      L23_28 = "Node"
      L24_29 = L21_26
      L22_27 = L22_27(L23_28, L24_29)
      L23_28 = getBrokenBeacon
      L23_28 = L23_28()
      L13_18 = L23_28
      if L14_19 ~= L13_18 then
        if L13_18 == 1 then
          L23_28 = Fn_captionView
          L24_29 = "ep16_00103"
          L23_28(L24_29)
          L23_28 = beaconActivate
          L24_29 = 3
          L23_28(L24_29)
        elseif L13_18 == 2 then
          L23_28 = beaconActivate
          L24_29 = 4
          L23_28(L24_29)
          L23_28 = beaconActivate
          L24_29 = 7
          L23_28(L24_29)
          L23_28 = Fn_setNpcActive
          L24_29 = _npc_stingray
          L25_30 = true
          L23_28(L24_29, L25_30)
          L23_28 = Fn_setNpcActive
          L24_29 = _npc_terrorist
          L25_30 = true
          L23_28(L24_29, L25_30)
          L23_28 = Fn_playNpcEventMotion
          L24_29 = _npc_terrorist
          L25_30 = EP16_TERRORIST_MOTION
          L25_30 = L25_30.communicate_00
          L23_28(L24_29, L25_30, -1, 0, false)
          L23_28 = Fn_findNpcPuppet
          L24_29 = _npc_terrorist
          L23_28 = L23_28(L24_29)
          L24_29 = findGameObject2
          L25_30 = "GimmickBg"
          L24_29 = L24_29(L25_30, "bg2_beacon_07")
          L25_30 = findGameObject2
          L25_30 = L25_30("Node", "locator2_beacon_07")
          L25_30:setPos(Vector(0, 0, 0))
          L24_29:appendChild(L25_30)
          L24_29:setCollidablePermission(false)
          Fn_attachJoint(L24_29, L23_28, "loc_r_hand")
          Fn_captionView("ep16_00104")
        elseif L13_18 == 3 then
          L23_28 = beaconActivate
          L24_29 = 5
          L23_28(L24_29)
        elseif L13_18 == 4 then
          L23_28 = Fn_captionView
          L24_29 = "ep16_00105"
          L23_28(L24_29)
          L23_28 = beaconActivate
          L24_29 = 6
          L23_28(L24_29)
        end
        L14_19 = L13_18
      end
      L23_28 = _beaconStatus
      L23_28 = L23_28[L20_25]
      L24_29 = _BEACON_STATUS
      L24_29 = L24_29.FIND
      if L23_28 == L24_29 then
        L23_28 = _beaconStatus
        L24_29 = _BEACON_STATUS
        L24_29 = L24_29.FINDED
        L23_28[L20_25] = L24_29
        L23_28 = _BEACON_GENUINE
        if L19_24 == L23_28 then
          L15_20 = true
          L23_28 = Fn_userCtrlAllOff
          L23_28()
          L23_28 = Player
          L24_29 = L23_28
          L23_28 = L23_28.setStay
          L25_30 = true
          L23_28(L24_29, L25_30)
          L23_28 = Player
          L24_29 = L23_28
          L23_28 = L23_28.setLookAtIk
          L25_30 = true
          L23_28(L24_29, L25_30, 1, L22_27:getWorldPos())
          L23_28 = RAC_LookAtObjectWait
          L24_29 = L22_27
          L25_30 = 0
          L23_28(L24_29, L25_30, 0.2)
          L23_28 = Player
          L24_29 = L23_28
          L23_28 = L23_28.setLookAtIk
          L25_30 = false
          L23_28(L24_29, L25_30, 1, Vector(0, 0, 0))
          L23_28 = putDiscoveryCaption
          L24_29 = L19_24
          L23_28(L24_29)
        else
          L23_28 = _findFirst
          if not L23_28 then
            L23_28 = Fn_userCtrlAllOff
            L23_28()
            L23_28 = Player
            L24_29 = L23_28
            L23_28 = L23_28.setStay
            L25_30 = true
            L23_28(L24_29, L25_30)
            L23_28 = Player
            L24_29 = L23_28
            L23_28 = L23_28.setLookAtIk
            L25_30 = true
            L23_28(L24_29, L25_30, 1, L22_27:getWorldPos())
            L23_28 = RAC_LookAtObjectWait
            L24_29 = L22_27
            L25_30 = 0
            L23_28(L24_29, L25_30, 0.2)
            L23_28 = Player
            L24_29 = L23_28
            L23_28 = L23_28.setLookAtIk
            L25_30 = false
            L23_28(L24_29, L25_30, 1, Vector(0, 0, 0))
            L23_28 = putDiscoveryCaption
            L24_29 = L19_24
            L23_28(L24_29)
            L23_28 = Fn_kaiwaDemoView
            L24_29 = "ep16_00115k"
            L23_28(L24_29)
            L23_28 = Fn_captionView
            L24_29 = "ep16_00106"
            L23_28(L24_29)
            L23_28 = Player
            L24_29 = L23_28
            L23_28 = L23_28.setStay
            L25_30 = false
            L23_28(L24_29, L25_30)
            L23_28 = Fn_userCtrlOn
            L23_28()
            _findFirst = true
          else
            L23_28 = putDiscoveryCaption
            L24_29 = L19_24
            L23_28(L24_29)
          end
        end
      end
      L23_28 = _beaconNaviStatus
      L23_28 = L23_28[L19_24]
      L23_28 = L23_28.navi_wait
      if L23_28 == 0 then
        L23_28 = _beaconNaviStatus
        L23_28 = L23_28[L19_24]
        L23_28 = L23_28.enable
        if not L23_28 then
          L23_28 = _beaconStatus
          L23_28 = L23_28[L20_25]
          L24_29 = _BEACON_STATUS
          L24_29 = L24_29.FINDED
        elseif L23_28 == L24_29 then
          L23_28 = _beaconNaviStatus
          L23_28 = L23_28[L19_24]
          L23_28 = L23_28.marker
          if L23_28 == nil then
            L23_28 = _beaconStatus
            L23_28 = L23_28[L20_25]
            L24_29 = _BEACON_STATUS
            L24_29 = L24_29.INSIGHT
            if L23_28 == L24_29 then
              L23_28 = putDetectCaption
              L23_28()
            else
              L23_28 = _beaconStatus
              L23_28 = L23_28[L20_25]
              L24_29 = _BEACON_STATUS
              L24_29 = L24_29.NEAR
              if L23_28 == L24_29 then
                L23_28 = putNearbyCaption
                L23_28()
              end
            end
            L23_28 = _beaconNaviStatus
            L23_28 = L23_28[L19_24]
            L24_29 = setMnavi
            L25_30 = L21_26
            L24_29 = L24_29(L25_30)
            L23_28.marker = L24_29
          end
          L23_28 = _BEACON_GENUINE
          if L19_24 ~= L23_28 then
            L23_28 = _beaconNaviStatus
            L23_28 = L23_28[L19_24]
            L23_28 = L23_28.away
            if L23_28 then
              L23_28 = _beaconNaviStatus
              L23_28 = L23_28[L19_24]
              L23_28 = L23_28.awayed
              if not L23_28 then
                L23_28 = Fn_userCtrlAllOff
                L23_28()
                L23_28 = Player
                L24_29 = L23_28
                L23_28 = L23_28.setStay
                L25_30 = true
                L23_28(L24_29, L25_30)
                L23_28 = RAC_LookAtObjectWait
                L24_29 = L22_27
                L25_30 = 0
                L23_28(L24_29, L25_30, 0.2)
                L23_28 = Fn_captionView
                L24_29 = "ep16_00107"
                L23_28(L24_29)
                L23_28 = Player
                L24_29 = L23_28
                L23_28 = L23_28.setStay
                L25_30 = false
                L23_28(L24_29, L25_30)
                L23_28 = Fn_userCtrlOn
                L23_28()
                L23_28 = _beaconNaviStatus
                L23_28 = L23_28[L19_24]
                L23_28.awayed = true
              end
            end
          end
        end
      else
        L23_28 = _beaconNaviStatus
        L23_28 = L23_28[L19_24]
        L23_28 = L23_28.marker
        if L23_28 ~= nil then
          L23_28 = deleteMnavi
          L24_29 = _beaconNaviStatus
          L24_29 = L24_29[L19_24]
          L24_29 = L24_29.marker
          L23_28(L24_29)
          L23_28 = _beaconNaviStatus
          L23_28 = L23_28[L19_24]
          L23_28.marker = nil
        end
      end
    end
    L16_21()
  end
  if L16_21 ~= nil then
    L16_21(L17_22)
    _beacon_task = nil
  end
  for L19_24 = 1, _BEACON_COUNT do
    L20_25 = _beaconNaviStatus
    L20_25 = L20_25[L19_24]
    L20_25 = L20_25.se_hdl
    if L20_25 ~= nil then
      L20_25 = Sound
      L21_26 = L20_25
      L20_25 = L20_25.stopSEHandle
      L22_27 = _beaconNaviStatus
      L22_27 = L22_27[L19_24]
      L22_27 = L22_27.se_hdl
      L20_25(L21_26, L22_27)
      L20_25 = _beaconNaviStatus
      L20_25 = L20_25[L19_24]
      L20_25.se_hdl = nil
    end
    L20_25 = _beaconNaviStatus
    L20_25 = L20_25[L19_24]
    L20_25 = L20_25.eff_hdl
    if L20_25 ~= nil then
      L20_25 = _beaconNaviStatus
      L20_25 = L20_25[L19_24]
      L20_25 = L20_25.eff_hdl
      L21_26 = L20_25
      L20_25 = L20_25.abort
      L20_25(L21_26)
      L20_25 = _beaconNaviStatus
      L20_25 = L20_25[L19_24]
      L20_25.eff_hdl = nil
    end
    L20_25 = _beaconNaviStatus
    L20_25 = L20_25[L19_24]
    L20_25 = L20_25.marker
    if L20_25 ~= nil then
      L20_25 = deleteMnavi
      L21_26 = _beaconNaviStatus
      L21_26 = L21_26[L19_24]
      L21_26 = L21_26.marker
      L20_25(L21_26)
    end
    L20_25 = _beaconNaviStatus
    L20_25 = L20_25[L19_24]
    L20_25.marker = nil
  end
  L16_21()
  if L16_21 ~= nil then
    L16_21(L17_22, L18_23)
    _detect_se_handle = nil
  end
end
function getBrokenBeacon()
  local L0_46, L1_47, L2_48, L3_49, L4_50
  L0_46 = 0
  for L4_50 = 1, _BEACON_COUNT do
    if _beaconStatus[string.format("bg2_beacon_%02d", L4_50)] == _BEACON_STATUS.BROKEN then
      L0_46 = L0_46 + 1
    end
  end
  return L0_46
end
function beaconActivate(A0_51)
  local L1_52, L2_53
  L1_52 = string
  L1_52 = L1_52.format
  L2_53 = "bg2_beacon_%02d"
  L1_52 = L1_52(L2_53, A0_51)
  L2_53 = findGameObject2
  L2_53 = L2_53("GimmickBg", L1_52)
  L2_53:setActive(true)
  _beaconStatus[L1_52] = _BEACON_STATUS.NO_INSIGHT
  if A0_51 ~= _BEACON_GENUINE then
    _beaconNaviStatus[A0_51].se_hdl = Sound:playSEHandle("ep16_becon_fake", 1, "", L2_53)
    L2_53:getWorldTransform().y = L2_53:getWorldTransform().y + 1.5
    _beaconNaviStatus[A0_51].eff_hdl = RAC_createEffect({
      eff_name = "ef_ev_glw_purple",
      world_pos = L2_53:getWorldTransform()
    })
  end
end
function beaconInitialize(A0_54)
  local L1_55
  L1_55 = string
  L1_55 = L1_55.format
  L1_55 = L1_55("bg2_beacon_%02d", A0_54)
  findGameObject2("GimmickBg", L1_55):setName(L1_55)
  findGameObject2("GimmickBg", L1_55):setActive(false)
  findGameObject2("GimmickBg", L1_55):setLockonPermission(false)
  _beaconStatus[L1_55] = _BEACON_STATUS.INVISIBLE
  _beaconNaviStatus[A0_54] = {}
  _beaconNaviStatus[A0_54].marker = nil
  _beaconNaviStatus[A0_54].enable = false
  _beaconNaviStatus[A0_54].away = false
  _beaconNaviStatus[A0_54].awayed = false
  _beaconNaviStatus[A0_54].navi_wait = 90
  _beaconNaviStatus[A0_54].se_hdl = nil
  _beaconNaviStatus[A0_54].eff_hdl = nil
end
function putDetectCaption()
  local L0_56
  L0_56 = _beacon_caption_wait
  if L0_56 == 0 then
    L0_56 = {
      "ep16_00108",
      "ep16_00109",
      "ep16_00110"
    }
    Fn_captionView(L0_56[math.random(#L0_56)])
    _beacon_caption_wait = _BEACON_CAPTION_TIMER
  end
end
function putDiscoveryCaption(A0_57)
  if A0_57 == _BEACON_GENUINE then
    Fn_captionViewWait("ep16_00111")
  elseif not _findFirst then
    Fn_captionViewWait("ep16_00112")
  else
    Fn_captionView(({
      "ep16_00113",
      "ep16_00114",
      "ep16_00115"
    })[math.random(#{
      "ep16_00113",
      "ep16_00114",
      "ep16_00115"
    })])
  end
end
function putNearbyCaption()
  local L0_58
  L0_58 = _beacon_caption_wait
  if L0_58 == 0 then
    L0_58 = {
      "ep16_00116",
      "ep16_00117",
      "ep16_00118"
    }
    Fn_captionView(L0_58[math.random(#L0_58)])
    _beacon_caption_wait = _BEACON_CAPTION_TIMER
  end
end
function invokeAreaMoveTask(A0_59, A1_60, A2_61)
  return invokeTask(function()
    local L0_62, L1_63, L2_64, L3_65, L4_66
    L0_62(L1_63, L2_64)
    L0_62(L1_63, L2_64)
    L0_62(L1_63, L2_64)
    L0_62(L1_63, L2_64)
    L0_62(L1_63)
    for L3_65, L4_66 in L0_62(L1_63) do
      A0_59:appendMoveTarget(findGameObject2("Node", L4_66))
    end
    L0_62(L1_63)
    L0_62(L1_63, L2_64)
    while true do
      if not L0_62 then
        L0_62()
      end
    end
    L0_62(L1_63)
    L0_62(L1_63)
    L0_62(L1_63, L2_64)
  end)
end
function pccubesensor2_beacon_07_OnEnter()
  local L0_67, L1_68
  _beacon_07_sensor = true
end
function pccubesensor2_beacon_07_OnLeave()
  local L0_69, L1_70
  _beacon_07_sensor = false
end
