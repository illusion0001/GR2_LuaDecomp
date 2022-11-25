dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/gesture.lua")
_cancel_flag = false
_break_flag = false
_study_phase = 0
_gesture_state = 0
_gesture = nil
_GAME_STATE = {
  START = 1,
  CRANE = 2,
  SELF = 3,
  SHOP = 4,
  CLEAR = 5
}
_npc_kaiwa_table = {
  npcgen2_man38_01 = {
    cnt = 0,
    phase = {
      [_GAME_STATE.START] = {
        replyId = 1,
        known_kaiwa = "sm11_00200k",
        reply_yes = {text = "sm11_00115", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.CRANE] = {
        replyId = 1,
        reply_yes = {text = "sm11_00115", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.SELF] = {},
      [_GAME_STATE.SHOP] = {
        replyId = 0,
        reply_no = {text = "sm11_00114", time = 2}
      },
      [_GAME_STATE.CLEAR] = {}
    }
  },
  npcgen2_man78_01 = {
    cnt = 0,
    phase = {
      [_GAME_STATE.START] = {
        replyId = 1,
        known_kaiwa = "sm11_00210k",
        reply_yes = {text = "sm11_00115", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.CRANE] = {
        replyId = 1,
        reply_yes = {text = "sm11_00111", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.SELF] = {},
      [_GAME_STATE.SHOP] = {
        replyId = 0,
        reply_no = {text = "sm11_00114", time = 2}
      },
      [_GAME_STATE.CLEAR] = {}
    }
  },
  npcgen2_wom22_01 = {
    cnt = 0,
    phase = {
      [_GAME_STATE.START] = {
        replyId = 1,
        known_kaiwa = "sm11_00220k",
        reply_yes = {text = "sm11_00115", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.CRANE] = {
        replyId = 1,
        reply_yes = {text = "sm11_00111", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.SELF] = {},
      [_GAME_STATE.SHOP] = {
        replyId = 0,
        reply_no = {text = "sm11_00114", time = 2}
      },
      [_GAME_STATE.CLEAR] = {}
    }
  },
  npcgen2_man41_01 = {
    cnt = 0,
    phase = {
      [_GAME_STATE.START] = {
        replyId = 1,
        known_kaiwa = "sm11_00310k",
        reply_yes = {text = "sm11_00112", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.CRANE] = {
        replyId = 1,
        known_kaiwa = "sm11_00310k",
        reply_yes = {text = "sm11_00112", time = 2},
        direction = {
          node = "locator2_crane_01"
        }
      },
      [_GAME_STATE.SELF] = {},
      [_GAME_STATE.SHOP] = {
        replyId = 0,
        reply_no = {text = "sm11_00114", time = 2}
      },
      [_GAME_STATE.CLEAR] = {}
    }
  },
  sm11_son = {cnt = 0, skip = true},
  sm11_client = {client = true}
}
function copy_table(A0_0, A1_1)
  local L3_2, L4_3, L5_4, L6_5, L7_6, L8_7, L9_8
  L3_2 = _npc_kaiwa_table
  L4_3 = {}
  L5_4 = _npc_kaiwa_table
  L5_4 = L5_4[A0_0]
  L5_4 = L5_4.cnt
  L4_3.cnt = L5_4
  L5_4 = {}
  L6_5 = _GAME_STATE
  L6_5 = L6_5.START
  L7_6 = {}
  L8_7 = _npc_kaiwa_table
  L8_7 = L8_7[A0_0]
  L8_7 = L8_7.phase
  L9_8 = _GAME_STATE
  L9_8 = L9_8.START
  L8_7 = L8_7[L9_8]
  L8_7 = L8_7.replyId
  L7_6.replyId = L8_7
  L8_7 = _npc_kaiwa_table
  L8_7 = L8_7[A0_0]
  L8_7 = L8_7.phase
  L9_8 = _GAME_STATE
  L9_8 = L9_8.START
  L8_7 = L8_7[L9_8]
  L8_7 = L8_7.known_kaiwa
  L7_6.known_kaiwa = L8_7
  L8_7 = {}
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.START]
  L9_8 = L9_8.reply_yes
  L9_8 = L9_8.text
  L8_7.text = L9_8
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.START]
  L9_8 = L9_8.reply_yes
  L9_8 = L9_8.time
  L8_7.time = L9_8
  L7_6.reply_yes = L8_7
  L8_7 = {}
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.START]
  L9_8 = L9_8.direction
  L9_8 = L9_8.node
  L8_7.node = L9_8
  L7_6.direction = L8_7
  L5_4[L6_5] = L7_6
  L6_5 = _GAME_STATE
  L6_5 = L6_5.CRANE
  L7_6 = {}
  L8_7 = _npc_kaiwa_table
  L8_7 = L8_7[A0_0]
  L8_7 = L8_7.phase
  L9_8 = _GAME_STATE
  L9_8 = L9_8.CRANE
  L8_7 = L8_7[L9_8]
  L8_7 = L8_7.replyId
  L7_6.replyId = L8_7
  L8_7 = _npc_kaiwa_table
  L8_7 = L8_7[A0_0]
  L8_7 = L8_7.phase
  L9_8 = _GAME_STATE
  L9_8 = L9_8.CRANE
  L8_7 = L8_7[L9_8]
  L8_7 = L8_7.known_kaiwa
  L7_6.known_kaiwa = L8_7
  L8_7 = {}
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.CRANE]
  L9_8 = L9_8.reply_yes
  L9_8 = L9_8.text
  L8_7.text = L9_8
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.CRANE]
  L9_8 = L9_8.reply_yes
  L9_8 = L9_8.time
  L8_7.time = L9_8
  L7_6.reply_yes = L8_7
  L8_7 = {}
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.CRANE]
  L9_8 = L9_8.direction
  L9_8 = L9_8.node
  L8_7.node = L9_8
  L7_6.direction = L8_7
  L5_4[L6_5] = L7_6
  L6_5 = _GAME_STATE
  L6_5 = L6_5.SELF
  L7_6 = {}
  L5_4[L6_5] = L7_6
  L6_5 = _GAME_STATE
  L6_5 = L6_5.SHOP
  L7_6 = {}
  L8_7 = _npc_kaiwa_table
  L8_7 = L8_7[A0_0]
  L8_7 = L8_7.phase
  L9_8 = _GAME_STATE
  L9_8 = L9_8.SHOP
  L8_7 = L8_7[L9_8]
  L8_7 = L8_7.replyId
  L7_6.replyId = L8_7
  L8_7 = {}
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.SHOP]
  L9_8 = L9_8.reply_no
  L9_8 = L9_8.text
  L8_7.text = L9_8
  L9_8 = _npc_kaiwa_table
  L9_8 = L9_8[A0_0]
  L9_8 = L9_8.phase
  L9_8 = L9_8[_GAME_STATE.SHOP]
  L9_8 = L9_8.reply_no
  L9_8 = L9_8.time
  L8_7.time = L9_8
  L7_6.reply_no = L8_7
  L5_4[L6_5] = L7_6
  L6_5 = _GAME_STATE
  L6_5 = L6_5.CLEAR
  L7_6 = {}
  L5_4[L6_5] = L7_6
  L4_3.phase = L5_4
  L3_2[A1_1] = L4_3
