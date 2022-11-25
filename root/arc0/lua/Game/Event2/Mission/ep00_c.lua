dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/area_controller.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/pdemo.lua")
import("Wind")
_cid_name = nil
_cid_npc = nil
_cid_pup = nil
_cid_area = "pi_a_10"
_cid_area_cnt = 1
_navi_max = 11
_is_goal = false
_wait_navi = false
_recovery = false
_recovery_node = nil
_recovery_sensor = 0
_kit_reach_area = nil
_recovery_task = nil
_pause = false
_move_task = nil
_pc_dist = 20
MOVE_DIST = 20
EVENT_DIST = 15
JUMP_DIST = 15
LAST_DIST = 10
_pause_release = 9.5
_caption_lock = false
_pause_cap = 0
_pause_cap_task = nil
_first_strike = false
_second_strike = false
_third_strike = false
_forth_strike = false
_last_strike = false
_last_strike_kit = false
_bridge_hit_23 = false
_bridge_hit_24 = false
_cid_area_id = 1
_kit_area_id = 1
_kit_pi_a_14_11 = false
_kit_bridge = false
_cid_bridge = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8
  L0_0(L1_1)
  L0_0()
  _sdemo = L0_0
  _cid_name = "npcgen2_cid05_01"
  _cid_npc = L0_0
  _cid_pup = L0_0
  L0_0.hail = "kit01_hail_00"
  L0_0.heat = "kit01_stay_heat_00"
  L0_0.stay = "kit01_stay_00"
  L0_0.landing = "kit01_landing_00"
  _kid_mot_list = L0_0
  L0_0(L1_1)
  _storms = L0_0
  L3_3 = "locator2_eff_bk_01_01"
  L0_0[1] = L1_1
  L0_0(L1_1)
  for L3_3, L4_4 in L0_0(L1_1) do
    for L8_8 = 1, 3 do
      if _kit_rcvy_tbl[L4_4][L8_8] ~= nil then
        Fn_pcSensorOff(string.format("pccubesensormulti2_rcvy_%s_%02d", L4_4, L8_8))
      end
    end
  end
  _pi_a_14_15_ctrl = L0_0
  _pi_a_16_06_ctrl = L0_0
  _pi_a_12_17_ctrl = L0_0
  _pi_a_12_10_ctrl = L0_0
  _pi_a_12_13_ctrl = L0_0
  _pi_a_02_15_ctrl = L0_0
  _pi_a_14_11_ctrl = L0_0
  _pi_a_12_14_ctrl = L0_0
  _pi_a_12_15_ctrl = L0_0
  _pi_a_12_16_ctrl = L0_0
  _pi_a_24_05_ctrl = L0_0
  _pi_a_06_07_ctrl = L0_0
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  L3_3 = "pi_a_14_11"
  L3_3 = {}
  L3_3.camera = true
  L3_3.scene_param = false
  _pdemo = L0_0
  _pi_a_02_15 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  _pi_a_24_01 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  L0_0(L1_1, L2_2)
  _pi_a_14_16 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  L0_0(L1_1, L2_2)
  _pi_a_12_17 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  L0_0(L1_1, L2_2)
  _pi_a_14_15 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  L0_0(L1_1, L2_2)
  _pi_a_24_03 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  _pi_a_14_11 = L0_0
  L0_0(L1_1, L2_2)
  while true do
    if L0_0 then
      L0_0()
    end
  end
  L0_0(L1_1, L2_2)
  for L3_3 = 1, 20 do
    L4_4 = findGameObject2
    L8_8 = L3_3
    L8_8 = L6_6(L7_7, L8_8)
    L4_4 = L4_4(L5_5, L6_6, L7_7, L8_8, L6_6(L7_7, L8_8))
    if L4_4 ~= nil then
      L5_5(L6_6, L7_7)
    end
  end
  for L3_3 = 1, 7 do
    L4_4 = findGameObject2
    L8_8 = L3_3
    L8_8 = L6_6(L7_7, L8_8)
    L4_4 = L4_4(L5_5, L6_6, L7_7, L8_8, L6_6(L7_7, L8_8))
    if L4_4 ~= nil then
      L5_5(L6_6, L7_7)
    end
  end
  _wall_hdl = L0_0
  L0_0(L1_1, L2_2)
  _debug_flag = false
  _debugDisp_naviTask = false
end
function Ingame()
  area_drift("pi_a_24_02")
  area_drift("pi_a_02_13")
  area_drift("pi_a_24_05")
  area_drift("pi_a_12_16")
  area_drift("pi_a_12_15")
  if _debug_flag then
    invokeTask(function()
      repeat
        if _move_task ~= nil then
          debugDispPrint("move_task running : " .. tostring(_move_task:isRunning()))
        end
        if _cid_npc ~= nil then
          debugDispPrint("Cid area          : " .. tostring(_cid_area))
          debugDispPrint("         Count    : " .. tostring(_cid_area_cnt))
          debugDispPrint("    Move Current  : " .. tostring(_cid_npc:getMoveCurrentIndex()))
          debugDispPrint("         End      : " .. tostring(_cid_npc:isMoveEnd()))
          debugDispPrint("    Jump End      : " .. tostring(_cid_npc:isJumpEnd()))
          debugDispPrint("    PC   dist set : " .. tostring(_pc_dist))
          debugDispPrint("         dist     : " .. tostring(Fn_getDistanceToPlayer(_cid_pup)))
        end
        debugDispPrint("    Pause         : " .. tostring(_pause))
        debugDispPrint("    Navi WAIT     : " .. tostring(_wait_navi))
        debugDispPrint("recovery          : " .. tostring(_recovery_node))
        debugDispPrint("_recovery_sensor  : " .. tostring(_recovery_sensor))
        debugDispPrint("_first_strike     : " .. tostring(_first_strike))
        debugDispPrint("_second_strike    : " .. tostring(_second_strike))
        debugDispPrint("_third_strike     : " .. tostring(_third_strike))
        debugDispPrint("_forth_strike     : " .. tostring(_forth_strike))
        debugDispPrint("_last_strike      : " .. tostring(_last_strike))
        debugDispPrint("_last_strike_kit  : " .. tostring(_last_strike_kit))
        debugDispPrint("_kit_pi_a_14_11   : " .. tostring(_kit_pi_a_14_11))
        debugDispPrint("_kit_bridge       : " .. tostring(_kit_bridge))
        debugDispPrint("_cid_bridge       : " .. tostring(_cid_bridge))
        wait()
      until false
    end)
  end
  playGravityStorm(_storms[1])
  _amb_voice = Sound:playSEHandle("amb_ep00_003", 1)
  Wind:setWind(50, 0, -90, 0, 1)
  Fn_playPlayerMotion(_kid_mot_list.heat, -1)
  Fn_missionStart()
  Fn_userCtrlOn()
  _cid_navi_task = invokeTask(cidNaviTask)
  invokeTask(cidActionTask)
  invokeTask(areaCheck)
  invokeTask(cidDestination)
  Fn_missionView("ep00_02002")
  invokeTask(updateRestartPoint)
  invokeTask(loversSpat)
  repeat
    wait()
  until _is_goal
  if _cid_navi_task ~= nil then
    _cid_navi_task:abort()
  end
  Fn_userCtrlOff()
  Fn_getPlayer():setCollidable(false)
  Player:getPuppet():setVisible(false)
  Fn_setNpcVisible(_cid_name)
  _pdemo:play()
  waitSeconds(2.3)
  invokeTask(function()
    Fn_resetPcPos("locator2_rcvy_pi_a_14_11_01")
  end)
  waitSeconds(1.5)
  Fn_captionViewWait("ep00_02075", 1)
  Sound:playSE("ryz_079", 1)
  Fn_captionView("ep00_02064", 1.8)
  repeat
    wait()
  until _pdemo:isEnd()
  _pdemo:stop(1)
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_9, L1_10, L2_11, L3_12, L4_13, L5_14
  L0_9 = Fn_getPlayer
  L0_9 = L0_9()
  if L0_9 ~= nil then
    L1_10(L2_11, L3_12)
    L1_10(L2_11, L3_12)
  end
  for L4_13, L5_14 in L1_10(L2_11) do
    if L5_14 ~= nil then
      Sound:stopSEHandle(L5_14)
    end
  end
  if L1_10 ~= nil then
    L1_10(L2_11, L3_12)
  end
  L1_10(L2_11)
end
function waitPhace()
  repeat
    wait()
  until _next_phase
  _next_phase = false
