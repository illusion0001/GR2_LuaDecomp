dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep05_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Misc/gesture.lua")
PHOTO_BOX_MAX = 18
_cat_navi_view = false
_more_important_navi_view = false
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_in_market = false
_only_marcket_phase = false
_vogo_task = nil
_mob_text_table = {
  {
    man39 = {
      unknown_kaiwa = "ep05_00115k",
      reply_caption_skip = true,
      reply_yes = {text = "ep05_00140", time = 2},
      reply_no = {text = "ep05_00115", time = 2}
    },
    man38 = {
      known_kaiwa = "ep05_00116k",
      reply_yes = {text = "ep05_00140", time = 2},
      reply_no = {text = "ep05_00115", time = 2}
    },
    wom25 = {
      known_kaiwa = "ep05_00117k",
      reply_yes = {text = "ep05_00140", time = 2},
      reply_no = {text = "ep05_00115", time = 2}
    },
    other = {
      {
        reply_yes = {text = "ep05_00140", time = 2},
        reply_no = {text = "ep05_00121", time = 2}
      },
      {
        reply_yes = {text = "ep05_00141", time = 2},
        reply_no = {text = "ep05_00127", time = 2}
      },
      {
        reply_yes = {text = "ep05_00142", time = 2},
        reply_no = {text = "ep05_00133", time = 2}
      }
    }
  },
  {
    other = {
      {
        reply_yes = {text = "ep05_00120", time = 2},
        reply_no = {text = "ep05_00121", time = 2}
      },
      {
        reply_yes = {text = "ep05_00126", time = 2},
        reply_no = {text = "ep05_00127", time = 2}
      },
      {
        reply_yes = {text = "ep05_00132", time = 2},
        reply_no = {text = "ep05_00133", time = 2}
      }
    }
  },
  {
    other = {
      {
        reply_yes = {text = "ep05_00138", time = 2},
        reply_no = {text = "ep05_00139", time = 2}
      }
    }
  }
}
_mob_text_market = {}
_mob_text_market[0] = {
  other = {
    {
      reply_yes = {text = "ep05_00143", time = 2},
      reply_no = {text = "ep05_00139", time = 2}
    }
  }
}
_mob_text_market[1] = {
  other = {
    {
      reply_yes = {text = "ep05_00144", time = 2},
      reply_no = {text = "ep05_00139", time = 2}
    }
  }
}
_mob_text_market[2] = {
  other = {
    {
      reply_yes = {text = "ep05_00145", time = 2},
      reply_no = {text = "ep05_00139", time = 2}
    }
  }
}
_shop_motion_tbl = {
  npcgen2_man40_01 = {
    name = "npcgen2_man40_01",
    mot1 = "call_00",
    mot2 = "stay_01"
  },
  npcgen2_wom21_01 = {
    name = "npcgen2_wom21_01",
    mot1 = "lookaround",
    mot2 = "vendor_attract_00"
  },
  npcgen2_wom37_01 = {
    name = "npcgen2_wom37_01",
    mot1 = "call_00",
    mot2 = "talk_01"
  },
  npcgen2_wom22_01 = {
    name = "npcgen2_wom22_01",
    mot1 = "lookaround",
    mot2 = "vendor_attract_00"
  },
  npcgen2_man37_01 = {
    name = "npcgen2_man37_01",
    mot1 = "call_00",
    mot2 = "stay_02"
  },
  opposite_bar = {
    name = "opposite_bar",
    mot1 = "handclap",
    mot2 = "call_00"
  }
}
_shop_motion_task = {}
function Initialize()
  local L0_0
  L0_0 = Fn_userCtrlOff
  L0_0()
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_marcket_island_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_a_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_a_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_a_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_warning_a_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_a_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_area_a_02")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_catwarp_navi_kill_a_01")
  L0_0 = {
    {
      name = "npcgen2_man40_01",
      type = "man40",
      node = "locator2_man40_01",
      attach = true
    },
    {
      name = "npcgen2_wom21_01",
      type = "wom21",
      node = "locator2_wom21_01",
      attach = true
    },
    {
      name = "npcgen2_wom37_01",
      type = "wom37",
      node = "locator2_wom37_01",
      attach = true
    },
    {
      name = "npcgen2_wom22_01",
      type = "wom22",
      node = "locator2_wom22_01",
      attach = true
    },
    {
      name = "npcgen2_man37_01",
      type = "man37",
      node = "locator2_man37_01",
      attach = true
    },
    {
      name = "opposite_bar",
      type = "wom30",
      node = "locator2_opposite_bar_01",
      attach = true
    },
    {
      name = "npcgen2_cid01_01",
      type = "cid01",
      node = "locator2_cid01_01",
      attach = true
    },
    {
      name = "npcgen2_phi01_01",
      type = "phi01",
      node = "locator2_phi01_01",
      attach = true
    },
    {
      name = "ryz01",
      type = "ryz01",
      node = "locator2_ryz01_01",
      attach = true
    },
    {
      name = "ep05_follower01",
      type = "man50",
      node = "locator2_follower01_01",
      attach = true
    },
    {
      name = "ep05_follower02",
      type = "man51",
      node = "locator2_follower02_01",
      attach = true
    }
  }
  Fn_setupNpc(L0_0)
  _sdemo_cut01 = SDemo.create("cut01")
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5
  L0_1(L1_2)
  for L3_4 = 1, 17 do
    L4_5:setActive(false)
  end
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1(L1_2)
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2, L2_3)
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1(L1_2)
  L0_1(L1_2, L2_3)
  for L3_4, L4_5 in L0_1(L1_2) do
    _shop_motion_task[L4_5.name] = Fn_playLoopMotionInsert(L4_5.name, L4_5.mot1, {
      L4_5.mot2
    }, 5, 5)
    print(L4_5.name, L4_5.mot1)
  end
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2, L2_3)
  L0_1(L1_2, L2_3)
  L0_1()
  L3_4 = false
  L0_1(L1_2, L2_3, L3_4)
  L0_1()
  L0_1(L1_2)
  L0_1(L1_2)
  L0_1()
  L0_1(L1_2)
  L1_2.in_game_preview = "k_photo_ep0501"
  L0_1.view = L1_2
  L1_2(L2_3)
  L3_4 = gestureCancelFunc
  _gesture = L1_2
  L3_4 = findGameObject2
  L3_4 = L3_4(L4_5, "locator2_market_center")
  L1_2(L2_3, L3_4, L4_5, {positiveRate = 0.5})
  L3_4 = {
    L4_5,
    Fn_findNpcPuppet("ryz01"),
    Fn_findNpcPuppet("npcgen2_man40_01"),
    Fn_findNpcPuppet("npcgen2_wom21_01"),
    Fn_findNpcPuppet("npcgen2_wom37_01"),
    Fn_findNpcPuppet("npcgen2_wom22_01"),
    Fn_findNpcPuppet("npcgen2_man37_01"),
    Fn_findNpcPuppet("opposite_bar")
  }
  L1_2(L2_3, L3_4)
  L3_4 = _mob_text_table
  L3_4 = L3_4[1]
  L1_2(L2_3, L3_4)
  L1_2(L2_3)
  L1_2(L2_3)
  L3_4 = "getVogoBoxBroken"
  L3_4 = false
  repeat
    for _FORV_7_, _FORV_8_ in L4_5(_shop_motion_tbl) do
      if _FORV_8_.name == "npcgen2_wom37_01" or _FORV_8_.name == "npcgen2_wom22_01" then
      elseif _npc_kaiwa_table[_FORV_8_.name].cnt == 1 then
        break
      end
    end
    if L2_3 ~= L3_4 then
      if L2_3 == true then
        L4_5(L4_5)
      else
        L4_5(L4_5)
      end
    end
    L3_4 = L2_3
    L4_5()
  until L1_2 == true
  L4_5("\232\170\176\227\129\139\227\129\171\227\131\158\227\131\188\227\130\177\227\131\131\227\131\136\227\129\160\227\129\168\230\149\153\227\129\136\227\129\166\227\130\130\227\130\137\227\129\163\227\129\159")
  if L4_5 == 0 then
    L4_5("pccubesensor2_a_01")
    if L4_5 == 0 then
      L4_5("pccubesensor2_a_02")
      L4_5()
      L4_5("pccubesensormulti2_marcket_island_01")
      while true do
        if L4_5 == true then
        end
        if L4_5 then
          L4_5()
        end
      end
      L4_5(L4_5)
      L4_5("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\228\184\128\230\151\166\229\129\156\230\173\162")
      L4_5("pccubesensor2_a_02")
      L4_5("pccubesensor2_catwarp_warning_a_01")
      L4_5("pccubesensor2_catwarp_area_a_01")
      L4_5("pccubesensor2_catwarp_navi_kill_a_01")
      if L4_5 == false then
        L4_5("ep05_00104")
      else
        L4_5(3.5)
        L4_5("ep05_00105")
      end
      L4_5()
    end
    L4_5("pccubesensor2_catwarp_warning_a_02")
    L4_5("pccubesensor2_catwarp_area_a_02")
    L4_5("locator2_pc_catwarp_pos_a_02")
    L4_5()
    L4_5(1)
    L4_5(L4_5)
    L4_5(L4_5, nil, nil, {pointing = false, positiveRate = 0.5})
    L4_5(L4_5, _mob_text_market[0])
    L4_5(L4_5, {
      Fn_findNpcPuppet("npcgen2_man40_01"),
      Fn_findNpcPuppet("npcgen2_wom21_01"),
      Fn_findNpcPuppet("npcgen2_wom37_01"),
      Fn_findNpcPuppet("npcgen2_wom22_01"),
      Fn_findNpcPuppet("npcgen2_man37_01"),
      Fn_findNpcPuppet("opposite_bar")
    })
    L4_5(L4_5)
    L4_5("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\229\134\141\233\150\139")
    _only_marcket_phase = true
    if L4_5 == 0 then
      if L4_5 == false then
        L4_5("ep05_00106")
      else
        L4_5("ep05_00107")
      end
    end
    L4_5("ep05_00108")
    Mv_waitPhase()
    Fn_naviKill()
  end
  L4_5(L4_5)
  L4_5(L4_5)
  _gesture = nil
  L4_5("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\231\181\130\228\186\134")
  for _FORV_7_, _FORV_8_ in L4_5(_shop_motion_tbl) do
    _shop_motion_task[_FORV_8_.name] = Mv_safeTaskAbort(_shop_motion_task[_FORV_8_.name])
  end
  L4_5()
  L4_5()
  L4_5()
  L4_5()