end
copy_table("npcgen2_man38_01", "npcgen2_man38_02")
copy_table("npcgen2_man38_01", "npcgen2_man38_03")
copy_table("npcgen2_man38_01", "npcgen2_man38_04")
copy_table("npcgen2_man78_01", "npcgen2_man78_02")
copy_table("npcgen2_man78_01", "npcgen2_man78_03")
copy_table("npcgen2_man78_01", "npcgen2_man78_04")
copy_table("npcgen2_wom22_01", "npcgen2_wom22_02")
copy_table("npcgen2_wom22_01", "npcgen2_wom22_03")
copy_table("npcgen2_wom22_01", "npcgen2_wom22_04")
function gestureNpcActionCallback2(A0_9)
  local L1_10, L2_11, L3_12, L4_13, L5_14, L6_15, L7_16, L8_17
  if A0_9 ~= nil then
    L1_10 = Fn_userCtrlOff
    L1_10()
    L2_11 = A0_9
    L1_10 = A0_9.getName
    L1_10 = L1_10(L2_11)
    L2_11 = _npc_kaiwa_table
    L2_11 = L2_11[L1_10]
    L2_11 = L2_11.client
    if L2_11 == true then
      L3_12 = A0_9
      L2_11 = A0_9.getWorldPos
      L2_11 = L2_11(L3_12)
      L3_12 = Vector
      L4_13 = 0
      L5_14 = 1.6
      L6_15 = 0
      L3_12 = L3_12(L4_13, L5_14, L6_15)
      L2_11 = L2_11 + L3_12
      L3_12 = Player
      L4_13 = L3_12
      L3_12 = L3_12.setLookAtIk
      L5_14 = true
      L6_15 = 1
      L7_16 = L2_11
      L3_12(L4_13, L5_14, L6_15, L7_16)
      L3_12 = Fn_turnNpc
      L4_13 = L1_10
      L3_12(L4_13)
      L3_12 = waitSeconds
      L4_13 = 0.5
      L3_12(L4_13)
      L3_12 = HUD
      L4_13 = L3_12
      L3_12 = L3_12.captionBegin
      L5_14 = "sm11_00127"
      L6_15 = 2
      L3_12(L4_13, L5_14, L6_15)
    else
      L2_11 = _npc_kaiwa_table
      L2_11 = L2_11[L1_10]
      L2_11 = L2_11.skip
      if L2_11 ~= true then
        L2_11 = Fn_findNpc
        L3_12 = L1_10
        L2_11 = L2_11(L3_12)
        L4_13 = A0_9
        L3_12 = A0_9.getWorldPos
        L3_12 = L3_12(L4_13)
        L4_13 = Vector
        L5_14 = 0
        L6_15 = 1.6
        L7_16 = 0
        L4_13 = L4_13(L5_14, L6_15, L7_16)
        L3_12 = L3_12 + L4_13
        L4_13 = Player
        L5_14 = L4_13
        L4_13 = L4_13.setLookAtIk
        L6_15 = true
        L7_16 = 1
        L8_17 = L3_12
        L4_13(L5_14, L6_15, L7_16, L8_17)
        L4_13 = Fn_turnNpc
        L5_14 = L1_10
        L4_13(L5_14)
        L4_13 = waitSeconds
        L5_14 = 0.16
        L4_13(L5_14)
        L4_13 = _npc_kaiwa_table
        L4_13 = L4_13[L1_10]
        L4_13 = L4_13.phase
        L5_14 = _study_phase
        L4_13 = L4_13[L5_14]
        L5_14 = L4_13.replyId
        if L5_14 == 1 then
          L5_14 = Fn_playMotionNpc
          L6_15 = L1_10
          L7_16 = "reply_yes"
          L8_17 = true
          L5_14(L6_15, L7_16, L8_17)
          L5_14 = _npc_kaiwa_table
          L5_14 = L5_14[L1_10]
          L5_14 = L5_14.cnt
          if L5_14 == 0 then
            L5_14 = L4_13.known_kaiwa
            if L5_14 ~= nil then
              L5_14 = Fn_kaiwaDemoView
              L6_15 = L4_13.known_kaiwa
              L5_14(L6_15)
              L5_14 = _npc_kaiwa_table
              L5_14 = L5_14[L1_10]
              L5_14.cnt = 1
            end
          end
          L5_14 = L4_13.direction
          if L5_14 ~= nil then
            L5_14 = findGameObject2
            L6_15 = "Node"
            L7_16 = L4_13.direction
            L7_16 = L7_16.node
            L5_14 = L5_14(L6_15, L7_16)
            L6_15 = Fn_turnNpc
            L7_16 = L1_10
            L8_17 = L4_13.direction
            L8_17 = L8_17.node
            L6_15(L7_16, L8_17)
            L6_15 = waitSeconds
            L7_16 = 0.2
            L6_15(L7_16)
            L6_15 = {}
            L6_15.anim_in = "inform_in"
            L6_15.anim_lp = "inform_lp"
            L6_15.anim_out = "inform_ed"
            L6_15.anim_stay = "stay"
            L8_17 = L2_11
            L7_16 = L2_11.inform
            L7_16(L8_17, L5_14, L6_15)
            L7_16 = Fn_lookAtObject
            L8_17 = L5_14
            L7_16 = L7_16(L8_17)
            L8_17 = L5_14.getWorldPos
            L8_17 = L8_17(L5_14)
            Player:setLookAtIk(true, 1, L8_17)
            waitSeconds(2)
            L7_16:abort()
            waitSeconds(0.5)
            L2_11:informEnd()
            while not L2_11:isInformEnd() do
              wait()
            end
          end
          L5_14 = L4_13.reply_yes
          if L5_14 ~= nil then
            L5_14 = HUD
            L6_15 = L5_14
            L5_14 = L5_14.captionBegin
            L7_16 = L4_13.reply_yes
            L7_16 = L7_16.text
            L8_17 = L4_13.reply_yes
            L8_17 = L8_17.time
            L5_14(L6_15, L7_16, L8_17)
            L5_14 = waitSeconds
            L6_15 = L4_13.reply_yes
            L6_15 = L6_15.time
            L5_14(L6_15)
          end
        else
          L5_14 = L4_13.replyId
          if L5_14 == 0 then
            L5_14 = Fn_playMotionNpc
            L6_15 = L1_10
            L7_16 = "reply_no"
            L8_17 = false
            L5_14(L6_15, L7_16, L8_17)
            L5_14 = wait
            L6_15 = 10
            L5_14(L6_15)
            L5_14 = L4_13.reply_no
            if L5_14 ~= nil then
              L5_14 = HUD
              L6_15 = L5_14
              L5_14 = L5_14.captionBegin
              L7_16 = L4_13.reply_no
              L7_16 = L7_16.text
              L8_17 = L4_13.reply_no
              L8_17 = L8_17.time
              L5_14(L6_15, L7_16, L8_17)
              L5_14 = waitSeconds
              L6_15 = L4_13.reply_no
              L6_15 = L6_15.time
              L5_14(L6_15)
            end
          end
        end
      end
    end
    L2_11 = Fn_userCtrlOn
    L2_11()
    L2_11 = gestureNpcActionChangeGameState
    L3_12 = L1_10
    L2_11(L3_12)
  end
