dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/gm_boss.lua")
dofile("/Game/Misc/area_controller.lua")
_ore_name = "bg2_gravityore_pi_a_10_01"
_ore_hdl = nil
_cid_npc = nil
_cid_pup = nil
_cid_name = "npcgen2_tkg05_01"
_cid_move_points = {
  {
    {
      pos = "locator2_cid_move_01_01"
    },
    {
      pos = "locator2_cid_move_01_02"
    },
    {
      pos = "locator2_cid_move_01_03"
    },
    {
      pos = "locator2_cid_move_01_04"
    },
    {
      pos = "locator2_cid_move_01_05"
    },
    {
      pos = "locator2_cid_move_01_06"
    },
    {
      pos = "locator2_cid_move_01_07"
    },
    {
      pos = "locator2_cid_move_01_08"
    },
    {
      pos = "locator2_cid_move_01_09"
    },
    {
      pos = "locator2_cid_move_01_11"
    },
    {
      pos = "locator2_cid_move_01_12"
    },
    {
      pos = "locator2_cid_move_01_13"
    },
    {
      pos = "locator2_cid_move_01_14"
    },
    {
      pos = "locator2_cid_move_01_15"
    },
    {
      pos = "locator2_cid_move_01_16"
    },
    {
      pos = "locator2_cid_move_01_17"
    },
    {
      pos = "locator2_cid_move_01_18"
    },
    {
      pos = "locator2_cid_move_01_19"
    },
    {
      pos = "locator2_cid_move_01_20"
    },
    {
      pos = "locator2_cid_move_01_21"
    },
    {
      pos = "locator2_cid_move_01_22"
    },
    {
      pos = "locator2_cid_move_01_23"
    },
    {
      pos = "locator2_cid_move_01_24"
    },
    {
      pos = "locator2_cid_move_01_25"
    },
    {
      pos = "locator2_cid_move_01_26"
    },
    {
      pos = "locator2_cid_move_01_27"
    },
    {
      pos = "locator2_cid_move_01_28"
    },
    {
      pos = "locator2_cid_move_01_29"
    },
    {
      pos = "locator2_cid_move_01_30"
    },
    {
      pos = "locator2_cid_move_01_31",
      opt = {
        anim_walk = "walk_step_up_00"
      }
    },
    {
      pos = "locator2_cid_move_01_32",
      opt = {
        anim_walk = "walk_step_up_00"
      }
    },
    {
      pos = "locator2_cid_move_01_33",
      opt = {
        anim_walk = "walk_step_up_end_00"
      }
    },
    {
      pos = "locator2_cid_move_01_34"
    }
  },
  {
    {
      pos = "locator2_cid_move_02_01"
    },
    {
      pos = "locator2_cid_move_02_02"
    },
    {
      pos = "locator2_cid_move_02_03"
    },
    {
      pos = "locator2_cid_move_02_04"
    },
    {
      pos = "locator2_cid_move_02_05"
    }
  },
  {
    {
      pos = "locator2_cid_move_03_01"
    },
    {
      pos = "locator2_cid_move_03_02"
    },
    {
      pos = "locator2_cid_move_03_03"
    },
    {
      pos = "locator2_cid_move_03_04"
    },
    {
      pos = "locator2_cid_move_03_05"
    },
    {
      pos = "locator2_cid_move_03_06"
    },
    {
      pos = "locator2_cid_move_03_07"
    },
    {
      pos = "locator2_cid_move_03_08"
    },
    {
      pos = "locator2_cid_move_03_09"
    },
    {
      pos = "locator2_cid_move_03_10"
    },
    {
      pos = "locator2_cid_move_03_11"
    },
    {
      pos = "locator2_cid_move_03_12"
    },
    {
      pos = "locator2_cid_move_03_13"
    },
    {
      pos = "locator2_cid_move_03_14"
    },
    {
      pos = "locator2_cid_move_03_15"
    },
    {
      pos = "locator2_cid_move_03_16"
    },
    {
      pos = "locator2_cid_move_03_17"
    },
    {
      pos = "locator2_cid_move_03_18"
    },
    {
      pos = "locator2_cid_move_03_19"
    },
    {
      pos = "locator2_cid_move_03_20"
    },
    {
      pos = "locator2_cid_move_03_21"
    },
    {
      pos = "locator2_cid_move_03_22"
    },
    {
      pos = "locator2_cid_move_03_23"
    },
    {
      pos = "locator2_cid_move_03_24"
    },
    {
      pos = "locator2_cid_move_03_25"
    },
    {
      pos = "locator2_cid_move_03_26"
    },
    {
      pos = "locator2_cid_move_03_27"
    },
    {
      pos = "locator2_cid_move_03_28"
    },
    {
      pos = "locator2_cid_move_03_29"
    },
    {
      pos = "locator2_cid_move_03_30"
    },
    {
      pos = "locator2_cid_move_03_31"
    },
    {
      pos = "locator2_cid_move_03_32"
    },
    {
      pos = "locator2_cid_move_03_33"
    },
    {
      pos = "locator2_cid_move_03_34"
    },
    {
      pos = "locator2_cid_move_03_35"
    },
    {
      pos = "locator2_cid_move_03_36"
    },
    {
      pos = "locator2_cid_move_03_37"
    }
  }
}
_area_list_counter = 1
_tkg05_11_escape_tbl = {
  {
    pos = "locator2_tkg05_escape_01"
  },
  {
    pos = "locator2_tkg05_escape_02"
  },
  {
    pos = "locator2_tkg05_escape_03"
  },
  {
    pos = "locator2_tkg05_escape_04"
  },
  {
    pos = "locator2_tkg05_escape_05"
  },
  {
    pos = "locator2_tkg05_escape_06"
  }
}
_tkg05_12_escape_tbl = {
  {
    pos = "locator2_tkg05_escape_22"
  },
  {
    pos = "locator2_tkg05_escape_23"
  },
  {
    pos = "locator2_tkg05_escape_24"
  },
  {
    pos = "locator2_tkg05_escape_25"
  },
  {
    pos = "locator2_tkg05_escape_10"
  },
  {
    pos = "locator2_tkg05_escape_01"
  },
  {
    pos = "locator2_tkg05_escape_02"
  },
  {
    pos = "locator2_tkg05_escape_03"
  },
  {
    pos = "locator2_tkg05_escape_04"
  },
  {
    pos = "locator2_tkg05_escape_05"
  },
  {
    pos = "locator2_tkg05_escape_06"
  }
}
_tkg05_13_escape_tbl = {
  {
    pos = "locator2_tkg05_escape_31"
  },
  {
    pos = "locator2_tkg05_escape_32"
  },
  {
    pos = "locator2_tkg05_escape_33"
  },
  {
    pos = "locator2_tkg05_escape_34"
  },
  {
    pos = "locator2_tkg05_escape_01"
  },
  {
    pos = "locator2_tkg05_escape_02"
  },
  {
    pos = "locator2_tkg05_escape_03"
  },
  {
    pos = "locator2_tkg05_escape_04"
  },
  {
    pos = "locator2_tkg05_escape_05"
  },
  {
    pos = "locator2_tkg05_escape_06"
  }
}
_tkg05_14_escape_tbl = {
  {
    pos = "locator2_tkg05_escape_04_2"
  },
  {
    pos = "locator2_tkg05_escape_04_3"
  },
  {
    pos = "locator2_tkg05_escape_04_4"
  },
  {
    pos = "locator2_tkg05_escape_05"
  },
  {
    pos = "locator2_tkg05_escape_06"
  }
}
_tkg05_15_escape_tbl = {
  {
    pos = "locator2_tkg05_escape_01"
  },
  {
    pos = "locator2_tkg05_escape_02"
  },
  {
    pos = "locator2_tkg05_escape_03"
  },
  {
    pos = "locator2_tkg05_escape_04"
  },
  {
    pos = "locator2_tkg05_escape_05"
  },
  {
    pos = "locator2_tkg05_escape_06"
  }
}
_pause = false
_wait_navi = false
_caption_lock = false
_pc_dist = 15
MOVE_DIST = 15
EVENT_DIST = 10
JUMP_DIST = 10
_request_tkg = false
_request_tkg_escape_01 = false
_request_tkg_escape_02 = false
_request_tkg_escape_03 = false
_tkg_escape_01 = false
_tkg_escape_02 = false
_tkg_escape_03 = false
_cid_jump_request = false
_cid_jump_id = nil
_cid_jump_end = false
_cir_jump_wait = false
_cid_trun_request = false
_cid_dig_request = false
_cid_stop_request = false
_cid_stop = false
_cid_navi_caption = 1
_pause_cap_task = nil
_area_out_request = false
_area_out_caption = false
_area_out = false
_npc_se = {
  npcgen2_tkg05_01 = {hdl = nil},
  npcgen2_tkg05_02 = {hdl = nil},
  npcgen2_tkg05_03 = {hdl = nil},
  npcgen2_tkg05_04 = {hdl = nil},
  npcgen2_tkg05_05 = {hdl = nil}
}
_ore_dist_check = false
function Initialize()
  local L0_0, L1_1, L2_2, L3_3
  L0_0.hurryup = "tkg05_hurryup_00"
  L0_0.call = "tkg05_call_00"
  _tkg05_mot_list = L0_0
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1)
  _cid_npc = L0_0
  _cid_pup = L0_0
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  _ore_pi_a_22 = 11
  _ore_bk_pi_a_22 = 14
  _ore_pi_a_10 = 10
  for L3_3 = 1, _ore_pi_a_22 do
    findGameObject2("GimmickBg", string.format("bg2_gravityore_pi_a_22_%02d", L3_3)):setActive(false)
  end
  for L3_3 = 1, _ore_bk_pi_a_22 do
    findGameObject2("GimmickBg", string.format("bg2_gravityore_bk_pi_a_22_%02d", L3_3)):setActive(false)
  end
  for L3_3 = 1, _ore_pi_a_10 do
    findGameObject2("GimmickBg", string.format("bg2_gravityore_pi_a_10_%02d", L3_3)):setActive(false)
  end
  debug_flag = false