end
_area_list = {
  "pi_a_10",
  "pi_a_02_15",
  "pi_a_06_07",
  "pi_a_24_02",
  "pi_a_13",
  "pi_a_02_13",
  "pi_a_16_06",
  "pi_a_24_05",
  "pi_a_14_15",
  "pi_a_12_16",
  "pi_a_23",
  "pi_a_14_11"
}
_move_list = {
  pi_a_10 = {
    {
      pos = "locator2_pi_a_10_01"
    },
    {
      pos = "locator2_pi_a_10_02"
    },
    {
      pos = "locator2_pi_a_10_03"
    },
    {
      pos = "locator2_pi_a_10_04"
    },
    {
      pos = "locator2_pi_a_10_05"
    },
    {
      pos = "locator2_pi_a_10_06"
    },
    {
      pos = "locator2_pi_a_10_07"
    }
  },
  pi_a_02_15 = {
    {
      pos = "locator2_pi_a_02_15_01"
    },
    {
      pos = "locator2_pi_a_02_15_02"
    },
    {
      pos = "locator2_pi_a_02_15_03"
    }
  },
  pi_a_06_07 = {
    {
      pos = "locator2_pi_a_06_07_01"
    },
    {
      pos = "locator2_pi_a_06_07_02"
    },
    {
      pos = "locator2_pi_a_06_07_03"
    },
    {
      pos = "locator2_pi_a_06_07_04"
    },
    {
      pos = "locator2_pi_a_06_07_05"
    },
    {
      pos = "locator2_pi_a_06_07_06"
    },
    {
      pos = "locator2_pi_a_06_07_07"
    }
  },
  pi_a_24_02 = {
    {
      pos = "locator2_pi_a_24_02_01"
    }
  },
  pi_a_13 = {
    {
      pos = "locator2_pi_a_13_01"
    },
    {
      pos = "locator2_pi_a_13_02"
    },
    {
      pos = "locator2_pi_a_13_03"
    },
    {
      pos = "locator2_pi_a_13_04"
    },
    {
      pos = "locator2_pi_a_13_05"
    }
  },
  pi_a_02_13 = {
    {
      pos = "locator2_pi_a_02_13_01"
    },
    {
      pos = "locator2_pi_a_02_13_02"
    },
    {
      pos = "locator2_pi_a_02_13_03"
    }
  },
  pi_a_16_06 = {
    {
      pos = "locator2_pi_a_16_06_01"
    },
    {
      pos = "locator2_pi_a_16_06_02"
    },
    {
      pos = "locator2_pi_a_16_06_03"
    },
    {
      pos = "locator2_pi_a_16_06_04"
    }
  },
  pi_a_24_05 = {
    {
      pos = "locator2_pi_a_24_05_01"
    },
    {
      pos = "locator2_pi_a_24_05_02"
    },
    {
      pos = "locator2_pi_a_24_05_03"
    }
  },
  pi_a_14_15 = {
    {
      pos = "locator2_pi_a_14_15_01"
    },
    {
      pos = "locator2_pi_a_14_15_02"
    },
    {
      pos = "locator2_pi_a_14_15_03"
    },
    {
      pos = "locator2_pi_a_14_15_04"
    }
  },
  pi_a_12_16 = {
    {
      pos = "locator2_pi_a_12_16_01"
    }
  },
  pi_a_23 = {
    {
      pos = "locator2_pi_a_23_01"
    },
    {
      pos = "locator2_pi_a_23_02"
    },
    {
      pos = "locator2_pi_a_23_03"
    },
    {
      pos = "locator2_pi_a_23_04"
    },
    {
      pos = "locator2_pi_a_23_05"
    },
    {
      pos = "locator2_pi_a_23_06"
    },
    {
      pos = "locator2_pi_a_23_07"
    }
  },
  pi_a_14_11 = {
    {
      pos = "locator2_pi_a_14_11_01"
    },
    {
      pos = "locator2_pi_a_14_11_02"
    },
    {
      pos = "locator2_pi_a_14_11_03"
    },
    {
      pos = "locator2_pi_a_14_11_04"
    },
    {
      pos = "locator2_pi_a_14_11_05"
    }
  },
  pi_a_06_07_02 = {
    {
      pos = "locator2_pi_a_06_07_20"
    },
    {
      pos = "locator2_pi_a_06_07_21"
    },
    {
      pos = "locator2_pi_a_06_07_22"
    }
  },
  pi_a_16_06_02 = {
    {
      pos = "locator2_pi_a_16_06_09"
    }
  },
  pi_a_10_02 = {
    {
      pos = "locator2_pi_a_10_11"
    },
    {
      pos = "locator2_pi_a_10_12"
    },
    {
      pos = "locator2_pi_a_10_13"
    }
  },
  pi_a_14_11_02 = {
    {
      pos = "locator2_pi_a_14_11_03"
    },
    {
      pos = "locator2_pi_a_14_11_04"
    },
    {
      pos = "locator2_pi_a_14_11_05"
    }
  }
}
_jump_pos_list = {
  pi_a_10 = {
    pos = "locator2_pi_a_10_13"
  },
  pi_a_02_15 = {
    pos = "locator2_pi_a_02_15_03"
  },
  pi_a_06_07 = {
    pos = "locator2_pi_a_06_07_22"
  },
  pi_a_24_02 = {
    pos = "locator2_pi_a_24_02_01"
  },
  pi_a_13 = {
    pos = "locator2_pi_a_13_05"
  },
  pi_a_02_13 = {
    pos = "locator2_pi_a_02_13_03"
  },
  pi_a_16_06 = {
    pos = "locator2_pi_a_16_06_09"
  },
  pi_a_24_05 = {
    pos = "locator2_pi_a_24_05_03"
  },
  pi_a_14_15 = {
    pos = "locator2_pi_a_14_15_04"
  },
  pi_a_12_16 = {
    pos = "locator2_pi_a_12_16_01"
  },
  pi_a_23 = {
    pos = "locator2_pi_a_23_07"
  },
  pi_a_14_11 = {
    pos = "locator2_pi_a_14_11_03"
  }
}
_route_end_list = {
  pi_a_10 = {
    "locator2_pi_a_10_13"
  },
  pi_a_02_15 = {
    "locator2_pi_a_02_15_03"
  },
  pi_a_06_07 = {
    "locator2_pi_a_06_07_22"
  },
  pi_a_24_02 = {
    "locator2_pi_a_24_02_01"
  },
  pi_a_13 = {
    "locator2_pi_a_13_05"
  },
  pi_a_02_13 = {
    "locator2_pi_a_02_13_03"
  },
  pi_a_16_06 = {
    "locator2_pi_a_16_06_09"
  },
  pi_a_24_05 = {
    "locator2_pi_a_24_05_03"
  },
  pi_a_14_15 = {
    "locator2_pi_a_14_15_04"
  },
  pi_a_12_16 = {
    "locator2_pi_a_12_16_01"
  },
  pi_a_23 = {
    "locator2_pi_a_23_06"
  },
  pi_a_14_11 = {
    "locator2_pi_a_14_11_05"
  }
}
_cid_next_loc = nil
function cidActionTask()
  local L0_15, L1_16, L2_17, L3_18, L4_19, L5_20, L6_21, L7_22, L8_23, L9_24, L10_25, L11_26, L12_27, L13_28, L14_29, L15_30, L16_31, L17_32, L18_33, L19_34
  L0_15 = {}
  L0_15.runLength = -1
  L0_15.recast = true
  L0_15.arrivedLength = 1
  L0_15.no_stay = true
  L1_16 = {}
  L1_16.runLength = -1
  L1_16.recast = true
  L1_16.arrivedLength = 1
  L1_16.no_stay = false
  L2_17 = {}
  L2_17.runLength = -1
  L2_17.recast = false
  L2_17.arrivedLength = 1
  L3_18 = {}
  L3_18.startDash = false
  L3_18.runStop = false
  L4_19 = {}
  L4_19.startDash = false
  L4_19.runStop = true
  L5_20 = {}
  L5_20.startDash = true
  L6_21 = false
  L7_22 = false
  L8_23 = false
  L9_24 = false
  L10_25 = false
  L11_26 = false
  L12_27 = false
  L13_28 = false
  L14_29 = false
  L15_30 = false
  L16_31 = false
  L17_32 = false
  L18_33 = Vector
  L19_34 = 0
  L18_33 = L18_33(L19_34, 0, 0)
  L19_34 = Vector
  L19_34 = L19_34(0, 0, 0)
  while true do
    if _pause then
      wait()
    else
      if _cid_area == "pi_a_14_11" or _cid_area == "pi_a_06_07" or _cid_area == "pi_a_16_06" or _cid_area == "pi_a_10" then
        _move_task = Fn_moveNpc(_cid_npc, _move_list[_cid_area], L1_16, L4_19)
      else
        _move_task = Fn_moveNpc(_cid_npc, _move_list[_cid_area], L0_15, L3_18)
      end
      repeat
        if not L6_21 then
          if _cid_area == "pi_a_10" then
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() == 3
            pauseDistChange(EVENT_DIST)
            repeat
              wait()
            until not _pause
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 4
            _wait_navi = true
            first_strike_start()
            repeat
              wait()
            until _first_strike
            if _cid_npc:getMoveCurrentIndex() > 5 then
              _cid_npc:pauseMove(true)
              Fn_playNpcEventMotion(_cid_name, "oops", false, 0.8)
              _cid_npc:pauseMove(false)
            end
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 6
            _move_task = Fn_moveNpc(_cid_npc, _move_list.pi_a_10_02, L0_15, L3_18)
            _next_point = true
            Sound:playSE("syd_187", 1)
            Fn_captionView("ep00_02052")
            Fn_pcSensorOn("pccubesensor2_guide_jump_pi_a_10")
            L6_21 = true
          end
        elseif not L7_22 then
          if _cid_area == "pi_a_02_15" then
            _wait_navi = false
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            pauseDistChange(JUMP_DIST)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 2
            pauseDistChange(MOVE_DIST)
            L7_22 = true
          end
        elseif not L8_23 then
          if _cid_area == "pi_a_06_07" then
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            pauseDistChange(EVENT_DIST)
            repeat
              wait()
            until not _pause
            _wait_navi = true
            second_strike_start()
            invokeTask(function()
              repeat
                wait()
              until _cid_npc:getMoveCurrentIndex() >= 3
              area_move(_pi_a_06_07_ctrl, "locator2_pi_a_06_07_set_01", 5, true)
            end)
            repeat
              wait()
            until _second_strike
            Sound:playSE("syd037c", 1)
            Fn_captionView("ep00_02053")
            if _cid_npc:getMoveCurrentIndex() > 5 then
              _cid_npc:pauseMove(true)
              Fn_playNpcEventMotion(_cid_name, "oops", false, 0.8)
              _cid_npc:pauseMove(false)
            end
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 6
            Fn_turnNpc(_cid_name, "locator2_pi_a_06_07_20")
            _move_task = Fn_moveNpc(_cid_npc, _move_list.pi_a_06_07_02, L0_15, L3_18)
            invokeTask(function()
              lockCialogue()
              Sound:playSE("syd037a", 1)
              Fn_captionViewWait("ep00_02054", 2.5)
              Sound:playSE("syd_163", 1)
              Fn_captionViewWait("ep00_02039", 2.5)
              _caption_lock = false
            end)
            L8_23 = true
          end
        elseif not L12_27 then
          if _cid_area == "pi_a_13" then
            _wait_navi = false
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            pauseDistChange(JUMP_DIST)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 2
            pauseDistChange(EVENT_DIST)
            repeat
              wait()
            until not _pause
            _wait_navi = true
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 3
            pauseDistChange(MOVE_DIST)
            fall_obj_start()
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 4
            rand_fall()
            fall_obj("obj_21", 5, 0.5, true)
            L12_27 = true
          end
        elseif not L13_28 then
          if _cid_area == "pi_a_02_13" then
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            _wait_navi = false
            pauseDistChange(EVENT_DIST)
            repeat
              wait()
            until not _pause
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 2
            area_move(_pi_a_24_05_ctrl, "locator2_pi_a_24_05_set_02", 12, true)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 3
            _wait_navi = true
            pauseDistChange(MOVE_DIST)
            L13_28 = true
          end
        elseif not L10_25 then
          if _cid_area == "pi_a_16_06" then
            _wait_navi = true
            fall_obj("obj_22", 10, 0.1, true)
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            fall_obj("pi_a_12_01", 10, 0.45, false)
            repeat
              wait()
            until _third_strike
            Sound:playSE("kit064a", 1)
            Fn_captionView("ep00_02055")
            if 1 < _cid_npc:getMoveCurrentIndex() then
              _cid_npc:pauseMove(true)
              Fn_playNpcEventMotion(_cid_name, "oops", false, 0.8)
              _cid_npc:pauseMove(false)
            end
            repeat
              wait()
            until _cid_npc:isMoveEnd()
            _move_task = Fn_moveNpc(_cid_npc, _move_list.pi_a_16_06_02, L0_15, L3_18)
            invokeTask(function()
              lockCialogue()
              Sound:playSE("syd046a", 1)
              Fn_captionView("ep00_02056")
              _caption_lock = false
            end)
            L10_25 = true
          end
        elseif not L11_26 then
          if _cid_area == "pi_a_24_05" then
            _wait_navi = false
            fall_obj("pi_a_12_03", 10, 0.35, false)
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            pauseDistChange(JUMP_DIST)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 2
            pauseDistChange(MOVE_DIST)
            L11_26 = true
          end
        elseif not L14_29 then
          if _cid_area == "pi_a_14_15" then
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            pauseDistChange(EVENT_DIST)
            repeat
              wait()
            until not _pause
            _wait_navi = true
            invokeTask(function()
              fall_obj("obj_23", 10, 0.1, true)
              waitSeconds(1.5)
              fall_obj("obj_24", 10, 0.1, true)
            end)
            repeat
              wait()
            until _bridge_hit_23
            _cid_npc:playMoveMotion("run_afraid_l_00")
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 2
            fall_obj("pi_a_12_02", 10, 0.45, false)
            repeat
              wait()
            until _bridge_hit_24
            _cid_npc:playMoveMotion("run_afraid_r_00")
            _wait_navi = false
            pauseDistChange(MOVE_DIST)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 3
            fall_obj("obj_25", 10, 0.3, true)
            L14_29 = true
          end
        elseif not L15_30 then
          if _cid_area == "pi_a_12_16" then
            L15_30 = true
          end
        elseif not L16_31 then
          if _cid_area == "pi_a_23" then
            repeat
              wait()
            until 1 <= _cid_npc:getMoveCurrentIndex()
            fall_obj("obj_27", 10, 0.25, true)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 2
            fall_obj("pi_a_12_04", 10, 0.4, false)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 3
            fall_obj("pi_a_12_05", 10, 0.4, false)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 4
            invokeTask(function()
              repeat
                wait()
              until _forth_strike
              forth_strike_start()
            end)
            fall_obj("pi_a_12_06", 10, 0.4, false)
            repeat
              wait()
            until _cid_npc:getMoveCurrentIndex() >= 6
            invokeTask(function()
              lockCialogue()
              Sound:playSE("syd042a", 1)
              Fn_captionViewWait("ep00_02032")
              _caption_lock = false
            end)
            pauseDistChange(JUMP_DIST)
            repeat
              wait()
            until not _pause
            L16_31 = true
          end
        elseif not L17_32 and _cid_area == "pi_a_14_11" then
          repeat
            wait()
          until 1 <= _cid_npc:getMoveCurrentIndex()
          pauseDistChange(LAST_DIST)
          repeat
            wait()
          until _kit_bridge and _cid_bridge and _pause == false
          _wait_navi = true
          last_strike_start()
          rcvy_update_end()
          fall_obj("pi_a_12_07", 10, 0.4, false)
          lockCialogue()
          Sound:playSE("kit040b", 1)
          Fn_captionView("ep00_02033")
          repeat
            wait()
          until _last_strike
          _recovery_node = "locator2_rcvy_pi_a_14_11_02"
          Sound:playSE("syd_164", 1)
          Fn_captionView("ep00_02034")
          _cid_npc:pauseMove(true)
          Fn_playNpcEventMotion(_cid_name, "oops", false, 0.8)
          _cid_npc:pauseMove(false)
          repeat
            wait()
          until _cid_npc:getMoveCurrentIndex() >= 5
          invokeTask(function()
            _cid_npc:pauseMove(true)
            Fn_playNpcEventMotion(_cid_name, "injured", true, 0.8)
          end)
          Sound:playSE("syd049c", 1)
          Fn_captionViewWait("ep00_02073")
          Fn_userCtrlOff()
          Sound:playSE("kit038a", 1)
          Fn_captionViewWait("ep00_02062")
          _is_goal = true
          L17_32 = true
        end
        wait()
        L18_33 = _cid_pup:getWorldPos()
        L19_34 = findGameObject2("Node", _jump_pos_list[_cid_area].pos):getWorldPos()
      until (2 > L18_33:DistanceTo(L19_34) or not _move_task:isRunning()) and not _pause
      _cid_area_cnt = _cid_area_cnt + 1
      if _area_list[_cid_area_cnt] then
        _cid_area = _area_list[_cid_area_cnt]
        if _cid_area ~= nil then
          cidJump(_cid_area)
        else
          Fn_appendNpcArea(_cid_npc, _move_list[_cid_area][1].pos)
        end
        wait()
      end
    end
  end
