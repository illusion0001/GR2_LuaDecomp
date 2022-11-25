dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep08_common.lua")
import("math")
import("DebugDraw")
_next_phase = false
_photo_start = false
_photo_caption = false
_photo = nil
_photo_check = false
_photo_node = {}
_detected_ar_flg = false
_detected_sol_flg = false
_soldierInstance = {}
_soldierEntInstance = {}
_guardInstance = {}
_npcTable = {}
_soldierEntName = {}
_soldierName = {}
_guardName = {}
_gem = {}
_restore_gem = {}
_ent_soldier_max = 4
_soldier_max = 18
_guard_max = 33
_sol_motion_list = {
  talk_00 = "man57_talk_00",
  talk_01 = "man57_talk_01",
  lookaround = "man57_lookaround_00"
}
_npc_tbl = {
  {
    name = "band_01",
    type = "man65",
    color_variation = 0,
    hair_variation = 0,
    node = "locator2_band_man65_02",
    start = true
  },
  {
    name = "band_02",
    type = "man63",
    node = "locator2_band_man65_01",
    start = true
  },
  {
    name = "band_03",
    type = "man65",
    color_variation = 0,
    hair_variation = 1,
    face_tex_name = "man65_face_d",
    node = "locator2_band_man65_04",
    start = true
  },
  {
    name = "band_04",
    type = "man65",
    color_variation = 3,
    hair_variation = 1,
    face_tex_name = "man65_face_b",
    node = "locator2_band_man65_03",
    start = true
  },
  {
    name = "vog",
    type = "vog01",
    node = "locator2_vog01_01",
    anim_name = "driver_01",
    attach = false
  }
}
_energy_gem_tbl = {
  "gem2_energy_001",
  "gem2_energy_002",
  "gem2_energy_003",
  "gem2_energy_004",
  "gem2_energy_005",
  "gem2_energy_006",
  "gem2_energy_007",
  "gem2_energy_008",
  "gem2_energy_009",
  "gem2_energy_010",
  "gem2_energy_011",
  "gem2_energy_012",
  "gem2_energy_013",
  "gem2_energy_014",
  "gem2_energy_015",
  "gem2_energy_016",
  "gem2_energy_017",
  "gem2_energy_018",
  "gem2_energy_019",
  "gem2_energy_020",
  "gem2_energy_021",
  "gem2_energy_022",
  "gem2_energy_023",
  "gem2_energy_024",
  "gem2_energy_025",
  "gem2_energy_026",
  "gem2_energy_027",
  "gem2_energy_028",
  "gem2_energy_029",
  "gem2_energy_030",
  "gem2_energy_031",
  "gem2_energy_032",
  "gem2_energy_033",
  "gem2_energy_034",
  "gem2_energy_035",
  "gem2_energy_036",
  "gem2_energy_037",
  "gem2_energy_038",
  "gem2_energy_039",
  "gem2_energy_040",
  "gem2_energy_041",
  "gem2_energy_042",
  "gem2_energy_043",
  "gem2_energy_044",
  "gem2_energy_045",
  "gem2_energy_046",
  "gem2_energy_047",
  "gem2_energy_048",
  "gem2_energy_0010",
  "gem2_energy_0011",
  "gem2_energy_0012",
  "gem2_energy_0013",
  "gem2_energy_0014",
  "gem2_energy_0015",
  "gem2_energy_0016",
  "gem2_energy_0017",
  "gem2_energy_0018",
  "gem2_energy_0019",
  "gem2_energy_0020"
}
_turn_npc_task = {}
function Initialize()
  local L0_0, L1_1, L2_2, L3_3, L4_4
  L0_0()
  L0_0(L1_1)
  for L3_3 = 1, _ent_soldier_max do
    L4_4 = "npcgen2_soldier_man57_"
    L4_4 = L4_4 .. string.format("%02d", L3_3)
    table.insert(_soldierEntName, L4_4)
    Fn_loadNpcEventMotion(L4_4, _sol_motion_list)
  end
  for L3_3 = 1, _soldier_max do
    L4_4 = "npcgen2_soldier_"
    L4_4 = L4_4 .. string.format("%02d", L3_3)
    table.insert(_soldierName, L4_4)
    Fn_loadNpcEventMotion("npcgen2_soldier_" .. string.format("%02d", L3_3), _sol_motion_list)
  end
  for L3_3 = 1, _guard_max do
    L4_4 = "npcgen2_guard_"
    L4_4 = L4_4 .. string.format("%02d", L3_3)
    table.insert(_guardName, L4_4)
    Fn_loadNpcEventMotion(L4_4, _sol_motion_list)
  end
  L0_0()
  for L3_3, L4_4 in L0_0(L1_1) do
    _gem[L3_3] = findGameObject2("Gem", L4_4)
    _restore_gem[L3_3] = findGameObject2("Gem", L4_4)
    if _gem[L3_3] ~= nil then
      _gem[L3_3]:setVisibleBlockHalfSize(3000)
    end
  end