end
function Ingame()
  if debug_flag then
    invokeTask(function()
      repeat
        debugDispPrint("wait_navi\t\t\t\t: " .. tostring(_wait_navi))
        debugDispPrint("pause\t\t\t\t\t: " .. tostring(_pause))
        debugDispPrint("_cid_action_request\t: " .. tostring(_cid_action_request))
        debugDispPrint("_move_end\t\t\t\t: " .. tostring(_move_end))
        debugDispPrint("_cid_jump_end\t\t\t: " .. tostring(_cid_jump_end))
        debugDispPrint("DistanceToPlayer\t\t: " .. tostring(Fn_getDistanceToPlayer(_cid_pup)))
        wait()
      until false
    end)
  end
  invokeTask(function()
    repeat
      wait()
    until _request_tkg
    tkg05_set()
  end)
  invokeTask(function()
    while true do
      if _cid_action_request then
        print("***** cid_action_request [ " .. tostring(_table_id) .. " ] *****")
        if _table_id ~= nil then
          cidActionTask(_table_id)
        else
          print("***** cid_action_request : not request *****")
        end
        _cid_action_request = false
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if _cid_navi_request then
        _cid_navi = cidNaviTask()
        _cid_navi_request = false
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if _cid_jump_request then
        cidJump(_cid_jump_id)
        _cid_jump_request = false
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if _cid_trun_request then
        cidTrun()
        _cid_trun_request = false
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if _cid_stop_request then
        cidMoveStop(_cid_stop)
        _cid_stop_request = false
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if _cid_dig_request then
        _cid_dig_request = false
        cidDigIn()
      end
      wait()
    end
  end)
  invokeTask(function()
    while not _tkg_escape_01 do
      if _request_tkg_escape_01 then
        tkg_escape_01_start()
        _tkg_escape_01 = true
      end
      wait()
    end
  end)
  invokeTask(function()
    while not _tkg_escape_03 do
      if _request_tkg_escape_03 then
        tkg_escape_03_start()
        _tkg_escape_03 = true
      end
      wait()
    end
  end)
  invokeTask(function()
    while true do
      if _area_out_request then
        kitAreaOut()
        _area_out_request = false
      end
      wait()
    end
  end)
  while true do
    wait()
  end
