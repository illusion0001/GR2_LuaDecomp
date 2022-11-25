dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep14_common.lua")
dofile("/Game/Misc/gesture.lua")
dofile("/Game/Mob/mob_event_util.lua")
_bench = nil
_puppet_tbl = {}
_npcgen_tbl = {}
_kdemo_viewed = false
_mob_txt = {
  [1] = {
    man08 = {
      known_kaiwa = "ep14_00151k",
      reply_yes = {text = "ep14_03027", time = 2},
      reply_no = {text = "ep14_03006", time = 2}
    },
    wom39 = {
      known_kaiwa = "ep14_00152k",
      reply_yes = {text = "ep14_03029", time = 2},
      reply_no = {text = "ep14_03030", time = 2}
    },
    wom01 = {
      known_kaiwa = "ep14_00153k",
      reply_yes = {text = "ep14_03032", time = 2},
      reply_no = {text = "ep14_03033", time = 2}
    },
    other = {
      {
        reply_yes = {text = "ep14_03027", time = 2},
        reply_no = {text = "ep14_03030", time = 2}
      },
      {
        reply_yes = {text = "ep14_03029", time = 2},
        reply_no = {text = "ep14_03006", time = 2}
      },
      {
        reply_yes = {text = "ep14_03032", time = 2},
        reply_no = {text = "ep14_03033", time = 2}
      }
    }
  },
  [2] = {
    other = {
      {
        reply_yes = {text = "ep14_03027", time = 2},
        reply_no = {text = "ep14_03006", time = 2}
      },
      {
        reply_yes = {text = "ep14_03029", time = 2},
        reply_no = {text = "ep14_03033", time = 2}
      },
      {
        reply_yes = {text = "ep14_03032", time = 2},
        reply_no = {text = "ep14_03030", time = 2}
      }
    }
  }
}
_npc_kaiwa_table = {
  info01 = {
    cnt = 0,
    kaiwa = "ep14_00151k",
    caption = "ep14_03032",
    direction = true
  },
  info02 = {
    cnt = 0,
    kaiwa = "ep14_00152k",
    caption = "ep14_03032",
    direction = true
  },
  info03 = {
    cnt = 0,
    kaiwa = "ep14_00153k",
    caption = "ep14_03032",
    direction = true
  },
  info04 = {cnt = 1, unknown = true},
  info04_2 = {cnt = 1, unknown = true},
  adicca = {cnt = 1, unknown = true}
}
_gesture = nil
_decide_flag = false
_cancel_flag = false
_break_flag = false
_find_conversation = false
_get_adicca_hint = false
_get_adicca_info = false
_time_over = false
_mob_type = nil
_navi_on = false
_study_phase = 0
_col_hdl = nil
_col_hdl2 = nil
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "adicca",
      type = "man77",
      node = "locator2_adicca",
      anim_name = "lookaround_01"
    },
    {
      name = "info01",
      type = "man08",
      node = "locator2_info_man08",
      anim_name = "stay_01"
    },
    {
      name = "info02",
      type = "wom39",
      node = "locator2_info_wom39"
    },
    {
      name = "info02_2",
      type = "wom38",
      node = "locator2_wom40"
    },
    {
      name = "info03",
      type = "wom01",
      node = "locator2_info_wom47",
      anim_name = "trouble_00"
    },
    {
      name = "info04",
      type = "man70",
      node = "locator2_info_man70",
      anim_name = "stay_02",
      active = false
    },
    {
      name = "info04_2",
      type = "wom40",
      node = "locator2_info_wom40",
      anim_name = "stay_02",
      active = false
    }
  }
  _npcgen_tbl = Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_pcSensorOff("pccubesensor2_adicca_01")
  Fn_pcSensorOff("pccubesensor2_brahman_bench")
  Fn_pcSensorOff("pccubesensor2_col_off")
  Fn_setCatWarpCheckPoint("locator2_cat_warp_reset_05_1")
  _col_hdl = createGameObject2("GimmickBg")
  findGameObject2("Node", "locator2_col_01"):appendChild(_col_hdl)
  _col_hdl:setName("ep14_col_1")
  _col_hdl:setCollisionName("ep14_col")
  _col_hdl:setCollidableBlockEnable(false)
  _col_hdl:try_init()
  _col_hdl:waitForReady()
  _col_hdl:try_start()
  _col_hdl2 = createGameObject2("GimmickBg")
  findGameObject2("Node", "locator2_col_02"):appendChild(_col_hdl2)
  _col_hdl2:setName("ep14_col_2")
  _col_hdl2:setCollisionName("ep14_col")
  _col_hdl2:setCollidableBlockEnable(false)
  _col_hdl2:try_init()
  _col_hdl2:waitForReady()
  _col_hdl2:try_start()
  _col_hdl:setCollidablePermission(false)
  _col_hdl2:setCollidablePermission(false)
  Mob:restrictOnNav__ed_a_root(true)
  Mob:restrictFromEnteringBehindFerrisWheel(true)
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11
  L0_1 = Fn_sendEventComSb
  L1_2 = "shopMasterEnd"
  L0_1(L1_2)
  L0_1 = Fn_sendEventComSb
  L1_2 = "checkCpartPlay"
  L0_1 = L0_1(L1_2)
  if L0_1 == false then
    while true do
      L1_2 = Fn_sendEventComSb
      L2_3 = "checkSpawnGridMax"
      L1_2 = L1_2(L2_3)
      if L1_2 == false then
        L1_2 = wait
        L1_2()
      end
    end
    L1_2 = Fn_sendEventComSb
    L2_3 = "pcJoin"
    L1_2(L2_3)
    L1_2 = Fn_sendEventComSb
    L2_3 = "buyingOk"
    L1_2(L2_3)
  end
  L1_2 = wait
  L1_2()
  L1_2 = Fn_missionStart
  L1_2()
  L1_2 = Fn_userCtrlOn
  L1_2()
  L1_2 = Fn_kaiwaDemoView
  L2_3 = "ep14_00150k"
  L1_2(L2_3)
  L1_2 = Fn_sendEventComSb
  L2_3 = "changeKaiwaEndFlg"
  L1_2(L2_3)
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "info02"
  L3_4 = "talk_00"
  L4_5 = {L5_6, L6_7}
  L5_6 = "talk_laugh_01"
  L6_7 = "talk_sad_02"
  L5_6 = 5
  L6_7 = 10
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L1_2 = Fn_repeatPlayMotion
  L2_3 = "info02_2"
  L3_4 = "talk_laugh_00"
  L4_5 = {L5_6, L6_7}
  L5_6 = "talk_00"
  L6_7 = "talk_sad_01"
  L5_6 = 5
  L6_7 = 10
  L1_2(L2_3, L3_4, L4_5, L5_6, L6_7)
  L1_2 = waitSeconds
  L2_3 = 1
  L1_2(L2_3)
  L1_2 = Fn_missionView
  L2_3 = "ep14_03000"
  L1_2(L2_3)
  L1_2 = waitSeconds
  L2_3 = 1.3
  L1_2(L2_3)
  L1_2 = findGameObject2
  L2_3 = "Node"
  L3_4 = "locator2_navi_01"
  L1_2 = L1_2(L2_3, L3_4)
  L2_3 = Fn_naviSet
  L3_4 = L1_2
  L2_3(L3_4)
  L2_3 = viewControl
  L3_4 = L1_2
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 1.5
  L2_3(L3_4)
  L2_3 = Fn_captionView
  L3_4 = "ep14_03001"
  L2_3(L3_4)
  L2_3 = invokeTask
  function L3_4()
    local L0_12, L1_13
    L0_12 = 10
    L1_13 = findGameObject2
    L1_13 = L1_13("Node", "locator2_pc_start_pos")
    while Fn_getDistanceToPlayer(L1_13) < 1 do
      if L0_12 == 10 then
        Fn_captionView("ep14_03050")
        L0_12 = 0
      end
      waitSeconds(1)
      L0_12 = L0_12 + 1
    end
  end
  L2_3(L3_4)
  repeat
    L2_3 = wait
    L2_3()
    L2_3 = Fn_getDistanceToPlayer
    L4_5 = L1_2
    L3_4 = L1_2.getWorldPos
    L10_11 = L3_4(L4_5)
    L2_3 = L2_3(L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L3_4(L4_5))
  until L2_3 < 40
  L2_3 = Fn_naviKill
  L2_3()
  L2_3 = Fn_setCatWarpCheckPoint
  L3_4 = "locator2_cat_warp_reset_05"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 1
  L2_3(L3_4)
  L2_3 = Fn_missionView
  L3_4 = "ep14_03002"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 3.8
  L2_3(L3_4)
  L2_3 = Fn_captionView
  L3_4 = "ep14_03003"
  L2_3(L3_4)
  L2_3 = waitSeconds
  L3_4 = 3
  L2_3(L3_4)
  L2_3 = findGameObject2
  L3_4 = "Node"
  L4_5 = "locator2_brahman_info_target"
  L2_3 = L2_3(L3_4, L4_5)
  function L3_4()
    local L0_14, L1_15
    _decide_flag = true
    L0_14 = _cancel_flag
    return L0_14
  end
  function L4_5()
    local L0_16, L1_17
    L0_16 = _break_flag
    return L0_16
  end
  L5_6 = GestureEvent
  L5_6 = L5_6.create
  L6_7 = "ui_event_guide_02"
  L7_8 = L3_4
  L8_9 = L4_5
  L9_10 = gestureNpcActionCallback
  L5_6 = L5_6(L6_7, L7_8, L8_9, L9_10)
  _gesture = L5_6
  L5_6 = _gesture
  L6_7 = L5_6
  L5_6 = L5_6.setAsking
  L7_8 = false
  L5_6(L6_7, L7_8)
  function L5_6()
    _gesture:setNaviTarget(_puppet_tbl.adicca, Vector(0, 1.5, 0), {
      classGroup = "yy_navi_ep14_01",
      positiveRate = 0
    })
    _gesture:setNpc({
      _puppet_tbl.info01,
      _puppet_tbl.info02,
      _puppet_tbl.info03
    })
    _gesture:setMobText(_mob_txt[1])
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\18801: \231\137\185\229\174\154\227\129\174\227\130\173\227\131\163\227\131\169\228\187\165\229\164\150\227\131\143\227\130\186\227\131\172\227\129\167 \231\137\185\229\174\154\227\130\173\227\131\163\227\131\169\227\129\174\229\160\180\229\144\136\227\129\175\228\188\154\232\169\177\227\131\135\227\131\162\227\129\171\233\129\183\231\167\187\227\129\153\227\130\139")
  end
  function L6_7()
    _gesture:setNaviTarget(_puppet_tbl.adicca, Vector(0, 1.5, 0), {positiveRate = 0.7})
    _gesture:setMobText(_mob_txt[2])
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\18802: \227\130\162\227\131\135\227\130\163\227\130\171\227\131\146\227\131\179\227\131\136\227\130\130\227\130\137\227\129\163\227\129\166\227\129\166\227\129\190\227\129\160\232\166\139\227\129\164\227\129\145\227\129\166\227\129\132\227\129\170\227\129\132\227\129\170\227\130\137\227\129\176\227\128\12970\239\188\133\227\129\174\231\162\186\231\142\135\227\129\167\230\173\163\232\167\163\227\128\129\230\140\135\227\129\149\227\129\151(\228\188\154\232\169\177\227\131\135\227\131\162\227\129\170\227\129\151)")
  end
  function L7_8()
    _gesture:setNaviTarget(L2_3, Vector(0, 2, 0), {positiveRate = 0})
    _gesture:setNpc({
      _puppet_tbl.adicca
    })
    _gesture:setMobText(_mob_txt[2])
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\18803: \227\130\162\227\131\135\227\130\163\227\130\171\227\129\168\227\129\174\228\188\154\232\169\177\229\190\140\227\128\1290\239\188\133\227\129\174\231\162\186\231\142\135\227\129\167\230\173\163\232\167\163 \229\173\166\231\148\159\227\129\186\227\130\162\227\129\190\227\129\167\227\129\174\227\129\164\227\129\170\227\129\142")
  end
  function L8_9()
    local L0_18
    L0_18 = _gesture
    L0_18 = L0_18.setNaviTarget
    L0_18(L0_18, L2_3, Vector(0, 2, 0), {positiveRate = 0.7})
    L0_18 = _gesture
    L0_18 = L0_18.setNpc
    L0_18(L0_18, {
      _puppet_tbl.info04,
      _puppet_tbl.info04_2
    })
    function L0_18(A0_19)
      if A0_19.className == "man31" then
        print("\232\173\166\229\139\153\229\174\152\227\129\140\231\159\165\227\129\163\227\129\166\227\129\161\227\130\131\227\131\158\227\130\186\227\130\164")
        return true
      end
      return false
    end
    _gesture:setOverrideNoFunc(L0_18)
    _gesture:run()
    print("\227\130\184\227\130\167\227\130\185\227\131\129\227\131\163\227\131\18804: \231\148\183\229\165\179\229\173\166\231\148\159\227\131\154\227\130\162\227\129\168\227\129\174\228\188\154\232\169\177\229\190\140\227\128\12970\239\188\133\227\129\174\231\162\186\231\142\135\227\129\167\230\173\163\232\167\163\227\128\129\230\140\135\227\129\149\227\129\151(\228\188\154\232\169\177\227\131\135\227\131\162\227\129\170\227\129\151)")
  end
  L9_10 = L5_6
  L9_10()
  _study_phase = 1
  repeat
    L9_10 = _study_phase
    if L9_10 == 1 then
      L9_10 = _get_adicca_hint
      if L9_10 == false then
        repeat
          L9_10 = wait
          L9_10()
          L9_10 = _gesture
          L10_11 = L9_10
          L9_10 = L9_10.getKnownCount
          L9_10 = L9_10(L10_11)
          if not (L9_10 >= 1) then
            L9_10 = _kdemo_viewed
          end
        until L9_10
        _study_phase = 2
        _kdemo_viewed = false
      end
    else
      L9_10 = _study_phase
      if L9_10 == 2 then
        _get_adicca_hint = true
        L9_10 = Fn_pcSensorOn
        L10_11 = "pccubesensor2_adicca_01"
        L9_10(L10_11)
        L9_10 = _gesture
        L10_11 = L9_10
        L9_10 = L9_10.stop
        L9_10(L10_11)
        L9_10 = L6_7
        L9_10()
        _study_phase = 3
      else
        L9_10 = _study_phase
        if L9_10 == 4 then
          L9_10 = _gesture
          L10_11 = L9_10
          L9_10 = L9_10.stop
          L9_10(L10_11)
          L9_10 = rayCheckPcSetStay
          L10_11 = _puppet_tbl
          L10_11 = L10_11.adicca
          L9_10(L10_11, 40, 1.5)
          while true do
            L9_10 = Fn_isCaptionView
            L9_10 = L9_10()
            if L9_10 then
              L9_10 = wait
              L9_10()
            end
          end
          L9_10 = Fn_captionView
          L10_11 = "ep14_03021"
          L9_10(L10_11, 2)
          L9_10 = Sound
          L10_11 = L9_10
          L9_10 = L9_10.playSE
          L9_10(L10_11, "kit_512", 0.5)
          L9_10 = pcStayCamStopOn
          L9_10()
          L9_10 = createNode
          L10_11 = _puppet_tbl
          L10_11 = L10_11.adicca
          L9_10 = L9_10(L10_11, "adi_child_node", true)
          L10_11 = viewControl
          L10_11(L9_10, 0.5, 0, 2)
          L10_11 = Fn_captionViewWait
          L10_11("ep14_03022", 3)
          L10_11 = Fn_captionView
          L10_11("ep14_03023")
          L10_11 = pcStayCamStopOff
          L10_11()
          _study_phase = 5
        else
          L9_10 = _study_phase
          if L9_10 == 5 then
            L9_10 = Fn_naviSet
            L10_11 = _puppet_tbl
            L10_11 = L10_11.adicca
            L9_10(L10_11)
            while true do
              L9_10 = Fn_getDistanceToPlayer
              L10_11 = _puppet_tbl
              L10_11 = L10_11.adicca
              L9_10 = L9_10(L10_11)
              if L9_10 > 3 then
                L9_10 = wait
                L9_10()
              end
            end
            _study_phase = 6
          else
            L9_10 = _study_phase
            if L9_10 == 6 then
              L9_10 = Fn_naviKill
              L9_10()
              L9_10 = pcStayCamStopOn
              L9_10()
              L9_10 = inSensorGravityCtrlModeOff
              L9_10()
              L9_10 = Fn_turnNpc
              L10_11 = "adicca"
              L9_10(L10_11)
              while true do
                L9_10 = Fn_isCaptionView
                L9_10 = L9_10()
                if L9_10 then
                  L9_10 = wait
                  L9_10()
                end
              end
              L9_10 = Fn_kaiwaDemoView
              L10_11 = "ep14_00155k"
              L9_10(L10_11)
              _get_adicca_info = true
              L9_10 = pcStayCamStopOff
              L9_10()
              L9_10 = Fn_setNpcActive
              L10_11 = "info04"
              L9_10(L10_11, true)
              L9_10 = Fn_setNpcActive
              L10_11 = "info04_2"
              L9_10(L10_11, true)
              L9_10 = _col_hdl
              L10_11 = L9_10
              L9_10 = L9_10.setCollidablePermission
              L9_10(L10_11, true)
              L9_10 = _col_hdl2
              L10_11 = L9_10
              L9_10 = L9_10.setCollidablePermission
              L9_10(L10_11, true)
              L9_10 = Fn_pcSensorOn
              L10_11 = "pccubesensor2_col_off"
              L9_10(L10_11)
              L9_10 = waitSeconds
              L10_11 = 0.3
              L9_10(L10_11)
              L9_10 = Fn_captionView
              L10_11 = "ep14_03024"
              L9_10(L10_11)
              L9_10 = waitSeconds
              L10_11 = 3
              L9_10(L10_11)
              L9_10 = L7_8
              L9_10()
              L9_10 = 0
              while true do
                while true do
                  L10_11 = Fn_isInSightTarget
                  L10_11 = L10_11(_puppet_tbl.info04_2, 1)
                  if not L10_11 and not (L9_10 > 480) then
                    L9_10 = L9_10 + 1
                    L10_11 = wait
                    L10_11()
                  end
                end
              end
              while true do
                L10_11 = _gesture
                L10_11 = L10_11.isInteraction
                L10_11 = L10_11(L10_11)
                if L10_11 then
                  L10_11 = wait
                  L10_11()
                end
              end
              L10_11 = _gesture
              L10_11 = L10_11.stop
              L10_11(L10_11)
              while true do
                L10_11 = rayCheck
                L10_11 = L10_11(_puppet_tbl.info04_2, 80, 1.5)
                if L10_11 == false then
                  L10_11 = wait
                  L10_11()
                end
              end
              L10_11 = pcStayCamStopOn
              L10_11()
              L10_11 = createNode
              L10_11 = L10_11(_puppet_tbl.info04_2, "info04_2_child_node", true)
              viewControl(L10_11, 0.5, 0, 2)
              if 5 < Fn_getDistanceToPlayer(_puppet_tbl.info04_2:getWorldPos()) then
                Fn_captionView("ep14_03051")
                waitSeconds(1.2)
              end
              L1_2 = findGameObject2("Node", "locator2_info_between_w_m")
              Fn_naviSet(L1_2)
              pcStayCamStopOff()
              repeat
                wait()
              until Fn_getDistanceToPlayer(L1_2:getWorldPos()) < 3
              Fn_naviKill()
              Fn_kaiwaDemoView("ep14_00156k")
              Fn_sendEventComSb("dPartbrahmanControl")
              Fn_captionView("ep14_03049")
              waitSeconds(2)
              L8_9()
              _study_phase = 7
            else
              L9_10 = _study_phase
              if L9_10 == 7 then
                L9_10 = Fn_getDistanceToPlayer
                L10_11 = L2_3
                L9_10 = L9_10(L10_11)
                if L9_10 < 40 then
                  L9_10 = rayCheckPcSetStay
                  L10_11 = L2_3
                  L9_10(L10_11, 35, 1.5)
                  L9_10 = _gesture
                  L10_11 = L9_10
                  L9_10 = L9_10.stop
                  L9_10(L10_11)
                  _find_conversation = true
                end
              end
            end
          end
        end
      end
    end
    L9_10 = wait
    L9_10()
    L9_10 = _find_conversation
  until L9_10
  L9_10 = Fn_captionView
  L10_11 = "ep14_03025"
  L9_10(L10_11, 2)
  L9_10 = Sound
  L10_11 = L9_10
  L9_10 = L9_10.playSE
  L9_10(L10_11, "kit_512", 0.5)
  L9_10 = waitSeconds
  L10_11 = 1
  L9_10(L10_11)
  L9_10 = viewControl
  L10_11 = L2_3
  L9_10(L10_11, nil, 1.5)
  L9_10 = Player
  L10_11 = L9_10
  L9_10 = L9_10.setStay
  L9_10(L10_11, false)
  L9_10 = waitSeconds
  L10_11 = 1.3
  L9_10(L10_11)
  L9_10 = Fn_captionView
  L10_11 = "ep14_03026"
  L9_10(L10_11)
  L9_10 = Fn_naviSet
  L10_11 = L2_3
  L9_10(L10_11)
  L9_10 = Fn_pcSensorOn
  L10_11 = "pccubesensor2_brahman_bench"
  L9_10(L10_11)
  L9_10 = waitPhase
  L9_10()
  L9_10 = Fn_naviKill
  L9_10()
  L9_10 = Fn_blackout
  L9_10()
  L9_10 = pcStayCamStopOn
  L9_10()
  L9_10 = inSensorGravityCtrlModeOff
  L9_10()
  L9_10 = Fn_sendEventComSb
  L10_11 = "customerGeneratorStop"
  L9_10(L10_11)
  L9_10 = Fn_setNextMissionFlag
  L9_10()
  L9_10 = Fn_nextMission
  L9_10()
  L9_10 = Fn_exitSandbox
  L9_10()