end
function cidNaviTask()
  while not _is_goal do
    if _debugDisp_naviTask then
      debugDispPrint("_wait_navi      : " .. tostring(_wait_navi))
      debugDispPrint("_pause          : " .. tostring(_pause))
      debugDispPrint(" _pc_dist       : " .. tostring(_pc_dist))
      debugDispPrint("Dist            : " .. tostring(Fn_getDistanceToPlayer(_cid_pup)) .. " [ " .. tostring(Fn_getDistanceToPlayer(_cid_pup) > _pc_dist) .. " ]")
      debugDispPrint("_cid_area_id    : " .. tostring(_cid_area_id))
      debugDispPrint("_kit_area_id    : " .. tostring(_kit_area_id))
      debugDispPrint(" pointDistCheck : " .. tostring(pointDistCheck()))
    end
    if not _wait_navi then
      if not _pause then
        if Fn_getDistanceToPlayer(_cid_pup) > _pc_dist and _cid_area_id >= _kit_area_id and pointDistCheck() then
          cidNaviStart()
        end
      elseif Fn_getDistanceToPlayer(_cid_pup) < _pause_release or _cid_area_id < _kit_area_id or _cid_area_id >= _kit_area_id and not pointDistCheck() then
        cidNaviEnd()
      elseif _pause_cap_task == nil then
        _pause_cap_task = EventHelper:timerCallback("pause caption", 10, cidPauseCaption)
      end
    end
    wait()
  end
  Fn_naviKill()