end
function requestHandle(A0_4, A1_5)
  if findGameObject2(A0_4, A1_5) == nil then
    return nil
  else
    return (findGameObject2(A0_4, A1_5))
  end
end
function requestTkgSet()
  local L0_6, L1_7
  _request_tkg = true
end
function tkg05_set()
  local L0_8, L1_9, L2_10, L3_11
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  L0_8(L1_9, L2_10)
  for L3_11 = 1, _ore_pi_a_22 do
    findGameObject2("GimmickBg", string.format("bg2_gravityore_pi_a_22_%02d", L3_11)):setActive(true)
  end
  for L3_11 = 1, _ore_bk_pi_a_22 do
    findGameObject2("GimmickBg", string.format("bg2_gravityore_bk_pi_a_22_%02d", L3_11)):setActive(true)
  end
  for L3_11 = 1, _ore_pi_a_10 do
    findGameObject2("GimmickBg", string.format("bg2_gravityore_pi_a_10_%02d", L3_11)):setActive(true)
  end
end
_cid_action_request = false
_table_id = nil
_move_end = false
function requestCidAction(A0_12)
  print("***** request Cid Action *****")
  if not _cid_action_request then
    _table_id = A0_12
    _move_end = false
    _cid_action_request = true
    return true
  end
  return false
