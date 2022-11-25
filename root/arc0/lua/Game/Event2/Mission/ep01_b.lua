dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
_next_phase = false
_crate_cap_wait = 30
_kaiwa_cnt = 0
sdemo = nil
navi_node = nil
_enemy_cnt = 0
_miz_event_mot_list = {
  repair = "miz01_repair_00"
}
_cid_event_mot_list = {
  stay1 = "man01_talk_02"
}
_ryz_event_mot_list = {
  stay1 = "ryz01_stay_01"
}
_man34_event_mot_list = {
  talk3 = "man01_talk_03"
}
_sis_event_mot_list = {
  run_afr = "sis01_run_afraid_00"
}
enmgen2_ep01_b_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_1_01",
      name = "ep01_b_1_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_1_02",
      name = "ep01_b_1_02"
    }
  },
  onUpdate = function(A0_0)
    local L1_1
  end,
  onEnter = function(A0_2)
    local L1_3
  end,
  onLeave = function(A0_4)
    local L1_5
  end,
  onObjectDead = function(A0_6, A1_7)
    A0_6:getSpecTable().enemyDeadNum = A0_6:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_8)
    return #A0_8.spawnSet
  end,
  getEnemyRest = function(A0_9)
    local L1_10
    L1_10 = A0_9.spawnSet
    L1_10 = #L1_10
    L1_10 = L1_10 - A0_9.enemyDeadNum
    return L1_10
  end
}
enmgen2_ep01_b_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_2_01",
      name = "ep01_b_2_01"
    },
    {
      type = "stalker",
      locator = "locator_ene_2_02",
      name = "ep01_b_2_02"
    }
  },
  onUpdate = function(A0_11)
    local L1_12
  end,
  onEnter = function(A0_13)
    local L1_14
  end,
  onLeave = function(A0_15)
    local L1_16
  end,
  onObjectDead = function(A0_17, A1_18)
    A0_17:getSpecTable().enemyDeadNum = A0_17:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_19)
    return #A0_19.spawnSet
  end,
  getEnemyRest = function(A0_20)
    local L1_21
    L1_21 = A0_20.spawnSet
    L1_21 = #L1_21
    L1_21 = L1_21 - A0_20.enemyDeadNum
    return L1_21
  end
}
function Initialize()
  local L0_22, L1_23
  L0_22 = Fn_findAreaHandle
  L1_23 = "ve_crane_root"
  L0_22 = L0_22(L1_23)
  shiphandle = L0_22
  L0_22 = Fn_setCatActive
  L1_23 = off
  L0_22(L1_23)
  L0_22 = {
    L1_23,
    {
      name = "chi_01",
      type = "chi11",
      node = "locator2_child_04"
    }
  }
  L1_23 = {}
  L1_23.name = "sis_01"
  L1_23.type = "sis01"
  L1_23.node = "locator2_sis_start"
  L1_23.attach = false
  L1_23.active = false
  L1_23 = Fn_setupNpc
  L1_23(L0_22)
  L1_23 = findGameObject2
  L1_23 = L1_23("Node", "locator2_talk_01")
  talknode_hdl = L1_23
  L1_23 = Fn_setKaiwaDemo
  L1_23(Fn_findNpcPuppet("npcgen2_ryz01_01"), "ep01_00120k", nil, true, nil, nil, nil, "ep01_00120")
  L1_23 = Fn_setKaiwaDemo
  L1_23(Fn_findNpcPuppet("chi_01"), "ep01_00130k", addKaiwaCount, true, nil, nil, "B", "ep01_00130")
  L1_23 = Fn_setKaiwaDemo
  L1_23(talknode_hdl, "ep01_00115k", nil, true, nil, nil, nil, "ep01_01015")
  L1_23 = Fn_disableKaiwaDemo
  L1_23(talknode_hdl)
  L1_23 = Fn_disableKaiwaDemo
  L1_23(Fn_findNpcPuppet("npcgen2_ryz01_01"))
  L1_23 = Fn_findNpcPuppet
  L1_23 = L1_23("sis_01")
  sdemo_chara = L1_23
  L1_23 = findGameObject2
  L1_23 = L1_23("Node", "camnode2_b_01")
  sdemo_node = L1_23
  L1_23 = SDemo
  L1_23 = L1_23.create
  L1_23 = L1_23("ep01_b")
  sdemo = L1_23
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_01_2")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_02")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_03")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_04")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_05")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_06")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_07")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_07_2")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_08")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_08_02")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_back_01")
  L1_23 = Fn_pcSensorOff
  L1_23("pccubesensor2_advance_01")
  L1_23 = Fn_loadNpcEventMotion
  L1_23("npcgen2_miz01_01", _miz_event_mot_list)
  L1_23 = Fn_loadNpcEventMotion
  L1_23("npcgen2_cid01_01", _cid_event_mot_list)
  L1_23 = Fn_loadNpcEventMotion
  L1_23("npcgen2_ryz01_01", _ryz_event_mot_list)
  L1_23 = Fn_loadNpcEventMotion
  L1_23("npcgen2_man34_01", _man34_event_mot_list)
  L1_23 = Fn_loadNpcEventMotion
  L1_23("sis_01", _sis_event_mot_list)
  L1_23 = createGameObject2
  L1_23 = L1_23("GimmickBg")
  _hammer_hdl = L1_23
  L1_23 = _hammer_hdl
  L1_23 = L1_23.setDrawModelName
  L1_23(L1_23, "cihammer01_base")
  L1_23 = _hammer_hdl
  L1_23 = L1_23.setName
  L1_23(L1_23, "cihammer01")
  L1_23 = Fn_findNpcPuppet
  L1_23 = L1_23("npcgen2_miz01_01")
  Fn_attachJoint(_hammer_hdl, L1_23, "loc_r_hand")
  Fn_userCtrlAllOff()