end
function cidNaviStart()
  if _move_task:isRunning() then
    _pause = true
    _cid_npc:pauseMove(true)
    cid_waittask = invokeTask(function()
      Fn_playNpcEventMotion(_cid_name, "lookback", true, 0.5)
    end)
    cidPauseCaption()
    HUD:naviSetPochiDistanceDensity0(0)
    HUD:naviSetPochiDistanceDensity100(-1)
    Fn_naviSet(_cid_pup)
  end
end
function cidNaviEnd()
  Fn_naviKill()
  cid_waittask:abort()
  Fn_playNpcEventMotion(_cid_name, "lookback_out", false, 0)
  HUD:naviSetPochiDistanceDensity0(40)
  HUD:naviSetPochiDistanceDensity100(60)
  if _pause_cap_task ~= nil then
    _pause_cap_task:abort()
  end
  _pause_cap_task = nil
  _cid_npc:pauseMove(false)
  _pause = false
end
function cidPauseCaption()
  local L0_35
  L0_35 = 0
  repeat
    L0_35 = RandI(1, 3)
    wait()
  until L0_35 ~= _pause_cap
  _pause_cap = L0_35
  _caption_lock = true
  if L0_35 == 1 then
    Sound:playSE("syd037c", 1)
    Fn_captionView("ep00_02070")
  elseif L0_35 == 2 then
    Sound:playSE("syd_187", 1)
    Fn_captionView("ep00_02071")
  else
    Sound:playSE("syd044b", 1)
    Fn_captionView("ep00_02072")
  end
  _caption_lock = false
  if _pause_cap_task ~= nil then
    _pause_cap_task:abort()
  end
  _pause_cap_task = nil
end
function areaCheck()
  repeat
    if _area_list[_cid_area_id] ~= _cid_area then
      for _FORV_3_, _FORV_4_ in pairs(_area_list) do
        if _FORV_4_ == _cid_area then
          _cid_area_id = _FORV_3_
          break
        end
      end
    end
    kit_area = Player:getRecentAreaName()
    if _area_list[_kit_area_id] ~= kit_area then
      for _FORV_3_, _FORV_4_ in pairs(_area_list) do
        if _FORV_4_ == kit_area then
          _kit_area_id = _FORV_3_
          break
        end
      end
    end
    wait()
  until _is_goal
end
function pauseDistChange(A0_36)
  _wait_navi = true
  wait()
  _pc_dist = A0_36
  wait()
  _wait_navi = false
end
function cidDestination()
  local L0_37, L1_38, L2_39, L3_40, L4_41, L5_42, L6_43, L7_44
  repeat
    L0_37 = _cid_area
    for L4_41, L5_42 in L1_38(L2_39) do
      _cid_next_loc = L5_42
      L6_43 = findGameObject2
      L7_44 = "Node"
      L6_43 = L6_43(L7_44, L5_42)
      L7_44 = L6_43
      L6_43 = L6_43.getWorldPos
      L6_43 = L6_43(L7_44)
      L7_44 = nil
      _next_point = false
      repeat
        L7_44 = _cid_pup:getWorldPos()
        if L0_37 == _cid_area and not _next_point then
          wait()
        end
      until L6_43:IsAlmostSame(L7_44)
    end
    L1_38()
  until L1_38
end
function pointDistCheck()
  local L0_45
  L0_45 = _cid_next_loc
  if L0_45 == nil then
    L0_45 = nil
    return L0_45
  end
  L0_45 = findGameObject2
  L0_45 = L0_45("Node", _cid_next_loc)
  L0_45 = L0_45.getWorldPos
  L0_45 = L0_45(L0_45)
  if Fn_getDistanceToPlayer(L0_45) < Fn_findNpcPuppet(_cid_name):getWorldPos():DistanceTo(L0_45) + 5 then
    return false
  else
    return true
  end
end
function cidJump(A0_46)
  local L1_47, L2_48, L3_49, L4_50, L5_51, L6_52, L7_53, L8_54
  L1_47 = {
    L2_48,
    L3_49,
    L4_50,
    L5_51,
    L6_52,
    L7_53
  }
  L2_48 = {}
  L2_48.height = 3
  L2_48.dist = 0
  L3_49 = {}
  L3_49.height = 2
  L3_49.dist = 1
  L4_50 = {}
  L4_50.height = -2
  L4_50.dist = 7.5
  L5_51 = {}
  L5_51.height = -4
  L5_51.dist = 9
  L6_52 = {}
  L6_52.height = -6
  L6_52.dist = 11
  L7_53 = {}
  L7_53.height = -99
  L7_53.dist = 0
  L2_48 = 7.5
  L3_49 = Fn_findNpc
  L4_50 = _cid_name
  L3_49 = L3_49(L4_50)
  L4_50 = string
  L4_50 = L4_50.format
  L5_51 = "locator2_%s_next"
  L6_52 = A0_46
  L4_50 = L4_50(L5_51, L6_52)
  L5_51 = {}
  L5_51.anim_in = "jump_00"
  L5_51.anim_lp = "jump_fall_00"
  L5_51.anim_out = "landing_run_00"
  L5_51.anim_stay = "run"
  L5_51.height = 0.2
  L5_51.nextTarget = L4_50
  L6_52 = Fn_findNpcPuppet
  L7_53 = _cid_name
  L6_52 = L6_52(L7_53)
  L8_54 = L6_52
  L7_53 = L6_52.getWorldPos
  L7_53 = L7_53(L8_54)
  L8_54 = "warppoint2_"
  L8_54 = L8_54 .. A0_46
  repeat
    wait()
  until _pause == false
  _wait_navi = true
  L3_49:jump("warppoint2_" .. A0_46, L5_51)
  repeat
    wait()
  until L3_49:isJumpEnd()
  _wait_navi = false
end
function cidoops()
  _cid_npc:pauseMove(true)
  Fn_playNpcEventMotion(_cid_name, "oops", false, 0.8)
  _cid_npc:pauseMove(false)
end
function lockCialogue()
  _caption_lock = false
  repeat
    wait()
  until _pause == false
  _caption_lock = true
end
function pccubesensor2_fall_obj_OnEnter(A0_55, A1_56)
  fall_obj_start()
  Fn_sensorOff(A0_55)
end
function fall_obj_start()
  if not _fall_obj_start then
    _fall_obj_start = true
    invokeTask(function()
      Sound:playSE("ep00_ground_fall", 1, "", Fn_findAreaHandle("pi_a_13"):getWorldPos())
      Camera:shake3D(2, 0.2, 1.5, Fn_findAreaHandle("pi_a_13"):getWorldPos(), 0)
      fall_obj("obj_04", 10, 0.5, true)
      waitSeconds(0.5)
      fall_obj("obj_01", 10, 0.5, true)
      waitSeconds(0.5)
      fall_obj("obj_02", 10, 0.5, true)
      waitSeconds(0.5)
      fall_obj("obj_03", 10, 0.5, true)
      waitSeconds(1.5)
      fall_obj("obj_06", 10, 0.5, true)
    end)
  end
