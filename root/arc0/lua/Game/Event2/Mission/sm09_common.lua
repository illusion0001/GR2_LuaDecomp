dofile("/Game/Misc/perceivable_npc.lua")
VILLAIN_MAX = 3
SOLDIER_MAX = 16
GUARD_MAX = 27
CELEBRITY_MAX = 3
MECHSKY_MAX = 16
BATTLE_SOLDIER_MAX = 3
CONVOY_MAX = 6
ALL_SOLDIER = SOLDIER_MAX + GUARD_MAX
SOLDIER_SIGHT_H_DEG = 45
SOLDIER_SIGHT_V_DEG = 45
SOLDIER_SIGHT_LEN = 13
GUARD_SIGHT_H_DEG = 45
GUARD_SIGHT_V_DEG = 45
GUARD_SIGHT_LEN = 20
VILLAIN_SIGHT_H_DEG = 45
VILLAIN_SIGHT_V_DEG = 45
VILLAIN_SIGHT_LEN = 10
CELEB_SIGHT_H_DEG = 80
CELEB_SIGHT_V_DEG = 80
CELEB_SIGHT_LEN = 11
MOVE_OPTION_SOLDIER_NORMAL = {
  anim_walk_speed = 1,
  runLength = 99999,
  arrivedLength = 0.1,
  navimesh = true,
  noTurn = true,
  recast = true
}
SOL_MOTION_LIST = {
  TALK_00 = "man57_talk_00",
  TALK_01 = "man57_talk_01",
  LOOKAROUND = "man57_lookaround_00"
}
_part = nil
_now_retry = false
_is_seen_the_enemy = false
_found_to_enemy = false
_begin_combat = false
_mechsky = {}
_enmgen = {}
_mechskytask = nil
_mechsky_retry = false
_is_rescue = false
_mnavi = {}
_obj_hdl = {}
_break_container = false
_is_photo_success = false
function npcInit_soldier(A0_0)
  local L1_1, L2_2
  L1_1 = nil
  L2_2 = {}
  if A0_0 == "sm09_a" then
    L1_1 = "a"
  elseif A0_0 == "sm09_b" then
    L1_1 = "b"
  elseif A0_0 == "sm09_c" then
    L1_1 = "c"
  elseif A0_0 == "sm09_d" then
    L1_1 = "d"
  end
  for _FORV_8_ = 1, SOLDIER_MAX do
    if _soldierInstance[_FORV_8_] ~= nil and _soldierInstance[_FORV_8_].task ~= nil then
      _soldierInstance[_FORV_8_]:taskAbort()
    end
    _soldierInstance[_FORV_8_] = PerceivableNpc.new(_soldierName[_FORV_8_])
    _soldierInstance[_FORV_8_]:setPosList(({
      {
        {
          pos = "locator2_sol01_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol01_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol02_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol02_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol03_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol03_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol04_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol04_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol05_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol05_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol06_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol06_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol07_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol07_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol08_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol08_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol09_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol09_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol10_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol10_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol11_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol11_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol12_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol12_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol13_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol13_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol14_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol14_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol15_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol15_" .. L1_1 .. "_path_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_sol16_" .. L1_1 .. "_path_01",
          opt = nil
        },
        {
          pos = "locator2_sol16_" .. L1_1 .. "_path_02",
          opt = nil
        }
      }
    })[_FORV_8_])
    _soldierInstance[_FORV_8_]:setMoveOption(MOVE_OPTION_SOLDIER_NORMAL)
    _soldierInstance[_FORV_8_]:setLoop(true)
    _soldierInstance[_FORV_8_]:setSightParam2(SOLDIER_SIGHT_H_DEG, SOLDIER_SIGHT_V_DEG, SOLDIER_SIGHT_LEN)
    _soldierInstance[_FORV_8_]:setAlertRange(3)
    _soldierInstance[_FORV_8_]:setCautionCoefficient(3, 0.35)
    _soldierInstance[_FORV_8_]:setOnChangeState(soldierCallBack)
    _soldierInstance[_FORV_8_]:setCombatReady(true)
    _soldierInstance[_FORV_8_]:setCombatTimeEnable(true)
    _soldierInstance[_FORV_8_]:setCombatTime(5)
    _soldierInstance[_FORV_8_]:setIndicationEnable(true)
    _soldierInstance[_FORV_8_]:setIndicationRange(10)
    _soldierInstance[_FORV_8_]:setIndicationCoefficient(5, 3)
    _soldierInstance[_FORV_8_]:setDismissMotion("stay")
    _soldierInstance[_FORV_8_]:action()
    Fn_findNpc(_soldierName[_FORV_8_]):enableHomingTarget(true)
    Fn_findNpc(_soldierName[_FORV_8_]):setDamage(true)
    _npcTable[_FORV_8_] = _soldierInstance[_FORV_8_]
  end
  for _FORV_8_ = 1, GUARD_MAX do
    if _guardInstance[_FORV_8_] ~= nil and _guardInstance[_FORV_8_].task ~= nil then
      _guardInstance[_FORV_8_]:taskAbort()
    end
    _guardInstance[_FORV_8_] = PerceivableNpc.new(_guardName[_FORV_8_])
    _guardInstance[_FORV_8_]:setPosList(({
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_03",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_04",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_05",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_06",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_07",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_08",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_09",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_10",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_11",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_12",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_13",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_14",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_15",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_16",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_17",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_18",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_19",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_20",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_21",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_22",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_23",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_24",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_25",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_26",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_" .. L1_1 .. "_27",
          opt = nil
        }
      }
    })[_FORV_8_])
    _guardInstance[_FORV_8_]:setMoveOption(MOVE_OPTION_SOLDIER_NORMAL)
    _guardInstance[_FORV_8_]:setLoop(false)
    _guardInstance[_FORV_8_]:setSightParam2(GUARD_SIGHT_H_DEG, GUARD_SIGHT_V_DEG, GUARD_SIGHT_LEN)
    _guardInstance[_FORV_8_]:setAlertRange(3)
    _guardInstance[_FORV_8_]:setCautionCoefficient(3, 0.35)
    _guardInstance[_FORV_8_]:setOnChangeState(soldierCallBack)
    _guardInstance[_FORV_8_]:setCombatReady(true)
    _guardInstance[_FORV_8_]:setCombatTimeEnable(true)
    _guardInstance[_FORV_8_]:setCombatTime(5)
    _guardInstance[_FORV_8_]:setIndicationEnable(true)
    _guardInstance[_FORV_8_]:setIndicationRange(10)
    _guardInstance[_FORV_8_]:setIndicationCoefficient(15, 3)
    _guardInstance[_FORV_8_]:setDismissMotion("stay")
    _guardInstance[_FORV_8_]:action()
    L2_2[_FORV_8_] = Fn_findNpc(_guardName[_FORV_8_])
    L2_2[_FORV_8_]:enableHomingTarget(true)
    L2_2[_FORV_8_]:setDamage(true)
    _npcTable[_FORV_8_ + SOLDIER_MAX] = _guardInstance[_FORV_8_]
  end
  if A0_0 == "sm09_b" then
    _soldierInstance[12]:setLoop(false)
    _soldierInstance[13]:setLoop(false)
    _soldierInstance[14]:setLoop(false)
    _soldierInstance[12]:setStayMotion(SOL_MOTION_LIST.TALK_00)
    _soldierInstance[13]:setStayMotion(SOL_MOTION_LIST.TALK_01)
    _soldierInstance[14]:setStayMotion(SOL_MOTION_LIST.TALK_00)
  elseif A0_0 == "sm09_c" then
    _soldierInstance[12]:setLoop(false)
    _soldierInstance[13]:setLoop(false)
    _soldierInstance[13]:setCombatTime(8)
    _soldierInstance[13]:setDamageType(0)
    _soldierInstance[13]:setIndicationEnable(false)
    _soldierInstance[13]:setStayMotion("blend_stay")
    _soldierInstance[14]:setLoop(false)
    _soldierInstance[13]:setSightParam2(GUARD_SIGHT_H_DEG + 5, GUARD_SIGHT_V_DEG + 15, GUARD_SIGHT_LEN + 7)
    _soldierInstance[13]:setIndicationRange(6)
    _soldierInstance[13]:setAlertRange(3)
    _soldierInstance[13]:action()
  end
  if A0_0 ~= "sm09_a" then
    for _FORV_8_ = 1, CONVOY_MAX do
      _guardInstance[_FORV_8_]:setCombatReady(false)
      _guardInstance[_FORV_8_]:setOnChangeState(callBack)
      L2_2[_FORV_8_]:enableHomingTarget(false)
      L2_2[_FORV_8_]:setDamage(false)
    end
  end
  _FOR_[15]:setIndicationRange(5)
  _guardInstance[15]:setAlertRange(1)
  CautionLevel.setNpc(_npcTable)
  CautionLevel.setLabel("sm09_09000")
  CautionLevel.drawTask()
  CautionLevel.setKeepVisible(true)