end
function gestureNpcActionChangeGameState(A0_18)
  if A0_18 == "npcgen2_man38_01" or A0_18 == "npcgen2_man38_02" or A0_18 == "npcgen2_man38_03" or A0_18 == "npcgen2_man38_04" or A0_18 == "npcgen2_man78_01" or A0_18 == "npcgen2_man78_02" or A0_18 == "npcgen2_man78_03" or A0_18 == "npcgen2_man78_04" or A0_18 == "npcgen2_wom22_01" or A0_18 == "npcgen2_wom22_02" or A0_18 == "npcgen2_wom22_03" or A0_18 == "npcgen2_wom22_04" then
    if _study_phase == _GAME_STATE.START then
      GameStateSet(_GAME_STATE.CRANE)
    end
  elseif A0_18 == "npcgen2_man41_01" then
    if _study_phase <= _GAME_STATE.CRANE then
      ExclusionEventStart(EventCraneDiscovery)
    end
  elseif A0_18 == "sm11_son" then
    GameStateSet(_GAME_STATE.CLEAR)
  end
end
GEATURE_START = 1
GEATURE_CRANE = 2
GEATURE_CRANE_NEAR = 3
GEATURE_SHOP = 4
GEATURE_SHOP_NEAR = 5
_mob_text_table = {
  [GEATURE_START] = {
    man38 = {
      known_kaiwa = "sm11_00200k",
      reply_yes = {text = "sm11_00115", time = 2},
      reply_no = {text = "sm11_00114", time = 2}
    },
    man78 = {
      known_kaiwa = "sm11_00210k",
      reply_yes = {text = "sm11_00115", time = 2},
      reply_no = {text = "sm11_00114", time = 2}
    },
    wom22 = {
      known_kaiwa = "sm11_00220k",
      reply_yes = {text = "sm11_00115", time = 2},
      reply_no = {text = "sm11_00114", time = 2}
    },
    other = {
      {
        reply_yes = {text = "sm11_00115", time = 2},
        reply_no = {text = "sm11_00114", time = 2}
      }
    }
  },
  [GEATURE_CRANE] = {
    other = {
      {
        reply_yes = {text = "sm11_00111", time = 2},
        reply_no = {text = "sm11_00114", time = 2}
      }
    }
  },
  [GEATURE_CRANE_NEAR] = {
    man41 = {
      known_kaiwa = "sm11_00310k",
      reply_yes = {text = "sm11_00112", time = 2},
      reply_no = {text = "sm11_00114", time = 2}
    },
    other = {
      {
        reply_yes = {text = "sm11_00111", time = 2},
        reply_no = {text = "sm11_00114", time = 2}
      }
    }
  },
  [GEATURE_SHOP] = {
    other = {
      {
        reply_yes = {text = "sm11_00111", time = 2},
        reply_no = {text = "sm11_00114", time = 2}
      }
    }
  },
  [GEATURE_SHOP_NEAR] = {
    other = {
      {
        reply_yes = {text = "sm11_00112", time = 2},
        reply_no = {text = "sm11_00114", time = 2}
      }
    }
  }
}
function StopGeature()
  _gesture:stop()
  _gesture_state = 0
  _cancel_flag = true
  _break_flag = true