end
function isCidActionEnd()
  local L0_13, L1_14
  L0_13 = _move_end
  return L0_13
end
function cidActionTask(A0_15)
  local L1_16
  L1_16 = print
  L1_16("***** cidActionTask [ " .. A0_15 .. " ]")
  L1_16 = {}
  L1_16.runLength = 900000
  L1_16.arrivedLength = 0
  L1_16.recast = true
  L1_16.anim_speed_over = true
  L1_16.anim_walk_speed = 1.05
  repeat
    wait()
  until not Fn_moveNpc(_cid_name, _cid_move_points[A0_15], L1_16):isRunning()
  print("***** cidActionTask [ " .. A0_15 .. " ] END *****")
  A0_15 = nil
  _move_end = true
end
function cidMoveCurrent()
  return _cid_npc:getMoveCurrentIndex()
end
_cid_navi_request = false
_cid_navi = nil
function requestCidNavi()
  local L1_17
  L1_17 = _cid_navi_request
  if not L1_17 then
    _cid_navi_request = true
    L1_17 = true
    return L1_17
  end
  L1_17 = false
  return L1_17
end
function cidNaviEnd()
  if _cid_navi ~= nil then
    _cid_navi:abort()
  end
end
function cidNaviTask()
  return invokeTask(function()
    local L0_18, L1_19
    L0_18 = waitSeconds
    L1_19 = 3
    L0_18(L1_19)
    L0_18 = Fn_findNpc
    L1_19 = _cid_name
    L0_18 = L0_18(L1_19)
    L1_19 = Fn_findNpcPuppet
    L1_19 = L1_19(_cid_name)
    while true do
      setDebugDispMissionText("[navi]")
      setDebugDispMissionText("dist to cid : " .. tostring(Fn_getDistanceToPlayer(L1_19)))
      if not _wait_navi then
        if not _pause then
          if Fn_getDistanceToPlayer(L1_19) > _pc_dist then
            if not _ore_dist_check then
              cidWaitStart()
            elseif _ore_dist_check and not oreDistCheck() then
              cidWaitStart()
            elseif _area_out then
              cidWaitStart()
            else
              wait()
            end
          end
        elseif Fn_getDistanceToPlayer(L1_19) < 7 and not _area_out then
          cidWaitEnd()
        elseif Fn_getDistanceToPlayer(L1_19) < 7 and _area_out then
          repeat
            wait()
          until _area_out_caption
          cidWaitEnd()
        elseif not _ore_dist_check then
          if _pause_cap_task == nil then
            _pause_cap_task = EventHelper:timerCallback("pause caption", 10, cidWaitMes)
          end
        elseif _ore_dist_check and oreDistCheck() then
          cidWaitEnd()
        end
      elseif _pause then
        cidWaitEnd()
      end
      wait()
    end
  end)