end
function Finalize()
  local L0_6, L1_7
end
function pccubesensormulti2_marcket_island_01_OnEnter()
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_market_center"), Vector(0, 1.5, 0), {positiveRate = 0.5})
  _gesture:setMobText(_mob_text_table[2])
  print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\227\131\158\227\130\177\229\179\182\229\134\133\232\168\173\229\174\154\227\129\171\229\164\137\230\155\180")
end
function pccubesensormulti2_marcket_island_01_OnLeave()
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_market_center"), Vector(0, 1.5, 0), {positiveRate = 0.5})
  _gesture:setMobText(_mob_text_table[1])
  print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\227\131\158\227\130\177\229\179\182\229\164\150\232\168\173\229\174\154\227\129\171\229\164\137\230\155\180")
end
function pccubesensor2_a_01_OnEnter()
  _in_market = true
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_market_center"), Vector(0, 1.5, 0), {pointing = false, positiveRate = 0.5})
  _gesture:setMobText(_mob_text_table[3])
  print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\227\131\158\227\130\177\229\134\133\232\168\173\229\174\154\227\129\171\229\164\137\230\155\180")
end
function pccubesensor2_a_01_OnLeave()
  _in_market = false
  _gesture:setNaviTarget(findGameObject2("Node", "locator2_market_center"), Vector(0, 1.5, 0), {positiveRate = 0.5})
  _gesture:setMobText(_mob_text_table[2])
  print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\239\188\154\227\131\158\227\130\177\229\179\182\229\134\133\232\168\173\229\174\154\227\129\171\229\164\137\230\155\180")