end
function fall_obj(A0_57, A1_58, A2_59, A3_60, A4_61)
  invokeTask(function()
    local L0_62, L1_63, L2_64, L3_65, L4_66, L5_67, L6_68, L7_69
    L0_62 = {}
    L1_63, L2_64 = nil, nil
    for L6_68 = 1, A1_58 do
      L7_69.pos = 0
      L7_69.rot = 0
      L7_69.pos, L7_69.rot = findGameObject2("Node", string.format("locator2_fall_%s_%02d", A0_57, L6_68)):getWorldTransform()
      table.insert(L0_62, L7_69)
    end
    L6_68 = A3_60
    if L6_68 then
      L6_68 = findGameObject2
      L6_68 = L6_68(L7_69, string.format("locator2_fall_%s_hit", A0_57))
      L6_68 = L5_67.getWorldTransform
      L6_68 = L6_68(L7_69)
      hil_point = L6_68
      L6_68 = Fn_createEffect
      L6_68 = L6_68(L7_69, "ef_ev_brkpar_02", L5_67, false, nil, "initonly")
      L1_63 = L6_68
      L6_68 = Fn_createEffect
      L6_68 = L6_68(L7_69, "ef_com_grnhit_03", L5_67, false, nil, "initonly")
      L2_64 = L6_68
    end
    L6_68 = findGameObject2
    L6_68 = L6_68(L7_69, "bg2_fall_" .. A0_57)
    L7_69(L6_68, findGameObject2("Node", "locator2_fall_" .. A0_57 .. "_01"):getWorldTransform())
    if L7_69 then
      L7_69(L6_68)
    end
    L7_69(L6_68, false)
    L7_69(L6_68, true)
    L7_69(L6_68)
    for _FORV_10_, _FORV_11_ in L7_69(L0_62) do
      L6_68:appendCurvePoint2(_FORV_11_.pos, _FORV_11_.rot, A2_59, "Liner", true)
    end
    repeat
      L7_69()
    until L7_69 == false
    if L7_69 then
      L7_69(L6_68, hil_point, 10, 30)
      L7_69(L1_63, L5_67)
      L7_69(L7_69, "ep00_ground_fall", 1, "", L5_67)
      L7_69(L2_64, L5_67)
      L7_69(L1_63, 5)
      L7_69(L2_64, 5)
      if L7_69 ~= nil then
      else
        if L7_69 == true then
          L7_69(L7_69, 2, 0.3, 1.25, L5_67:getWorldPos(), 0)
      end
      elseif L7_69 == false then
        L7_69(L7_69, 2, 0.2, 1, L5_67:getWorldPos(), 10)
      end
      if L7_69 == "obj_23" then
        _bridge_hit_23 = true
      elseif L7_69 == "obj_24" then
        _bridge_hit_24 = true
      end
      L7_69(L6_68)
      repeat
        L7_69()
      until L7_69 == false
      L7_69(L6_68)
    else
      L7_69(L6_68)
      L7_69(L6_68, false)
    end
  end)
end
function rand_fall()
  invokeTask(function()
    local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77, L8_78, L9_79, L10_80, L11_81, L12_82
    L0_70 = {}
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_04 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_05 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_06 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_07 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_08 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_09 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_10 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_11 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_12 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_13 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_14 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_15 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_16 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_17 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_18 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_19 = L1_71
    L1_71 = {}
    L1_71.loc_max = 10
    L1_71.hit = true
    L1_71.shake = false
    L1_71.fall = true
    L0_70.obj_20 = L1_71
    L1_71 = 6
    L2_72 = 4
    L3_73 = 8
    L4_74 = {
      L5_75,
      L6_76,
      L7_77,
      L8_78,
      L9_79,
      L10_80
    }
    L5_75 = {}
    L5_75.min = 4
    L5_75.max = 7
    L6_76.min = 8
    L6_76.max = 11
    L7_77.min = 12
    L7_77.max = 15
    L8_78.min = 16
    L8_78.max = 20
    L9_79 = {}
    L9_79.min = 8
    L9_79.max = 15
    L10_80 = {}
    L10_80.min = 16
    L10_80.max = 20
    repeat
      L5_75 = waitSeconds
      L5_75(L6_76)
      L5_75 = {}
      for L9_79 = 1, L1_71 do
        L10_80 = nil
        L11_81 = true
        repeat
          repeat
            L10_80 = L12_82
            L12_82()
          until L12_82
          L11_81 = true
          for _FORV_15_, _FORV_16_ in L12_82(L5_75) do
            if _FORV_16_ == L10_80 then
              L11_81 = false
            end
          end
          L12_82()
        until L11_81
        L12_82(L5_75, L10_80)
        fall_obj(L12_82, L0_70[L12_82].loc_max, RandI(L2_72, L3_73) / 10, L0_70[L12_82].hit, L0_70[L12_82].shake)
        invokeTask(function()
          L0_70[L12_82].fall = false
          obj_hdl = findGameObject2("GimmickBg", "bg2_fall_" .. L12_82)
          repeat
            wait()
          until obj_hdl:isCurveMoving()
          repeat
            wait()
          until obj_hdl:isCurveMoving() == false
          L0_70[L12_82].fall = true
        end)
        wait(RandI(20, 45))
        break
      end
      L6_76()
    until L6_76
  end)
end
function area_move(A0_83, A1_84, A2_85, A3_86, A4_87, A5_88)
  invokeTask(function()
    local L0_89
    L0_89 = {}
    L0_89.velocity = A2_85
    L0_89.move_type = 1
    L0_89.move_atime = A4_87
    L0_89.move_bdist = A5_88
    if A3_86 == nil then
      L0_89.move_type = 1
    elseif A3_86 == true then
      L0_89.move_type = 2
    elseif A3_86 == false then
      L0_89.move_type = 1
    end
    A0_83:setMoveParam(L0_89)
    A0_83:move(A1_84)
  end)
end
function area_move_deccel(A0_90, A1_91, A2_92)
  invokeTask(function()
    local L0_93, L1_94, L2_95
    L0_93 = {}
    L1_94 = A2_92
    L0_93.velocity = L1_94
    L0_93.move_type = 1
    L1_94 = A0_90
    L2_95 = L1_94
    L1_94 = L1_94.setMoveParam
    L1_94(L2_95, L0_93)
    L1_94 = A0_90.handle
    L2_95 = L1_94
    L1_94 = L1_94.getWorldPos
    L1_94 = L1_94(L2_95)
    L2_95 = findGameObject2
    L2_95 = L2_95("Node", A1_91)
    L2_95 = L2_95.getWorldPos
    L2_95 = L2_95(L2_95)
    A0_90:move(A1_91)
    for _FORV_7_ = 1, 0.01, -0.01 do
      if not A0_90:isMoveEnd() then
        repeat
          wait()
        until _FORV_7_ > A0_90.handle:getMoveDistance() / L1_94:DistanceTo(L2_95) or _FORV_7_ < 0.1
        A0_90.handle:setMoveVelocity(L0_93.velocity * _FORV_7_)
      end
    end
  end)
end
function area_move_accel(A0_96, A1_97, A2_98)
  invokeTask(function()
    local L0_99, L1_100, L2_101
    L0_99 = {}
    L1_100 = A2_98
    L0_99.velocity = L1_100
    L0_99.move_type = 1
    L1_100 = A0_96
    L2_101 = L1_100
    L1_100 = L1_100.setMoveParam
    L1_100(L2_101, L0_99)
    L1_100 = A0_96.handle
    L2_101 = L1_100
    L1_100 = L1_100.getWorldPos
    L1_100 = L1_100(L2_101)
    L2_101 = findGameObject2
    L2_101 = L2_101("Node", A1_97)
    L2_101 = L2_101.getWorldPos
    L2_101 = L2_101(L2_101)
    A0_96:move(A1_97)
    for _FORV_7_ = 0.01, 0.99, 0.01 do
      if not A0_96:isMoveEnd() then
        repeat
          wait()
        until _FORV_7_ < A0_96.handle:getMoveDistance() / L1_100:DistanceTo(L2_101) or _FORV_7_ > 1.99
        A0_96.handle:setMoveVelocity(L0_99.velocity * _FORV_7_)
      end
    end
  end)
end
function pccubesensor2_first_strike_start_OnEnter(A0_102, A1_103)
  print("PC\227\129\140\229\133\136\227\129\171\230\157\165\227\129\159\239\188\159")
  first_strike_start()
  Fn_pcSensorOff(A0_102)
end
function first_strike_start()
  if not _first_strike_start then
    print("\230\156\128\229\136\157\227\129\174\229\156\176\229\189\162\227\130\146\229\139\149\227\129\139\227\129\153")
    _first_strike_start = true
    invokeTask(function()
      local L0_104, L1_105
      L0_104 = findGameObject2
      L1_105 = "Node"
      L0_104 = L0_104(L1_105, "locator2_first_strike")
      L1_105 = createGameObject2
      L1_105 = L1_105("DNode")
      L1_105:setName("DNode_first_strike")
      L1_105:setAsSphere(1)
      L0_104:appendChild(L1_105)
      L1_105:try_init()
      L1_105:waitForReady()
      L1_105:try_start()
      area_move(_pi_a_12_13_ctrl, "locator2_pi_a_12_13_set_01", 28)
    end)
  end