end
function Finalize()
  Mob:restrictOnNav__ed_a_root(false)
  Mob:restrictFromEnteringBehindFerrisWheel(false)
  if Fn_getPlayer() then
    pcStayCamStopOff()
  end
  _puppet_tbl = nil
end
function pccubesensor2_adicca_01_OnEnter(A0_20)
  _study_phase = 4
  Fn_pcSensorOff(A0_20)
end
function gestureNpcActionCallback(A0_21)
  local L1_22, L2_23, L3_24, L4_25, L5_26
  if A0_21 then
    L2_23 = A0_21
    L1_22 = A0_21.getName
    L1_22 = L1_22(L2_23)
    L2_23 = Fn_userCtrlOff
    L2_23()
    L3_24 = A0_21
    L2_23 = A0_21.getWorldPos
    L2_23 = L2_23(L3_24)
    L3_24 = Vector
    L4_25 = 0
    L5_26 = 1.6
    L3_24 = L3_24(L4_25, L5_26, 0)
    L2_23 = L2_23 + L3_24
    L3_24 = Player
    L4_25 = L3_24
    L3_24 = L3_24.setLookAtIk
    L5_26 = true
    L3_24(L4_25, L5_26, 1, L2_23)
    L3_24 = Fn_turnNpc
    L4_25 = L1_22
    L3_24(L4_25)
    L3_24 = _npc_kaiwa_table
    L3_24 = L3_24[L1_22]
    L3_24 = L3_24.cnt
    if L3_24 == 0 then
      L3_24 = Fn_kaiwaDemoView
      L4_25 = _npc_kaiwa_table
      L4_25 = L4_25[L1_22]
      L4_25 = L4_25.kaiwa
      L3_24(L4_25)
      L3_24 = _npc_kaiwa_table
      L3_24 = L3_24.info01
      L3_24.cnt = 1
      L3_24 = _npc_kaiwa_table
      L3_24 = L3_24.info02
      L3_24.cnt = 1
      L3_24 = _npc_kaiwa_table
      L3_24 = L3_24.info03
      L3_24.cnt = 1
      _kdemo_viewed = true
    else
      L3_24 = _npc_kaiwa_table
      L3_24 = L3_24[L1_22]
      L3_24 = L3_24.unknown
      if L3_24 then
        L3_24 = Fn_playMotionNpc
        L4_25 = L1_22
        L5_26 = "reply_no"
        L3_24(L4_25, L5_26, true)
      else
        L3_24 = Fn_playMotionNpc
        L4_25 = L1_22
        L5_26 = "reply_yes"
        L3_24(L4_25, L5_26, true)
      end
    end
    L3_24 = _npc_kaiwa_table
    L3_24 = L3_24[L1_22]
    L3_24 = L3_24.direction
    if nil ~= L3_24 then
      L3_24 = Fn_turnNpc
      L4_25 = L1_22
      L5_26 = _puppet_tbl
      L5_26 = L5_26.adicca
      L3_24(L4_25, L5_26)
      L3_24 = {}
      L3_24.anim_in = "inform_in"
      L3_24.anim_lp = "inform_lp"
      L3_24.anim_out = "inform_ed"
      L3_24.anim_stay = "stay"
      L4_25 = _npcgen_tbl
      L4_25 = L4_25[L1_22]
      L5_26 = L4_25
      L4_25 = L4_25.inform
      L4_25(L5_26, _puppet_tbl.adicca, L3_24)
      L4_25 = Fn_lookAtObject
      L5_26 = _puppet_tbl
      L5_26 = L5_26.adicca
      L4_25 = L4_25(L5_26)
      L5_26 = _puppet_tbl
      L5_26 = L5_26.adicca
      L5_26 = L5_26.getWorldPos
      L5_26 = L5_26(L5_26)
      Player:setLookAtIk(true, 1, L5_26)
      waitSeconds(2)
      L4_25:abort()
      waitSeconds(0.5)
      _npcgen_tbl[L1_22]:informEnd()
      while not _npcgen_tbl[L1_22]:isInformEnd() do
        wait()
      end
    end
    L3_24 = _npc_kaiwa_table
    L3_24 = L3_24[L1_22]
    L3_24 = L3_24.caption
    if L3_24 then
      L3_24 = Fn_captionView
      L4_25 = _npc_kaiwa_table
      L4_25 = L4_25[L1_22]
      L4_25 = L4_25.caption
      L5_26 = 2
      L3_24(L4_25, L5_26)
      L3_24 = waitSeconds
      L4_25 = 1
      L3_24(L4_25)
    end
    L3_24 = invokeTask
    function L4_25()
      _npcgen_tbl[L1_22]:resetDirection()
      repeat
        wait()
      until _npcgen_tbl[L1_22]:isTurnEnd()
      waitSeconds(0.5)
    end
    L3_24(L4_25)
    L3_24 = Fn_userCtrlOn
    L3_24()
    L3_24 = Player
    L4_25 = L3_24
    L3_24 = L3_24.setLookAtIk
    L5_26 = false
    L3_24(L4_25, L5_26, 1, L2_23)
  else
  end