end
function pccubesensor2_a_02_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_a_02_OnLeave()
  local L0_8, L1_9
end
function pccubesensor2_catwarp_warning_a_01_OnLeave()
  invokeTask(function()
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    if _more_important_navi_view == false then
      Fn_naviSet(findGameObject2("Node", "pccubesensor2_catwarp_warning_a_01"))
      _cat_navi_view = true
    end
    Fn_captionViewWait("ep05_00150")
  end)
end
function pccubesensor2_catwarp_area_a_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function pccubesensor2_catwarp_navi_kill_a_01_OnEnter()
  if _cat_navi_view then
    Fn_naviKill()
    _cat_navi_view = false
  end
end
function pccubesensor2_catwarp_warning_a_02_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("ep05_09000")
    Player:setStay(false)
  end)
end
function pccubesensor2_catwarp_area_a_02_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function playSdemoCut01()
  Fn_userCtrlAllOff()
  Fn_setKittenAndCatActive(false)
  _sdemo_cut01:set(findGameObject2("Node", "locator2_cam_a_01"), findGameObject2("Node", "locator2_aim_a_01"))
  _sdemo_cut01:play(nil, {
    {
      pos = "locator2_aim_a_02",
      time = 4
    }
  })
  Player:setLookAtIk(true, 1, findGameObject2("Node", "pccubesensor2_a_01"):getWorldPos())
  print("PC\227\130\191\227\131\188\227\131\179\233\150\139\229\167\139")
  while _sdemo_cut01:isPlay() do
    wait()
  end
  _sdemo_cut01:stop()
  Fn_setKittenAndCatActive(true)
  Player:setLookAtIk(false, 1, findGameObject2("Node", "pccubesensor2_a_01"):getWorldPos())
  print("PC\227\130\191\227\131\188\227\131\179\231\181\130\228\186\134")