end
function cidWaitMes()
  print("***** cidWaitMes *****")
  _caption_lock = true
  Fn_turnNpc(_cid_name)
  if not _area_out_caption then
    if _cid_navi_caption == 1 then
      Sound:playSE("ep00_syd016c_radio", 1)
      Fn_captionView("ep00_09001")
      _caption_lock = false
      _cid_navi_caption = 2
    elseif c_cid_navi_captionnt == 2 then
      Sound:playSE("ep00_syd_161", 1)
      Fn_captionView("ep00_09002")
      _caption_lock = false
      _cid_navi_caption = 3
    else
      Sound:playSE("ep00_syd_160", 1)
      Fn_captionView("ep00_09003")
      _caption_lock = false
      _cid_navi_caption = 1
    end
  else
    _area_out_caption = false
    Fn_captionViewWait("ep00_01090")
    _caption_lock = false
  end
  if _pause_cap_task ~= nil then
    _pause_cap_task:abort()
  end
  _pause_cap_task = nil
end
function lnductionSensor(A0_20)
  if A0_20 then
    Fn_pcSensorOn("pccubesensor2_tkg05_caption")
  else
    Fn_pcSensorOff("pccubesensor2_tkg05_caption")
  end
end
function pccubesensor2_tkg05_caption_OnEnter(A0_21)
  invokeTask(function()
    repeat
      wait()
    until not _caption_lock
    tkgInductionMes()
  end)
end
function pccubesensor2_tkg05_caption_OnLeaver(A0_22)
  local L1_23
end
function tkgInductionMes()
  _caption_lock = true
  if RandI(2) == 1 then
    Sound:playSE("ep00_m06_001", 1)
    Fn_captionViewWait("ep00_01087")
  else
    Sound:playSE("ep00_m05_801_radio", 1)
    Fn_captionViewWait("ep00_01088")
  end
  _caption_lock = false
end
function cidNaviWait(A0_24)
  local L1_25
  _wait_navi = A0_24
end
function isPause()
  local L0_26, L1_27
  L0_26 = _pause
  return L0_26
end
function isLockCap()
  local L0_28, L1_29
  L0_28 = _caption_lock
  return L0_28
end
function setLockCap(A0_30)
  local L1_31
  _caption_lock = A0_30
end
function setWaitDist(A0_32)
  local L1_33
  _pc_dist = A0_32
end
function requestAreaOut()
  local L1_34
  L1_34 = _area_out_request
  if not L1_34 then
    _area_out_request = true
    L1_34 = true
    return L1_34
  end
  L1_34 = false
  return L1_34
end
function kitAreaOut()
  print("***** kitAreaOut : pause [ " .. tostring(_pause) .. " ]   move_end [ " .. tostring(_move_end) .. " ] *****")
  _area_out = true
  _area_out_caption = true
  repeat
    wait()
  until _area_out_caption == false
  _area_out = false
end
function oreDistCheckStart()
  local L0_35, L1_36
  _ore_dist_check = true
end
function cidWaitStart()
  _pause = true
  if not _move_end then
    _cid_npc:pauseMove(true)
  end
  Fn_turnNpc(_cid_name)
  repeat
    wait()
  until not _caption_lock
  cidWaitMes()
  HUD:naviSetPochiDistanceDensity0(0)
  HUD:naviSetPochiDistanceDensity100(-1)
  Fn_naviSet(_cid_pup)
end
function cidWaitEnd()
  Fn_naviKill()
  if _pause_cap_task ~= nil then
    _pause_cap_task:abort()
  end
  _pause_cap_task = nil
  if not _move_end then
    _cid_npc:pauseMove(false)
  end
  _pause = false
end
function oreDistCheck()
  local L0_37
  L0_37 = findGameObject2
  L0_37 = L0_37("Node", _ore_name)
  L0_37 = L0_37.getWorldPos
  L0_37 = L0_37(L0_37)
  if Fn_getDistanceToPlayer(_ore_name) <= Fn_findNpcPuppet(_cid_name):getWorldPos():DistanceTo(L0_37) + 5 then
    return true
  else
    return false
  end
end
function requestCidJump(A0_38)
  if not _cid_jump_request then
    _cid_jump_id = A0_38
    _cid_jump_request = true
    return true
  end
  return false
end
function isCidJumpEnd()
  local L0_39, L1_40
  L0_39 = _cid_jump_end
  return L0_39