end
function cubesensor2_first_strike_OnEnter(A0_106, A1_107)
  if A1_107:getName() == "DNode_first_strike" then
    Fn_sensorOff(A0_106)
    invokeTask(function()
      local L0_108, L1_109, L2_110, L3_111, L4_112
      L0_108 = findGameObject2
      L1_109 = "Node"
      L2_110 = "locator2_first_strike"
      L0_108 = L0_108(L1_109, L2_110)
      L2_110 = L0_108
      L1_109 = L0_108.getWorldPos
      L1_109 = L1_109(L2_110)
      L2_110 = findGameObject2
      L3_111 = "GimmickBg"
      L4_112 = "bg2_first_break_01"
      L2_110 = L2_110(L3_111, L4_112)
      L3_111 = findGameObject2
      L4_112 = "GimmickBg"
      L3_111 = L3_111(L4_112, "bg2_first_break_02")
      L4_112 = L2_110.requestBreak
      L4_112(L2_110, L1_109, -5)
      L4_112 = L3_111.requestBreak
      L4_112(L3_111, L1_109, -5)
      L4_112 = _pi_a_02_15
      L4_112 = L4_112.playMoveAnim
      L4_112(L4_112, 0)
      L4_112 = Fn_createEffect
      L4_112 = L4_112("obj_break", "ef_ev_brkpar_02", L0_108, false)
      Sound:playSE("ep00_ground_fall", 1, "", L0_108)
      Fn_finishedTremEffect(L4_112, 5)
      _first_strike = true
      area_move_deccel(_pi_a_12_13_ctrl, "locator2_pi_a_12_13_set_02", 23)
    end)
  end
end
function pccubesensor2_second_strike_start_OnEnter(A0_113, A1_114)
  print("PC\227\129\140\229\133\136\227\129\171\230\157\165\227\129\159\239\188\159")
  second_strike_start()
  Fn_pcSensorOff(A0_113)
end
function second_strike_start()
  if not _second_strike_start then
    print("2\227\129\164\227\130\129\227\129\174\229\156\176\229\189\162\227\130\146\229\139\149\227\129\139\227\129\153")
    _second_strike_start = true
    invokeTask(function()
      local L0_115, L1_116
      L0_115 = print
      L1_116 = "***** second_strike_start *****"
      L0_115(L1_116)
      L0_115 = findGameObject2
      L1_116 = "Node"
      L0_115 = L0_115(L1_116, "locator2_bridge_contact")
      L1_116 = createGameObject2
      L1_116 = L1_116("DNode")
      L1_116:setName("DNode_bridge_contact")
      L1_116:setAsSphere(1)
      L0_115:appendChild(L1_116)
      L1_116:try_init()
      L1_116:waitForReady()
      L1_116:try_start()
      _pi_a_24_01:playMoveAnim(0)
      _pi_a_14_16:playMoveAnim(0)
    end)
  end
end
function cubesensor2_bridge_contact_OnEnter(A0_117, A1_118)
  if A1_118:getName() == "DNode_bridge_contact" then
    Fn_sensorOff(A0_117)
    invokeTask(function()
      local L0_119, L1_120
      L0_119 = print
      L1_120 = "********** second_strike **********"
      L0_119(L1_120)
      L0_119 = findGameObject2
      L1_120 = "Node"
      L0_119 = L0_119(L1_120, "locator2_bridge_contact")
      L1_120 = Fn_createEffect
      L1_120 = L1_120("obj_break", "ef_ev_brkpar_02", L0_119, false)
      Sound:playSE("ep00_ground_fall", 1, "", L0_119)
      Fn_finishedTremEffect(L1_120, 5)
      _second_strike = true
    end)
  end
end
function pccubesensor2_third_strike_start_OnEnter(A0_121, A1_122)
  print("PC\227\129\140\229\133\136\227\129\171\230\157\165\227\129\159\239\188\159")
  third_strike_start()
  Fn_pcSensorOff(A0_121)
end
function cubesensor2_third_strike_start_OnEnter(A0_123, A1_124)
  third_strike_start()
  Fn_sensorOff(A0_123)
end
function third_strike_start()
  if not _third_strike_start then
    print("3\227\129\164\227\130\129\227\129\174\229\156\176\229\189\162\227\130\146\229\139\149\227\129\139\227\129\153")
    _third_strike_start = true
    invokeTask(function()
      local L0_125, L1_126
      L0_125 = print
      L1_126 = "********** third_strike_start **********"
      L0_125(L1_126)
      L0_125 = findGameObject2
      L1_126 = "Node"
      L0_125 = L0_125(L1_126, "locator2_area_strike")
      L1_126 = createGameObject2
      L1_126 = L1_126("DNode")
      L1_126:setName("DNode_area_strike")
      L1_126:setAsSphere(1)
      L0_125:appendChild(L1_126)
      L1_126:try_init()
      L1_126:waitForReady()
      L1_126:try_start()
      _pi_a_12_17:playMoveAnim(0)
      _pi_a_14_15:playMoveAnim(0)
    end)
  end
end
function cubesensor2_area_strike_OnEnter(A0_127, A1_128)
  if A1_128:getName() == "DNode_area_strike" then
    Fn_sensorOff(A0_127)
    invokeTask(function()
      local L0_129, L1_130
      L0_129 = print
      L1_130 = "********** third_strike **********"
      L0_129(L1_130)
      L0_129 = findGameObject2
      L1_130 = "Node"
      L0_129 = L0_129(L1_130, "locator2_area_strike")
      L1_130 = Fn_createEffect
      L1_130 = L1_130("obj_break", "ef_ev_brkpar_02", L0_129, false)
      Sound:playSE("ep00_ground_fall", 1, "", L0_129)
      Fn_finishedTremEffect(L1_130, 5)
      _third_strike = true
      area_drift("pi_a_14_15")
    end)
  end
end
function pccubesensor2_forth_strike_OnEnter(A0_131, A1_132)
  _forth_strike = true
  Fn_pcSensorOn(A0_131)
end
function forth_strike_start()
  repeat
    wait()
  until _forth_strike
  invokeTask(function()
    local L0_133, L1_134
    L0_133 = findGameObject2
    L1_134 = "Node"
    L0_133 = L0_133(L1_134, "locator2_forth_strike")
    L1_134 = createGameObject2
    L1_134 = L1_134("DNode")
    L1_134:setName("DNode_forth_strike")
    L1_134:setAsSphere(1)
    L0_133:appendChild(L1_134)
    L1_134:try_init()
    L1_134:waitForReady()
    L1_134:try_start()
    area_move(_pi_a_12_14_ctrl, "locator2_pi_a_12_14_set_01", 26)
  end)
end
function cubesensor2_forth_strike_OnEnter(A0_135, A1_136)
  if A1_136:getName() == "DNode_forth_strike" then
    Fn_sensorOff(A0_135)
    invokeTask(function()
      local L0_137, L1_138
      L0_137 = print
      L1_138 = "********** forth_strike **********"
      L0_137(L1_138)
      L0_137 = area_move_deccel
      L1_138 = _pi_a_12_16_ctrl
      L0_137(L1_138, "locator2_pi_a_12_16_set_01", 18)
      L0_137 = findGameObject2
      L1_138 = "Node"
      L0_137 = L0_137(L1_138, "locator2_forth_strike")
      L1_138 = Fn_createEffect
      L1_138 = L1_138("obj_break", "ef_ev_brkpar_02", L0_137, false)
      Sound:playSE("ep00_ground_fall", 1, "", L0_137)
      Fn_finishedTremEffect(L1_138, 5)
      area_move_deccel(_pi_a_12_14_ctrl, "locator2_pi_a_12_14_set_02", 20)
      area_move_deccel(_pi_a_12_16_ctrl, "locator2_pi_a_12_16_set_01", 10)
    end)
  end
end
function cubesensormulti2_last_strike_start_OnEnter(A0_139, A1_140)
  invokeTask(function()
    if A1_140:getName() == "player" then
      _kit_bridge = true
      print("\230\169\139\227\130\146\227\130\179\227\131\170\227\130\184\227\131\167\227\131\179\227\129\167\229\155\178\227\129\163\227\129\166\227\129\151\227\129\190\227\129\134")
      _wall_hdl:setActive(true)
    elseif A1_140:getName() == "npcgen2_cid05_01" then
      _cid_bridge = true
    end
    if _kit_bridge and _cid_bridge then
      Fn_sensorOff(A0_139)
    end
  end)
end
function cubesensormulti2_last_strike_start_OnLeave(A0_141, A1_142)
end
function last_strike_start()
  print("\230\156\128\229\190\140\227\129\174\229\156\176\229\189\162\227\130\146\229\139\149\227\129\139\227\129\153")
  invokeTask(function()
    local L0_143, L1_144
    L0_143 = findGameObject2
    L1_144 = "Node"
    L0_143 = L0_143(L1_144, "locator2_bridge_contact_02")
    L1_144 = createGameObject2
    L1_144 = L1_144("DNode")
    L1_144:setName("DNode_bridge_contact_02")
    L1_144:setAsSphere(1)
    L0_143:appendChild(L1_144)
    L1_144:try_init()
    L1_144:waitForReady()
    L1_144:try_start()
    _pi_a_24_03:playMoveAnim(0)
  end)
