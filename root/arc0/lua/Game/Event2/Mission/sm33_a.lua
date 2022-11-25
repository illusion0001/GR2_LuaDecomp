dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm33_common.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Misc/pdemo.lua")
_puppet_tbl = {}
_set_navi_phase = false
_npc_watch_node = {}
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_talk_man = false
_next_destination = false
_is_warning = false
_is_costume_change = false
_gesture_phase = 0
PHASE00 = 0
PHASE01 = 1
PHASE02 = 2
PHASE03 = 3
_mob_txt = {
  [1] = {
    man70 = {
      known_kaiwa = "sm33_00150k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    man71 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom38 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom39 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom40 = {
      known_kaiwa = "sm33_00151k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    other = {
      {
        reply_yes = {text = nil, time = nil},
        reply_no = {text = "sm33_09000", time = 2}
      }
    }
  },
  [2] = {
    man70 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    man71 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom38 = {
      known_kaiwa = "sm33_00170k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    wom39 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom40 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    other = {
      {
        reply_yes = {text = nil, time = nil},
        reply_no = {text = "sm33_09000", time = 2}
      }
    }
  },
  [3] = {
    man70 = {
      known_kaiwa = "sm33_00202k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    man71 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom38 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom39 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom40 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    other = {
      {
        reply_yes = {text = nil, time = nil},
        reply_no = {text = "sm33_09000", time = 2}
      }
    }
  },
  [4] = {
    man70 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    man71 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom38 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom39 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom40 = {
      known_kaiwa = "sm33_00203k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    other = {
      {
        reply_yes = {text = nil, time = nil},
        reply_no = {text = "sm33_09000", time = 2}
      }
    }
  },
  [5] = {
    man70 = {
      known_kaiwa = "sm33_00200k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    man71 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom38 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom39 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom40 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    other = {
      {
        reply_yes = {text = nil, time = nil},
        reply_no = {text = "sm33_09000", time = 2}
      }
    }
  },
  [6] = {
    man70 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    man71 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom38 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom39 = {
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00119", time = 2}
    },
    wom40 = {
      known_kaiwa = "sm33_00201k",
      reply_caption_skip = true,
      reply_yes = {text = nil, time = nil},
      reply_no = {text = "sm33_00118", time = 2}
    },
    other = {
      {
        reply_yes = {text = nil, time = nil},
        reply_no = {text = "sm33_09000", time = 2}
      }
    }
  }
}
function Initialize()
  local L0_0
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shinbun_kanran_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_shinbun_megami_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_grab")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensor2_door_yumemi_01")
  L0_0 = Fn_pcSensorOff
  L0_0("pccubesensormulti2_school_area_01")
  L0_0 = {
    {
      name = "sm33_man_gishiki_01",
      type = "man70",
      node = "locator2_man_gishiki_01",
      anim_name = "sit_00"
    },
    {
      name = "sm33_man_gishiki_02",
      type = "man70",
      node = "locator2_man_gishiki_02",
      anim_name = "sit_01"
    },
    {
      name = "sm33_wom_gishiki_01",
      type = "wom40",
      node = "locator2_wom_gishiki_01",
      anim_name = "sit_01"
    },
    {
      name = "sm33_wom_gishiki_02",
      type = "wom40",
      node = "locator2_wom_gishiki_02",
      anim_name = "sit_00"
    },
    {
      name = "sm33_wom_kaidan_01",
      type = "wom38",
      node = "locator2_wom_kaidan_01",
      anim_name = "stay_03"
    },
    {
      name = "sm33_wom_kaidan_02",
      type = "wom38",
      node = "locator2_wom_kaidan_02",
      anim_name = "sit_01"
    },
    {
      name = "sm33_man_megami_01",
      type = "man70",
      node = "locator2_man_megami_01",
      anim_name = "stay_02"
    },
    {
      name = "sm33_wom_megami_01",
      type = "wom40",
      node = "locator2_wom_megami_01",
      anim_name = "stay_01"
    },
    {
      name = "sm33_man_kanran_01",
      type = "man70",
      node = "locator2_man_kanran_01",
      anim_name = "sit_01"
    },
    {
      name = "sm33_wom_kanran_01",
      type = "wom40",
      node = "locator2_wom_kanran_01",
      anim_name = "stay_01"
    },
    {
      name = "sm33_man_shinbun_01",
      type = "man71",
      node = "locator2_man_shinbun_megami_01",
      active = false
    },
    {
      name = "sm33_shinbun_talk",
      type = "wom39",
      node = "locator2_shinbunn_talk",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _puppet_tbl.sm33_client = Fn_findNpcPuppet("sm33_client")
  _polydemo = PDemo.create("kit18_stu_00", findGameObject2("Node", "locator2_resetpos_demo_cos_01"), {camera = true, scene_param = false})
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22
  L0_1 = Fn_userCtrlOff
  L0_1()
  L0_1 = Fn_loadPlayerMotion
  L1_2 = {L2_3}
  L0_1(L1_2)
  L0_1 = Fn_playPlayerMotion
  L1_2 = "kit01_stay_00"
  L0_1(L1_2, L2_3)
  L0_1 = {}
  L0_1.idle_sm49_00 = "man01_idle_sm49_00"
  L0_1.talk_agree = "man01_talk_agree_00"
  L1_2 = Fn_loadNpcEventMotion
  L1_2(L2_3, L3_4)
  L1_2 = {}
  L2_3.name = "sm33_wom_kaidan_01"
  L5_6 = 1.5
  L6_7 = 2
  L2_3.offset = L3_4
  L1_2.sm33_wom_kaidan_01 = L2_3
  L2_3.name = "sm33_man_megami_01"
  L5_6 = 1.5
  L6_7 = 2
  L2_3.offset = L3_4
  L1_2.sm33_man_megami_01 = L2_3
  L2_3.name = "sm33_wom_megami_01"
  L5_6 = 2.5
  L6_7 = 2
  L2_3.offset = L3_4
  L1_2.sm33_wom_megami_01 = L2_3
  L2_3.name = "sm33_wom_kanran_01"
  L5_6 = 2.5
  L6_7 = 2
  L2_3.offset = L3_4
  L1_2.sm33_wom_kanran_01 = L2_3
  for L5_6, L6_7 in L2_3(L3_4) do
    L7_8 = _npc_watch_node
    L8_9 = createNpcWatchNode
    L9_10 = L6_7.name
    L10_11 = L6_7.offset
    L8_9 = L8_9(L9_10, L10_11)
    L7_8[L5_6] = L8_9
  end
  L2_3()
  L2_3(L3_4)
  L3_4.npc = "sm33_man_gishiki_01"
  L3_4.name = "g1_bench_iy_01_08"
  L3_4.area = "g1_base_ed_f1_a_road"
  L3_4.hdl = nil
  L4_5.npc = "sm33_wom_gishiki_01"
  L4_5.name = "g1_bench_iy_01_01"
  L4_5.area = "g1_base_ed_c1_road"
  L4_5.hdl = nil
  L5_6 = {}
  L5_6.npc = "sm33_man_gishiki_02"
  L5_6.name = "g1_bench_iy_01_08"
  L5_6.area = "g1_base_ed_c1_road"
  L5_6.hdl = nil
  L6_7 = {}
  L6_7.npc = "sm33_wom_gishiki_02"
  L6_7.name = "g1_bench_iy_01_03"
  L6_7.area = "g1_base_ed_a1_road"
  L6_7.hdl = nil
  L7_8 = {}
  L7_8.npc = "sm33_man_kanran_01"
  L7_8.name = "g1_bench_iy_01_017"
  L7_8.area = "g1_base_ed_a1_road"
  L7_8.hdl = nil
  L8_9 = {}
  L8_9.npc = "sm33_wom_kaidan_02"
  L8_9.name = "g1_bench_iy_01_02"
  L8_9.area = "g1_base_ed_d1_road"
  L8_9.hdl = nil
  function L5_6()
    repeat
      for _FORV_3_, _FORV_4_ in pairs(L2_3) do
        if Fn_getDistanceToPlayer(_puppet_tbl[_FORV_4_.npc]) <= 60 then
          if _FORV_4_.hdl == nil then
            _FORV_4_.hdl = Fn_findAreaHandle(_FORV_4_.area)
          end
          while true do
            if _FORV_4_.hdl:findChildNode(_FORV_4_.name, true) ~= nil then
              _FORV_4_.hdl:findChildNode(_FORV_4_.name, true):setIgnoreGrab(true)
              _FORV_4_.hdl:findChildNode(_FORV_4_.name, true):setDetectable(false)
              _FORV_4_.hdl:findChildNode(_FORV_4_.name, true):setEventListener("judge", L3_4)
              break
            end
            wait()
          end
        end
      end
      wait()
    until false
  end
  L4_5(L5_6)
  L5_6 = "sm33_00100k"
  L4_5(L5_6)
  while true do
    L5_6 = L4_5
    if L4_5 == false then
      L4_5()
    end
  end
  L5_6 = L4_5
  L4_5(L5_6)
  while true do
    L5_6 = L4_5
    if L4_5 == false then
      L4_5()
    end
  end
  L4_5()
  L5_6 = L4_5
  L6_7 = 0
  L4_5(L5_6, L6_7)
  L5_6 = L4_5
  L4_5(L5_6)
  L5_6 = "kit18"
  L4_5(L5_6)
  L5_6 = true
  L4_5(L5_6)
  L4_5()
  L5_6 = "locator2_pc_start_pos"
  L4_5(L5_6)
  _is_costume_change = true
  L5_6 = "locator2_pc_start_pos"
  L4_5(L5_6)
  L4_5()
  L5_6 = 1
  L4_5(L5_6)
  L4_5()
  L5_6 = "pccubesensormulti2_school_area_01"
  L4_5(L5_6)
  L5_6 = "sm33_client"
  L6_7 = "stay_02"
  L7_8 = false
  L4_5(L5_6, L6_7, L7_8)
  L5_6 = "sm33_00101"
  L4_5(L5_6)
  L5_6 = 1.3
  L4_5(L5_6)
  L5_6 = "sm33_00100"
  L4_5(L5_6)
  _gesture_phase = L4_5
  function L5_6()
    local L0_23, L1_24
    L0_23 = _break_flag
    return L0_23
  end
  L6_7 = GestureEvent
  L6_7 = L6_7.create
  L7_8 = "ui_event_guide_02"
  L8_9 = L4_5
  L9_10 = L5_6
  L10_11 = gestureNpcActionCallback
  L6_7 = L6_7(L7_8, L8_9, L9_10, L10_11)
  _gesture = L6_7
  L6_7 = {
    L7_8,
    L8_9,
    L9_10,
    L10_11,
    L11_12,
    L12_13,
    L13_14,
    L14_15,
    L15_16,
    L16_17,
    L17_18
  }
  L7_8 = _puppet_tbl
  L7_8 = L7_8.sm33_client
  L8_9 = _puppet_tbl
  L8_9 = L8_9.sm33_man_gishiki_01
  L9_10 = _puppet_tbl
  L9_10 = L9_10.sm33_man_gishiki_02
  L10_11 = _puppet_tbl
  L10_11 = L10_11.sm33_wom_gishiki_01
  L11_12 = _puppet_tbl
  L11_12 = L11_12.sm33_wom_gishiki_02
  L12_13 = _puppet_tbl
  L12_13 = L12_13.sm33_wom_kaidan_01
  L13_14 = _puppet_tbl
  L13_14 = L13_14.sm33_wom_kaidan_02
  L14_15 = _puppet_tbl
  L14_15 = L14_15.sm33_man_megami_01
  L15_16 = _puppet_tbl
  L15_16 = L15_16.sm33_wom_megami_01
  L16_17 = _puppet_tbl
  L16_17 = L16_17.sm33_man_kanran_01
  L17_18 = _puppet_tbl
  L17_18 = L17_18.sm33_wom_kanran_01
  function L7_8(A0_25)
    if A0_25.stdAppearance == false then
      return true
    end
  end
  function L8_9()
    _gesture:setNaviTarget(nil, nil, {
      classGroup = "yy_navi_sm33_01",
      positiveRate = 0
    })
    _gesture:setNpc(L6_7)
    _gesture:setAsking(false)
    _gesture:setMobText(_mob_txt[1])
    _gesture:setOverrideNoFunc(L7_8)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139\227\128\144\239\188\145\227\128\145")
  end
  function L9_10()
    _gesture:setNaviTarget(nil, nil, {
      classGroup = "yy_navi_sm33_02",
      positiveRate = 0
    })
    _gesture:setNpc(L6_7)
    _gesture:setAsking(false)
    _gesture:setMobText(_mob_txt[2])
    _gesture:setOverrideNoFunc(L7_8)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139\227\128\144\239\188\146\227\128\145")
  end
  function L10_11()
    _gesture:setNaviTarget(nil, nil, {
      classGroup = "yy_navi_sm33_03",
      positiveRate = 0
    })
    _gesture:setNpc(L6_7)
    _gesture:setAsking(false)
    _gesture:setMobText(_mob_txt[3])
    _gesture:setOverrideNoFunc(L7_8)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139\227\128\144\239\188\147\227\128\145")
  end
  function L11_12()
    _gesture:setNaviTarget(nil, nil, {
      classGroup = "yy_navi_sm33_04",
      positiveRate = 0
    })
    _gesture:setNpc(L6_7)
    _gesture:setAsking(false)
    _gesture:setMobText(_mob_txt[4])
    _gesture:setOverrideNoFunc(L7_8)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139\227\128\144\239\188\148\227\128\145")
  end
  function L12_13()
    _gesture:setNaviTarget(nil, nil, {
      classGroup = "yy_navi_sm33_03",
      positiveRate = 0
    })
    _gesture:setNpc(L6_7)
    _gesture:setAsking(false)
    _gesture:setMobText(_mob_txt[5])
    _gesture:setOverrideNoFunc(L7_8)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139\227\128\144\239\188\149\227\128\145")
  end
  function L13_14()
    _gesture:setNaviTarget(nil, nil, {
      classGroup = "yy_navi_sm33_04",
      positiveRate = 0
    })
    _gesture:setNpc(L6_7)
    _gesture:setAsking(false)
    _gesture:setMobText(_mob_txt[6])
    _gesture:setOverrideNoFunc(L7_8)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\188\227\130\164\227\131\153\227\131\179\227\131\136\233\150\139\229\167\139\227\128\144\239\188\150\227\128\145")
  end
  L14_15 = L8_9
  L14_15()
  repeat
    L14_15 = wait
    L14_15()
    L14_15 = _gesture
    L15_16 = L14_15
    L14_15 = L14_15.getKnownKaiwaDemoCount
    L14_15 = L14_15(L15_16)
  until L14_15 >= 1
  L14_15 = _gesture
  L15_16 = L14_15
  L14_15 = L14_15.getInteractionMobType
  L14_15 = L14_15(L15_16)
  if L14_15 ~= nil then
    L14_15 = _gesture
    L15_16 = L14_15
    L14_15 = L14_15.getInteractionMobType
    L14_15 = L14_15(L15_16)
    if L14_15 == "man70" then
      _talk_man = true
    end
  end
  L14_15 = _gesture
  L15_16 = L14_15
  L14_15 = L14_15.stop
  L14_15(L15_16)
  L14_15 = waitSeconds
  L15_16 = 1
  L14_15(L15_16)
  L14_15 = Fn_captionView
  L15_16 = "sm33_00103"
  L14_15(L15_16)
  L14_15 = L9_10
  L14_15()
  repeat
    L14_15 = wait
    L14_15()
    L14_15 = _gesture
    L15_16 = L14_15
    L14_15 = L14_15.getKnownKaiwaDemoCount
    L14_15 = L14_15(L15_16)
  until L14_15 >= 2
  L14_15 = _gesture
  L15_16 = L14_15
  L14_15 = L14_15.stop
  L14_15(L15_16)
  L14_15 = waitSeconds
  L15_16 = 1
  L14_15(L15_16)
  L14_15 = Fn_captionView
  L15_16 = "sm33_00104"
  L14_15(L15_16)
  L14_15 = Fn_getDistanceToPlayer
  L15_16 = findGameObject2
  L16_17 = "Node"
  L17_18 = "locator2_kanran_01"
  L21_22 = L15_16(L16_17, L17_18)
  L14_15 = L14_15(L15_16, L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L15_16(L16_17, L17_18))
  L15_16 = Fn_getDistanceToPlayer
  L16_17 = findGameObject2
  L17_18 = "Node"
  L18_19 = "locator2_megami_01"
  L21_22 = L16_17(L17_18, L18_19)
  L15_16 = L15_16(L16_17, L17_18, L18_19, L19_20, L20_21, L21_22, L16_17(L17_18, L18_19))
  if L14_15 < L15_16 then
    _next_destination = true
  end
  while true do
    L16_17 = _gesture
    L16_17 = L16_17.known_kdemo_cnt
    if L16_17 ~= 3 then
      L16_17 = Fn_getDistanceToPlayer
      L17_18 = findGameObject2
      L18_19 = "Node"
      L19_20 = "locator2_kanran_01"
      L21_22 = L17_18(L18_19, L19_20)
      L16_17 = L16_17(L17_18, L18_19, L19_20, L20_21, L21_22, L17_18(L18_19, L19_20))
      L14_15 = L16_17
      L16_17 = Fn_getDistanceToPlayer
      L17_18 = findGameObject2
      L18_19 = "Node"
      L19_20 = "locator2_megami_01"
      L21_22 = L17_18(L18_19, L19_20)
      L16_17 = L16_17(L17_18, L18_19, L19_20, L20_21, L21_22, L17_18(L18_19, L19_20))
      L15_16 = L16_17
      if L14_15 >= L15_16 then
        L16_17 = _next_destination
        if L16_17 == false then
          L16_17 = _gesture
          L17_18 = L16_17
          L16_17 = L16_17.stop
          L16_17(L17_18)
          L16_17 = Fn_warpNpc
          L17_18 = "sm33_man_shinbun_01"
          L18_19 = "locator2_man_shinbun_kanran_01"
          L16_17(L17_18, L18_19)
          _next_destination = true
          L16_17 = _talk_man
          if L16_17 == false then
            L16_17 = L10_11
            L16_17()
          else
            L16_17 = L11_12
            L16_17()
          end
        end
      elseif L14_15 < L15_16 then
        L16_17 = _next_destination
        if L16_17 == true then
          L16_17 = _gesture
          L17_18 = L16_17
          L16_17 = L16_17.stop
          L16_17(L17_18)
          L16_17 = Fn_warpNpc
          L17_18 = "sm33_man_shinbun_01"
          L18_19 = "locator2_man_shinbun_megami_01"
          L16_17(L17_18, L18_19)
          _next_destination = false
          L16_17 = _talk_man
          if L16_17 == false then
            L16_17 = L12_13
            L16_17()
          else
            L16_17 = L13_14
            L16_17()
          end
        end
      end
      L16_17 = wait
      L16_17()
    end
  end
  L16_17 = _gesture
  L17_18 = L16_17
  L16_17 = L16_17.stop
  L16_17(L17_18)
  _gesture = nil
  L16_17 = waitSeconds
  L17_18 = 1
  L16_17(L17_18)
  L16_17 = PHASE01
  _gesture_phase = L16_17
  L16_17 = createGameObject2
  L17_18 = "GimmickBg"
  L16_17 = L16_17(L17_18)
  L18_19 = L16_17
  L17_18 = L16_17.setDrawModelName
  L19_20 = "cicamera01_base"
  L17_18(L18_19, L19_20)
  L18_19 = L16_17
  L17_18 = L16_17.try_init
  L17_18(L18_19)
  L18_19 = L16_17
  L17_18 = L16_17.waitForReady
  L17_18(L18_19)
  L18_19 = L16_17
  L17_18 = L16_17.try_start
  L17_18(L18_19)
  L17_18 = Fn_attachJoint
  L18_19 = L16_17
  L19_20 = _puppet_tbl
  L19_20 = L19_20.sm33_man_shinbun_01
  L20_21 = "loc_r_hand"
  L17_18(L18_19, L19_20, L20_21)
  L17_18 = Fn_setNpcActive
  L18_19 = "sm33_man_shinbun_01"
  L19_20 = true
  L17_18(L18_19, L19_20)
  L17_18 = _next_destination
  if L17_18 == false then
    L17_18 = Mv_viewObjCancelByCameraInput
    L18_19 = "locator2_megami_01"
    L19_20 = 0.3
    L17_18(L18_19, L19_20)
    L17_18 = Fn_naviSet
    L18_19 = findGameObject2
    L19_20 = "Node"
    L20_21 = "locator2_megami_01"
    L21_22 = L18_19(L19_20, L20_21)
    L17_18(L18_19, L19_20, L20_21, L21_22, L18_19(L19_20, L20_21))
    L17_18 = Fn_setNpcActive
    L18_19 = "sm33_shinbun_talk"
    L19_20 = true
    L17_18(L18_19, L19_20)
    L17_18 = Fn_pcSensorOn
    L18_19 = "pccubesensor2_shinbun_megami_01"
    L17_18(L18_19)
  else
    L17_18 = Mv_viewObjCancelByCameraInput
    L18_19 = "locator2_kanran_01"
    L19_20 = 0.3
    L17_18(L18_19, L19_20)
    L17_18 = Fn_naviSet
    L18_19 = findGameObject2
    L19_20 = "Node"
    L20_21 = "locator2_kanran_01"
    L21_22 = L18_19(L19_20, L20_21)
    L17_18(L18_19, L19_20, L20_21, L21_22, L18_19(L19_20, L20_21))
    L17_18 = Fn_pcSensorOn
    L18_19 = "pccubesensor2_shinbun_kanran_01"
    L17_18(L18_19)
  end
  _set_navi_phase = false
  L17_18 = Fn_captionView
  L18_19 = "sm33_00105"
  L17_18(L18_19)
  L17_18 = _next_destination
  if L17_18 then
    L17_18 = Fn_playNpcEventMotion
    L18_19 = "sm33_man_shinbun_01"
    L19_20 = L0_1.idle_sm49_00
    L20_21 = -1
    L21_22 = 0
    L17_18(L18_19, L19_20, L20_21, L21_22, false, {animBlendDuration = 1})
  else
    L17_18 = Fn_playNpcEventMotion
    L18_19 = "sm33_man_shinbun_01"
    L19_20 = L0_1.idle_sm49_00
    L20_21 = -1
    L21_22 = 0
    L17_18(L18_19, L19_20, L20_21, L21_22, false, {animBlendDuration = 1})
    L17_18 = Fn_playMotionNpc
    L18_19 = "sm33_shinbun_talk"
    L19_20 = {
      L20_21,
      L21_22,
      "talk_02"
    }
    L20_21 = "talk_00"
    L21_22 = "talk_01"
    L20_21 = false
    L21_22 = {}
    L21_22.isRandom = true
    L21_22.isRepeat = true
    L21_22.animBlendDuration = 1
    L17_18(L18_19, L19_20, L20_21, L21_22)
  end
  repeat
    L17_18 = wait
    L17_18()
    L17_18 = Mv_raycastCameraSight
    L18_19 = _puppet_tbl
    L18_19 = L18_19.sm33_man_shinbun_01
    L19_20 = 20
    L20_21 = nil
    L21_22 = Vector
    L21_22 = L21_22(0, 1.5, 0)
    L17_18 = L17_18(L18_19, L19_20, L20_21, L21_22, 0.9)
  until L17_18
  L17_18 = Fn_captionView
  L18_19 = "sm33_00120"
  L17_18(L18_19)
  L17_18 = Fn_pcSensorOff
  L18_19 = "pccubesensor2_shinbun_megami_01"
  L17_18(L18_19)
  L17_18 = Fn_pcSensorOff
  L18_19 = "pccubesensor2_shinbun_kanran_01"
  L17_18(L18_19)
  L17_18 = Fn_userCtrlAllOff
  L17_18()
  L17_18 = Player
  L18_19 = L17_18
  L17_18 = L17_18.setStay
  L19_20 = true
  L20_21 = false
  L17_18(L18_19, L19_20, L20_21)
  L17_18 = Fn_lookAtObject
  L18_19 = _puppet_tbl
  L18_19 = L18_19.sm33_man_shinbun_01
  L19_20 = 1.5
  L17_18 = L17_18(L18_19, L19_20)
  L18_19 = waitSeconds
  L19_20 = 1.5
  L18_19(L19_20)
  L18_19 = Fn_captionView
  L19_20 = "sm33_00106"
  L18_19(L19_20)
  L18_19 = waitSeconds
  L19_20 = 1.3
  L18_19(L19_20)
  L18_19 = Fn_naviSet
  L19_20 = _puppet_tbl
  L19_20 = L19_20.sm33_man_shinbun_01
  L18_19(L19_20)
  L18_19 = Mv_safeTaskAbort
  L19_20 = L17_18
  L18_19 = L18_19(L19_20)
  L17_18 = L18_19
  L18_19 = Player
  L19_20 = L18_19
  L18_19 = L18_19.setStay
  L20_21 = false
  L18_19(L19_20, L20_21)
  L18_19 = Fn_userCtrlOn
  L18_19()
  while true do
    L18_19 = Fn_getDistanceToPlayer
    L19_20 = _puppet_tbl
    L19_20 = L19_20.sm33_man_shinbun_01
    L18_19 = L18_19(L19_20)
    if L18_19 >= 5 then
      L18_19 = wait
      L18_19()
    end
  end
  L18_19 = waitSeconds
  L19_20 = 0.3
  L18_19(L19_20)
  L18_19 = Fn_userCtrlAllOff
  L18_19()
  L18_19 = Fn_naviKill
  L18_19()
  L18_19 = Fn_playMotionNpc
  L19_20 = "sm33_shinbun_talk"
  L20_21 = "stay_02"
  L21_22 = false
  L18_19(L19_20, L20_21, L21_22, {animBlendDuration = 0.6})
  L18_19 = Fn_turnNpc
  L19_20 = "sm33_man_shinbun_01"
  L18_19(L19_20)
  L18_19 = Fn_kaiwaDemoView
  L19_20 = "sm33_00250k"
  L18_19(L19_20)
  L18_19 = Fn_userCtrlOn
  L18_19()
  L18_19 = _next_destination
  if L18_19 then
    L18_19 = Fn_playNpcEventMotion
    L19_20 = "sm33_man_shinbun_01"
    L20_21 = L0_1.idle_sm49_00
    L21_22 = -1
    L18_19(L19_20, L20_21, L21_22, 0, false, {animBlendDuration = 1})
  else
    L18_19 = Fn_turnNpc
    L19_20 = "sm33_man_shinbun_01"
    L20_21 = _puppet_tbl
    L20_21 = L20_21.sm33_shinbun_talk
    L18_19(L19_20, L20_21)
    L18_19 = Fn_playNpcEventMotion
    L19_20 = "sm33_man_shinbun_01"
    L20_21 = L0_1.idle_sm49_00
    L21_22 = -1
    L18_19(L19_20, L20_21, L21_22, 0, false, {animBlendDuration = 1})
    L18_19 = Fn_playMotionNpc
    L19_20 = "sm33_shinbun_talk"
    L20_21 = {
      L21_22,
      "talk_01",
      "talk_02"
    }
    L21_22 = "talk_00"
    L21_22 = false
    L18_19(L19_20, L20_21, L21_22, {
      isRandom = true,
      isRepeat = true,
      animBlendDuration = 1
    })
  end
  L18_19 = Fn_captionViewWait
  L19_20 = "sm33_00107"
  L18_19(L19_20)
  L18_19 = waitSeconds
  L19_20 = 1
  L18_19(L19_20)
  L18_19 = Fn_pcSensorOff
  L19_20 = "pccubesensormulti2_school_area_01"
  L18_19(L19_20)
  L18_19 = Fn_kaiwaDemoView
  L19_20 = "sm33_00300k"
  L18_19(L19_20)
  L18_19 = PHASE02
  _gesture_phase = L18_19
  L18_19 = Mv_invokeMissionViewNaviCaption
  L19_20 = "sm33_00108"
  L20_21 = _puppet_tbl
  L20_21 = L20_21.sm33_client
  L21_22 = nil
  L18_19 = L18_19(L19_20, L20_21, L21_22)
  L19_20 = Mv_viewObjCancelByCameraInput
  L20_21 = _puppet_tbl
  L20_21 = L20_21.sm33_client
  L21_22 = 0.3
  L19_20(L20_21, L21_22)
  while true do
    L19_20 = Fn_getDistanceToPlayer
    L20_21 = _puppet_tbl
    L20_21 = L20_21.sm33_client
    L19_20 = L19_20(L20_21)
    L20_21 = Player
    L21_22 = L20_21
    L20_21 = L20_21.getAction
    L20_21 = L20_21(L21_22)
    if L19_20 <= 4 then
      L21_22 = Player
      L21_22 = L21_22.kAction_Idle
    end
    if L20_21 ~= L21_22 then
      L21_22 = wait
      L21_22()
    end
  end
  L19_20 = Fn_naviKill
  L19_20()
  L19_20 = Player
  L20_21 = L19_20
  L19_20 = L19_20.setGrabExceptionalObject
  L21_22 = {
    "sm33_client"
  }
  L19_20(L20_21, L21_22)
  L19_20 = Fn_turnNpc
  L20_21 = "sm33_client"
  L19_20(L20_21)
  L19_20 = Fn_playMotionNpc
  L20_21 = "sm33_client"
  L21_22 = "stay"
  L19_20(L20_21, L21_22, false)
  L19_20 = Fn_kaiwaDemoView
  L20_21 = "sm33_00400k"
  L19_20(L20_21)
  L19_20 = Fn_setCatWarpCheckPoint
  L20_21 = "locator2_pc_start_pos"
  L19_20(L20_21)
  L19_20 = Fn_setGrabNpc
  L20_21 = "sm33_client"
  L21_22 = false
  L19_20(L20_21, L21_22, false)
  L19_20 = Mv_invokeMissionViewNaviCaption
  L20_21 = "sm33_00109"
  L21_22 = _puppet_tbl
  L21_22 = L21_22.sm33_client
  L19_20 = L19_20(L20_21, L21_22, nil)
  L20_21 = invokeTask
  function L21_22()
    waitSeconds(3)
    if _puppet_tbl.sm33_client:isGrabbed() == false then
      Fn_pcSensorOn("pccubesensor2_grab")
    end
  end
  L20_21(L21_22)
  while true do
    L20_21 = _puppet_tbl
    L20_21 = L20_21.sm33_client
    L21_22 = L20_21
    L20_21 = L20_21.isGrabbed
    L20_21 = L20_21(L21_22)
    if L20_21 == false then
      L20_21 = wait
      L20_21()
    end
  end
  L20_21 = Fn_pcSensorOff
  L21_22 = "pccubesensor2_grab"
  L20_21(L21_22)
  L20_21 = Mv_safeTaskAbort
  L21_22 = L19_20
  L20_21 = L20_21(L21_22)
  L19_20 = L20_21
  L20_21 = Mv_safeTaskAbort
  L21_22 = grab_sensor_task
  L20_21 = L20_21(L21_22)
  grab_sensor_task = L20_21
  L20_21 = Fn_captionViewEnd
  L20_21()
  L20_21 = Fn_naviKill
  L20_21()
  L20_21 = PHASE03
  _gesture_phase = L20_21
  L20_21 = Mv_invokeMissionViewNaviCaption
  L21_22 = nil
  L20_21 = L20_21(L21_22, "locator2_navi_yumemi_01", "sm33_00110")
  L21_22 = Mv_viewObjCancelByCameraInput
  L21_22("locator2_navi_yumemi_01")
  L21_22 = Fn_pcSensorOn
  L21_22("pccubesensor2_door_yumemi_01")
  L21_22 = invokeTask
  L21_22(function()
    waitSeconds(7)
    while true do
      if not _is_warning then
        Sound:playSE("new_006")
        Fn_captionViewWait("sm33_00111")
        break
      end
      wait()
    end
  end)
  L21_22 = Mv_waitPhase
  L21_22()
  L21_22 = Fn_pcSensorOff
  L21_22("pccubesensormulti2_warning_area_01")
  L21_22 = Fn_pcSensorOff
  L21_22("pccubesensormulti2_over_area_01")
  L21_22 = waitSeconds
  L21_22(2)
  function L21_22()
    Fn_userCtrlOff()
    Fn_resetPcPos("locator2_resetpos_yumemi_01")
    Fn_warpNpc("sm33_client", "locator2_newt_02")
  end
  Fn_kaiwaDemoView2("sm33_00500k", L21_22)
  Fn_disappearNpc("sm33_man_shinbun_01")
  waitSeconds(2)
  Fn_kaiwaDemoView("sm33_00550k")
  Fn_setGrabNpc("sm33_client", true, true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  local L0_26
  L0_26 = {
    "sm33_man_gishiki_01",
    "sm33_man_gishiki_02",
    "sm33_wom_gishiki_01",
    "sm33_wom_gishiki_02",
    "sm33_wom_kaidan_01",
    "sm33_wom_kaidan_02",
    "sm33_man_megami_01",
    "sm33_wom_megami_01",
    "sm33_man_kanran_01",
    "sm33_wom_kanran_01",
    "sm33_man_shinbun_01",
    "sm33_shinbun_talk"
  }
  for _FORV_4_ = 1, #L0_26 do
    if Fn_findNpc(L0_26[_FORV_4_]) ~= nil then
      Fn_disappearNpc(L0_26[_FORV_4_])
    end
  end
  if _FOR_() then
    Player:setGrabExceptionalObject({})
  end
  Fn_disableCostumeChange(false)
end
function pccubesensormulti2_warning_area_01_OnLeave()
  _is_warning = true
  Player:setStay(true, false)
  if _is_costume_change then
    if _gesture_phase == PHASE02 then
      Fn_captionView("sm33_00121")
    elseif _gesture_phase == PHASE03 then
      Fn_captionView("sm33_00122")
    else
      Fn_captionView("sm33_00112")
    end
  end
  if _gesture_phase == PHASE00 then
    Fn_naviSet(findGameObject2("Node", "locator2_area_over_navi_01"))
  end
  Player:setStay(false)
end
function pccubesensormulti2_warning_area_01_OnEnter()
  _is_warning = false
  if _gesture_phase == PHASE00 then
    Fn_naviKill()
  end
end
function pccubesensormulti2_over_area_01_OnLeave()
  invokeTask(function()
    Fn_catWarp()
    if _gesture_phase == PHASE03 then
      Fn_warpNpc("sm33_client", "locator2_client_reset")
      Player:setGrabObject(_puppet_tbl.sm33_client)
    end
    closeSchoolGates()
  end)
end
function pccubesensormulti2_school_area_01_OnEnter()
  Fn_captionView("sm33_00123")
end
function pccubesensor2_shinbun_kanran_01_OnEnter()
  Fn_naviKill()
  Fn_captionView("sm33_00113")
  Fn_setCatWarpCheckPoint("locator2_catwarp_kanran")
end
function pccubesensor2_shinbun_kanran_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_kanran_01"))
  Fn_captionView("sm33_00114")
end
function pccubesensor2_shinbun_megami_01_OnEnter()
  Fn_naviKill()
  Fn_captionView("sm33_00115")
  Fn_setCatWarpCheckPoint("locator2_catwarp_megami")
end
function pccubesensor2_shinbun_megami_01_OnLeave()
  Fn_naviSet(findGameObject2("Node", "locator2_megami_01"))
  Fn_captionView("sm33_00116")
end
function pccubesensor2_grab_OnEnter()
  invokeTask(function()
    Fn_tutorialCaption("grab")
  end)
end
function pccubesensor2_grab_OnLeave()
  invokeTask(function()
    Fn_tutorialCaptionKill()
    Fn_turnNpc("sm33_client")
    Fn_captionViewWait("sm33_00117")
  end)
end
function pccubesensor2_door_yumemi_01_OnEnter()
  Player:setStay(true, false)
  Player:setAction(Player.kAction_GravFall)
  Fn_naviKill()
  Fn_setGrabReleaseNpc("sm33_client")
  Fn_pcSensorOff("pccubesensor2_door_yumemi_01")
  Mv_gotoNextPhase()
  Player:setStay(false, false)
end
function gestureNpcActionCallback(A0_27)
  local L1_28, L2_29, L3_30
  if A0_27 then
    L2_29 = A0_27
    L1_28 = A0_27.getName
    L1_28 = L1_28(L2_29)
    L2_29 = print
    L3_30 = "gestureNpcActionCallback"
    L2_29(L3_30, L1_28)
    L2_29 = false
    if L1_28 == "sm33_man_gishiki_01" or L1_28 == "sm33_man_gishiki_02" or L1_28 == "sm33_wom_gishiki_01" or L1_28 == "sm33_wom_gishiki_02" or L1_28 == "sm33_wom_kaidan_02" or L1_28 == "sm33_man_kanran_01" then
      L2_29 = true
    end
    L3_30 = Fn_userCtrlOff
    L3_30()
    L3_30 = A0_27.getWorldPos
    L3_30 = L3_30(A0_27)
    L3_30 = L3_30 + Vector(0, 1.2, 0)
    Player:setLookAtIk(true, 1, L3_30)
    if L2_29 then
      Fn_watchNpc(L1_28, true)
    else
      Fn_playMotionNpc(L1_28, "stay", false)
      Fn_turnNpc(L1_28)
    end
    if L1_28 == "sm33_client" then
      Fn_playMotionNpc("sm33_client", "talk_01", false)
      Fn_captionView("sm33_00102")
      Fn_playMotionNpc("sm33_client", "stay_02", false)
    elseif _gesture.known_kdemo_cnt == 0 then
      if L1_28 == "sm33_man_gishiki_01" or L1_28 == "sm33_man_gishiki_02" or L1_28 == "sm33_man_kanran_01" or L1_28 == "sm33_man_megami_01" then
        _talk_man = true
        rightAnswersGestureAction(L1_28, "sm33_00150k", L2_29)
      elseif L1_28 == "sm33_wom_gishiki_01" or L1_28 == "sm33_wom_gishiki_02" or L1_28 == "sm33_wom_kanran_01" or L1_28 == "sm33_wom_megami_01" then
        rightAnswersGestureAction(L1_28, "sm33_00151k", L2_29)
      else
        incorrectAnswersGestureAction(L1_28, L2_29)
      end
    elseif _gesture.known_kdemo_cnt == 1 then
      if L1_28 == "sm33_wom_kaidan_01" or L1_28 == "sm33_wom_kaidan_02" then
        rightAnswersGestureAction(L1_28, "sm33_00170k", L2_29)
      else
        incorrectAnswersGestureAction(L1_28, L2_29)
      end
    elseif _gesture.known_kdemo_cnt == 2 then
      if _next_destination == false then
        if L1_28 == "sm33_man_gishiki_01" or L1_28 == "sm33_man_gishiki_02" or L1_28 == "sm33_man_kanran_01" or L1_28 == "sm33_man_megami_01" then
          if _talk_man == false then
            rightAnswersGestureAction(L1_28, "sm33_00200k", L2_29)
          else
            incorrectAnswersGestureAction(L1_28, L2_29)
          end
        elseif L1_28 == "sm33_wom_gishiki_01" or L1_28 == "sm33_wom_gishiki_02" or L1_28 == "sm33_wom_kanran_01" or L1_28 == "sm33_wom_megami_01" then
          if _talk_man == true then
            rightAnswersGestureAction(L1_28, "sm33_00201k", L2_29)
          else
            incorrectAnswersGestureAction(L1_28, L2_29)
          end
        else
          incorrectAnswersGestureAction(L1_28, L2_29)
        end
      elseif L1_28 == "sm33_man_gishiki_01" or L1_28 == "sm33_man_gishiki_02" or L1_28 == "sm33_man_kanran_01" or L1_28 == "sm33_man_megami_01" then
        if _talk_man == false then
          rightAnswersGestureAction(L1_28, "sm33_00202k", L2_29)
        else
          incorrectAnswersGestureAction(L1_28, L2_29)
        end
      elseif L1_28 == "sm33_wom_gishiki_01" or L1_28 == "sm33_wom_gishiki_02" or L1_28 == "sm33_wom_kanran_01" or L1_28 == "sm33_wom_megami_01" then
        if _talk_man == true then
          rightAnswersGestureAction(L1_28, "sm33_00203k", L2_29)
        else
          incorrectAnswersGestureAction(L1_28, L2_29)
        end
      else
        incorrectAnswersGestureAction(L1_28, L2_29)
      end
    end
    Player:setLookAtIk(false, 1, L3_30)
    Fn_userCtrlOn()
  end
end
function rightAnswersGestureAction(A0_31, A1_32, A2_33)
  Fn_kaiwaDemoView(A1_32)
  _gesture.known_kdemo_cnt = _gesture.known_kdemo_cnt + 1
  invokeTask(function()
    playDefaultMotion(A0_31, A2_33)
  end)
end
function incorrectAnswersGestureAction(A0_34, A1_35)
  invokeTask(function()
    Fn_captionView("sm33_00118")
    if not A1_35 then
      Fn_playMotionNpc(A0_34, "reply_no", true)
    end
    playDefaultMotion(A0_34, A1_35)
  end)
end
function playDefaultMotion(A0_36, A1_37)
  if A1_37 then
    waitSeconds(1)
    Fn_watchNpc(A0_36, false)
  else
    Fn_turnNpc(A0_36, _npc_watch_node[A0_36])
    Fn_findNpc(A0_36):setSightParam({
      valid = true,
      target = _npc_watch_node[A0_36],
      watchTarget = true
    })
    Fn_playMotionNpc(A0_36, ({
      sm33_wom_kaidan_01 = "stay_03",
      sm33_man_megami_01 = "stay_02",
      sm33_wom_megami_01 = "stay_01",
      sm33_wom_kanran_01 = "stay_01"
    })[A0_36], true)
  end
end