end
function cidJump(A0_41)
  local L1_42, L2_43, L3_44
  L1_42 = print
  L2_43 = "cid jump : "
  L3_44 = A0_41
  L2_43 = L2_43 .. L3_44
  L1_42(L2_43)
  _cid_jump_end = false
  repeat
    L1_42 = wait
    L1_42()
    L1_42 = _pause
  until L1_42 == false
  _wait_navi = true
  L1_42 = Fn_findNpc
  L2_43 = _cid_name
  L1_42 = L1_42(L2_43)
  L2_43 = {}
  L2_43.anim_in = "jump_00"
  L2_43.anim_lp = "jump_fall_00"
  L2_43.anim_out = "jump_land_00"
  L2_43.anim_stay = "stay"
  L2_43.height = 0.2
  L3_44 = findGameObject2
  L3_44 = L3_44("Node", string.format("locator2_warp_point_%02d", A0_41))
  Fn_turnNpc(_cid_name, L3_44, {force = true})
  L1_42:jump(string.format("locator2_warp_point_%02d", A0_41), L2_43)
  repeat
    wait()
  until L1_42:isJumpEnd()
  _cid_jump_end = true
  _wait_navi = false
end
function requestCidTrun()
  local L1_45
  L1_45 = _cid_trun_request
  if not L1_45 then
    _cid_trun_request = true
    L1_45 = true
    return L1_45
  end
  L1_45 = false
  return L1_45
end
function cidTrun()
  if not _move_end then
    Fn_findNpc(_cid_name):pauseMove(true)
  end
  Fn_turnNpc(_cid_name)
end
function requestMoveStop(A0_46)
  if not _cid_stop_request then
    _cid_stop = A0_46
    _cid_stop_request = true
    return true
  end
  return false
end
function cidMoveStop(A0_47)
  if A0_47 then
    _wait_navi = A0_47
    if not _move_end then
      Fn_findNpc(_cid_name):pauseMove(A0_47)
    end
    Fn_playMotionNpc(_cid_name, "stay", false)
  else
    repeat
      wait()
    until not _pause
    Fn_findNpc(_cid_name):pauseMove(A0_47)
    _wait_navi = A0_47
  end
end
function cidPause(A0_48)
  Z_wait_navi = A0_48
  Fn_findNpc(_cid_name):pauseMove(A0_48)
end
function cidDigIn()
  Fn_turnNpc(_cid_name, "bg2_gravityore_pi_a_10_01")
  waitSeconds(0.5)
  _npc_se[_cid_name].hdl = Sound:playSEHandle("npc_drill_idling", 1, "", _cid_pup)
  Fn_playMotionNpc("npcgen2_tkg05_01", "dig_in_00", false)
  invokeTask(function()
    waitSeconds(1.5)
    Sound:stopSEHandle(_npc_se[_cid_name].hdl)
    _npc_se[_cid_name].hdl = Sound:playSEHandle("npc_drill_digging", 1, "", _cid_pup)
  end)
  while not _cid_npc:isMotionEnd() do
    wait()
  end
  Fn_playMotionNpc("npcgen2_tkg05_01", "dig_00", true)
end
function requestCidDig()
  local L1_49
  L1_49 = _cid_dig_request
  if not L1_49 then
    _cid_dig_request = true
    L1_49 = true
    return L1_49
  end
  L1_49 = false
  return L1_49