end
function Ingame()
  local L0_5, L1_6, L2_7, L3_8, L4_9, L5_10, L6_11, L7_12, L8_13, L9_14, L10_15, L11_16, L12_17, L13_18, L14_19
  L0_5()
  L0_5()
  for L3_8 = 1, L1_6 - 1 do
    L9_14 = "talk_01"
    L9_14 = 10
    L4_9(L5_10, L6_11, L7_12, L8_13, L9_14)
  end
  for L5_10 = 1, 5 do
    L9_14 = "locator2_photo_0"
    L9_14 = L9_14 .. L10_15
    L6_11[L5_10] = L7_12
  end
  L2_7()
  L2_7(L3_8)
  L3_8(L4_9, L5_10)
  L3_8()
  L3_8(L4_9)
  L3_8(L4_9)
  L3_8(L4_9)
  L3_8(L4_9)
  L7_12.near = 380
  L7_12.far = 600
  L9_14 = "ep08_user_photo01"
  _photo = L3_8
  for L6_11 = 1, 5 do
    L9_14 = _photo_node
    L9_14 = L9_14[L6_11]
    L7_12(L8_13, L9_14)
  end
  while true do
    if L5_10 then
      if L5_10 == false then
        if L5_10 ~= nil then
          L5_10(L6_11)
          repeat
            L5_10()
            if not L5_10 then
              if L5_10 ~= false then
              end
            end
          until not L5_10
          L6_11(L7_12)
          if L5_10 ~= nil then
            L9_14 = L5_10
            L6_11(L7_12)
            if L6_11 == "number" then
              L6_11(L7_12)
              L6_11(L7_12)
            elseif L6_11 == "table" then
              for L9_14 = 1, #L5_10 do
                for L13_18, L14_19 in L10_15(L11_16) do
                  print(L13_18, L14_19)
                end
                if L10_15 ~= L11_16 then
                elseif L10_15 then
                  L10_15(L11_16)
                end
              end
              if L4_9 == 5 then
                _photo_check = true
                L6_11(L7_12)
                L6_11(L7_12)
                L6_11(L7_12)
                L6_11(L7_12)
                _photo = nil
                L6_11(L7_12)
              else
                L6_11(L7_12)
              end
            end
          end
          if L6_11 == false then
            if L6_11 then
              L6_11(L7_12)
              _photo = nil
            end
            L6_11(L7_12)
            L6_11(L7_12)
            L6_11(L7_12)
          end
        end
      end
    end
    if L5_10 then
      for L8_13 = 1, #L6_11 do
        L9_14 = _npcTable
        L9_14 = L9_14[L8_13]
        L9_14.status = L10_15
      end
      L5_10(L6_11)
      L5_10()
      L5_10()
      L5_10()
      break
    end
    L5_10()
  end
  L5_10(L6_11)
  L5_10(L6_11, L7_12)
  L5_10(L6_11, L7_12)
  L5_10(L6_11, L7_12)
  L5_10(L6_11, L7_12)
  L5_10(L6_11, L7_12)
  L5_10()
  L5_10()
  L5_10()
end
function Finalize()
  if _se_handle then
    Sound:stopSEHandle(_se_handle)
    _se_handle = nil
  end