end
function SettingGeature(A0_19)
  if A0_19 == GEATURE_START then
    SetupGeatureStart()
    _gesture_state = A0_19
  elseif A0_19 == GEATURE_CRANE then
    SetupGeatureCrane()
    _gesture_state = A0_19
  elseif A0_19 == GEATURE_CRANE_NEAR then
    SetupGeatureCraneNear()
    _gesture_state = A0_19
  elseif A0_19 == GEATURE_SHOP then
    SetupGeatureShop()
    _gesture_state = A0_19
  elseif A0_19 == GEATURE_SHOP_NEAR then
    SetupGeatureShopNear()
    _gesture_state = A0_19
  end
  _gesture:resetCount()
  _cancel_flag = false
  _break_flag = false
end
function getGeatureNPC()
  local L0_20
  L0_20 = {
    Fn_findNpcPuppet("npcgen2_man38_01"),
    Fn_findNpcPuppet("npcgen2_man38_02"),
    Fn_findNpcPuppet("npcgen2_man38_03"),
    Fn_findNpcPuppet("npcgen2_man38_04"),
    Fn_findNpcPuppet("npcgen2_man78_01"),
    Fn_findNpcPuppet("npcgen2_man78_02"),
    Fn_findNpcPuppet("npcgen2_man78_03"),
    Fn_findNpcPuppet("npcgen2_man78_04"),
    Fn_findNpcPuppet("npcgen2_wom22_01"),
    Fn_findNpcPuppet("npcgen2_wom22_02"),
    Fn_findNpcPuppet("npcgen2_wom22_03"),
    Fn_findNpcPuppet("npcgen2_wom22_04"),
    Fn_findNpcPuppet("npcgen2_man41_01"),
    Fn_findNpcPuppet("sm11_son"),
    Fn_findNpcPuppet("sm11_client")
  }
  return L0_20