end
function naviMarket()
  local L0_10
  L0_10 = findGameObject2
  L0_10 = L0_10("Node", "locator2_market_center")
  while true do
    if _more_important_navi_view == false and Fn_getDistanceToPlayer(L0_10) > 70 then
      if _gesture ~= nil then
        _gesture:stop()
      end
      _more_important_navi_view = true
      Fn_naviSet(L0_10)
      Fn_captionView("ep05_00109")
    elseif _more_important_navi_view == true and Fn_getDistanceToPlayer(L0_10) <= 45 then
      if _gesture ~= nil then
        _gesture:run()
      end
      _more_important_navi_view = false
      Fn_naviKill()
      Fn_captionView("ep05_00146")
    end
    wait()
  end
end
function gestureCancelFunc()
  local L0_11, L1_12
  _decide_flag = true
  L0_11 = _cancel_flag
  return L0_11
end
function gestureBreakFunc()
  if _only_marcket_phase then
    _gesture:setMobText(_mob_text_market[_gesture:getKnownCount() % 3])
    print("setMobText\239\188\154_mob_text_market\229\134\133\227\129\167\229\136\135\230\155\191\239\188\129")
    return _break_flag
  end
end
_npc_kaiwa_table = {
  npcgen2_man40_01 = {
    cnt = 0,
    kaiwa = "ep05_00120k",
    answer = true
  },
  npcgen2_wom21_01 = {
    cnt = 0,
    kaiwa = "ep05_00123k",
    caption = "ep05_00100"
  },
  npcgen2_wom37_01 = {
    cnt = 0,
    kaiwa = "ep05_00124k",
    caption = "ep05_00101"
  },
  npcgen2_wom22_01 = {
    cnt = 0,
    kaiwa = "ep05_00121k"
  },
  npcgen2_man37_01 = {
    cnt = 0,
    kaiwa = "ep05_00122k",
    caption = "ep05_00102"
  },
  opposite_bar = {
    cnt = 0,
    kaiwa = "ep05_00125k",
    caption = "ep05_00147"
  },
  ep05_vogo_01 = {
    cnt = 0,
    kaiwa = "ep05_00111k",
    caption = "ep05_00148"
  },
  ryz01 = {
    cnt = 0,
    kaiwa = "ep05_00113k",
    caption = "ep05_00148"
  }
}
function gestureNpcActionCallback(A0_13)
  local L1_14
  if A0_13 then
    L1_14 = A0_13.getName
    L1_14 = L1_14(A0_13)
    Fn_userCtrlOff()
    Mv_safeTaskAbort(_shop_motion_task[L1_14])
    print("_shop_motion_task:abort!!!", L1_14)
    Fn_playMotionNpc(L1_14, "stay", false, {animBlendDuration = 0.8})
    waitSeconds(1)
    Fn_turnNpc(L1_14)
    if _npc_kaiwa_table[L1_14].cnt == 0 then
      Fn_kaiwaDemoView(_npc_kaiwa_table[L1_14].kaiwa)
      _npc_kaiwa_table[L1_14].cnt = 1
    elseif L1_14 == "ep05_vogo_01" or L1_14 == "ryz01" then
      Fn_captionView(_npc_kaiwa_table[L1_14].caption)
    end
    if L1_14 == "ep05_vogo_01" or L1_14 == "ryz01" or L1_14 == "npcgen2_man40_01" then
      print("\227\129\147\227\129\174\228\186\186\227\129\159\227\129\161\227\129\175\227\131\171\227\131\188\227\131\151\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\229\134\141\233\150\139\227\129\151\227\129\170\227\129\132\239\188\129\239\188\129")
    else
      invokeTask(function()
        Fn_findNpc(L1_14):resetDirection()
        while not Fn_findNpc(L1_14):isTurnEnd() do
          wait()
        end
        _shop_motion_task[L1_14] = Fn_playLoopMotionInsert(L1_14, _shop_motion_tbl[L1_14].mot1, {
          _shop_motion_tbl[L1_14].mot2
        }, 5, 5)
        print("\227\131\171\227\131\188\227\131\151\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\229\134\141\233\150\139\239\188\129\239\188\129")
      end)
    end
    Fn_userCtrlOn()
    if not _npc_kaiwa_table[L1_14].caption or L1_14 == "ep05_vogo_01" or L1_14 == "ryz01" then
    else
      Fn_captionView(_npc_kaiwa_table[L1_14].caption)
    end
    if _npc_kaiwa_table[L1_14].answer == true then
      Mv_gotoNextPhase()
    end
  else
  end
end