end
function cubesensor2_bridge_contact_02_OnEnter(A0_145, A1_146)
  if A1_146:getName() == "DNode_bridge_contact_02" then
    Fn_sensorOff(A0_145)
    invokeTask(function()
      local L0_147, L1_148
      L0_147 = print
      L1_148 = "********** last_strike **********"
      L0_147(L1_148)
      L0_147 = area_move
      L1_148 = _pi_a_14_11_ctrl
      L0_147(L1_148, "locator2_pi_a_14_11_set_01", 20, 2, 0, 20)
      _last_strike = true
      L0_147 = findGameObject2
      L1_148 = "Node"
      L0_147 = L0_147(L1_148, "locator2_bridge_contact_02")
      L1_148 = Fn_createEffect
      L1_148 = L1_148("obj_break", "ef_ev_brkpar_02", L0_147, false)
      Sound:playSE("ep00_ground_fall", 1, "", L0_147)
      Fn_finishedTremEffect(L1_148, 5)
      Camera:shake3D(3, 2, 2, L0_147:getWorldPos(), 0)
    end)
  end
end
function areaSync(A0_149, A1_150, A2_151)
  invokeTask(function()
    repeat
      Fn_findAreaHandle(A0_149):setSynchroArea(A1_150, A2_151)
      waitSeconds(A2_151)
      Fn_findAreaHandle(A0_149):setSynchroArea(nil, A2_151)
      wait()
    until _pause
  end)
end
_kit_jump_tbl = {
  pi_a_10 = true,
  pi_a_02_15 = false,
  pi_a_06_07 = false,
  pi_a_24_02 = false,
  pi_a_13 = false,
  pi_a_02_13 = false,
  pi_a_16_06 = false,
  pi_a_24_05 = false,
  pi_a_14_15 = false,
  pi_a_12_16 = false,
  pi_a_12_15 = false,
  pi_a_23 = false,
  pi_a_14_11 = false
}
_jump_check_area = false
_guide_jump_task = nil
_guide_jump = false
function pccubesensor2_guide_jump_OnEnter(A0_152)
  if _guide_jump_task == nil then
    _guide_jump_task = invokeTask(function()
      repeat
        if Player:getAction() == Player.kAction_Jump then
          if _guide_jump == true then
            Fn_tutorialCaptionKill()
            _guide_jump = false
          end
        elseif _guide_jump == false then
          _guide_jump = true
          Fn_tutorialCaption("jump")
        end
        wait()
      until false
    end)
  end
end
function pccubesensor2_guide_jump_OnLeave(A0_153)
  _guide_jump_task:abort()
  _guide_jump_task = nil
  Fn_tutorialCaptionKill()
  _guide_jump = false
end
function pccubesensor2_jump_success_OnEnter(A0_154)
  _jump_check_area = true
  invokeTask(function()
    local L0_155, L1_156
    repeat
      L0_155 = Player
      L1_156 = L0_155
      L0_155 = L0_155.getAction
      L0_155 = L0_155(L1_156)
      L1_156 = Player
      L1_156 = L1_156.kAction_Jump
      if L0_155 ~= L1_156 then
        L0_155 = Fn_sensorOff
        L1_156 = A0_154
        L0_155(L1_156)
        L0_155 = string
        L0_155 = L0_155.sub
        L1_156 = A0_154
        L1_156 = L1_156.getName
        L1_156 = L1_156(L1_156)
        L0_155 = L0_155(L1_156, 28)
        L1_156 = _kit_jump_tbl
        L1_156[L0_155] = true
        L1_156 = nil
        for _FORV_5_ = 1, table.maxn(_area_list) do
          if _area_list[_FORV_5_] == L0_155 then
            L1_156 = _area_list[_FORV_5_ - 1]
            break
          end
        end
        if findGameObject2("Node", "pccubesensor2_guide_jump_" .. L1_156) ~= nil then
          Fn_pcSensorOff("pccubesensor2_guide_jump_" .. L1_156)
          do break end
          L0_155 = wait
          L0_155()
          L0_155 = _jump_check_area
        end
      end
    until L0_155 == false
  end)
end
function pccubesensor2_jump_success_OnLeave()
  local L0_157, L1_158
  _jump_check_area = false
end
_kit_rcvy_tbl = {
  pi_a_10 = {
    false,
    false,
    false
  },
  pi_a_02_15 = {
    false,
    false,
    false
  },
  pi_a_06_07 = {
    false,
    false,
    false
  },
  pi_a_24_02 = {
    false,
    false,
    nil
  },
  pi_a_13 = {
    false,
    false,
    false
  },
  pi_a_02_13 = {
    false,
    false,
    nil
  },
  pi_a_16_06 = {
    false,
    false,
    false
  },
  pi_a_24_05 = {
    false,
    false,
    nil
  },
  pi_a_14_15 = {
    false,
    nil,
    nil
  },
  pi_a_12_16 = {
    false,
    nil,
    nil
  },
  pi_a_12_15 = {
    false,
    nil,
    nil
  },
  pi_a_23 = {
    false,
    false,
    false
  },
  pi_a_14_11 = {
    false,
    nil,
    nil
  }
}
_recovery_update = true
function updateRestartPoint()
  local L0_159, L1_160, L2_161, L3_162, L4_163, L5_164, L6_165, L7_166, L8_167, L9_168
  while true do
    L0_159 = _recovery_update
    if L0_159 then
      L0_159 = Player
      L0_159 = L0_159.getRecentAreaName
      L0_159 = L0_159(L1_160)
      if L0_159 then
        if L1_160 ~= L0_159 then
          for L4_163, L5_164 in L1_160(L2_161) do
            if L5_164 == L0_159 then
              if L6_165 then
                L9_168 = L0_159
                L6_165(L7_166)
                _kit_reach_area = L0_159
                for L9_168 = 1, 3 do
                  if _kit_rcvy_tbl[_kit_reach_area][L9_168] ~= nil then
                    Fn_pcSensorOn(string.format("pccubesensormulti2_rcvy_%s_%02d", _kit_reach_area, L9_168))
                  end
                end
                if L6_165 == false then
                  L6_165[1] = true
                  _recovery_node = L6_165
                end
                L6_165(L7_166)
                break
              end
            end
          end
        end
      end
      L1_160()
    end
  end
end
function recovery()
  if _recovery_task == nil then
    _recovery_task = invokeTask(function()
      Fn_userCtrlOff()
      Fn_blackout()
      Fn_resetPcPos(findGameObject2("Node", _recovery_node))
      Fn_fadein()
      Fn_userCtrlOn()
      _recovery_task = nil
    end)
  end
end
function pccubesensormulti2_recovery_OnEnter(A0_169)
  local L1_170, L2_171
  L1_170 = _recovery_sensor
  L1_170 = L1_170 + 1
  _recovery_sensor = L1_170
  L1_170 = print
  L2_171 = "IN _recovery_sensor : "
  L2_171 = L2_171 .. _recovery_sensor .. " | " .. A0_169:getName()
  L1_170(L2_171)
  L1_170 = string
  L1_170 = L1_170.sub
  L2_171 = A0_169.getName
  L2_171 = L2_171(A0_169)
  L1_170 = L1_170(L2_171, 25, -4)
  L2_171 = tonumber
  L2_171 = L2_171(string.sub(A0_169:getName(), -2))
  if L1_170 == "pi_a_14_11" then
    _kit_pi_a_14_11 = true
  end
  if _kit_reach_area == L1_170 and _kit_rcvy_tbl[L1_170][L2_171] == false then
    _kit_rcvy_tbl[L1_170][L2_171] = true
    print("loc_area : " .. L1_170 .. " | loc_point : " .. L2_171)
    _recovery_node = string.format("locator2_rcvy_%s_%02d", L1_170, L2_171)
    print("recovery : " .. _recovery_node)
  end
end
function pccubesensormulti2_recovery_OnLeave(A0_172)
  _recovery_sensor = _recovery_sensor - 1
  print("OUT _recovery_sensor : " .. _recovery_sensor)
  if string.sub(A0_172:getName(), 25, -4) == "pi_a_14_11" then
    _kit_pi_a_14_11 = false
  end
  if _recovery_sensor <= 0 then
    _recovery_sensor = 0
    recovery()
  end