end
function SetupGeatureStart()
  local L0_21
  L0_21 = _gesture
  L0_21 = L0_21.setNaviTarget
  L0_21(L0_21, findGameObject2("Node", "locator2_crane_01"), nil, {pointing = true, positiveRate = 0})
  L0_21 = _gesture
  L0_21 = L0_21.setNpc
  L0_21(L0_21, getGeatureNPC())
  L0_21 = _gesture
  L0_21 = L0_21.setMobText
  L0_21(L0_21, _mob_text_table[GEATURE_START])
  function L0_21(A0_22)
    local L1_23
    L1_23 = A0_22.stdAppearance
    if L1_23 == true then
      L1_23 = A0_22.className
      if L1_23 ~= "man38" then
        L1_23 = A0_22.className
        if L1_23 ~= "man78" then
          L1_23 = A0_22.className
        end
      elseif L1_23 == "wom22" then
        L1_23 = true
        return L1_23
      end
    else
      L1_23 = false
      return L1_23
    end
  end
  _gesture:setOverrideYesFunc(L0_21)
  _gesture:run()
end
function SetupGeatureCrane()
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_crane_01"), nil, {
    pointing = true,
    classGroup = "yy_navi_sm11",
    positiveRate = 0.5
  })
  _gesture:setNpc(getGeatureNPC())
  _gesture:setMobText(_mob_text_table[GEATURE_CRANE])
  _gesture:run()
end
function SetupGeatureCraneNear()
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_crane_01"), nil, {pointing = true, positiveRate = 1})
  _gesture:setNpc(getGeatureNPC())
  _gesture:setMobText(_mob_text_table[GEATURE_CRANE_NEAR])
  _gesture:run()
end
function SetupGeatureShop()
  _gesture:setNaviTarget(Fn_findNpc(_son_name), Vector(0, 1.5, 0), {pointing = true, positiveRate = 0.5})
  _gesture:setNpc(getGeatureNPC())
  _gesture:setMobText(_mob_text_table[GEATURE_SHOP])
  _gesture:run()
end
function SetupGeatureShopNear()
  _gesture:setNaviTarget(Fn_findNpc(_son_name), Vector(0, 1.5, 0), {pointing = true, positiveRate = 0.75})
  _gesture:setNpc(getGeatureNPC())
  _gesture:setMobText(_mob_text_table[GEATURE_SHOP_NEAR])
  _gesture:run()
end