end
function mnaviDelete(A0_3)
  if _mnavi[A0_3] ~= nil then
    _mnavi[A0_3]:setActive(false)
    _mnavi[A0_3]:del(false)
    _mnavi[A0_3] = nil
  end
end
function soldierCallBack(A0_4, A1_5)
  local L2_6
  L2_6 = Fn_findNpcPuppet
  L2_6 = L2_6(A0_4)
  if A1_5 == CALLBACK_REASON.IS_INSIGHT or A1_5 == CALLBACK_REASON.INDICATION_OVERFLOW then
    print("\232\166\150\231\149\140\227\129\171\227\129\168\227\130\137\227\129\136\227\130\137\227\130\140\227\129\159")
    _is_seen_the_enemy = true
    _mnavi[A0_4] = HUD:mnaviNew({
      name = "mnavi_" .. A0_4
    })
    _mnavi[A0_4]:setTarget(L2_6)
    _mnavi[A0_4]:setActive(true)
    if _begin_combat then
      return
    end
    Fn_captionView(({
      "sm09_09001",
      "sm09_09002",
      "sm09_09003",
      "sm09_09004",
      "sm09_09005"
    })[RandI(1, #{
      "sm09_09001",
      "sm09_09002",
      "sm09_09003",
      "sm09_09004",
      "sm09_09005"
    })])
    Sound:playSE(({
      "m25_010",
      "m26_005",
      "m27_006",
      "m28_005",
      "m25_010"
    })[RandI(1, #{
      "sm09_09001",
      "sm09_09002",
      "sm09_09003",
      "sm09_09004",
      "sm09_09005"
    })], 1)
  elseif A1_5 == CALLBACK_REASON.CAUTION_OVERFLOW or A1_5 == CALLBACK_REASON.DAMAGED then
    print("\232\173\166\230\136\146\229\186\166\227\129\140MAX\227\129\171\227\129\170\227\129\163\227\129\159", A0_4)
    mnaviDelete(A0_4)
  elseif A1_5 == CALLBACK_REASON.BEGIN_COMBAT then
    _begin_combat = true
    Fn_coercionPoseBattle()
    Fn_captionView("sm09_00117")
  elseif A1_5 == CALLBACK_REASON.COMBAT_TIMEOUT then
    mnaviDelete(A0_4)
    if _begin_combat then
      _begin_combat = false
    end
    Retry(A0_4)
  elseif A1_5 == CALLBACK_REASON.DIED then
    mnaviDelete(A0_4)
    if A0_4 == "sm09_soldier_13" then
      _is_rescue = true
    end
    if _begin_combat then
      _begin_combat = false
    end
    Fn_coercionPoseNomal()
    if _is_seen_the_enemy then
      _is_seen_the_enemy = false
    end
  elseif A1_5 == CALLBACK_REASON.NO_CAUTION or A1_5 == CALLBACK_REASON.NO_INDICATION then
    print("\232\173\166\230\136\146\229\186\166\227\129\140\230\156\128\229\176\145\227\129\171\227\129\170\227\129\163\227\129\159")
    mnaviDelete(A0_4)
    if _is_seen_the_enemy then
      _is_seen_the_enemy = false
    end
    Fn_captionView(({
      "sm09_09007",
      "sm09_09008",
      "sm09_09009"
    })[RandI(1, #{
      "sm09_09007",
      "sm09_09008",
      "sm09_09009"
    })])
    Sound:playSE(({
      "m26_007",
      "m25_012",
      "m27_008"
    })[RandI(1, #{
      "sm09_09007",
      "sm09_09008",
      "sm09_09009"
    })], 1)
  elseif A1_5 == CALLBACK_REASON.FORCED_TERMINATION then
    mnaviDelete(A0_4)
  end