end
function tkgDigTask(A0_50, A1_51)
  return invokeTask(function()
    local L0_52, L1_53, L2_54
    L0_52 = Fn_findNpc
    L1_53 = A0_50
    L0_52 = L0_52(L1_53)
    L1_53 = waitSeconds
    L2_54 = A1_51
    L1_53(L2_54)
    L1_53 = _npc_se
    L2_54 = A0_50
    L1_53 = L1_53[L2_54]
    L2_54 = Sound
    L2_54 = L2_54.playSEHandle
    L2_54 = L2_54(L2_54, "npc_drill_idling", 0.25, "", L0_52)
    L1_53.hdl = L2_54
    L2_54 = L0_52
    L1_53 = L0_52.playMotion
    L1_53(L2_54, "dig_in_00")
    while true do
      L2_54 = L0_52
      L1_53 = L0_52.isMotionEnd
      L1_53 = L1_53(L2_54)
      if not L1_53 then
        L1_53 = wait
        L1_53()
      end
    end
    L1_53 = _npc_se
    L2_54 = A0_50
    L1_53 = L1_53[L2_54]
    L1_53 = L1_53.hdl
    if L1_53 ~= nil then
      L1_53 = Sound
      L2_54 = L1_53
      L1_53 = L1_53.stopSEHandle
      L1_53(L2_54, _npc_se[A0_50].hdl)
    end
    L2_54 = L0_52
    L1_53 = L0_52.playMotion
    L1_53(L2_54, "dig_00")
    L1_53 = _npc_se
    L2_54 = A0_50
    L1_53 = L1_53[L2_54]
    L2_54 = Sound
    L2_54 = L2_54.playSEHandle
    L2_54 = L2_54(L2_54, "npc_drill_digging", 0.25, "", L0_52)
    L1_53.hdl = L2_54
    L1_53 = Fn_createEffect
    L2_54 = "npc_digging"
    L1_53 = L1_53(L2_54, "ef_ev_jkpar_01", {
      obj = Fn_findNpcPuppet(A0_50),
      joint = "bn_r_drill3"
    }, true)
    while true do
      L2_54 = RandI
      L2_54 = L2_54(20, 30)
      waitSeconds(L2_54)
      if _npc_se[A0_50].hdl ~= nil then
        Sound:stopSEHandle(_npc_se[A0_50].hdl)
      end
      L0_52:playMotion("dig_idle_00", {animBlendDuration = 1})
      if L1_53 ~= nil then
        Fn_finishedTremEffect(L1_53)
      end
      _npc_se[A0_50].hdl = Sound:playSEHandle("npc_drill_idling", 0.25, "", L0_52)
      L2_54 = RandI(5, 10)
      waitSeconds(L2_54)
      if _npc_se[A0_50].hdl ~= nil then
        Sound:stopSEHandle(_npc_se[A0_50].hdl)
      end
      L0_52:playMotion("dig_00", {animBlendDuration = 1})
      L1_53 = Fn_createEffect("npc_digging", "ef_ev_jkpar_01", {
        obj = Fn_findNpcPuppet(A0_50),
        joint = "bn_r_drill3"
      }, true)
      _npc_se[A0_50].hdl = Sound:playSEHandle("npc_drill_digging", 0.25, "", L0_52)
    end
  end)
end
function tkgPerambulation(A0_55, A1_56)
  wait()
  return (invokeTask(function()
    local L0_57, L1_58, L2_59, L3_60, L4_61, L5_62, L6_63
    L0_57 = Fn_findNpc
    L1_58 = A0_55
    L0_57 = L0_57(L1_58)
    function L1_58(A0_64)
      return findGameObject2("Node", A0_64):getWorldPos()
    end
    L2_59 = table
    L2_59 = L2_59.map
    L3_60 = A1_56
    L4_61 = L1_58
    L2_59 = L2_59(L3_60, L4_61)
    function L3_60()
      local L1_65
      L1_65 = L2_59
      L1_65 = #L1_65
      L1_65 = L2_59[L1_65]
      return L1_65
    end
    L4_61 = 1
    L5_62 = 30
    L6_63 = 0
    while true do
      L0_57:move(L3_60(), L4_61, L5_62, L6_63, mot_opt)
      repeat
        wait()
      until L0_57:isMoveEnd()
      table.remove(L2_59)
      if #L2_59 == 0 then
        L2_59 = table.map(A1_56, L1_58)
        wait()
      end
    end
  end))
end
function tkg_escape_set()
  Fn_playNpcEventMotion("npcgen2_tkg05_12", _tkg05_mot_list.hurryup, -1, 0, false)
  Fn_playMotionNpc("npcgen2_tkg05_13", "talk_00", false)
  Fn_playNpcEventMotion("npcgen2_tkg05_14", _tkg05_mot_list.hurryup, -1, 0, false)
  Fn_playNpcEventMotion("npcgen2_tkg05_15", _tkg05_mot_list.hurryup, -1, 0, false)
end
function tkg_escape_01_start()
  invokeTask(function()
    Fn_moveNpc("npcgen2_tkg05_15", _tkg05_15_escape_tbl, {
      anim_run_speed = 1,
      runLength = -1,
      avoidance = true
    })
    invokeTask(npc_jump, "npcgen2_tkg05_15")
    _tkg_escape_01 = true
    Fn_sensorOn("cubesensor2_npc_jump")
  end)