end
function Ingame()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40, L17_41, L18_42, L19_43, L20_44, L21_45, L22_46, L23_47, L24_48, L25_49, L26_50, L27_51, L28_52, L29_53, L30_54, L31_55, L32_56, L33_57, L34_58, L35_59, L36_60
  L0_24 = Fn_getPlayer
  L0_24 = L0_24()
  L1_25 = createGameObject2
  L2_26 = "GimmickBg"
  L1_25 = L1_25(L2_26)
  L2_26 = shiphandle
  L3_27 = L2_26
  L2_26 = L2_26.appendChild
  L4_28 = L1_25
  L2_26(L3_27, L4_28)
  L3_27 = L1_25
  L2_26 = L1_25.setName
  L4_28 = "ep01_col"
  L2_26(L3_27, L4_28)
  L3_27 = L1_25
  L2_26 = L1_25.setCollisionName
  L4_28 = "ep01_col"
  L2_26(L3_27, L4_28)
  L3_27 = L1_25
  L2_26 = L1_25.setAttributeName
  L4_28 = "ep01_col"
  L2_26(L3_27, L4_28)
  L3_27 = L1_25
  L2_26 = L1_25.overrideCollisionFilterLayer
  L4_28 = "Boundary"
  L2_26(L3_27, L4_28)
  L3_27 = L1_25
  L2_26 = L1_25.try_init
  L2_26(L3_27)
  L3_27 = L1_25
  L2_26 = L1_25.waitForReady
  L2_26(L3_27)
  L3_27 = L1_25
  L2_26 = L1_25.try_start
  L2_26(L3_27)
  L2_26 = Fn_playNpcEventMotion
  L3_27 = "npcgen2_ryz01_01"
  L4_28 = _ryz_event_mot_list
  L4_28 = L4_28.stay1
  L5_29 = -1
  L6_30 = 0
  L7_31 = false
  L2_26(L3_27, L4_28, L5_29, L6_30, L7_31)
  L2_26 = Player
  L3_27 = L2_26
  L2_26 = L2_26.setSituation
  L4_28 = Player
  L4_28 = L4_28.kSituation_Normal
  L5_29 = true
  L6_30 = 0
  L7_31 = true
  L8_32 = false
  L2_26(L3_27, L4_28, L5_29, L6_30, L7_31, L8_32)
  L2_26 = mother2
  L3_27 = L2_26
  L2_26 = L2_26.sendEvent
  L4_28 = "getBackgroundElement2Handle"
  L5_29 = "bungua"
  L2_26 = L2_26(L3_27, L4_28, L5_29)
  L4_28 = L2_26
  L3_27 = L2_26.findSubArea
  L5_29 = "bu_a_18"
  L3_27 = L3_27(L4_28, L5_29)
  L5_29 = L2_26
  L4_28 = L2_26.findSubArea
  L6_30 = "bu_a_19"
  L4_28 = L4_28(L5_29, L6_30)
  L5_29 = mother2
  L6_30 = L5_29
  L5_29 = L5_29.sendEvent
  L7_31 = "getBackgroundElement2Handle"
  L8_32 = "scree"
  L5_29 = L5_29(L6_30, L7_31, L8_32)
  L7_31 = L5_29
  L6_30 = L5_29.findSubArea
  L8_32 = "wa_a_01"
  L6_30 = L6_30(L7_31, L8_32)
  L8_32 = L5_29
  L7_31 = L5_29.findSubArea
  L9_33 = "wa_a_02"
  L7_31 = L7_31(L8_32, L9_33)
  L9_33 = L5_29
  L8_32 = L5_29.findSubArea
  L10_34 = "wa_a_03"
  L8_32 = L8_32(L9_33, L10_34)
  L10_34 = L5_29
  L9_33 = L5_29.findSubArea
  L11_35 = "wa_a_04"
  L9_33 = L9_33(L10_34, L11_35)
  L11_35 = L5_29
  L10_34 = L5_29.findSubArea
  L12_36 = "wa_a_05"
  L10_34 = L10_34(L11_35, L12_36)
  L12_36 = L5_29
  L11_35 = L5_29.findSubArea
  L13_37 = "wa_a_07"
  L11_35 = L11_35(L12_36, L13_37)
  L13_37 = L3_27
  L12_36 = L3_27.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L4_28
  L12_36 = L4_28.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L6_30
  L12_36 = L6_30.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L7_31
  L12_36 = L7_31.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L8_32
  L12_36 = L8_32.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L9_33
  L12_36 = L9_33.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L10_34
  L12_36 = L10_34.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L13_37 = L11_35
  L12_36 = L11_35.setExpandedAabb
  L14_38 = true
  L12_36(L13_37, L14_38)
  L12_36 = invokeTask
  function L13_37()
    local L0_61, L1_62, L2_63
    L0_61 = Fn_findNpc
    L1_62 = "chi_01"
    L0_61 = L0_61(L1_62)
    child_hdl = L0_61
    L0_61 = Fn_findNpcPuppet
    L1_62 = "chi_01"
    L0_61 = L0_61(L1_62)
    chi_pup_hdl = L0_61
    repeat
      L0_61 = {
        L1_62,
        L2_63,
        {
          pos = "locator2_child_07",
          opt = {
            anim_walk = "walk",
            anim_walk_speed = 0.9,
            anim_run = "run2",
            bridge = true
          }
        },
        {
          pos = "locator2_child_08"
        }
      }
      L1_62 = {}
      L1_62.pos = "locator2_child_05"
      L2_63 = {}
      L2_63.pos = "locator2_child_06"
      L1_62 = Fn_moveNpc
      L2_63 = "chi_01"
      L1_62 = L1_62(L2_63, L0_61, {runLength = 100, loop = false})
      repeat
        L2_63 = wait
        L2_63()
        L2_63 = child_hdl
        L2_63 = L2_63.isMoveEnd
        L2_63 = L2_63(L2_63)
      until L2_63
      L2_63 = waitSeconds
      L2_63(2)
      L2_63 = {
        {
          pos = "locator2_child_07"
        },
        {
          pos = "locator2_child_06",
          opt = {
            anim_walk = "walk",
            anim_walk_speed = 0.9,
            anim_run = "run2",
            bridge = true
          }
        },
        {
          pos = "locator2_child_05"
        },
        {
          pos = "locator2_child_04"
        }
      }
      repeat
        wait()
      until child_hdl:isMoveEnd()
      waitSeconds(2)
    until false
  end
  L12_36 = L12_36(L13_37)
  L13_37 = invokeTask
  function L14_38()
    repeat
      repeat
        if _kaiwa_cnt <= 0 then
        end
        wait()
      until Fn_getDistanceToPlayer(chi_pup_hdl) < 2.3 and _kaiwa_cnt <= 0
      child_hdl:pauseMove(true)
      Fn_turnNpc(child_hdl)
      child_hdl:playMotion("stay")
      repeat
        wait()
      until Fn_getDistanceToPlayer(chi_pup_hdl) >= 2.5
      child_hdl:pauseMove(false)
    until false
  end
  L13_37 = L13_37(L14_38)
  L14_38 = Fn_findAreaHandle
  L15_39 = "bu_a_root"
  L14_38 = L14_38(L15_39)
  if L14_38 then
    L16_40 = L14_38
    L15_39 = L14_38.setSceneParameters
    L17_41 = "wa_a_root"
    L15_39(L16_40, L17_41)
  end
  L15_39 = Fn_findAreaHandle
  L16_40 = "wa_a_root"
  L15_39 = L15_39(L16_40)
  if L15_39 then
    L17_41 = L15_39
    L16_40 = L15_39.setSceneParameters
    L18_42 = "wa_a_root"
    L16_40(L17_41, L18_42)
  end
  L16_40 = Fn_missionStart
  L16_40()
  L16_40 = Fn_userCtrlOn
  L16_40()
  L16_40 = Fn_kaiwaDemoView
  L17_41 = "ep01_00110k"
  L16_40(L17_41)
  L16_40 = Fn_missionView
  L17_41 = "ep01_01000"
  L18_42 = 5
  L16_40(L17_41, L18_42)
  L16_40 = Fn_playNpcEventMotion
  L17_41 = "npcgen2_miz01_01"
  L18_42 = _miz_event_mot_list
  L18_42 = L18_42.repair
  L19_43 = -1
  L20_44 = 0
  L21_45 = false
  L16_40(L17_41, L18_42, L19_43, L20_44, L21_45)
  L16_40 = invokeTask
  function L17_41()
    Fn_turnNpc("npcgen2_cid01_01", "npcgen2_man34_01")
    Fn_playNpcEventMotion("npcgen2_cid01_01", _cid_event_mot_list.stay1, -1, 1, false)
  end
  L16_40(L17_41)
  L16_40 = wait
  L17_41 = 10
  L16_40(L17_41)
  L16_40 = Fn_turnNpc
  L17_41 = "npcgen2_man34_01"
  L18_42 = "npcgen2_cid01_01"
  L16_40(L17_41, L18_42)
  L16_40 = Fn_playNpcEventMotion
  L17_41 = "npcgen2_man34_01"
  L18_42 = _man34_event_mot_list
  L18_42 = L18_42.talk3
  L19_43 = -1
  L20_44 = 1
  L21_45 = false
  L16_40(L17_41, L18_42, L19_43, L20_44, L21_45)
  L16_40 = Fn_enableKaiwaDemo
  L17_41 = talknode_hdl
  L16_40(L17_41)
  L16_40 = Fn_enableKaiwaDemo
  L17_41 = Fn_findNpcPuppet
  L18_42 = "npcgen2_ryz01_01"
  L36_60 = L17_41(L18_42)
  L16_40(L17_41, L18_42, L19_43, L20_44, L21_45, L22_46, L23_47, L24_48, L25_49, L26_50, L27_51, L28_52, L29_53, L30_54, L31_55, L32_56, L33_57, L34_58, L35_59, L36_60, L17_41(L18_42))
  L16_40 = Fn_findNpc
  L17_41 = "npcgen2_cid01_01"
  L16_40 = L16_40(L17_41)
  L17_41 = Fn_findNpcPuppet
  L18_42 = "npcgen2_cid01_01"
  L17_41 = L17_41(L18_42)
  L18_42 = Fn_findNpcPuppet
  L19_43 = "npcgen2_man34_01"
  L18_42 = L18_42(L19_43)
  L19_43 = invokeTask
  function L20_44()
    repeat
      if ore_check_eye(L17_41, 200) == false and Fn_getDistanceToPlayer(L17_41) > 50 then
        Fn_disableKaiwaDemo(talknode_hdl)
        L17_41:setVisible(false)
        L18_42:setVisible(false)
        Fn_setNpcActive("npcgen2_cid01_01", false)
        Fn_setNpcActive("npcgen2_man34_01", false)
        print("\227\130\183\227\131\137\227\131\188\227\129\168\227\130\172\227\131\175\227\131\138\230\182\136\227\129\151\227\129\159")
        break
      end
      print("\227\130\183\227\131\137\227\131\188\230\182\136\227\129\151\229\190\133\227\129\161" .. Fn_getDistanceToPlayer(L17_41))
      wait()
    until false
  end
  L19_43 = L19_43(L20_44)
  cid_gawa = L19_43
  L19_43 = 0
  L20_44 = {}
  L21_45 = 0
  L22_46 = invokeTask
  function L23_47()
    repeat
      waitSeconds(1)
      L21_45 = L21_45 + 1
      print(L21_45)
      if L21_45 > 20 then
        L20_44[0] = function()
          Fn_captionView("ep01_01016", nil, false)
        end
        L20_44[1] = function()
          Fn_captionView("ep01_01017", nil, false)
        end
        L20_44[2] = function()
          Fn_captionView("ep01_01018", nil, false)
        end
        L20_44[3] = function()
          Fn_captionView("ep01_01019", nil, false)
          L19_43 = L19_43 - 4
        end
        L20_44[L19_43]()
        L19_43 = L19_43 + 1
        L21_45 = 0
      end
    until false
  end
  L22_46 = L22_46(L23_47)
  auto_cap = L22_46
  while true do
    L22_46 = _kaiwa_cnt
    if not (L22_46 >= 1) then
      L22_46 = wait
      L22_46()
    end
  end
  L22_46 = cid_gawa
  if L22_46 ~= nil then
    L22_46 = cid_gawa
    L23_47 = L22_46
    L22_46 = L22_46.abort
    L22_46(L23_47)
    cid_gawa = nil
  end
  L22_46 = auto_cap
  if L22_46 ~= nil then
    L22_46 = auto_cap
    L23_47 = L22_46
    L22_46 = L22_46.abort
    L22_46(L23_47)
    auto_cap = nil
  end
  L22_46 = Fn_userCtrlAllOff
  L22_46()
  L22_46 = Fn_setNpcActive
  L23_47 = "sis_01"
  L24_48 = true
  L22_46(L23_47, L24_48)
  L22_46 = Fn_findNpc
  L23_47 = "sis_01"
  L22_46 = L22_46(L23_47)
  L23_47 = Fn_findNpcPuppet
  L24_48 = "sis_01"
  L23_47 = L23_47(L24_48)
  L24_48 = {L25_49}
  L25_49 = "locator2_sis_01_01"
  L25_49 = Fn_moveNpc
  L26_50 = "sis_01"
  L27_51 = L24_48
  L28_52 = {}
  L28_52.runLength = -1
  L25_49 = L25_49(L26_50, L27_51, L28_52)
  L26_50 = Fn_captionView
  L27_51 = "ep01_01001"
  L26_50(L27_51)
  L26_50 = Fn_findNpcPuppet
  L27_51 = "sis_01"
  L26_50 = L26_50(L27_51)
  L27_51 = Fn_lookAtObject
  L28_52 = L26_50
  L29_53 = -5
  L27_51 = L27_51(L28_52, L29_53)
  L28_52 = Player
  L29_53 = L28_52
  L28_52 = L28_52.setLookAtIk
  L30_54 = true
  L31_55 = 1
  L33_57 = L26_50
  L32_56 = L26_50.getWorldPos
  L36_60 = L32_56(L33_57)
  L28_52(L29_53, L30_54, L31_55, L32_56, L33_57, L34_58, L35_59, L36_60, L32_56(L33_57))
  L28_52 = waitSeconds
  L29_53 = 4
  L28_52(L29_53)
  L29_53 = L27_51
  L28_52 = L27_51.abort
  L28_52(L29_53)
  L28_52 = Fn_setNpcActive
  L29_53 = "sis_01"
  L30_54 = true
  L28_52(L29_53, L30_54)
  L28_52 = sdemo
  L29_53 = L28_52
  L28_52 = L28_52.set
  L30_54 = sdemo_node
  L31_55 = sdemo_chara
  L32_56 = kSDEMO_APPEND_AIM
  L28_52(L29_53, L30_54, L31_55, L32_56)
  L28_52 = sdemo
  L29_53 = L28_52
  L28_52 = L28_52.play
  L28_52(L29_53)
  L28_52 = waitSeconds
  L29_53 = 0.5
  L28_52(L29_53)
  L28_52 = Fn_captionView
  L29_53 = "ep01_01002"
  L28_52(L29_53)
  L28_52 = waitSeconds
  L29_53 = 1
  L28_52(L29_53)
  L28_52 = {
    L29_53,
    L30_54,
    L31_55,
    L32_56,
    L33_57,
    L34_58,
    L35_59,
    L36_60
  }
  L29_53 = "locator2_sis_01_02"
  L30_54 = "locator2_sis_01_03"
  L31_55 = "locator2_sis_01_04"
  L32_56 = "locator2_sis_01_05"
  L33_57 = "locator2_sis_01_06"
  L34_58 = "locator2_sis_01_07"
  L35_59 = "locator2_sis_01_08"
  L36_60 = "locator2_sis_01_09"
  L29_53 = Fn_moveNpc
  L30_54 = "sis_01"
  L31_55 = L28_52
  L32_56 = {}
  L32_56.runLength = -1
  L29_53 = L29_53(L30_54, L31_55, L32_56)
  L30_54 = waitSeconds
  L31_55 = 3
  L30_54(L31_55)
  L30_54 = sdemo
  L31_55 = L30_54
  L30_54 = L30_54.stop
  L32_56 = 2
  L30_54(L31_55, L32_56)
  L30_54 = Fn_userCtrlOn
  L30_54()
  L30_54 = Player
  L31_55 = L30_54
  L30_54 = L30_54.setLookAtIk
  L32_56 = false
  L33_57 = 1
  L34_58 = Vector
  L35_59 = 0
  L36_60 = 0
  L36_60 = L34_58(L35_59, L36_60, 0)
  L30_54(L31_55, L32_56, L33_57, L34_58, L35_59, L36_60, L34_58(L35_59, L36_60, 0))
  L30_54 = Fn_sendEventComSb
  L31_55 = "b_sisyChaceon"
  L30_54(L31_55)
  L30_54 = Fn_missionView
  L31_55 = "ep01_01003"
  L32_56 = 5
  L30_54(L31_55, L32_56)
  L30_54 = findGameObject2
  L31_55 = "Node"
  L32_56 = "pccubesensor2_00"
  L30_54 = L30_54(L31_55, L32_56)
  navi_node = L30_54
  L30_54 = Fn_naviSet
  L31_55 = navi_node
  L30_54(L31_55)
  L30_54 = waitPhace
  L30_54()
  L30_54 = Fn_naviKill
  L30_54()
  L30_54 = findGameObject2
  L31_55 = "Node"
  L32_56 = "locator2_navi_01"
  L30_54 = L30_54(L31_55, L32_56)
  navi_node = L30_54
  L30_54 = Fn_naviSet
  L31_55 = navi_node
  L30_54(L31_55)
  L30_54 = Fn_captionView
  L31_55 = "ep01_01020"
  L30_54(L31_55)
  L30_54 = waitPhace
  L30_54()
  L30_54 = Fn_naviKill
  L30_54()
  L30_54 = Fn_pcSensorOff
  L31_55 = "pccubesensormulti2_01"
  L30_54(L31_55)
  L30_54 = Fn_pcSensorOn
  L31_55 = "pccubesensor2_02"
  L30_54(L31_55)
  L30_54 = Fn_kaiwaDemoView
  L31_55 = "ep01_00140k"
  L30_54(L31_55)
  L30_54 = invokeTask
  function L31_55()
    local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77
    L0_64 = Fn_warpNpc
    L1_65 = "sis_01"
    L2_66 = "locator2_sis_01_12"
    L0_64(L1_65, L2_66)
    L0_64 = {}
    L0_64.anim_in = "jump_run_00"
    L0_64.anim_lp = "jump_run_fall_00"
    L0_64.anim_out = "jump_run_land_00"
    L0_64.anim_stay = "stay"
    L0_64.height = 0.5
    L1_65 = L22_46
    L2_66 = L1_65
    L1_65 = L1_65.jump
    L3_67 = "locator2_sis_02_00"
    L4_68 = L0_64
    L1_65(L2_66, L3_67, L4_68)
    repeat
      L1_65 = wait
      L1_65()
      L1_65 = L22_46
      L2_66 = L1_65
      L1_65 = L1_65.isJumpEnd
      L1_65 = L1_65(L2_66)
    until L1_65
    L1_65 = L22_46
    L2_66 = L1_65
    L1_65 = L1_65.pauseMove
    L3_67 = false
    L1_65(L2_66, L3_67)
    L1_65 = {L2_66, L3_67}
    L2_66 = "locator2_sis_02_01"
    L3_67 = "locator2_sis_02_02"
    L2_66 = Fn_moveNpc
    L3_67 = "sis_01"
    L4_68 = L1_65
    L5_69 = {}
    L5_69.runLength = -1
    L2_66 = L2_66(L3_67, L4_68, L5_69)
    L3_67 = findGameObject2
    L4_68 = "Node"
    L5_69 = "locator2_sis_02_03"
    L3_67 = L3_67(L4_68, L5_69)
    node_hdl = L3_67
    repeat
      L3_67 = wait
      L3_67()
      L3_67 = Fn_get_distance
      L4_68 = L23_47
      L5_69 = L4_68
      L4_68 = L4_68.getWorldPos
      L4_68 = L4_68(L5_69)
      L5_69 = node_hdl
      L6_70 = L5_69
      L5_69 = L5_69.getWorldTransform
      L13_77 = L5_69(L6_70)
      L3_67 = L3_67(L4_68, L5_69, L6_70, L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77, L5_69(L6_70))
    until L3_67 < 5
    L4_68 = L2_66
    L3_67 = L2_66.abort
    L3_67(L4_68)
    L2_66 = nil
    L3_67 = L22_46
    L4_68 = L3_67
    L3_67 = L3_67.pauseMove
    L5_69 = true
    L3_67(L4_68, L5_69)
    L3_67 = {}
    L3_67.anim_in = "jump_run_00"
    L3_67.anim_lp = "jump_run_fall_00"
    L3_67.anim_out = "jump_run_land_00"
    L3_67.anim_stay = "stay"
    L3_67.height = 0.5
    L4_68 = L22_46
    L5_69 = L4_68
    L4_68 = L4_68.jump
    L6_70 = "locator2_sis_02_03"
    L7_71 = L3_67
    L4_68(L5_69, L6_70, L7_71)
    repeat
      L4_68 = wait
      L4_68()
      L4_68 = L22_46
      L5_69 = L4_68
      L4_68 = L4_68.isJumpEnd
      L4_68 = L4_68(L5_69)
    until L4_68
    L4_68 = L22_46
    L5_69 = L4_68
    L4_68 = L4_68.pauseMove
    L6_70 = false
    L4_68(L5_69, L6_70)
    L4_68 = {L5_69}
    L5_69 = "locator2_sis_02_04"
    L5_69 = Fn_moveNpc
    L6_70 = "sis_01"
    L7_71 = L4_68
    L8_72 = {}
    L8_72.runLength = -1
    L5_69 = L5_69(L6_70, L7_71, L8_72)
    L6_70 = findGameObject2
    L7_71 = "Node"
    L8_72 = "locator2_sis_05"
    L6_70 = L6_70(L7_71, L8_72)
    node_hdl = L6_70
    repeat
      L6_70 = wait
      L6_70()
      L6_70 = Fn_get_distance
      L7_71 = L23_47
      L8_72 = L7_71
      L7_71 = L7_71.getWorldPos
      L7_71 = L7_71(L8_72)
      L8_72 = node_hdl
      L9_73 = L8_72
      L8_72 = L8_72.getWorldTransform
      L13_77 = L8_72(L9_73)
      L6_70 = L6_70(L7_71, L8_72, L9_73, L10_74, L11_75, L12_76, L13_77, L8_72(L9_73))
    until L6_70 < 5
    L7_71 = L5_69
    L6_70 = L5_69.abort
    L6_70(L7_71)
    L5_69 = nil
    L6_70 = L22_46
    L7_71 = L6_70
    L6_70 = L6_70.pauseMove
    L8_72 = true
    L6_70(L7_71, L8_72)
    L6_70 = {}
    L6_70.anim_in = "jump_run_00"
    L6_70.anim_lp = "jump_run_fall_00"
    L6_70.anim_out = "jump_run_land_00"
    L6_70.anim_stay = "stay"
    L6_70.height = 0.5
    L7_71 = L22_46
    L8_72 = L7_71
    L7_71 = L7_71.jump
    L9_73 = "locator2_sis_05"
    L10_74 = L6_70
    L7_71(L8_72, L9_73, L10_74)
    repeat
      L7_71 = wait
      L7_71()
      L7_71 = L22_46
      L8_72 = L7_71
      L7_71 = L7_71.isJumpEnd
      L7_71 = L7_71(L8_72)
    until L7_71
    L7_71 = L22_46
    L8_72 = L7_71
    L7_71 = L7_71.pauseMove
    L9_73 = false
    L7_71(L8_72, L9_73)
    L7_71 = {L8_72}
    L8_72 = "locator2_sis_05_2"
    L8_72 = Fn_moveNpc
    L9_73 = "sis_01"
    L10_74 = L7_71
    L11_75 = {}
    L11_75.runLength = -1
    L8_72 = L8_72(L9_73, L10_74, L11_75)
    L9_73 = findGameObject2
    L10_74 = "Node"
    L11_75 = "locator2_sis_06"
    L9_73 = L9_73(L10_74, L11_75)
    node_hdl = L9_73
    repeat
      L9_73 = wait
      L9_73()
      L9_73 = Fn_get_distance
      L10_74 = L23_47
      L11_75 = L10_74
      L10_74 = L10_74.getWorldPos
      L10_74 = L10_74(L11_75)
      L11_75 = node_hdl
      L12_76 = L11_75
      L11_75 = L11_75.getWorldTransform
      L13_77 = L11_75(L12_76)
      L9_73 = L9_73(L10_74, L11_75, L12_76, L13_77, L11_75(L12_76))
    until L9_73 < 5
    L10_74 = L8_72
    L9_73 = L8_72.abort
    L9_73(L10_74)
    L8_72 = nil
    L9_73 = {}
    L9_73.anim_in = "jump_run_00"
    L9_73.anim_lp = "jump_run_fall_00"
    L9_73.anim_out = "jump_run_land_00"
    L9_73.anim_stay = "stay"
    L9_73.height = 0.5
    L10_74 = L22_46
    L11_75 = L10_74
    L10_74 = L10_74.jump
    L12_76 = "locator2_sis_06"
    L13_77 = L9_73
    L10_74(L11_75, L12_76, L13_77)
    repeat
      L10_74 = wait
      L10_74()
      L10_74 = L22_46
      L11_75 = L10_74
      L10_74 = L10_74.isJumpEnd
      L10_74 = L10_74(L11_75)
    until L10_74
    L10_74 = {L11_75}
    L11_75 = "locator2_sis_06_02"
    L11_75 = Fn_moveNpc
    L12_76 = "sis_01"
    L13_77 = L10_74
    L11_75 = L11_75(L12_76, L13_77, {runLength = -1})
    L12_76 = findGameObject2
    L13_77 = "Node"
    L12_76 = L12_76(L13_77, "locator2_sis_07")
    node_hdl = L12_76
    repeat
      L12_76 = wait
      L12_76()
      L12_76 = Fn_get_distance
      L13_77 = L23_47
      L13_77 = L13_77.getWorldPos
      L13_77 = L13_77(L13_77)
      L12_76 = L12_76(L13_77, node_hdl:getWorldTransform())
    until L12_76 < 5
    L13_77 = L11_75
    L12_76 = L11_75.abort
    L12_76(L13_77)
    L11_75 = nil
    L12_76 = {}
    L12_76.anim_in = "jump_run_00"
    L12_76.anim_lp = "jump_run_fall_00"
    L12_76.anim_out = "jump_run_land_00"
    L12_76.anim_stay = "stay"
    L12_76.height = 0.5
    L13_77 = L22_46
    L13_77 = L13_77.jump
    L13_77(L13_77, "locator2_sis_07", L12_76)
    repeat
      L13_77 = wait
      L13_77()
      L13_77 = L22_46
      L13_77 = L13_77.isJumpEnd
      L13_77 = L13_77(L13_77)
    until L13_77
    L13_77 = {
      "locator2_sis_07_2",
      "locator2_sis_07_3",
      "locator2_sis_07_4"
    }
    while Fn_moveNpc("sis_01", L13_77, {runLength = -1}):isRunning() do
      wait()
    end
  end
  L30_54 = L30_54(L31_55)
  L31_55 = Fn_sendEventComSb
  L32_56 = "fall_Fast"
  L31_55(L32_56)
  L31_55 = findGameObject2
  L32_56 = "Node"
  L33_57 = "locator2_sis_01_06"
  L31_55 = L31_55(L32_56, L33_57)
  navi_node = L31_55
  L31_55 = Fn_naviSet
  L32_56 = navi_node
  L31_55(L32_56)
  L31_55 = waitPhace
  L31_55()
  L31_55 = Fn_pcSensorOn
  L32_56 = "pccubesensor2_06"
  L31_55(L32_56)
  L31_55 = Fn_naviKill
  L31_55()
  L31_55 = findGameObject2
  L32_56 = "Node"
  L33_57 = "locator2_help_05"
  L31_55 = L31_55(L32_56, L33_57)
  navi_node = L31_55
  L31_55 = Fn_naviSet
  L32_56 = navi_node
  L31_55(L32_56)
  L31_55 = Fn_captionView
  L32_56 = "ep01_01021"
  L31_55(L32_56)
  L31_55 = waitPhace
  L31_55()
  L31_55 = Fn_pcSensorOn
  L32_56 = "pccubesensor2_05"
  L31_55(L32_56)
  L31_55 = Fn_sendEventComSb
  L32_56 = "b_jumpon"
  L31_55(L32_56)
  L31_55 = Fn_captionView
  L32_56 = "ep01_01022"
  L31_55(L32_56)
  L31_55 = waitPhace
  L31_55()
  L31_55 = Fn_pcSensorOn
  L32_56 = "pccubesensor2_10"
  L31_55(L32_56)
  L31_55 = Fn_naviKill
  L31_55()
  L31_55 = findGameObject2
  L32_56 = "Node"
  L33_57 = "pccubesensor2_10"
  L31_55 = L31_55(L32_56, L33_57)
  navi_node = L31_55
  L31_55 = Fn_naviSet
  L32_56 = navi_node
  L31_55(L32_56)
  L31_55 = Fn_captionView
  L32_56 = "ep01_01004"
  L31_55(L32_56)
  L31_55 = waitPhace
  L31_55()
  L31_55 = Fn_pcSensorOn
  L32_56 = "pccubesensor2_08"
  L31_55(L32_56)
  L31_55 = Fn_pcSensorOn
  L32_56 = "pccubesensor2_08_02"
  L31_55(L32_56)
  if L30_54 ~= nil then
    L32_56 = L30_54
    L31_55 = L30_54.abort
    L31_55(L32_56)
    L30_54 = nil
  end
  L31_55 = invokeTask
  function L32_56()
    local L0_78
    L0_78 = {
      "locator2_sis_07_5",
      "locator2_sis_07_6"
    }
    while Fn_moveNpc("sis_01", L0_78, {runLength = -1}):isRunning() do
      wait()
    end
  end
  L31_55 = L31_55(L32_56)
  L32_56 = Fn_naviKill
  L32_56()
  L32_56 = findGameObject2
  L33_57 = "Node"
  L34_58 = "pccubesensor2_11"
  L32_56 = L32_56(L33_57, L34_58)
  navi_node = L32_56
  L32_56 = Fn_naviSet
  L33_57 = navi_node
  L32_56(L33_57)
  L32_56 = waitPhace
  L32_56()
  L32_56 = Fn_pcSensorOff
  L33_57 = "pccubesensor2_08"
  L32_56(L33_57)
  L32_56 = Fn_pcSensorOff
  L33_57 = "pccubesensor2_08_02"
  L32_56(L33_57)
  L32_56 = Fn_pcSensorOn
  L33_57 = "pccubesensor2_12"
  L32_56(L33_57)
  L32_56 = Fn_tutorialCaptionKill
  L32_56()
  L32_56 = nove_task
  if L32_56 ~= nil then
    L29_53 = nil
    L33_57 = L31_55
    L32_56 = L31_55.abort
    L32_56(L33_57)
    L31_55 = nil
  end
  L32_56 = Fn_warpNpc
  L33_57 = "sis_01"
  L34_58 = "locator2_sis_07_7"
  L32_56(L33_57, L34_58)
  L32_56 = invokeTask
  function L33_57()
    local L0_79
    L0_79 = {
      "locator2_sis_07_8",
      "locator2_sis_08"
    }
    while Fn_moveNpc("sis_01", L0_79, {runLength = -1}):isRunning() do
      wait()
    end
    Fn_warpNpc("sis_01", "locator2_sis_08")
  end
  L32_56 = L32_56(L33_57)
  L33_57 = Fn_findAreaHandle
  L34_58 = "bu_a_root"
  L33_57 = L33_57(L34_58)
  L34_58 = Area
  L35_59 = L34_58
  L34_58 = L34_58.setSceneParametersInterpolateTime
  L36_60 = 5
  L34_58(L35_59, L36_60)
  if L33_57 then
    L35_59 = L33_57
    L34_58 = L33_57.setSceneParameters
    L36_60 = "storm_a_root"
    L34_58(L35_59, L36_60)
  end
  L34_58 = Fn_findAreaHandle
  L35_59 = "wa_a_root"
  L34_58 = L34_58(L35_59)
  if L34_58 then
    L36_60 = L34_58
    L35_59 = L34_58.setSceneParameters
    L35_59(L36_60, "storm_a_root")
  end
  L35_59 = waitSeconds
  L36_60 = 1
  L35_59(L36_60)
  L35_59 = Fn_captionView
  L36_60 = "ep01_01005"
  L35_59(L36_60)
  L35_59 = waitPhace
  L35_59()
  L35_59 = Fn_naviKill
  L35_59()
  L35_59 = Fn_pcSensorOn
  L36_60 = "pccubesensor2_03"
  L35_59(L36_60)
  L35_59 = findGameObject2
  L36_60 = "Node"
  L35_59 = L35_59(L36_60, "locator2_help_03")
  navi_node = L35_59
  L35_59 = Fn_naviSet
  L36_60 = navi_node
  L35_59(L36_60)
  L35_59 = waitPhace
  L35_59()
  L35_59 = Fn_pcSensorOn
  L36_60 = "pccubesensor2_04"
  L35_59(L36_60)
  L35_59 = findGameObject2
  L36_60 = "Node"
  L35_59 = L35_59(L36_60, "locator2_sis_07_8")
  sisy_vo = L35_59
  L35_59 = Sound
  L36_60 = L35_59
  L35_59 = L35_59.playSE
  L35_59(L36_60, "sis020c", 1, "", sisy_vo)
  L35_59 = Sound
  L36_60 = L35_59
  L35_59 = L35_59.setAudibleRange
  L35_59(L36_60, sis020c, 400)
  L35_59 = waitSeconds
  L36_60 = 2
  L35_59(L36_60)
  L35_59 = Fn_naviKill
  L35_59()
  L36_60 = L32_56
  L35_59 = L32_56.abort
  L35_59(L36_60)
  L35_59 = invokeTask
  function L36_60()
    local L0_80
    L0_80 = {
      "locator2_sis_09"
    }
    while Fn_moveNpc("sis_01", L0_80, {
      runLength = -1,
      anim_run = "sis01_run_afraid_00"
    }):isRunning() do
      wait()
    end
    Fn_warpNpc("sis_01", "locator2_sis_10")
  end
  L35_59 = L35_59(L36_60)
  L36_60 = Fn_pcSensorOn
  L36_60("pccubesensor2_back_01")
  L36_60 = Fn_captionView
  L36_60("ep01_01006")
  L36_60 = Sound
  L36_60 = L36_60.playSE
  L36_60(L36_60, "kit061a", 1, "", L0_24)
  L36_60 = waitSeconds
  L36_60(1)
  L36_60 = findGameObject2
  L36_60 = L36_60("Node", "locator2_b_aim02")
  Player:setLookAtIk(true, 1, L36_60:getWorldPos())
  Fn_userCtrlAllOff()
  waitSeconds(1)
  Fn_sendEventComSb("enemy_b_01_call")
  Fn_sendEventComSb("enemy_b_11_call")
  Fn_sendEventComSb("enemy_b_12_call")
  waitSeconds(2)
  Fn_lookAtObject(L36_60, 0):abort()
  Fn_sendEventComSb("b_nevi_spown")
  Fn_sendEventComSb("enemy_idleOn")
  Fn_captionView("ep01_01007")
  waitSeconds(3)
  navi_node = findGameObject2("Node", "pccubesensor2_12")
  Fn_naviSet(navi_node)
  waitSeconds(1)
  Fn_sendEventComSb("enemy_idleOff")
  Fn_tutorialCaption("escape")
  Fn_userCtrlOn()
  waitPhace()
  Fn_pcSensorOn("pccubesensor2_12")
  Fn_tutorialCaptionKill()
  Fn_captionView("ep01_01010")
  L35_59:abort()
  L35_59 = nil
  waitSeconds(2)
  Fn_sendEventComSb("enemy_b_13_call")
  waitSeconds(1)
  Fn_tutorialCaption("escape")
  waitPhace()
  Fn_sendEventComSb("enemy_b_02_call")
  Fn_pcSensorOn("pccubesensor2_07")
  waitPhace()
  Fn_tutorialCaptionKill()
  Fn_pcSensorOn("pccubesensor2_07_2")
  repeat
    wait()
  until 0 >= enmgen2_ep01_b_02:getEnemyRest() or _next_phase == true
  _next_phase = false
  Fn_naviKill()
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  Area:setSceneParametersInterpolateTime()
  HUD:enemymarkerSetRange()