end
function pccubesensor2_goal_OnEnter(A0_20)
  if _detected_ar_flg or _detected_sol_flg then
    return
  end
  Fn_pcSensorOff("pccubesensor2_detected_01")
  for _FORV_4_ = 1, _ent_soldier_max do
    _soldierEntInstance[_FORV_4_]:setSightParam2(0, 0, 0)
  end
  _FOR_:setStay(true)
  Fn_setBgmPoint("event", "ev_point1")
  _next_phase = true
  Fn_pcSensorOff(A0_20)
end
function pccubesensor2_near_ar_01_OnEnter(A0_21)
  invokeTask(function()
    Fn_captionView("ep08_00108")
  end)
  Fn_setCatWarpCheckPoint("locator2_pc_restart_pos")
  Fn_pcSensorOff(A0_21)
end
function pccubesensor2_near_ar_02_OnEnter(A0_22)
  invokeTask(function()
    Fn_captionView("ep08_00109")
  end)
  Fn_pcSensorOff(A0_22)
end
function pccubesensor2_near_ar_03_OnEnter(A0_23)
  _photo_start = false
  if _photo_check == false then
    invokeTask(function()
      Fn_captionView("ep08_00110")
    end)
  end
  Fn_pcSensorOff(A0_23)
end
function pccubesensor2_photospot_01_OnEnter(A0_24)
  print("pccubesensor2_photospot_01_OnEnter")
  invokeTask(function()
    Fn_pcSensorOff(A0_24)
    if _photo_caption == false then
      _photo_caption = true
      Player:setStay(true, false)
      wait(60)
      Fn_lookAtObject(_photo_node[2]):abort()
      Fn_captionView("ep08_00106")
      waitSeconds(1.5)
      Player:setStay(false)
      Fn_missionView("ep08_00107")
      if _photo_start == false then
        _photo_start = true
      end
      Fn_pcSensorOn(A0_24)
    end
    if _photo_caption then
      print("\227\131\149\227\130\169\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\170\227\131\179")
      _photo:resetCaption()
      _photo:coercionCaption(true)
    end
  end)
end
function pccubesensor2_photospot_01_OnLeave()
  print("pccubesensor2_photospot_01_OnLeave")
  invokeTask(function()
    if _photo_check == false then
      print("\227\131\149\227\130\169\227\131\136\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\170\227\131\149")
      _photo:coercionCaption(false)
    end
  end)
end
function pccubesensor2_detected_01_OnEnter()
  print("pccubesensor2_detected_01_OnEnter")
  invokeTask(function()
    local L0_25, L1_26, L2_27, L3_28
    for L3_28 = 1, _ent_soldier_max do
      if _soldierEntInstance[L3_28].status ~= NPC_STATUS.DEAD then
        Fn_turnNpc(_soldierEntInstance[L3_28].npcName)
        _soldierEntInstance[L3_28]:setAlertRange(500)
      end
    end
  end)
end
function pccubesensor2_detected_01_OnLeave()
  print("pccubesensor2_detected_01_OnLeave")
  for _FORV_3_ = 1, _ent_soldier_max do
    if _soldierEntInstance[_FORV_3_].status ~= NPC_STATUS.DEAD then
      _soldierEntInstance[_FORV_3_]:setAlertRange(3)
    end
  end
end
function pccubesensormulti2_restart_01_OnEnter(A0_29)
  local L1_30, L2_31, L3_32, L4_33, L5_34, L6_35, L7_36
  L1_30 = _detected_sol_flg
  if L1_30 then
    return
  end
  _detected_ar_flg = true
  L1_30 = print
  L2_31 = "detectedByArRoot"
  L1_30(L2_31)
  L1_30 = Fn_getGameObject
  L2_31 = "mother2"
  L1_30 = L1_30(L2_31)
  L2_31 = L1_30
  L1_30 = L1_30.findGameObject2
  L3_32 = "Sandbox2"
  L1_30 = L1_30(L2_31, L3_32, L4_33)
  L2_31 = {}
  L3_32 = findGameObject2
  L3_32 = L3_32(L4_33, L5_34)
  for L7_36 = 1, 18 do
    L2_31[L7_36] = L1_30:findGameObject2("Node", string.format("locator2_mechcannon_%02d", L7_36))
  end
  L5_34(L6_35)