end
function tkg_escape_02_start()
  local L0_66, L1_67
end
function tkg_escape_03_start()
  invokeTask(function()
    Fn_playNpcEventMotion("npcgen2_tkg05_11", _tkg05_mot_list.call, false, 1, false)
    Fn_moveNpc("npcgen2_tkg05_13", _tkg05_13_escape_tbl, {
      anim_run_speed = 1,
      runLength = -1,
      avoidance = true
    })
    invokeTask(npc_jump, "npcgen2_tkg05_13")
    waitSeconds(1)
    Fn_moveNpc("npcgen2_tkg05_11", _tkg05_11_escape_tbl, {
      anim_run_speed = 1,
      runLength = -1,
      avoidance = true
    })
    invokeTask(npc_jump, "npcgen2_tkg05_11")
    Fn_moveNpc("npcgen2_tkg05_12", _tkg05_12_escape_tbl, {
      anim_run_speed = 1,
      runLength = -1,
      avoidance = true
    })
    invokeTask(npc_jump, "npcgen2_tkg05_12")
    _tkg_escape_03 = true
  end)
end
function requestTkgEscape01()
  local L0_68, L1_69
  L0_68 = _tkg_escape_01
  if not L0_68 then
    L0_68 = _request_tkg_escape_01
    if not L0_68 then
      _request_tkg_escape_01 = true
    end
  end
end
function requestTkgEscape02()
  if not _tkg_escape_02 then
    tkg_escape_02 = true
    invokeTask(function()
      Fn_playNpcEventMotion("npcgen2_tkg05_11", _tkg05_mot_list.call, false, 1, false)
      Fn_moveNpc("npcgen2_tkg05_14", _tkg05_14_escape_tbl, {
        anim_run_speed = 1,
        runLength = -1,
        avoidance = true
      })
      invokeTask(npc_jump, "npcgen2_tkg05_14")
      _tkg_escape_02 = true
      Fn_sensorOn("cubesensor2_npc_jump")
    end)
  end
end
function requestTkgEscape03()
  local L0_70, L1_71
  L0_70 = _tkg_escape_03
  if not L0_70 then
    L0_70 = _request_tkg_escape_03
    if not L0_70 then
      _request_tkg_escape_03 = true
    end
  end
end
function npc_jump(A0_72)
  local L1_73, L2_74
  L1_73 = Fn_findNpc
  L2_74 = A0_72
  L1_73 = L1_73(L2_74)
  repeat
    L2_74 = wait
    L2_74()
    L2_74 = L1_73.isMoveEnd
    L2_74 = L2_74(L1_73)
  until L2_74
  L2_74 = {}
  L2_74.anim_in = "jump_00"
  L2_74.anim_lp = "jump_fall_00"
  L2_74.anim_out = "jump_land_00"
  L2_74.anim_stay = "stay"
  L2_74.height = 0.5
  L1_73:jump("locator2_tkg05_jump", L2_74)
  repeat
    wait()
  until L1_73:isJumpEnd()
  _tkg05_escape_tbl = {
    {
      pos = "locator2_tkg05_escape_001"
    },
    {
      pos = "locator2_tkg05_escape_002"
    }
  }
  Fn_moveNpc(A0_72, _tkg05_escape_tbl, {
    anim_run_speed = 1,
    runLength = -1,
    avoidance = true
  })
  repeat
    wait()
  until L1_73:isMoveEnd()
  L1_73:setActive(false)
end
function istkgEscape_01()
  local L0_75, L1_76
  L0_75 = _tkg_escape_01
  return L0_75
end
function istkgEscape_02()
  local L0_77, L1_78
  L0_77 = _tkg_escape_02
  return L0_77
end
function istkgEscape_03()
  local L0_79, L1_80
  L0_79 = _tkg_escape_03
  return L0_79
end
function Finalize()
  for _FORV_3_, _FORV_4_ in pairs(_npc_se) do
    Sound:stopSEHandle(_FORV_4_.hdl)
  end
  HUD:naviSetPochiDistanceDensity0(40)
  HUD:naviSetPochiDistanceDensity100(60)
end