end
function pccubesensor2_sisy_chase_OnEnter(A0_81)
  A0_81:setActive(false)
  _next_phase = true
end
function pccubesensor2_12_OnEnter(A0_82)
  A0_82:setActive(false)
  _next_phase = true
  Fn_naviKill()
  navi_node = findGameObject2("Node", "pccubesensor2_07_2")
  Fn_naviSet(navi_node)
end
function pccubesensor2_back_01_OnEnter(A0_83)
  local L1_84
  L1_84 = A0_83.setActive
  L1_84(A0_83, false)
  L1_84 = Fn_pcSensorOn
  L1_84("pccubesensor2_advance_01")
  L1_84 = Fn_captionView
  L1_84("ep01_01009")
  L1_84 = findGameObject2
  L1_84 = L1_84("Node", "locator2_back_01")
  Fn_naviSet(L1_84)
end
function pccubesensor2_advance_01_OnEnter(A0_85)
  A0_85:setActive(false)
  Fn_pcSensorOn("pccubesensor2_back_01")
  Fn_naviKill()
  navi_node = findGameObject2("Node", "pccubesensor2_07_2")
  Fn_naviSet(navi_node)
end
function pccubesensor2_09_OnEnter(A0_86)
  A0_86:setActive(false)
  Fn_captionView("ep01_01012")