end
function npcInit()
  print("npcInit")
  for _FORV_6_ = 1, _ent_soldier_max do
    if _soldierEntInstance[_FORV_6_] ~= nil and _soldierEntInstance[_FORV_6_].task ~= nil then
      _soldierEntInstance[_FORV_6_]:taskAbort()
    end
    _soldierEntInstance[_FORV_6_] = PerceivableNpc.new(_soldierEntName[_FORV_6_])
    _soldierEntInstance[_FORV_6_]:setPosList(({
      {
        {
          pos = "locator2_soldier_ent_01_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_ent_02_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_ent_03_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_ent_04_01",
          opt = nil
        }
      }
    })[_FORV_6_])
    _soldierEntInstance[_FORV_6_]:setMoveOption(_move_option_soldier_normal)
    _soldierEntInstance[_FORV_6_]:setCombatReady(false)
    _soldierEntInstance[_FORV_6_]:setAlertRange(3)
    _soldierEntInstance[_FORV_6_]:setCautionCoefficient(50, 0.5)
    _soldierEntInstance[_FORV_6_]:setSightParam2(_NPC_SIGHT_H_DEG, _NPC_SIGHT_V_DEG, 28)
    _soldierEntInstance[_FORV_6_]:setLoop(true)
    _soldierEntInstance[_FORV_6_]:setOnChangeState(soldierActionep08a)
    _soldierEntInstance[_FORV_6_]:setDismissMotion("stay")
    _soldierEntInstance[_FORV_6_]:action()
    _npcTable[_FORV_6_] = _soldierEntInstance[_FORV_6_]
  end
  for _FORV_6_ = 1, _soldier_max do
    if _soldierInstance[_FORV_6_] ~= nil and _soldierInstance[_FORV_6_].task ~= nil then
      _soldierInstance[_FORV_6_].task:abort()
      _soldierInstance[_FORV_6_].task = nil
    end
    _soldierInstance[_FORV_6_] = PerceivableNpc.new(_soldierName[_FORV_6_])
    _soldierInstance[_FORV_6_]:setPosList(({
      {
        {
          pos = "locator2_soldier_01_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_02_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_02_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_03_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_04_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_04_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_04_03",
          opt = nil
        },
        {
          pos = "locator2_soldier_04_04",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_05_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_05_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_05_03",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_06_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_06_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_06_03",
          opt = nil
        },
        {
          pos = "locator2_soldier_06_04",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_07_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_08_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_09_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_10_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_11_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_12_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_13_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_14_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_15_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_15_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_15_03",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_16_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_16_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_16_03",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_17_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_17_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_17_03",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_soldier_18_01",
          opt = nil
        },
        {
          pos = "locator2_soldier_18_02",
          opt = nil
        },
        {
          pos = "locator2_soldier_18_03",
          opt = nil
        }
      }
    })[_FORV_6_])
    _soldierInstance[_FORV_6_]:setMoveOption(_move_option_soldier_normal)
    _soldierInstance[_FORV_6_]:setLoop(true)
    _soldierInstance[_FORV_6_]:setSightParam(0, 0)
    _soldierInstance[_FORV_6_]:action()
    _npcTable[_FORV_6_ + _ent_soldier_max] = _soldierInstance[_FORV_6_]
  end
  for _FORV_6_ = 1, _guard_max do
    if _guardInstance[_FORV_6_] ~= nil and _guardInstance[_FORV_6_].task ~= nil then
      _guardInstance[_FORV_6_].task:abort()
      _guardInstance[_FORV_6_].task = nil
    end
    _guardInstance[_FORV_6_] = PerceivableNpc.new(_guardName[_FORV_6_])
    _guardInstance[_FORV_6_]:setPosList(({
      {
        {
          pos = "locator2_guard_01_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_02_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_03_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_04_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_05_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_06_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_07_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_08_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_09_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_10_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_11_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_12_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_13_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_14_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_15_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_16_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_17_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_18_01",
          opt = nil
        },
        {
          pos = "locator2_guard_18_02",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_19_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_20_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_21_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_22_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_23_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_24_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_25_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_26_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_27_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_28_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_29_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_30_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_31_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_32_01",
          opt = nil
        }
      },
      {
        {
          pos = "locator2_guard_33_01",
          opt = nil
        }
      }
    })[_FORV_6_])
    _guardInstance[_FORV_6_]:setMoveOption(_move_option_soldier_normal)
    _guardInstance[_FORV_6_]:setLoop(false)
    _guardInstance[_FORV_6_]:setSightParam(0, 0)
    _guardInstance[_FORV_6_]:action()
    _npcTable[_FORV_6_ + _soldier_max + _ent_soldier_max] = _guardInstance[_FORV_6_]
  end
  _FOR_[1]:setStayMotion(_sol_motion_list.talk_00)
  _soldierEntInstance[4]:setStayMotion(_sol_motion_list.talk_01)
  _soldierInstance[7]:setLoop(false)
  _soldierInstance[10]:setLoop(false)
  _soldierInstance[13]:setLoop(false)
  _soldierInstance[14]:setLoop(false)
  _soldierInstance[7]:setStayMotion(_sol_motion_list.talk_00)
  _soldierInstance[10]:setStayMotion(_sol_motion_list.talk_00)
  _soldierInstance[13]:setStayMotion(_sol_motion_list.talk_00)
  _soldierInstance[14]:setStayMotion(_sol_motion_list.talk_01)
  _guardInstance[1]:setStayMotion(_sol_motion_list.talk_01)
  _guardInstance[2]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[4]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[5]:setStayMotion(_sol_motion_list.talk_01)
  _guardInstance[7]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[8]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[9]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[10]:setStayMotion(_sol_motion_list.talk_01)
  _guardInstance[11]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[12]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[15]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[17]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[23]:setStayMotion(_sol_motion_list.talk_00)
  _guardInstance[18]:setLoop(true)
  CautionLevel.setNpc(_npcTable)
  CautionLevel.setLabel("ep08_00114")
  CautionLevel.drawTask()
  CautionLevel.setKeepVisible(false)