end
function pccubesensor2_yakata_OnEnter(A0_27)
  invokeTask(function()
    local L0_28
    L0_28 = _gesture
    L0_28 = L0_28.isRunning
    L0_28 = L0_28(L0_28)
    if L0_28 then
      L0_28 = _gesture
      L0_28 = L0_28.stop
      L0_28(L0_28)
      L0_28 = wait
      L0_28(3)
      L0_28 = {}
      L0_28.RL = {
        id = "ui_event_guide_17",
        func = yes_func
      }
      Fn_gestureAction(L0_28)
    end
  end)
end
function yes_func()
  Fn_gestureActionCancel()
  Fn_pcSensorOff("pccubesensor2_yakata")
  invokeTask(function()
    Sound:playSE("kit_512a", 0.5)
    Fn_captionViewWait("ep14_03060")
    waitSeconds(1)
    _gesture:run()
  end)
end
function pccubesensor2_yakata_OnLeave(A0_29)
  invokeTask(function()
    if _gesture:isRunning() == false then
      Fn_gestureActionCancel()
      wait(3)
      _gesture:run()
    end
  end)
end
function col_off_OnEnter(A0_30)
  _col_hdl:setCollidablePermission(false)
  _col_hdl2:setCollidablePermission(false)
  Fn_pcSensorOff(A0_30)
end