end
function pccubesensor2_enemy_01_OnEnter(A0_87)
  A0_87:setActive(false)
  _next_phase = true
end
function addKaiwaCount()
  local L1_88
  L1_88 = _kaiwa_cnt
  L1_88 = L1_88 + 1
  _kaiwa_cnt = L1_88
end
function navi_on()
  local L0_89, L1_90
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function ore_check_eye(A0_91, A1_92)
  local L2_93, L3_94, L4_95, L5_96
  if A1_92 == nil then
    A1_92 = 300
  end
  L2_93 = false
  L3_94 = Fn_isInSightTarget
  L4_95 = A0_91
  L3_94 = L3_94(L4_95)
  if L3_94 == true then
    L3_94 = Fn_getPcPosRot
    L4_95 = L3_94()
    L5_96 = L3_94.y
    L5_96 = L5_96 + 1.5
    L3_94.y = L5_96
    L5_96 = Query
    L5_96 = L5_96.setEyeSightTransform
    L5_96(L5_96, L3_94, L4_95)
    L5_96 = Query
    L5_96 = L5_96.setEyeSightAngle
    L5_96(L5_96, Deg2Rad(360))
    L5_96 = Query
    L5_96 = L5_96.setEyeSightRange
    L5_96(L5_96, A1_92)
    L5_96 = A0_91.getWorldPos
    L5_96 = L5_96(A0_91)
    if A1_92 >= Fn_getDistanceToPlayer(A0_91) and Query:raycastEyeSight(L5_96) == nil then
      L2_93 = true
    end
  end
  return L2_93
end