end
function rcvy_update_end()
  local L0_173, L1_174, L2_175, L3_176, L4_177, L5_178, L6_179, L7_180, L8_181
  for L3_176, L4_177 in L0_173(L1_174) do
    if L4_177 ~= "pi_a_14_11" then
      for L8_181, _FORV_9_ in L5_178(L6_179) do
        if _FORV_9_ ~= nil then
          Fn_pcSensorOff(string.format("pccubesensormulti2_rcvy_%s_%02d", L4_177, L8_181))
        end
      end
    end
  end
  if L0_173 then
    _recovery_sensor = 1
  end
end
function loversSpat()
  local L7_182, L8_183
  L7_182 = false
  L8_183 = false
  while true do
    if _cid_area == "pi_a_10" then
      if L7_182 == false then
        lockCialogue()
        Sound:playSE("syd_163", 1)
        Fn_captionViewWait("ep00_02076", 2)
        Sound:playSE("syd045c", 1)
        Fn_captionViewWait("ep00_02077", 2.5)
        lockCialogue()
        Sound:playSE("kit_461", 1)
        Fn_captionViewWait("ep00_02078", 2)
        Sound:playSE("syd037c", 1)
        Fn_captionViewWait("ep00_02065", 2)
        _caption_lock = false
        L7_182 = true
      end
    elseif _cid_area == "pi_a_02_15" and _kit_jump_tbl.pi_a_02_15 then
      if L8_183 == false then
        lockCialogue()
        Sound:playSE("syd045b", 1)
        Fn_captionViewWait("ep00_02079", 2.5)
        Sound:playSE("kit034a", 1)
        Fn_captionViewWait("ep00_02080", 2)
        lockCialogue()
        Sound:playSE("syd026b", 1)
        Fn_captionViewWait("ep00_02081", 2)
        Sound:playSE("syd023a_1", 1)
        Fn_captionViewWait("ep00_02066", 2)
        lockCialogue()
        Sound:playSE("kit039b", 1)
        Fn_captionViewWait("ep00_02067", 1.8)
        Sound:playSE("syd025b", 1)
        Fn_captionViewWait("ep00_02068", 1.8)
        _caption_lock = false
        L8_183 = true
      end
    elseif _cid_area == "pi_a_24_02" and _kit_jump_tbl.pi_a_24_02 then
      if false == false then
        lockCialogue()
        Sound:playSE("syd_187", 1)
        Fn_captionViewWait("ep00_02082", 1.8)
        _caption_lock = false
      end
    elseif _cid_area == "pi_a_13" and _kit_jump_tbl.pi_a_13 then
      if false == false then
        lockCialogue()
        Sound:playSE("kit057a", 1)
        Fn_captionViewWait("ep00_02083", 2)
        Sound:playSE("syd037b", 1)
        Fn_captionViewWait("ep00_02084", 2)
        lockCialogue()
        Sound:playSE("syd026b", 1)
        Fn_captionViewWait("ep00_02069", 2)
        Sound:playSE("kit040a", 1)
        Fn_captionViewWait("ep00_02085", 2)
        _caption_lock = false
      end
    elseif _cid_area == "pi_a_02_13" and _kit_jump_tbl.pi_a_02_13 then
      if false == false then
        lockCialogue()
        Sound:playSE("syd032b", 1)
        Fn_captionViewWait("ep00_02086", 2.5)
        Sound:playSE("kit037c", 1)
        Fn_captionViewWait("ep00_02087", 2)
        _caption_lock = false
      end
    elseif _cid_area == "pi_a_24_05" and _kit_jump_tbl.pi_a_24_05 then
      if false == false then
        lockCialogue()
        Sound:playSE("syd044b", 1)
        Fn_captionViewWait("ep00_02088", 1.8)
        Sound:playSE("kit039a", 1)
        Fn_captionViewWait("ep00_02089", 1.8)
        _caption_lock = false
      end
    elseif _cid_area == "pi_a_14_15" and _kit_jump_tbl.pi_a_14_15 and false == false then
      repeat
        wait()
      until 2 <= _cid_npc:getMoveCurrentIndex()
      lockCialogue()
      Sound:playSE("kit056a", 1)
      Fn_captionViewWait("ep00_02057", 3)
      Sound:playSE("syd029a", 1)
      Fn_captionViewWait("ep00_02058", 2.5)
      lockCialogue()
      Sound:playSE("kit043a", 1)
      Fn_captionViewWait("ep00_02059", 3)
      Sound:playSE("kit056c", 1)
      Fn_captionViewWait("ep00_02060", 3)
      _caption_lock = false
    end
    wait()
  end
end
_bk_01_01_storm_inside_se = nil
_bk_01_02_storm_inside_se = nil
_bk_storm = {}
function createGravityStorm(A0_184, A1_185)
  local L2_186
  L2_186 = {}
  L2_186[1] = createGameObject2("Effect")
  L2_186[1]:setName(A0_184 .. "_01")
  L2_186[1]:setModelName("ef_ev_bk01_par01")
  findGameObject2("Node", A1_185):appendChild(L2_186[1])
  L2_186[2] = createGameObject2("Effect")
  L2_186[2]:setName(A0_184 .. "_04")
  L2_186[2]:setModelName("ef_ev_bk01_par04")
  findGameObject2("Node", "locator2_eff_bk_01_par_04"):appendChild(L2_186[2])
  return L2_186
end
function playGravityStorm(A0_187)
  A0_187[2]:play()
  A0_187[2]:setLoop(true)
  table.insert(_bk_storm, Sound:playSEHandle("amb_ep00_001", 1, "", A0_187[2]))
end
function stopGravityStorm(A0_188)
  local L1_189, L2_190, L3_191, L4_192
  for L4_192 = 1, 2 do
    if A0_188[L4_192] ~= nil then
      A0_188[L4_192]:stop()
    end
  end
end
_drift_param = {
  pi_a_24_02 = {
    xz = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    },
    y = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0.2,
      min_a = 0.1,
      max_t = 2,
      min_t = 1
    },
    angle = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    }
  },
  pi_a_02_13 = {
    xz = {
      rand = 0,
      sign = 0.5,
      max_a = 0.3,
      min_a = 0.1,
      max_t = 2,
      min_t = 1
    },
    y = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0.2,
      min_a = 0.1,
      max_t = 2,
      min_t = 1
    },
    angle = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    }
  },
  pi_a_24_05 = {
    xz = {
      rand = 0,
      sign = 0.5,
      max_a = 0.2,
      min_a = 0.2,
      max_t = 5,
      min_t = 3
    },
    y = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0.5,
      min_a = 0.3,
      max_t = 10,
      min_t = 3
    },
    angle = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    }
  },
  pi_a_14_15 = {
    xz = {
      rand = 0,
      sign = 0.5,
      max_a = 0.3,
      min_a = 0.2,
      max_t = 2,
      min_t = 1
    },
    y = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    },
    angle = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    }
  },
  pi_a_12_16 = {
    xz = {
      rand = 0,
      sign = 0.5,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    },
    y = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0.3,
      min_a = 0.1,
      max_t = 3,
      min_t = 1
    },
    angle = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    }
  },
  pi_a_12_15 = {
    xz = {
      rand = 0,
      sign = 0.5,
      max_a = 0.3,
      min_a = 0.2,
      max_t = 2,
      min_t = 1
    },
    y = {
      rand = 0.5,
      sign = 0.5,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    },
    angle = {
      rand = 0,
      sign = 0,
      max_a = 0,
      min_a = 0,
      max_t = 1,
      min_t = 1
    }
  }
}
_drift_param_stop = {
  xz = {
    rand = 0,
    sign = 0,
    max_a = 0.01,
    min_a = 0,
    max_t = 1,
    min_t = 1
  },
  y = {
    rand = 0,
    sign = 0,
    max_a = 0.01,
    min_a = 0,
    max_t = 1,
    min_t = 1
  },
  angle = {
    rand = 0,
    sign = 0,
    max_a = 0.01,
    min_a = 0,
    max_t = 1,
    min_t = 1
  }
}
function change_drift()
  local L0_193, L1_194, L2_195, L3_196, L4_197
  for L3_196, L4_197 in L0_193(L1_194) do
    if Fn_findAreaHandle(L4_197) ~= nil then
      Fn_findAreaHandle(L4_197):setDriftParams(_drift_param[L4_197])
    else
    end
  end
end
function area_drift(A0_198)
  if Fn_findAreaHandle(A0_198) ~= nil then
    Fn_findAreaHandle(A0_198):setDriftParams(_drift_param[A0_198])
  end
end
function createWall(A0_199, A1_200)
  local L2_201
  L2_201 = createGameObject2
  L2_201 = L2_201("GimmickBg")
  L2_201:setName(A1_200)
  L2_201:setCollisionName(A1_200)
  L2_201:setAttributeName("invisible_col")
  L2_201:setMoveThreshold(0)
  L2_201:overrideCollisionFilterLayer("Boundary")
  A0_199:appendChild(L2_201)
  return L2_201
end