end
function callBack(A0_7, A1_8)
  local L2_9
  L2_9 = CALLBACK_REASON
  L2_9 = L2_9.IS_INSIGHT
  if A1_8 ~= L2_9 then
    L2_9 = CALLBACK_REASON
    L2_9 = L2_9.INDICATION_OVERFLOW
  else
    if A1_8 == L2_9 then
      L2_9 = print
      L2_9("\232\166\150\231\149\140\227\129\171\227\129\168\227\130\137\227\129\136\227\130\137\227\130\140\227\129\159")
      _is_seen_the_enemy = true
      L2_9 = _begin_combat
      if L2_9 then
        return
      end
      L2_9 = _is_photo_spot_find
      if not L2_9 then
        L2_9 = {
          "sm09_09001",
          "sm09_09002",
          "sm09_09003",
          "sm09_09004",
          "sm09_09005"
        }
        Fn_captionView(L2_9[RandI(1, #L2_9)])
        Sound:playSE(({
          "m25_010",
          "m26_005",
          "m27_006",
          "m28_005",
          "m25_010"
        })[RandI(1, #L2_9)], 1)
      end
  end
  else
    L2_9 = CALLBACK_REASON
    L2_9 = L2_9.CAUTION_OVERFLOW
    if A1_8 ~= L2_9 then
      L2_9 = CALLBACK_REASON
      L2_9 = L2_9.DAMAGED
    else
      if A1_8 == L2_9 then
        L2_9 = print
        L2_9("\232\173\166\230\136\146\229\186\166\227\129\140MAX\227\129\171\227\129\170\227\129\163\227\129\159")
        L2_9 = _is_photo_success
        if not L2_9 then
          L2_9 = _found_to_enemy
          if L2_9 then
            return
          end
          _found_to_enemy = true
          function L2_9()
            _polydemo:setVisible(false)
            Fn_setNpcActive("sm09_gun_01", true)
            Fn_setNpcActive("sm09_waru_01", true)
          end
          if _part == "sm09_a" then
            Fn_captionView("sm09_00119")
          elseif _is_photo_spot_find then
            Fn_kaiwaDemoView2("sm09_00406k", L2_9, true)
          else
            Fn_kaiwaDemoView("sm09_00406k")
          end
          Retry(A0_7)
        end
    end
    else
      L2_9 = CALLBACK_REASON
      L2_9 = L2_9.NO_CAUTION
      if A1_8 == L2_9 then
        L2_9 = print
        L2_9("\232\173\166\230\136\146\229\186\166\227\129\140\230\156\128\229\176\145\227\129\171\227\129\170\227\129\163\227\129\159")
        L2_9 = _is_seen_the_enemy
        if not L2_9 then
          _is_seen_the_enemy = false
        end
        L2_9 = {
          "sm09_09007",
          "sm09_09008",
          "sm09_09009"
        }
        Fn_captionView(L2_9[RandI(1, #L2_9)])
        Sound:playSE(({
          "m26_007",
          "m25_012",
          "m27_008"
        })[RandI(1, #L2_9)], 1)
      end
    end
  end
end
function setupAreaModel()
  Fn_findAreaHandle("po_a_04"):setExpandedAabb(true)
  if Fn_findAreaHandle("po_a_04"):findChildNode("bg2_container_02_05", true) ~= nil then
    Fn_findAreaHandle("po_a_04"):findChildNode("bg2_container_02_05", true):try_term()
  end
end
function containerBrokenCheck()
  invokeTask(function()
    local L0_10, L1_11
    L0_10 = Fn_findAreaHandle
    L1_11 = "po_a_04c"
    L0_10 = L0_10(L1_11)
    L1_11 = {
      {
        name = "container_kk_01_01",
        hdl = nil,
        callback = false
      },
      {
        name = "container_kk_01_02",
        hdl = nil,
        callback = false
      },
      {
        name = "container_kk_02_01",
        hdl = nil,
        callback = false
      },
      {
        name = "container_kk_02_02",
        hdl = nil,
        callback = false
      },
      {
        name = "container_kk_03_01",
        hdl = nil,
        callback = false
      },
      {
        name = "container_kk_03_02",
        hdl = nil,
        callback = false
      }
    }
    while true do
      for _FORV_5_, _FORV_6_ in ipairs(L1_11) do
        if _FORV_6_.hdl then
          if _FORV_6_.hdl:isRunning() and _FORV_6_.callback == false then
            print(_FORV_6_.name .. "\227\129\171callback\227\130\146\232\168\173\229\174\154\227\129\151\227\129\190\227\129\151\227\129\159")
            _obj_hdl[_FORV_6_.name] = _FORV_6_.hdl
            _FORV_6_.callback = true
            _FORV_6_.hdl:setEventListener("broken", function(A0_12)
              if not _is_photo_success then
                print("object broken = " .. A0_12:getName())
                invokeTask(function()
                  if _part ~= "sm09_a" and not _break_container then
                    _break_container = true
                    Fn_kaiwaDemoView("sm09_00406k")
                  end
                end)
                Retry()
              end
            end)
          end
          if _FORV_6_.hdl:isStopped() then
            print(_FORV_6_.name .. "\227\129\140\230\177\142\231\148\168\229\129\180\227\129\167\231\160\180\230\163\132\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\227\131\143\227\131\179\227\131\137\227\131\171\227\130\146\232\167\163\230\148\190\227\129\151\227\129\190\227\129\153")
            _obj_hdl[_FORV_6_.name] = nil
            _FORV_6_.hdl = nil
            _FORV_6_.callback = false
          end
        else
          _FORV_6_.hdl = L0_10:findChildNode(_FORV_6_.name, true)
        end
        wait()
      end
      wait()
    end
  end)
end
function containerRestoreForce()
  for _FORV_3_, _FORV_4_ in pairs(_obj_hdl) do
    if _FORV_4_ then
      _FORV_4_:requestRestoreForce()
    end
  end
  _break_container = false
end
function soldierTurnAction()
  local L0_13, L1_14, L2_15, L3_16
  for L3_16 = 1, SOLDIER_MAX do
    invokeTask(function()
      Fn_turnNpc("sm09_soldier_" .. string.format("%02d", L3_16))
    end)
    break
  end
  for L3_16 = 1, GUARD_MAX do
    invokeTask(function()
      Fn_turnNpc("sm09_guard_" .. string.format("%02d", L3_16))
    end)
    break
  end
end
function villainTurnAction()
  local L0_17, L1_18, L2_19, L3_20
  for L3_20 = 2, VILLAIN_MAX do
    invokeTask(function()
      Fn_turnNpc("sm09_gun_" .. string.format("%02d", L3_20))
      Fn_playMotionNpc("sm09_gun_" .. string.format("%02d", L3_20), "blend_stay", false, {animBlendDuration = 0.3})
    end)
    break
  end
  L0_17(L1_18)
end
function celebrityTurnAction()
  invokeTask(function()
    Fn_turnNpc("sm09_waru_01")
    if _now_retry then
      Fn_playMotionNpc("sm09_waru_01", "surprise", false)
    end
  end)
  invokeTask(function()
    Fn_turnNpc("sm09_waru_02")
    if _now_retry then
      Fn_playMotionNpc("sm09_waru_02", {
        "shock_in_00",
        "shock_00",
        "stay"
      }, false)
    end
  end)
  invokeTask(function()
    Fn_turnNpc("sm09_waru_03")
    if _now_retry then
      waitSeconds(0.3)
      Fn_playMotionNpc("sm09_waru_03", "surprise_01", false)
    end
  end)
end
function playerRetryAction(A0_21)
  local L1_22, L2_23
  L1_22 = nil
  if A0_21 ~= nil then
    L2_23 = _mechsky_retry
    if L2_23 then
      L2_23 = findGameObject2
      L2_23 = L2_23("Puppet", A0_21)
      L1_22 = HUD:mnaviNew({
        name = "mnavi_" .. A0_21,
        PochFadeLen0 = 0,
        PochFadeLen100 = -1
      })
      L1_22:setTarget(L2_23)
      L1_22:setActive(true)
      waitSeconds(1)
      Mv_viewObj(L2_23)
    else
      L2_23 = Mv_viewObj
      L2_23(_puppet_tbl[A0_21])
    end
    L2_23 = print
    L2_23(A0_21 .. "\227\129\171\232\166\139\227\129\164\227\129\139\227\129\163\227\129\159")
  end
  L2_23 = Fn_captionViewWait
  L2_23("sm09_09018")
  L2_23 = _mechsky_retry
  if L2_23 then
    L2_23 = L1_22.setActive
    L2_23(L1_22, false)
    L2_23 = L1_22.del
    L2_23(L1_22)
  end
end
function periodicMotionChange()
  invokeTask(function()
    local L0_24, L1_25, L2_26, L3_27, L4_28
    L0_24 = 0
    repeat
      L0_24 = L0_24 + 1
      if L0_24 == 90 then
        if not L1_25 then
          for L4_28 = 1, GUARD_MAX do
            invokeTask(function()
              waitSeconds(RandF(3, 5))
              _guardInstance[L4_28]:setStayMotion(SOL_MOTION_LIST.LOOKAROUND)
            end)
            break
          end
        end
      elseif L0_24 == 180 then
        if not L1_25 then
          for L4_28 = 1, GUARD_MAX do
            invokeTask(function()
              waitSeconds(RandF(2, 4))
              _guardInstance[L4_28]:setStayMotion("stay")
            end)
            break
          end
        end
      elseif L0_24 >= 270 then
        if not L1_25 then
          L0_24 = 0
        end
      end
      L1_25()
    until L1_25
  end)
end
function enemyResetRelocation(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34
  L1_30 = nil
  if A0_29 == "sm09_a" then
    L1_30 = "a"
  elseif A0_29 == "sm09_b" then
    L1_30 = "b"
  elseif A0_29 == "sm09_c" then
    L1_30 = "c"
  elseif A0_29 == "sm09_d" then
    L1_30 = "d"
  end
  for L5_34 = 1, #L3_32 do
    if _npcTable[L5_34].npc:isEnemy() then
      _npcTable[L5_34].npc:changeNpc()
    end
    if _npcTable[L5_34].status == NPC_STATUS.DEAD then
      Fn_disappearNpc(_npcTable[L5_34].npcName)
      Fn_setupNpc({
        {
          name = _npcTable[L5_34].npcName,
          type = "soldier",
          start = true,
          attach = false
        }
      })
      Fn_loadNpcEventMotion(_npcTable[L5_34].npcName, SOL_MOTION_LIST)
    end
  end
  for L5_34 = 1, SOLDIER_MAX do
    Fn_warpNpc(_soldierInstance[L5_34].npcName, "locator2_soldier_" .. L1_30 .. "_" .. string.format("%02d", L5_34))
  end
  for L5_34 = 1, GUARD_MAX do
    Fn_warpNpc(_guardInstance[L5_34].npcName, "locator2_guard_" .. L1_30 .. "_" .. string.format("%02d", L5_34))
  end
  for L5_34 = 1, VILLAIN_MAX do
    Fn_warpNpc("sm09_gun_" .. string.format("%02d", L5_34), "locator2_gunjin_" .. L1_30 .. "_" .. string.format("%02d", L5_34))
  end
end
function setupMechSkyTask(A0_35)
  local L1_36
  L1_36 = nil
  if A0_35 == "sm09_a" then
    L1_36 = "a"
  elseif A0_35 == "sm09_b" then
    L1_36 = "b"
  elseif A0_35 == "sm09_c" then
    L1_36 = "c"
  end
  _mechskytask = invokeTask(function()
    local L0_37, L1_38, L2_39, L3_40
    for L3_40 = 1, MECHSKY_MAX do
      _enmgen[L3_40] = findGameObject2("EnemyGenerator", "enmgen2_mechsky_" .. L1_36 .. string.format("_%02d", L3_40))
      _mechsky[L3_40] = findGameObject2("EnemyBrain", "mechsky_" .. string.format("%02d", L3_40))
      repeat
        wait()
      until _mechsky[L3_40]:isReadyEnemy()
      _enmgen[L3_40]:setEnemyMarker(false)
      _mechsky[L3_40]:setEnableHomingTarget(false)
      _enmgen[L3_40]:requestIdlingEnemy(true)
    end
    for _FORV_4_ = 1, MECHSKY_MAX do
      _enmgen[_FORV_4_]:setEventListener("TargetEnemyReport", L0_37)
    end
    L1_38.invincible = true
    L1_38.speed = 4
    L1_38.loop = true
    L1_38.search = true
    for _FORV_6_ = 1, MECHSKY_MAX do
      _mechsky[_FORV_6_]:move(L2_39[_FORV_6_], L1_38)
    end
  end)
end
function restartCaptionView()
  if _mechsky_retry then
    Fn_captionView("sm09_09019")
    _mechsky_retry = false
  else
    Fn_captionView("sm09_09020")
  end
end
