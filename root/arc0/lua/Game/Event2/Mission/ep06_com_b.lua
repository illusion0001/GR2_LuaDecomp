dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/ep06_common.lua")
_COMMAND_NOTHING = 0
_COMMAND_NAVI_SET = 1
_COMMAND_NAVI_KILL = 2
_command = 0
_navi_locator = ""
_prev_phase_continue = false
_activeButler = false
_btl_task = nil
_foundBtlTask = nil
_foundBtl = false
_talkBtl = false
_turnBtl = 0
_turnEndBtl = false
_puppet_tbl = {}
_moveTask = nil
_returnMove = false
_end_com_flag = false
_restart_move = false
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "rich_03_btl",
      type = "man49",
      node = "locator2_rich_03_btl",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4
  L0_1 = false
  L1_2 = 1
  L2_3 = ""
  L3_4 = false
  while true do
    _puppet_tbl.rich_03_btl = Fn_findNpcPuppet("rich_03_btl")
    if _command == _COMMAND_NAVI_SET then
      Fn_naviSet(findGameObject2("Node", _navi_locator))
      _command = _COMMAND_NOTHING
    elseif _command == _COMMAND_NAVI_KILL then
      Fn_naviKill()
      _command = _COMMAND_NOTHING
    end
    if not _end_com_flag then
      if _turnBtl == 1 then
        _moveTask = Mv_safeTaskAbort(_moveTask)
        Fn_turnNpc("rich_03_btl")
        _turnBtl = 2
        L3_4 = true
      elseif _turnBtl == 2 and Fn_findNpc("rich_03_btl"):isTurnEnd() then
        _turnBtl = 0
        _turnEndBtl = true
      end
      if _returnMove then
        Fn_playMotionNpc("rich_03_btl", "reply_yes", true)
        Fn_playMotionNpc("rich_03_btl", "stay", false)
        L2_3 = "locator2_rich_03_btl_move_" .. string.format("%02d", L1_2)
        _moveTask = Fn_moveNpc("rich_03_btl", L2_3)
        _returnMove = false
        L3_4 = false
      end
      if _activeButler then
        waitSeconds(0.5)
        if _btl_task == nil then
          _btl_task = invokeTask(function()
            L2_3 = "locator2_rich_03_btl_move_" .. string.format("%02d", L1_2)
            _moveTask = Fn_moveNpc("rich_03_btl", L2_3)
            while true do
              if L3_4 == false and Fn_findNpc("rich_03_btl") ~= nil then
                if _restart_move then
                  _moveTask = Mv_safeTaskAbort(_moveTask)
                  _moveTask = Fn_moveNpc("rich_03_btl", L2_3)
                  _restart_move = false
                elseif _moveTask ~= nil and _moveTask:isRunning() == false then
                  if L1_2 == 1 or L1_2 == 2 or L1_2 == 5 or L1_2 == 7 or L1_2 == 8 or L1_2 == 10 then
                    Fn_playMotionNpc("rich_03_btl", "lookaround", false)
                    waitSeconds(9)
                  end
                  L1_2 = L1_2 + 1
                  L1_2 = L1_2 % 13
                  if L1_2 == 0 then
                    L1_2 = 1
                  end
                  _moveTask = Mv_safeTaskAbort(_moveTask)
                  L2_3 = "locator2_rich_03_btl_move_" .. string.format("%02d", L1_2)
                  _moveTask = Fn_moveNpc("rich_03_btl", L2_3)
                end
              else
              end
              wait()
            end
          end)
        end
        if _foundBtl == false then
          if _foundBtlTask == nil then
            _foundBtlTask = invokeTask(function()
              local L0_5, L1_6, L2_7
              while true do
                L0_5 = L0_1
                if L0_5 == false then
                  L0_5 = Fn_getDistanceToPlayer
                  L1_6 = _puppet_tbl
                  L1_6 = L1_6.rich_03_btl
                  L0_5 = L0_5(L1_6)
                  L1_6 = Fn_findNpc
                  L2_7 = "rich_03_btl"
                  L1_6 = L1_6(L2_7)
                  if L0_5 < 25 then
                    L2_7 = Fn_isInSightTarget
                    L2_7 = L2_7(_puppet_tbl.rich_03_btl, 0.8)
                    if L2_7 then
                      L2_7 = true
                      L0_1 = L2_7
                      L2_7 = Player
                      L2_7 = L2_7.setStay
                      L2_7(L2_7, true)
                      L2_7 = Player
                      L2_7 = L2_7.setControl
                      L2_7(L2_7, Player.kControl_All, false)
                      L2_7 = Camera
                      L2_7 = L2_7.setControl
                      L2_7(L2_7, Camera.kPlayer, Camera.kControl_All, false)
                      L2_7 = Fn_captionView
                      L2_7("ep06_00148")
                      L2_7 = Mv_viewObjWait
                      L2_7 = L2_7(_puppet_tbl.rich_03_btl, 0.5, 0)
                      Fn_captionView("ep06_00149")
                      Fn_naviKill()
                      Fn_naviSet(_puppet_tbl.rich_03_btl)
                      Player:setControl(Player.kControl_All, true)
                      Camera:setControl(Camera.kPlayer, Camera.kControl_All, true)
                      Player:setStay(false)
                      L2_7 = Mv_safeTaskAbort(L2_7)
                      _foundBtl = true
                      break
                    end
                  end
                end
                L0_5 = wait
                L0_5()
              end
            end)
          end
        elseif Fn_getDistanceToPlayer(_puppet_tbl.rich_03_btl:getWorldPos()) <= 4 then
          _talkBtl = true
        end
      else
        _btl_task = Mv_safeTaskAbort(_btl_task)
        _foundBtlTask = Mv_safeTaskAbort(_foundBtlTask)
      end
      wait()
    end
  end
end
function Finalize()
  local L0_8, L1_9
end
function com_naviSet(A0_10)
  local L1_11
  _navi_locator = A0_10
  L1_11 = _COMMAND_NAVI_SET
  _command = L1_11
end
function com_naviKill()
  local L0_12, L1_13
  L0_12 = _COMMAND_NAVI_KILL
  _command = L0_12
end
function setPrevPhaseContinue(A0_14)
  local L1_15
  _prev_phase_continue = A0_14
end
function getPrevPhaseContinue()
  local L0_16, L1_17
  L0_16 = _prev_phase_continue
  return L0_16
end
function setActiveButler(A0_18)
  if A0_18 then
    _activeButler = true
    Fn_setNpcActive("rich_03_btl", true)
  else
    _activeButler = false
    Fn_setNpcActive("rich_03_btl", false)
  end
end
function isFoundButler()
  local L0_19, L1_20
  L0_19 = _foundBtl
  return L0_19
end
function setFoundButler()
  local L0_21, L1_22
  _foundBtl = true
end
function isTalkBtl()
  local L0_23, L1_24
  L0_23 = _talkBtl
  return L0_23
end
function turnButler()
  local L0_25, L1_26
  _turnBtl = 1
  _turnEndBtl = false
end
function isTurnEndButler()
  local L0_27, L1_28
  L0_27 = _turnEndBtl
  return L0_27
end
function returnMoveButler()
  local L0_29, L1_30
  _returnMove = true
end
function endComTask()
  local L0_31, L1_32
  _end_com_flag = true
end
function restartMove()
  local L0_33, L1_34
  _restart_move = true
end
function checkBattler()
  return Fn_findNpc("rich_03_btl")
end