end
function detectedBySoldier(A0_37)
  Fn_pcSensorOff("pccubesensor2_detected_01")
  Fn_pcSensorOff("pccubesensor2_goal")
  for _FORV_4_ = 1, #_npcTable do
    _npcTable[_FORV_4_].status = NPC_STATUS.TERMINATE
  end
  _detected_sol_flg = true
  waitSeconds(1)
  CautionLevel.allTerminate()
  print("detectedBy:" .. A0_37)
  invokeTask(function()
    local L0_38, L1_39, L2_40, L3_41, L4_42, L5_43, L6_44, L7_45, L8_46, L9_47
    L0_38 = Fn_findAreaHandle
    L1_39 = "ar_a_root"
    L0_38 = L0_38(L1_39)
    L1_39 = Sound
    L2_40 = L1_39
    L1_39 = L1_39.playSEHandle
    L3_41 = "ep08_siren"
    L4_42 = 1
    L5_43 = ""
    L1_39 = L1_39(L2_40, L3_41, L4_42, L5_43, L6_44)
    L2_40 = findGameObject2
    L3_41 = "Puppet"
    L4_42 = A0_37
    L2_40 = L2_40(L3_41, L4_42)
    L3_41 = nil
    L4_42 = setPlayerIdle2
    L4_42()
    L4_42 = invokeTask
    function L5_43()
      if _soldierEntInstance[1].npcName ~= A0_37 then
        Fn_turnNpc(_soldierEntInstance[1].npcName)
        Fn_playMotionNpc(_soldierEntInstance[1].npcName, "shoot_aim", false)
      end
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.3
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      if _soldierEntInstance[2].npcName ~= A0_37 then
        Fn_turnNpc(_soldierEntInstance[2].npcName)
        Fn_playMotionNpc(_soldierEntInstance[2].npcName, "shoot_aim", false)
      end
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.2
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      if _soldierEntInstance[3].npcName ~= A0_37 then
        Fn_turnNpc(_soldierEntInstance[3].npcName)
        Fn_playMotionNpc(_soldierEntInstance[3].npcName, "shoot_aim", false)
      end
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.3
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      if _soldierEntInstance[4].npcName ~= A0_37 then
        Fn_turnNpc(_soldierEntInstance[4].npcName)
        Fn_playMotionNpc(_soldierEntInstance[4].npcName, "shoot_aim", false)
      end
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.5
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      Fn_turnNpc(_npc_tbl[4].name)
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.3
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      Fn_turnNpc(_npc_tbl[1].name)
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.2
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      Fn_turnNpc(_npc_tbl[3].name)
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = waitSeconds
    L5_43 = 0.2
    L4_42(L5_43)
    L4_42 = invokeTask
    function L5_43()
      Fn_turnNpc(_npc_tbl[2].name)
    end
    L4_42 = L4_42(L5_43)
    L3_41 = L4_42
    L4_42 = table
    L4_42 = L4_42.insert
    L5_43 = _turn_npc_task
    L4_42(L5_43, L6_44)
    L4_42 = Fn_lookAtObject
    L5_43 = L2_40
    L4_42 = L4_42(L5_43)
    L5_43 = Fn_captionView
    L5_43(L6_44)
    L5_43 = waitSeconds
    L5_43(L6_44)
    L5_43 = Fn_turnNpc
    L5_43(L6_44)
    L5_43 = Fn_playMotionNpc
    L5_43(L6_44, L7_45, L8_46)
    L5_43 = L4_42.abort
    L5_43(L6_44)
    L5_43 = Fn_blackout
    L5_43(L6_44)
    L5_43 = waitSeconds
    L5_43(L6_44)
    L5_43 = Player
    L5_43 = L5_43.setEnergy
    L9_47 = L8_46
    L9_47 = true
    L5_43(L6_44, L7_45, L8_46, L9_47)
    L5_43 = Fn_resetPcPos
    L5_43(L6_44, L7_45)
    L5_43 = npcInit
    L5_43()
    L5_43 = boxGemRestore
    L5_43()
    L5_43 = npcPosReset
    L5_43()
    L5_43 = Sound
    L5_43 = L5_43.stopSEHandle
    L5_43(L6_44, L7_45)
    _detected_sol_flg = false
    L5_43 = Fn_lookAtObject
    L9_47 = L6_44(L7_45, L8_46)
    L5_43 = L5_43(L6_44, L7_45, L8_46, L9_47, L6_44(L7_45, L8_46))
    L6_44(L7_45)
    L6_44()
    L6_44(L7_45)
    L6_44(L7_45, L8_46)
    L6_44(L7_45)
    L6_44(L7_45)
    L6_44(L7_45)
    L6_44(L7_45)
    for L9_47 = 1, #L7_45 do
      print("_turn_npc_task[" .. L9_47 .. "]:abort()")
      _turn_npc_task[L9_47]:abort()
    end
    _turn_npc_task = L6_44
    L6_44(L7_45)
    L6_44(L7_45)
    L6_44()
    L6_44(L7_45)
  end)
end
function boxGemRestore()
  for _FORV_3_, _FORV_4_ in pairs(_energy_gem_tbl) do
    if _gem[_FORV_3_] ~= nil then
      _gem[_FORV_3_]:kill()
      _gem[_FORV_3_] = nil
      _gem[_FORV_3_] = createGem(_restore_gem[_FORV_3_], 4)
    end
  end
end
function npcPosReset()
  local L0_48, L1_49, L2_50, L3_51
  for L3_51 = 1, _ent_soldier_max do
    Fn_warpNpc(_soldierEntInstance[L3_51].npcName, string.format("locator2_soldier_ent_%02d_01", L3_51))
  end
  for L3_51 = 1, L1_49 - 1 do
    Fn_warpNpc(_npc_tbl[L3_51].name, string.format("locator2_band_man65_%02d", L3_51))
  end
  L0_48(L1_49, L2_50)
end
