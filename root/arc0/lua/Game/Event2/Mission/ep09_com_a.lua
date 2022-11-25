dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Misc/lithograph_controller.lua")
dofile("/Game/Event2/bgset/bg_az_02_param.lua")
_isFirstTimeCatWorp = false
mine_name = "ep09_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_progress_table = {
  ep09_a = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    id = 1,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_b = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    id = 1,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_c = {
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    id = 2,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_d = {
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    id = 2,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_e = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    id = 3,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_f = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    id = 3,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_g = {
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    id = 4,
    crow = true,
    soldier = true,
    attribute = true
  },
  ep09_h = {
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    id = 4,
    crow = false,
    soldier = false,
    attribute = true
  },
  ep09_i = {
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    id = 4,
    crow = false,
    soldier = false,
    attribute = true
  },
  ep09_j = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    id = 5,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_k = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    id = 5,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_l = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    id = 6,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_m = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    id = 6,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_n = {
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    id = 7,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_o = {
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    id = 7,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_p = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    id = 8,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_q = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    id = 8,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_r = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    id = 9,
    crow = false,
    soldier = false,
    attribute = false
  },
  ep09_s = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    id = 9,
    crow = true,
    soldier = false,
    attribute = false
  },
  ep09_t = {
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    id = 9,
    crow = true,
    soldier = false,
    attribute = false
  }
}
_litho_area_table = {
  ep09_a = {prev = nil, current = "az2_a_16"},
  ep09_b = {
    prev = nil,
    current = "az2_a_16",
    next = "az2_a_17"
  },
  ep09_c = {prev = "az2_a_16", current = "az2_a_17"},
  ep09_d = {
    prev = "az2_a_16",
    current = "az2_a_17",
    next = "az2_a_18"
  },
  ep09_e = {prev = "az2_a_17", current = "az2_a_18"},
  ep09_f = {
    prev = "az2_a_17",
    current = "az2_a_18",
    next = "az2_a_20"
  },
  ep09_g = {prev = "az2_a_18", current = "az2_a_20"},
  ep09_h = {prev = "az2_a_18", current = "az2_a_20"},
  ep09_i = {
    prev = "az2_a_18",
    current = "az2_a_20",
    current2 = "az2_a_03",
    next = "az2_a_23"
  },
  ep09_j = {prev = "az2_a_03", current = "az2_a_23"},
  ep09_k = {
    prev = "az2_a_03",
    current = "az2_a_23",
    current2 = "az2_a_04_02",
    next = "az2_a_22"
  },
  ep09_l = {
    prev = "az2_a_04_02",
    current = "az2_a_22"
  },
  ep09_m = {
    prev = "az2_a_04_02",
    current = "az2_a_22",
    next = "az2_a_21"
  },
  ep09_n = {prev = "az2_a_22", current = "az2_a_21"},
  ep09_o = {
    prev = "az2_a_22",
    current = "az2_a_21",
    next = "az2_a_24"
  },
  ep09_p = {prev = "az2_a_21", current = "az2_a_24"},
  ep09_q = {
    prev = "az2_a_21",
    current = "az2_a_24",
    next = "gm_a_root"
  },
  ep09_r = {prev = "az2_a_24", current = "gm_a_root"},
  ep09_s = {prev = "az2_a_24", current = "gm_a_root"},
  ep09_t = {prev = nil, current = nil}
}
_mission_text_table = {
  {text = "ep09_09003", se = "skb_003"},
  {text = "ep09_09005", se = "skb_003"},
  {text = "ep09_09004", se = "skb_003"},
  {text = "ep09_09006", se = "skb_001"},
  {text = "ep09_09007", se = "skb_001"},
  {text = "ep09_09008", se = "skb_003"},
  {text = "ep09_09009", se = "skb_001"},
  {text = "ep09_09010", se = "skb_003"}
}
_demo_table = {
  {
    first_half = {
      warp = "locator2_pc_move_pos_01",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    },
    second_half = {
      warp = "locator2_pc_move_pos_02",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      },
      cut2 = {
        cam = "locator2_cam_02",
        aim = "locator2_aim_01"
      },
      cut3 = {
        cam = "locator2_cam_03",
        aim = "locator2_aim_02"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos_02",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos_02",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      },
      cut2 = {
        cam = "locator2_cam_02",
        aim = "locator2_aim_01"
      },
      cut3 = {
        cam = "locator2_cam_03",
        aim = "locator2_aim_02"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_sdemo_start_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01",
        waittime = 2
      },
      endfade = true
    },
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01b",
        aim = "locator2_litho_01b"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_move_pos_01",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    },
    second_half = {
      warp = "locator2_pc_move_pos_02",
      cut1 = {
        cam = "locator2_cam_01b",
        aim = "locator2_litho_01b"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01",
        waittime = 1.6
      },
      cut2 = {
        cam = "locator2_cam_02",
        aim = "locator2_aim_01"
      },
      cut3 = {
        cam = "locator2_cam_02",
        aim = "locator2_aim_02"
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    }
  }
}
_guide_eff_table = {
  "ef_ev_hndpar02_01",
  "ef_ev_hndpar02_02",
  "ef_ev_hndpar02_03",
  "ef_ev_hndpar02_04",
  "ef_ev_hndpar02_05",
  "ef_ev_hndpar02_06",
  "ef_ev_hndpar02_07",
  "ef_ev_hndpar02_08"
}
_spawn_request = false
_grab_request = false
_invisible_request = false
_set_area_request = false
_lockwarp_request = false
_set_idling_request = false
_release_idling_request = false
_move_request = nil
_spawn_node = nil
_first_action = nil
_warp_node = nil
_wait = nil
_advanced_degree = nil
_end_move_node = nil
_middle_move_node = nil
_move_vel = nil
_puppet_crow = nil
_brain_crow = nil
_spawn_crow = false
area_max_az2 = 27
area_max_az2_a_01 = 4
area_max_az2_a_02 = 3
area_max_az2_a_04 = 2
area_max_az2_a_05 = 27
area_max_az2_a_06 = 32
area_max_az2_a_07 = 88
area_max_az2_a_08 = 62
area_max_az2_a_09 = 61
area_max_az2_a_10 = 16
area_max_az2_a_11 = 13
area_max_az2_a_12 = 40
area_max_az2_a_13 = 99
area_max_az2_a_14 = 226
area_max_az2_a_15 = 158
candle_fire_max_az2_a_01 = 5
candle_fire_max_az2_a_02 = 5
candle_fire_max_az2_a_03 = 3
candle_fire_max_az2_a_04 = 4
candle_fire_max_az2_a_05 = 1
candle_fire_max_az2_a_06 = 1
candle_fire_max_az2_a_07 = 1
candle_fire_max_az2_a_16 = 9
candle_fire_max_az2_a_17 = 11
candle_fire_max_az2_a_18 = 10
candle_fire_max_az2_a_19 = 10
candle_fire_max_az2_a_20 = 15
candle_fire_max_az2_a_21 = 2
candle_fire_max_az2_a_22 = 7
candle_fire_max_az2_a_23 = 12
candle_fire_max_az2_a_24 = 13
candle_fire_max_az2_a_25 = 8
candle_fire_max_az2_a_26 = 6
candle_fire_max_az2_a_27 = 6
_candle_fire = false
_candle_fire_se = nil
bubble_big = {}
bubble_medium = {}
bubble_small = {}
bubble_very_small = {}
ammo = {}
ammo_max = 46
attribute_hdl = nil
attribute_effect = nil
com_a_catwarp_max = 9
effect_hdl = nil
function putCandleFireEffect(A0_0, A1_1, A2_2)
  local L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11
  L3_3 = Fn_findAreaHandle
  L3_3 = L3_3(L4_4)
  if L3_3 ~= nil then
    for L7_7 = 1, A1_1 do
      L9_9 = L3_3
      L8_8 = L3_3.getNodePosRot
      L10_10 = string
      L10_10 = L10_10.format
      L11_11 = "candle_fire_%s_%02d"
      L11_11 = L10_10(L11_11, string.sub(A0_0, 1, 8), L7_7)
      L9_9 = L8_8(L9_9, L10_10, L11_11, L10_10(L11_11, string.sub(A0_0, 1, 8), L7_7))
      if L8_8 ~= nil and L9_9 ~= nil then
        L10_10 = Fn_createEffect
        L11_11 = string
        L11_11 = L11_11.format
        L11_11 = L11_11("ef_CandleFire_%s_%02d", A0_0, L7_7)
        L10_10 = L10_10(L11_11, "ef_ev_fir_02", L8_8, true)
      end
      if L10_10 ~= nil then
        L11_11 = L3_3.appendChild
        L11_11(L3_3, L10_10)
        L11_11 = L10_10.setWorldTransform
        L11_11(L10_10, L8_8, L9_9)
        if A2_2 == nil then
          L11_11 = Sound
          L11_11 = L11_11.playSE
          L11_11(L11_11, "ep09_candle_ignition")
        end
        L11_11 = createGameObject2
        L11_11 = L11_11("PlayerSensor")
        L11_11:setName(string.format("pcspheresensor2_CandleFire_%s_%02d", A0_0, L7_7))
        L11_11:setFilterType("Player")
        L11_11:setDetectBehavior(1)
        L11_11:addBox(Vector(1, 2, 1), Vector(0, 2, 0))
        L11_11:setOnEnter("pcspheresensor2_CandleFire_OnEnter")
        L11_11:setOnLeave("pcspheresensor2_CandleFire_OnLeave")
        L3_3:appendChild(L11_11)
        L11_11:setWorldTransform(L8_8, L9_9)
        L11_11:setForceMove()
        L11_11:try_init()
        L11_11:waitForReady()
        L11_11:try_start()
      end
    end
    return L4_4
  end
  return L4_4
end
function removeCandleFireEffect(A0_12, A1_13, A2_14)
  local L3_15, L4_16, L5_17, L6_18, L7_19
  L3_15 = Fn_findAreaHandle
  L3_15 = L3_15(L4_16)
  if L3_15 ~= nil then
    for L7_19 = 1, A1_13 do
      if findGameObject2("Effect", string.format("ef_CandleFire_%s_%02d", A0_12, L7_19)) ~= nil then
        if A2_14 == nil then
          Sound:playSE("ep09_candle_lost")
        end
        findGameObject2("Effect", string.format("ef_CandleFire_%s_%02d", A0_12, L7_19)):stop()
        findGameObject2("Effect", string.format("ef_CandleFire_%s_%02d", A0_12, L7_19)):kill()
      end
      if findGameObject2("PlayerSensor", string.format("pcspheresensor2_CandleFire_%s_%02d", A0_12, L7_19)) ~= nil then
        findGameObject2("PlayerSensor", string.format("pcspheresensor2_CandleFire_%s_%02d", A0_12, L7_19)):kill()
      end
    end
    return L4_16
  end
  return L4_16
end
function setLightIntensityMin(A0_20, A1_21)
  if Fn_findAreaHandle(A0_20) ~= nil then
    Fn_findAreaHandle(A0_20):setLightIntensity(0, A1_21)
  end
end
function setLightIntensityMax(A0_22, A1_23)
  if Fn_findAreaHandle(A0_22) ~= nil then
    Fn_findAreaHandle(A0_22):setLightIntensity(1, A1_23)
  end
end
function setEffectivenessOn(A0_24, A1_25)
  if Fn_findAreaHandle(A0_24) ~= nil then
    Fn_findAreaHandle(A0_24):setEffectiveness(true, A1_25)
  end
end
function setEffectivenessOff(A0_26, A1_27)
  if Fn_findAreaHandle(A0_26) ~= nil then
    Fn_findAreaHandle(A0_26):setEffectiveness(false, A1_27)
  end
end
function Lithograph_OnInitialize(A0_28)
  local L1_29, L2_30
  if A0_28 ~= nil then
    L1_29 = Fn_getMissionPart
    L1_29 = L1_29()
    L2_30 = A0_28.getName
    L2_30 = L2_30(A0_28)
    return _progress_table[L1_29][tonumber(string.sub(L2_30, -2))]
  end
  L1_29 = false
  return L1_29
end
function brokenCallbackBubble(A0_31)
  local L1_32
end
function restoreCallbackBubble(A0_33)
  Sound:playSE("ep09_bubble_appear", 1, "", A0_33:getPos())
  A0_33:pushJob("NJO", "N", 0, "B")
end
function invisibleBubble(A0_34)
  if string.sub(A0_34, 1, 8) == "az2_a_12" then
    if bubble_big[tonumber(string.sub(A0_34, 10))] ~= nil then
      bubble_big[tonumber(string.sub(A0_34, 10))]:setVisiblePermission(false)
      bubble_big[tonumber(string.sub(A0_34, 10))]:setCollidablePermission(false)
    end
  elseif string.sub(A0_34, 1, 8) == "az2_a_13" then
    if bubble_medium[tonumber(string.sub(A0_34, 10))] ~= nil then
      bubble_medium[tonumber(string.sub(A0_34, 10))]:setVisiblePermission(false)
      bubble_medium[tonumber(string.sub(A0_34, 10))]:setCollidablePermission(false)
    end
  elseif string.sub(A0_34, 1, 8) == "az2_a_14" then
    if bubble_small[tonumber(string.sub(A0_34, 10))] ~= nil then
      bubble_small[tonumber(string.sub(A0_34, 10))]:setVisiblePermission(false)
      bubble_small[tonumber(string.sub(A0_34, 10))]:setCollidablePermission(false)
    end
  elseif string.sub(A0_34, 1, 8) == "az2_a_15" and bubble_very_small[tonumber(string.sub(A0_34, 10))] ~= nil then
    bubble_very_small[tonumber(string.sub(A0_34, 10))]:setVisiblePermission(false)
    bubble_very_small[tonumber(string.sub(A0_34, 10))]:setCollidablePermission(false)
  end
end
function visibleBubble(A0_35)
  if string.sub(A0_35, 1, 8) == "az2_a_12" then
    if bubble_big[tonumber(string.sub(A0_35, 10))] ~= nil then
      bubble_big[tonumber(string.sub(A0_35, 10))]:setVisiblePermission(true)
      bubble_big[tonumber(string.sub(A0_35, 10))]:setCollidablePermission(true)
    end
  elseif string.sub(A0_35, 1, 8) == "az2_a_13" then
    if bubble_medium[tonumber(string.sub(A0_35, 10))] ~= nil then
      bubble_medium[tonumber(string.sub(A0_35, 10))]:setVisiblePermission(true)
      bubble_medium[tonumber(string.sub(A0_35, 10))]:setCollidablePermission(true)
    end
  elseif string.sub(A0_35, 1, 8) == "az2_a_14" then
    if bubble_small[tonumber(string.sub(A0_35, 10))] ~= nil then
      bubble_small[tonumber(string.sub(A0_35, 10))]:setVisiblePermission(true)
      bubble_small[tonumber(string.sub(A0_35, 10))]:setCollidablePermission(true)
    end
  elseif string.sub(A0_35, 1, 8) == "az2_a_15" and bubble_very_small[tonumber(string.sub(A0_35, 10))] ~= nil then
    bubble_very_small[tonumber(string.sub(A0_35, 10))]:setVisiblePermission(true)
    bubble_very_small[tonumber(string.sub(A0_35, 10))]:setCollidablePermission(true)
  end
end
function brokenCallbackAmmo(A0_36)
  local L1_37
end
function restoreCallbackAmmo(A0_38)
  local L1_39
end
function invisibleAmmo(A0_40)
  local L1_41
  L1_41 = tonumber
  L1_41 = L1_41(string.sub(A0_40, 17))
  if ammo[num] ~= nil then
    ammo[num]:setVisiblePermission(false)
    ammo[num]:setCollidablePermission(false)
  end
end
function visibleAmmo(A0_42)
  local L1_43
  L1_43 = tonumber
  L1_43 = L1_43(string.sub(A0_42, 17))
  if ammo[num] ~= nil then
    ammo[num]:setVisiblePermission(true)
    ammo[num]:setCollidablePermission(true)
  end
end
function setupNpc(A0_44)
  local L1_45
  L1_45 = {}
  L1_45.label01 = "man01_groggy_01"
  Fn_loadNpcEventMotion("npcgen2_sol_01", L1_45)
  if A0_44 then
    Fn_playNpcEventMotion("npcgen2_sol_01", L1_45.label01, -1, 0, false)
    Fn_setGrabNpc("npcgen2_sol_01", true, true)
    Fn_findNpc("npcgen2_sol_01"):ignoreStoop()
  else
    Fn_disappearNpc("npcgen2_sol_01")
  end
end
function Initialize()
  local L0_46
  L0_46 = Fn_sendBulkMineSetupRun
  L0_46(mine_name, _gravityOre, _addGravityOre)
  repeat
    L0_46 = wait
    L0_46()
    L0_46 = Fn_sendIsRunMine
    L0_46 = L0_46()
  until L0_46
  L0_46 = Fn_getMissionPart
  L0_46 = L0_46()
  _litho_ctrls = nil
  _litho_ctrls = Lithograph_controller.create(_progress_table, _demo_table, _mission_text_table, _guide_eff_table)
  if L0_46 ~= "ep09_t" then
    Fn_createEffect("mechsky_smk", "ef_ev_smk_01", findGameObject2("Node", "locator2_effect_pos_ve"), true)
  end
  wait()
  if _progress_table[L0_46].attribute then
    attribute_hdl = Fn_createGimmickBg("locator2_attribute", "attribute_01", "cilightarmor01_base", false)
    wait()
    attribute_effect = Fn_createEffect("ev_tune_01", "ef_ev_tune_01", findGameObject2("Node", "locator2_attribute"), true)
  end
  initializeArea(L0_46)
  startSynchroArea()
end
function Ingame()
  local L0_47
  L0_47 = Fn_getMissionPart
  L0_47 = L0_47()
  if _progress_table[L0_47].crow then
    supportCrowSpawn("locator2_crow_start_pos_" .. L0_47)
  end
  putGimmickBg()
  setupNpc(_progress_table[L0_47].soldier)
  while true do
    if _spawn_request then
      supportCrowSpawn(_spawn_node, _first_action, _wait)
      _spawn_request = false
    elseif _grab_request then
      supportCrowGrab()
      _grab_request = false
    elseif _lockwarp_request then
      supportCrowLockToWarp(_warp_node)
      _lockwarp_request = false
    elseif _set_idling_request then
      supportCrowSetIdling()
      _set_idling_request = false
    elseif _release_idling_request then
      supportCrowReleaseIdling()
      _release_idling_request = false
    elseif _move_request then
      supportCrowMove(_end_move_node, _middle_move_node, _move_vel)
      _move_request = false
    elseif _reset_request then
      supportCrowReset()
      _reset_request = false
    elseif _invisible_request then
      invisibleBg(_advanced_degree)
      _invisible_request = false
    elseif _set_area_request then
      repeat
        wait()
      until _litho_ctrls:isSecondHalfProcessStart()
      if _puppet_crow then
        supportCrowLockToWarp("locator2_crow_move_pos_" .. Fn_getMissionPart())
      end
      repeat
        wait()
      until _litho_ctrls:isSecondHalfProcessWait()
      setArea()
      _litho_ctrls:setSecondHalfProcessEnd()
      _set_area_request = false
    end
    wait()
  end
end
function Finalize()
  azSeUnload()
  mineFinalize()
  _candle_fire = false
  if _candle_fire_se ~= nil then
    Sound:stopSEHandle(_candle_fire_se)
  end
end
function com_a_hdl(A0_48, A1_49)
  if findGameObject2(A0_48, A1_49) == nil then
    return nil
  else
    return (findGameObject2(A0_48, A1_49))
  end
end
function requestAttributeHandle()
  local L0_50, L1_51
  L0_50 = attribute_hdl
  return L0_50
end
function requestAttributeEffect()
  local L0_52, L1_53
  L0_52 = attribute_effect
  return L0_52
end
function requestCrowPuppet()
  local L0_54, L1_55
  L0_54 = _puppet_crow
  return L0_54
end
function requestCrowBrain()
  local L0_56, L1_57
  L0_56 = _brain_crow
  return L0_56
end
function requestCrowSpawn()
  local L0_58, L1_59
  L0_58 = _spawn_crow
  return L0_58
end
function requestSupportCrowSpawn(A0_60, A1_61, A2_62)
  if not _spawn_request then
    _spawn_node = A0_60
    _first_action = A1_61
    _wait = A2_62
    _spawn_request = true
    return true
  end
  return false
end
function requestSupportCrowGrab()
  local L1_63
  L1_63 = _grab_request
  if not L1_63 then
    _grab_request = true
    L1_63 = true
    return L1_63
  end
  L1_63 = false
  return L1_63
end
function requestSupportCrowLockToWarp(A0_64)
  if not _lockwarp_request then
    _warp_node = A0_64
    _lockwarp_request = true
    return true
  end
  return false
end
function requestsupportCrowSetIdling()
  local L1_65
  L1_65 = _set_idling_request
  if not L1_65 then
    _set_idling_request = true
    L1_65 = true
    return L1_65
  end
  L1_65 = false
  return L1_65
end
function requestsupportCrowReleaseIdling()
  local L1_66
  L1_66 = _release_idling_request
  if not L1_66 then
    _release_idling_request = true
    L1_66 = true
    return L1_66
  end
  L1_66 = false
  return L1_66
end
function requestsupportCrowMove(A0_67, A1_68, A2_69)
  if not _move_request then
    _end_move_node = A0_67
    _middle_move_node = A1_68
    _move_vel = A2_69
    _move_request = true
    return true
  end
  return false
end
function requestsupportCrowReset()
  local L1_70
  L1_70 = _reset_request
  if not L1_70 then
    _reset_request = true
    L1_70 = true
    return L1_70
  end
  L1_70 = false
  return L1_70
end
function requestInvisibleBg(A0_71)
  if not _invisible_request then
    _advanced_degree = A0_71
    _invisible_request = true
    return true
  end
  return false
end
function requestSetArea()
  local L1_72
  L1_72 = _set_area_request
  if not L1_72 then
    _set_area_request = true
    L1_72 = true
    return L1_72
  end
  L1_72 = false
  return L1_72
end
function requestSetCatWarpCheckPoint(A0_73)
  if A0_73 ~= nil then
    Fn_setCatWarpCheckPoint(A0_73)
    return true
  end
  return false
end
function requestComSensorOn(A0_74)
  if A0_74 ~= nil then
    Fn_pcSensorOn(A0_74)
    return true
  end
  return false
end
function requestComSensorOff(A0_75)
  if A0_75 ~= nil then
    Fn_pcSensorOff(A0_75)
    return true
  end
  return false
end
function isCandleFireAreaIN()
  local L0_76, L1_77
  L0_76 = _candle_fire
  return L0_76
end
function lithographStart()
  _litho_ctrls:LithographStart()
end
function isLithographStart()
  return _litho_ctrls:isLithographStart()
end
function setFirstHalfProcessEnd()
  _litho_ctrls:setFirstHalfProcessEnd()
end
function isFirstHalfProcessEnd()
  return _litho_ctrls:isFirstHalfProcessEnd()
end
function missionComplete()
  invokeTask(function()
    requestSetArea()
    _litho_ctrls:missionComplete()
  end)
end
function setSecondHalfProcessEnd()
  _litho_ctrls:setSecondHalfProcessEnd()
end
function isSecondHalfProcessEnd()
  return _litho_ctrls:isSecondHalfProcessEnd()
end
function isSecondHalfProcessStart()
  return _litho_ctrls:isSecondHalfProcessStart()
end
function isSecondHalfProcessWait()
  return _litho_ctrls:isSecondHalfProcessWait()
end
function missionFailure()
  invokeTask(function()
    _litho_ctrls:missionFailure()
  end)
end
function isFailureProcessEnd()
  return _litho_ctrls:isFailureProcessEnd()
end
function guideEffAllOff()
  return _litho_ctrls:guideEffAllOff()
end
function guideEffOff()
  return _litho_ctrls:guideEffOff()
end
function setSensorVisible(A0_78)
  _litho_ctrls:setSensorVisible(A0_78)
end
function azSeUnload()
  return _litho_ctrls:azSeUnload()
end
function supportCrowSpawn(A0_79, A1_80, A2_81)
  local L3_82
  L3_82 = A1_80
  if L3_82 == nil then
    L3_82 = Supporter.FirstAction.Ground
  end
  if _puppet_crow == nil then
    _puppet_crow = Fn_spawnSuppotCrow(false, L3_82, A0_79)
  end
  if _brain_crow == nil then
    _brain_crow = _puppet_crow:getBrain()
  end
  if _spawn_crow == false then
    _spawn_crow = true
  end
  if A2_81 then
    _brain_crow:setIdling(true)
  end
end
function supportCrowSetIdling()
  if _brain_crow ~= nil then
    _brain_crow:setIdling(true)
  end
end
function supportCrowLockToWarp(A0_83)
  local L1_84
  L1_84 = _brain_crow
  if L1_84 ~= nil then
    L1_84 = _brain_crow
    L1_84 = L1_84.setIdling
    L1_84(L1_84, true)
    L1_84 = findGameObject2
    L1_84 = L1_84("Node", A0_83)
    _brain_crow:warpToNode(L1_84, Supporter.FirstAction.Ground)
  end
end
function supportCrowReleaseIdling()
  if _brain_crow ~= nil then
    _brain_crow:setIdling(false)
  end
end
function supportCrowGrab()
  invokeTask(function()
    local L0_85, L1_86, L2_87, L3_88, L4_89, L5_90, L6_91, L7_92
    L0_85 = Fn_setGrabNpc
    L1_86 = "npcgen2_sol_01"
    L2_87 = false
    L3_88 = false
    L0_85(L1_86, L2_87, L3_88)
    L0_85 = _brain_crow
    L1_86 = L0_85
    L0_85 = L0_85.grabAround
    L0_85(L1_86)
    L0_85 = waitSeconds
    L1_86 = 1
    L0_85(L1_86)
    L0_85 = findGameObject2
    L1_86 = "Node"
    L2_87 = "locator2_crow_warp_pos"
    L0_85 = L0_85(L1_86, L2_87)
    L1_86 = L0_85
    L0_85 = L0_85.getWorldPos
    L0_85 = L0_85(L1_86)
    L1_86 = findGameObject2
    L2_87 = "Node"
    L3_88 = "locator2_crow_move_pos_01"
    L1_86 = L1_86(L2_87, L3_88)
    L2_87 = L1_86
    L1_86 = L1_86.getWorldPos
    L1_86 = L1_86(L2_87)
    L2_87 = findGameObject2
    L3_88 = "Node"
    L4_89 = "locator2_crow_move_pos_02"
    L2_87 = L2_87(L3_88, L4_89)
    L3_88 = L2_87
    L2_87 = L2_87.getWorldPos
    L2_87 = L2_87(L3_88)
    L3_88 = findGameObject2
    L4_89 = "Node"
    L5_90 = "locator2_crow_move_pos_03"
    L3_88 = L3_88(L4_89, L5_90)
    L4_89 = L3_88
    L3_88 = L3_88.getWorldPos
    L3_88 = L3_88(L4_89)
    L4_89 = findGameObject2
    L5_90 = "Node"
    L6_91 = "locator2_crow_move_pos_04"
    L4_89 = L4_89(L5_90, L6_91)
    L5_90 = L4_89
    L4_89 = L4_89.getWorldPos
    L4_89 = L4_89(L5_90)
    L5_90 = findGameObject2
    L6_91 = "Node"
    L7_92 = "locator2_crow_move_pos_05"
    L5_90 = L5_90(L6_91, L7_92)
    L6_91 = L5_90
    L5_90 = L5_90.getWorldPos
    L5_90 = L5_90(L6_91)
    L6_91 = findGameObject2
    L7_92 = "Node"
    L6_91 = L6_91(L7_92, "locator2_crow_move_pos_06")
    L7_92 = L6_91
    L6_91 = L6_91.getWorldPos
    L6_91 = L6_91(L7_92)
    L7_92 = {
      {
        pos = L0_85,
        action = Supporter.MovePoint.Takeoff,
        vel = 10
      },
      {
        pos = L0_85,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L1_86,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L2_87,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L3_88,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L4_89,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L5_90,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L6_91,
        action = Supporter.MovePoint.Air,
        vel = 10
      },
      {
        pos = L6_91,
        action = Supporter.MovePoint.Alight,
        vel = 6.6
      }
    }
    _brain_crow:setMovePoints(L7_92)
    _brain_crow:startMovePoint()
    while true do
      if _brain_crow:isMovePointEnd() then
        _brain_crow:clearMovePoint()
        _brain_crow:setIdling(true)
        break
      end
      wait()
    end
    Fn_disappearNpc("npcgen2_sol_01")
    _brain_crow:reset()
    _puppet_crow:kill()
    _puppet_crow = nil
    _brain_crow:kill()
    _brain_crow = nil
    _spawn_crow = false
  end)
end
function supportCrowMove(A0_93, A1_94, A2_95)
  invokeTask(function()
    local L0_96, L1_97, L2_98, L3_99, L4_100
    L0_96 = assert
    L1_97 = _puppet_crow
    L0_96(L1_97)
    L0_96 = assert
    L1_97 = _brain_crow
    L0_96(L1_97)
    L0_96 = _puppet_crow
    L1_97 = L0_96
    L0_96 = L0_96.getWorldPos
    L0_96 = L0_96(L1_97)
    L1_97 = findGameObject2
    L2_98 = "Node"
    L3_99 = A0_93
    L1_97 = L1_97(L2_98, L3_99)
    L2_98 = 30
    L3_99 = A2_95
    if L3_99 ~= nil then
      L2_98 = A2_95
    end
    L3_99 = nil
    L4_100 = {}
    if A1_94 ~= nil then
      L3_99 = findGameObject2("Node", A1_94)
      L4_100 = {
        {
          pos = L0_96,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_96,
          action = Supporter.MovePoint.Air,
          vel = L2_98
        },
        {
          pos = L3_99:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_98
        },
        {
          pos = L1_97:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_98
        },
        {
          pos = L1_97:getWorldPos(),
          action = Supporter.MovePoint.Alight
        }
      }
    else
      L4_100 = {
        {
          pos = L0_96,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_96,
          action = Supporter.MovePoint.Air,
          vel = L2_98
        },
        {
          pos = L1_97:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_98
        },
        {
          pos = L1_97:getWorldPos(),
          action = Supporter.MovePoint.Alight
        }
      }
    end
    _brain_crow:setMovePoints(L4_100)
    _brain_crow:startMovePoint()
    while _brain_crow do
      if _brain_crow:isMovePointEnd() then
        _brain_crow:clearMovePoint()
        _brain_crow:setIdling(true)
        break
      end
      wait()
    end
  end)
end
function supportCrowReset()
  if _brain_crow ~= nil then
    _brain_crow:reset()
    print("ep09_com_a : \227\130\175\227\131\173\227\130\166\227\130\146\229\136\157\230\156\159\229\140\150")
  end
end
function putGimmickBg()
  local L0_101, L1_102, L2_103, L3_104, L4_105
  L0_101 = Fn_findAreaHandle
  L0_101 = L0_101(L1_102)
  for L4_105 = 1, area_max_az2_a_12 do
    bubble_big[L4_105] = L0_101:findChildNode(string.format("az2_a_12_%02d", L4_105), true)
    if bubble_big[L4_105] ~= nil then
      bubble_big[L4_105]:pushJob("NJO", "N", 0, "B")
      bubble_big[L4_105]:setEventListener("broken", brokenCallbackBubble)
      bubble_big[L4_105]:setEventListener("restore", restoreCallbackBubble)
      bubble_big[L4_105]:setAutoRestore(3)
      bubble_big[L4_105]:setFloaterParams(DRIFT_PARAM_BUBBLE_ANOTHER_ZONE_02)
    end
  end
  for L4_105 = 1, area_max_az2_a_13 do
    bubble_medium[L4_105] = L0_101:findChildNode(string.format("az2_a_13_%02d", L4_105), true)
    if bubble_medium[L4_105] ~= nil then
      bubble_medium[L4_105]:pushJob("NJO", "N", 0, "B")
      bubble_medium[L4_105]:setEventListener("broken", brokenCallbackBubble)
      bubble_medium[L4_105]:setEventListener("restore", restoreCallbackBubble)
      bubble_medium[L4_105]:setAutoRestore(3)
      bubble_medium[L4_105]:setFloaterParams(DRIFT_PARAM_BUBBLE_ANOTHER_ZONE_02)
    end
  end
  for L4_105 = 1, area_max_az2_a_14 do
    bubble_small[L4_105] = L0_101:findChildNode(string.format("az2_a_14_%02d", L4_105), true)
    if bubble_small[L4_105] ~= nil then
      bubble_small[L4_105]:pushJob("NJO", "N", 0, "B")
      bubble_small[L4_105]:setEventListener("broken", brokenCallbackBubble)
      bubble_small[L4_105]:setEventListener("restore", restoreCallbackBubble)
      bubble_small[L4_105]:setAutoRestore(3)
      bubble_small[L4_105]:setFloaterParams(DRIFT_PARAM_BUBBLE_ANOTHER_ZONE_02)
    end
  end
  for L4_105 = 1, area_max_az2_a_15 do
    bubble_very_small[L4_105] = L0_101:findChildNode(string.format("az2_a_15_%02d", L4_105), true)
    if bubble_very_small[L4_105] ~= nil then
      bubble_very_small[L4_105]:pushJob("NJO", "N", 0, "B")
      bubble_very_small[L4_105]:setEventListener("broken", brokenCallbackBubble)
      bubble_very_small[L4_105]:setEventListener("restore", restoreCallbackBubble)
      bubble_very_small[L4_105]:setAutoRestore(3)
      bubble_very_small[L4_105]:setFloaterParams(DRIFT_PARAM_BUBBLE_ANOTHER_ZONE_02)
    end
  end
  for L4_105 = 1, ammo_max do
    ammo[L4_105] = findGameObject2("GimmickBg", string.format("bg2_az2_anmo_01_%02d", L4_105))
    if ammo[L4_105] ~= nil then
      ammo[L4_105]:setEventListener("broken", brokenCallbackAmmo)
      ammo[L4_105]:setEventListener("restore", restoreCallbackAmmo)
      ammo[L4_105]:setAutoRestore(5)
    end
  end
end
function initializeArea(A0_106)
  local L1_107, L2_108, L3_109, L4_110, L5_111
  for L4_110 = 1, com_a_catwarp_max do
    L5_111 = Fn_pcSensorOff
    L5_111(string.format("pccubesensormulti2_caution_%02d", L4_110))
    L5_111 = Fn_pcSensorOff
    L5_111(string.format("pccubesensormulti2_catwarp_%02d", L4_110))
  end
  if L1_107 == "ep09_a" or L1_107 == "ep09_b" then
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 15 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 1))
    end
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_02_%02d", L5_111 + 1))
    end
    L2_108(L3_109)
    for L5_111 = 1, area_max_az2_a_04 do
      setLightIntensityMin(string.format("az2_a_04_%02d", L5_111))
    end
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 1))
    end
    for L5_111 = 1, L3_109 - 2 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 2))
    end
    for L5_111 = 1, L3_109 - 15 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 15))
    end
    for L5_111 = 1, L3_109 - 16 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 16))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_c" or L1_107 == "ep09_d" then
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 3 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 4 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 19 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 1))
    end
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_02_%02d", L5_111 + 1))
    end
    L2_108(L3_109)
    for L5_111 = 1, area_max_az2_a_04 do
      setLightIntensityMin(string.format("az2_a_04_%02d", L5_111))
    end
    for L5_111 = 1, L3_109 - 3 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 3))
    end
    for L5_111 = 1, L3_109 - 4 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 4))
    end
    for L5_111 = 1, L3_109 - 19 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 19))
    end
    for L5_111 = 1, L3_109 - 17 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 17))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_e" or L1_107 == "ep09_f" then
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 3 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 7 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 25 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 1))
    end
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_02_%02d", L5_111 + 1))
    end
    L2_108(L3_109)
    for L5_111 = 1, area_max_az2_a_04 do
      setLightIntensityMin(string.format("az2_a_04_%02d", L5_111))
    end
    for L5_111 = 1, L3_109 - 3 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 3))
    end
    for L5_111 = 1, L3_109 - 7 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 7))
    end
    for L5_111 = 1, L3_109 - 25 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 25))
    end
    for L5_111 = 1, L3_109 - 18 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 18))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_g" or L1_107 == "ep09_h" or L1_107 == "ep09_i" then
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 8 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 9 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 35 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 1))
    end
    L2_108(L3_109)
    L2_108(L3_109)
    L2_108(L3_109)
    L2_108(L3_109)
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 8 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 8))
    end
    for L5_111 = 1, L3_109 - 9 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 9))
    end
    for L5_111 = 1, L3_109 - 35 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 35))
    end
    for L5_111 = 1, L3_109 - 20 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 20))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_j" or L1_107 == "ep09_k" then
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_02_%02d", L5_111), candle_fire_max_az2_a_02, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 10 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 13 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111 + 30), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 35 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 1 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 1))
    end
    L2_108(L3_109)
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 10 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 10))
    end
    for L5_111 = 1, L3_109 - 15 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 13))
    end
    for L5_111 = 1, L3_109 - 35 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 35))
    end
    for L5_111 = 1, 2 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 20))
    end
    for L5_111 = 1, L3_109 - 23 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 23))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_l" or L1_107 == "ep09_m" then
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_01_%02d", L5_111), candle_fire_max_az2_a_01, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_02_%02d", L5_111), candle_fire_max_az2_a_02, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_04_%02d", L5_111), candle_fire_max_az2_a_04, true)
    end
    for L5_111 = 1, 14 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 17 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111 + 30), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 43 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 2 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 2))
    end
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 14 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 14))
    end
    for L5_111 = 1, L3_109 - 19 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 17))
    end
    for L5_111 = 1, L3_109 - 43 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 43))
    end
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 23 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 23))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_n" or L1_107 == "ep09_o" then
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_01_%02d", L5_111), candle_fire_max_az2_a_01, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_02_%02d", L5_111), candle_fire_max_az2_a_02, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_04_%02d", L5_111), candle_fire_max_az2_a_04, true)
    end
    for L5_111 = 1, 16 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 20 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111 + 30), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 46 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, L3_109 - 2 do
      setLightIntensityMin(string.format("az2_a_01_%02d", L5_111 + 2))
    end
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 16 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 16))
    end
    for L5_111 = 1, L3_109 - 22 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 20))
    end
    for L5_111 = 1, L3_109 - 46 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 46))
    end
    for L5_111 = 1, L3_109 - 23 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 23))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_p" or L1_107 == "ep09_q" then
    for L5_111 = 1, 3 do
      putCandleFireEffect(string.format("az2_a_01_%02d", L5_111), candle_fire_max_az2_a_01, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_02_%02d", L5_111), candle_fire_max_az2_a_02, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_04_%02d", L5_111), candle_fire_max_az2_a_04, true)
    end
    for L5_111 = 1, 18 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 22 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111 + 30), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 48 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L2_108(L3_109)
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 18 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 18))
    end
    for L5_111 = 1, L3_109 - 24 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 22))
    end
    for L5_111 = 1, L3_109 - 48 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 48))
    end
    for L5_111 = 1, L3_109 - 24 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 24))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_r" or L1_107 == "ep09_s" then
    for L5_111 = 1, 4 do
      putCandleFireEffect(string.format("az2_a_01_%02d", L5_111), candle_fire_max_az2_a_01, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_02_%02d", L5_111), candle_fire_max_az2_a_02, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_04_%02d", L5_111), candle_fire_max_az2_a_04, true)
    end
    for L5_111 = 1, 19 do
      putCandleFireEffect(string.format("az2_a_05_%02d", L5_111), candle_fire_max_az2_a_05, true)
    end
    for L5_111 = 1, 23 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 2 do
      putCandleFireEffect(string.format("az2_a_06_%02d", L5_111 + 30), candle_fire_max_az2_a_06, true)
    end
    for L5_111 = 1, 74 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111), candle_fire_max_az2_a_07, true)
    end
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L5_111 = true
    L2_108(L3_109, L4_110, L5_111)
    L2_108(L3_109)
    for L5_111 = 1, L3_109 - 19 do
      setLightIntensityMin(string.format("az2_a_05_%02d", L5_111 + 19))
    end
    for L5_111 = 1, L3_109 - 25 do
      setLightIntensityMin(string.format("az2_a_06_%02d", L5_111 + 23))
    end
    for L5_111 = 1, L3_109 - 74 do
      setLightIntensityMin(string.format("az2_a_07_%02d", L5_111 + 74))
    end
    for L5_111 = 1, L3_109 - 24 do
      setLightIntensityMin(string.format("az2_a_%02d", L5_111 + 24))
    end
    L2_108(L3_109)
    L2_108(L3_109)
  elseif L1_107 == "ep09_t" then
    for L5_111 = 1, 21 do
      putCandleFireEffect(string.format("az2_a_07_%02d", L5_111 + 53), candle_fire_max_az2_a_07, true)
    end
  end
end
function activeArea(A0_112, A1_113, A2_114, A3_115)
  local L4_116
  L4_116 = A2_114
  if L4_116 == nil then
    L4_116 = 0.3
  end
  putCandleFireEffect(A0_112, A1_113, A3_115)
  setLightIntensityMax(A0_112, L4_116)
  waitSeconds(L4_116)
end
function deleteArea(A0_117, A1_118, A2_119, A3_120, A4_121)
  local L5_122
  L5_122 = A2_119
  if L5_122 == nil then
    L5_122 = 0.3
  end
  removeCandleFireEffect(A0_117, A1_118, A3_120)
  setLightIntensityMin(A0_117, L5_122)
  setEffectivenessOff(A0_117, A4_121)
  waitSeconds(L5_122)
end
function startSynchroArea()
  local L0_123, L1_124, L2_125, L3_126, L4_127
  L0_123 = Fn_getMissionPart
  L0_123 = L0_123()
  L1_124 = _litho_area_table
  L1_124 = L1_124[L0_123]
  L1_124 = L1_124.prev
  L2_125 = _litho_area_table
  L2_125 = L2_125[L0_123]
  L2_125 = L2_125.current
  if L1_124 ~= nil and L2_125 ~= nil then
    L3_126 = Fn_findAreaHandle
    L4_127 = L1_124
    L3_126 = L3_126(L4_127)
    L4_127 = Fn_findAreaHandle
    L4_127 = L4_127(L2_125)
    L3_126:setSynchroArea(L4_127, 0)
  end
end
function synchroArea()
  local L0_128, L1_129, L2_130, L3_131, L4_132, L5_133, L6_134
  L0_128 = Fn_getMissionPart
  L0_128 = L0_128()
  L1_129 = _litho_area_table
  L1_129 = L1_129[L0_128]
  L1_129 = L1_129.prev
  L2_130 = _litho_area_table
  L2_130 = L2_130[L0_128]
  L2_130 = L2_130.current
  L3_131 = _litho_area_table
  L3_131 = L3_131[L0_128]
  L3_131 = L3_131.current2
  L4_132 = _litho_area_table
  L4_132 = L4_132[L0_128]
  L4_132 = L4_132.next
  if L1_129 ~= nil then
    L5_133 = Fn_findAreaHandle
    L6_134 = L1_129
    L5_133 = L5_133(L6_134)
    L6_134 = L5_133.setSynchroArea
    L6_134(L5_133, nil, 0)
  end
  if L4_132 ~= nil then
    if L3_131 ~= nil then
      L5_133 = Fn_findAreaHandle
      L6_134 = L3_131
      L5_133 = L5_133(L6_134)
      L6_134 = Fn_findAreaHandle
      L6_134 = L6_134(L4_132)
      L5_133:setSynchroArea(L6_134, 3)
    elseif L2_130 ~= nil then
      L5_133 = Fn_findAreaHandle
      L6_134 = L2_130
      L5_133 = L5_133(L6_134)
      L6_134 = Fn_findAreaHandle
      L6_134 = L6_134(L4_132)
      L5_133:setSynchroArea(L6_134, 3)
    end
  end
end
function setArea()
  if Fn_getMissionPart() == "ep09_b" then
    activeArea("az2_a_05_02", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_06_03", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_07_16", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_05_03", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_17", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_18", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_19", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_04", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_17", candle_fire_max_az2_a_17, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_02")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_02")
  elseif Fn_getMissionPart() == "ep09_d" then
    activeArea("az2_a_07_20", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_05", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_07_21", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_22", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_23", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_06", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_06_07", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_07_24", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_25", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_18", candle_fire_max_az2_a_18, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_03")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_03")
  elseif Fn_getMissionPart() == "ep09_f" then
    activeArea("az2_a_07_26", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_08", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_05_04", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_27", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_05_05", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_28", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_19", candle_fire_max_az2_a_19, 0)
    activeArea("az2_a_07_29", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_09", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_07_30", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_31", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_05_06", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_05_07", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_32", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_05_08", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_20", candle_fire_max_az2_a_20, 0)
    activeArea("az2_a_07_33", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_34", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_35", candle_fire_max_az2_a_07, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_04")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_04")
  elseif Fn_getMissionPart() == "ep09_i" then
    activeArea("az2_a_06_13", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_05_10", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_23", candle_fire_max_az2_a_23, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_05")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_05")
  elseif Fn_getMissionPart() == "ep09_k" then
    activeArea("az2_a_07_39", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_05_13", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_40", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_16", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_07_41", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_42", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_17", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_05_14", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_43", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_22", candle_fire_max_az2_a_22, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_06")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_06")
  elseif Fn_getMissionPart() == "ep09_m" then
    activeArea("az2_a_05_15", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_44", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_18", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_05_16", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_07_45", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_07_46", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_19", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_06_20", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_21", candle_fire_max_az2_a_21, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_07")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_07")
  elseif Fn_getMissionPart() == "ep09_o" then
    activeArea("az2_a_07_47", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_05_17", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_06_21", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_01_03", candle_fire_max_az2_a_01, 0)
    activeArea("az2_a_07_48", candle_fire_max_az2_a_07, 0)
    activeArea("az2_a_06_22", candle_fire_max_az2_a_06, 0)
    activeArea("az2_a_05_18", candle_fire_max_az2_a_05, 0)
    activeArea("az2_a_24", candle_fire_max_az2_a_24, 0)
    Fn_pcSensorOn("pccubesensormulti2_caution_08")
    Fn_pcSensorOn("pccubesensormulti2_catwarp_08")
  else
    if Fn_getMissionPart() == "ep09_q" then
      activeArea("az2_a_07_49", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_05_19", candle_fire_max_az2_a_05, 0)
      activeArea("az2_a_06_23", candle_fire_max_az2_a_06, 0)
      activeArea("az2_a_07_50", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_51", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_52", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_01_04", candle_fire_max_az2_a_01, 0)
      activeArea("az2_a_07_53", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_54", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_55", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_56", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_57", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_58", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_59", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_60", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_61", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_62", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_63", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_64", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_65", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_66", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_67", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_68", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_69", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_70", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_71", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_72", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_73", candle_fire_max_az2_a_07, 0)
      activeArea("az2_a_07_74", candle_fire_max_az2_a_07, 0)
      Fn_pcSensorOn("pccubesensormulti2_caution_09")
      Fn_pcSensorOn("pccubesensormulti2_catwarp_09")
    else
    end
  end
end
function activeAreaIngame(A0_135)
  invokeTask(function()
    if Fn_getMissionPart() == "ep09_i" then
      if A0_135 == 1 then
        Fn_pcSensorOff("pccubesensormulti2_caution_04")
        Fn_pcSensorOff("pccubesensormulti2_catwarp_04")
        activeArea("az2_a_06_31", candle_fire_max_az2_a_06, 0)
        activeArea("az2_a_06_10", candle_fire_max_az2_a_06, 0)
      elseif A0_135 == 2 then
        activeArea("az2_a_06_32", candle_fire_max_az2_a_06, 0)
        activeArea("az2_a_02_02", candle_fire_max_az2_a_02, 0)
      elseif A0_135 == 3 then
        activeArea("az2_a_04_01", candle_fire_max_az2_a_04, 0)
      elseif A0_135 == 4 then
        activeArea("az2_a_05_09", candle_fire_max_az2_a_05, 0)
        activeArea("az2_a_06_12", candle_fire_max_az2_a_06, 0)
        activeArea("az2_a_06_11", candle_fire_max_az2_a_06, 0)
        activeArea("az2_a_03", candle_fire_max_az2_a_03, 0)
      end
    elseif Fn_getMissionPart() == "ep09_k" then
      if A0_135 == 1 then
        Fn_pcSensorOff("pccubesensormulti2_caution_05")
        Fn_pcSensorOff("pccubesensormulti2_catwarp_05")
        activeArea("az2_a_05_11", candle_fire_max_az2_a_05, 0)
        activeArea("az2_a_07_36", candle_fire_max_az2_a_07, 0)
        activeArea("az2_a_01_02", candle_fire_max_az2_a_01, 0)
      elseif A0_135 == 2 then
        activeArea("az2_a_06_14", candle_fire_max_az2_a_06, 0)
        activeArea("az2_a_05_12", candle_fire_max_az2_a_05, 0)
        activeArea("az2_a_06_15", candle_fire_max_az2_a_06, 0)
        activeArea("az2_a_07_37", candle_fire_max_az2_a_07, 0)
        activeArea("az2_a_07_38", candle_fire_max_az2_a_07, 0)
        activeArea("az2_a_04_02", candle_fire_max_az2_a_04, 0)
      end
    elseif Fn_getMissionPart() == "ep09_t" then
      if A0_135 == 1 then
        activeArea("az2_a_05_20", candle_fire_max_az2_a_05)
        activeArea("az2_a_07_75", candle_fire_max_az2_a_07)
        activeArea("az2_a_07_76", candle_fire_max_az2_a_07)
        activeArea("az2_a_05_21", candle_fire_max_az2_a_05)
        activeArea("az2_a_06_24", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_77", candle_fire_max_az2_a_07)
        activeArea("az2_a_05_22", candle_fire_max_az2_a_05)
        activeArea("az2_a_07_78", candle_fire_max_az2_a_07)
        activeArea("az2_a_25", candle_fire_max_az2_a_25)
      elseif A0_135 == 2 then
        activeArea("az2_a_05_23", candle_fire_max_az2_a_05)
        activeArea("az2_a_07_79", candle_fire_max_az2_a_07)
        activeArea("az2_a_05_24", candle_fire_max_az2_a_05)
        activeArea("az2_a_07_80", candle_fire_max_az2_a_07)
        activeArea("az2_a_06_25", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_81", candle_fire_max_az2_a_07)
        activeArea("az2_a_06_26", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_82", candle_fire_max_az2_a_07)
        activeArea("az2_a_05_25", candle_fire_max_az2_a_05)
        activeArea("az2_a_07_83", candle_fire_max_az2_a_07)
        activeArea("az2_a_06_27", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_84", candle_fire_max_az2_a_07)
        activeArea("az2_a_26", candle_fire_max_az2_a_26)
      elseif A0_135 == 3 then
        activeArea("az2_a_05_26", candle_fire_max_az2_a_05)
        activeArea("az2_a_07_85", candle_fire_max_az2_a_07)
        activeArea("az2_a_02_03", candle_fire_max_az2_a_02)
      elseif A0_135 == 4 then
        activeArea("az2_a_06_28", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_86", candle_fire_max_az2_a_07)
        activeArea("az2_a_05_27", candle_fire_max_az2_a_05)
        activeArea("az2_a_06_29", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_87", candle_fire_max_az2_a_07)
        activeArea("az2_a_27", candle_fire_max_az2_a_27)
        activeArea("az2_a_06_30", candle_fire_max_az2_a_06)
        activeArea("az2_a_07_88", candle_fire_max_az2_a_07)
      end
    end
  end)
end
function invisibleBg(A0_136)
  local L1_137, L2_138, L3_139, L4_140, L5_141, L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152
  if A0_136 == "1" then
    L1_137()
    L4_140 = DRIFT_PARAM_ANOTHER_ZONE_02_02
    L2_138(L3_139, L4_140)
    L4_140 = L2_138
    L3_139(L4_140, L5_141)
    L4_140 = "az2_a_02_03"
    L4_140 = L3_139.setDriftParams
    L4_140(L5_141, L6_142)
    L4_140 = Fn_findAreaHandle
    L4_140 = L4_140(L5_141)
    L5_141(L6_142, L7_143)
    for L8_144 = 1, 8 do
      L12_148 = L8_144 + 19
      L16_152 = L10_146(L11_147, L12_148)
      L12_148 = DRIFT_PARAM_ANOTHER_ZONE_02_02
      L10_146(L11_147, L12_148)
    end
    for L8_144 = 1, 7 do
      L12_148 = L8_144 + 23
      L16_152 = L10_146(L11_147, L12_148)
      L12_148 = DRIFT_PARAM_ANOTHER_ZONE_02_02
      L10_146(L11_147, L12_148)
    end
    for L8_144 = 1, 34 do
      L12_148 = L8_144 + 53
      L16_152 = L10_146(L11_147, L12_148)
      L12_148 = DRIFT_PARAM_ANOTHER_ZONE_02_02
      L10_146(L11_147, L12_148)
    end
    for L8_144 = 1, 8 do
      L12_148 = L8_144 + 54
      L16_152 = L10_146(L11_147, L12_148)
      L12_148 = DRIFT_PARAM_ANOTHER_ZONE_02_02
      L10_146(L11_147, L12_148)
    end
    for L8_144 = 1, 9 do
      L12_148 = L8_144 + 52
      L16_152 = L10_146(L11_147, L12_148)
      L12_148 = DRIFT_PARAM_ANOTHER_ZONE_02_02
      L10_146(L11_147, L12_148)
    end
    for L8_144 = 1, 3 do
      L12_148 = L8_144 + 13
      L16_152 = L10_146(L11_147, L12_148)
      L12_148 = DRIFT_PARAM_ANOTHER_ZONE_02_02
      L10_146(L11_147, L12_148)
    end
    for L8_144 = 1, area_max_az2_a_12 do
      if L9_145 ~= nil then
        L9_145(L10_146, L11_147)
      end
    end
    for L8_144 = 1, area_max_az2_a_13 do
      if L9_145 ~= nil then
        L9_145(L10_146, L11_147)
      end
    end
    for L8_144 = 1, area_max_az2_a_14 do
      if L9_145 ~= nil then
        L9_145(L10_146, L11_147)
      end
    end
    for L8_144 = 1, area_max_az2_a_15 do
      if L9_145 ~= nil then
        L9_145(L10_146, L11_147)
      end
    end
    for L8_144 = 1, area_max_az2_a_01 do
      L12_148 = L8_144
      L12_148 = 0
      L9_145(L10_146, L11_147, L12_148, L13_149)
    end
    for L8_144 = 1, L6_142 - 1 do
      L12_148 = L8_144
      L12_148 = 0
      L9_145(L10_146, L11_147, L12_148, L13_149)
    end
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    for L8_144 = 1, area_max_az2_a_04 do
      L12_148 = L8_144
      L12_148 = 0
      L9_145(L10_146, L11_147, L12_148, L13_149)
    end
    for L8_144 = 1, L6_142 - 8 do
      L12_148 = L8_144
      L12_148 = 0
      L9_145(L10_146, L11_147, L12_148, L13_149)
    end
    for L8_144 = 1, L6_142 - 7 do
      L12_148 = L8_144
      L12_148 = 0
      L9_145(L10_146, L11_147, L12_148, L13_149)
    end
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    for L8_144 = 1, L6_142 - 35 do
      L12_148 = L8_144
      L12_148 = 0
      L9_145(L10_146, L11_147, L12_148, L13_149)
    end
    for L8_144 = 1, L6_142 - 8 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, L6_142 - 9 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, L6_142 - 3 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, area_max_az2_a_11 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    L8_144 = 0
    L5_141(L6_142, L7_143, L8_144, L9_145)
    for L8_144 = 1, L6_142 - 18 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, L6_142 - 18 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, L6_142 - 23 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, L6_142 - 49 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    for L8_144 = 1, L6_142 - 15 do
      L12_148 = L8_144
      L16_152 = L10_146(L11_147, L12_148)
      L9_145(L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L10_146(L11_147, L12_148))
    end
    if L5_141 ~= nil then
      L8_144 = false
      L6_142(L7_143, L8_144)
      L6_142(L7_143)
    end
    L8_144 = "bg2_ve_ar_f_01"
    if L6_142 ~= nil then
      L8_144 = L6_142
      L7_143(L8_144, L9_145)
      L8_144 = L6_142
      L7_143(L8_144)
    end
    L8_144 = "Node"
    if L7_143 ~= nil then
      L8_144 = L7_143.setActive
      L8_144(L9_145, L10_146)
      L8_144 = L7_143.kill
      L8_144(L9_145)
    end
    L8_144 = findGameObject2
    L8_144 = L8_144(L9_145, L10_146)
    if L8_144 ~= nil then
      L9_145(L10_146, L11_147)
      L9_145(L10_146)
      L8_144 = nil
    end
    for L12_148 = 1, 75 do
      L16_152 = L12_148
      L16_152 = L14_150(L15_151, L16_152)
      if L13_149 ~= nil then
        L16_152 = false
        L14_150(L15_151, L16_152)
        L14_150(L15_151)
      end
    end
    for L12_148 = 1, 8 do
      for L16_152 = 1, 9 do
        if Fn_getGravityOre2(string.format("gravityore_hand_%02d_%02d", L12_148, L16_152)) ~= nil then
          Fn_getGravityOre2(string.format("gravityore_hand_%02d_%02d", L12_148, L16_152)):setActive(false)
          Fn_getGravityOre2(string.format("gravityore_hand_%02d_%02d", L12_148, L16_152)):kill()
        end
      end
    end
  elseif A0_136 == "2" then
    for L4_140 = 1, 21 do
      L8_144 = L4_140 + 53
      L16_152 = L6_142(L7_143, L8_144)
      L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L6_142(L7_143, L8_144))
      L8_144 = L4_140 + 53
      L5_141(L6_142, L7_143)
    end
    for L4_140 = 1, 15 do
      L8_144 = L4_140 + 31
      L16_152 = L6_142(L7_143, L8_144)
      L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L6_142(L7_143, L8_144))
    end
    for L4_140 = 1, 10 do
      L8_144 = L4_140 + 110
      L16_152 = L6_142(L7_143, L8_144)
      L5_141(L6_142, L7_143, L8_144, L9_145, L10_146, L11_147, L12_148, L13_149, L14_150, L15_151, L16_152, L6_142(L7_143, L8_144))
    end
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
  elseif A0_136 == "3" then
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138, L3_139)
    L1_137(L2_138, L3_139)
  elseif A0_136 == "4" then
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138)
    L1_137(L2_138, L3_139)
    L1_137(L2_138)
  end
end
function visibleBg()
  setEffectivenessOn("gm_a_root", true)
  for _FORV_3_ = 1, 15 do
    visibleAmmo(string.format("bg2_az2_anmo_01_%02d", _FORV_3_ + 31))
  end
  for _FORV_3_ = 1, 18 do
    visibleBubble(string.format("az2_a_12_%02d", _FORV_3_ + 13))
  end
  for _FORV_3_ = 1, 14 do
    visibleBubble(string.format("az2_a_13_%02d", _FORV_3_ + 84))
  end
  for _FORV_3_ = 1, 19 do
    visibleBubble(string.format("az2_a_14_%02d", _FORV_3_ + 203))
  end
  for _FORV_3_ = 1, 38 do
    visibleBubble(string.format("az2_a_15_%02d", _FORV_3_ + 110))
  end
  setEffectivenessOn("az2_a_02_03", true)
  setLightIntensityMax("az2_a_02_03", 0)
  for _FORV_3_ = 1, 7 do
    setEffectivenessOn(string.format("az2_a_05_%02d", _FORV_3_ + 19), true)
    setLightIntensityMax(string.format("az2_a_05_%02d", _FORV_3_ + 19), 0)
  end
  for _FORV_3_ = 1, 5 do
    setEffectivenessOn(string.format("az2_a_06_%02d", _FORV_3_ + 23), true)
    setLightIntensityMax(string.format("az2_a_06_%02d", _FORV_3_ + 23), 0)
  end
  for _FORV_3_ = 1, 2 do
    setEffectivenessOn(string.format("az2_a_%02d", _FORV_3_ + 24), true)
    setLightIntensityMax(string.format("az2_a_%02d", _FORV_3_ + 24), 0)
  end
  for _FORV_3_ = 1, 35 do
    setEffectivenessOn(string.format("az2_a_07_%02d", _FORV_3_ + 53), true)
    setLightIntensityMax(string.format("az2_a_07_%02d", _FORV_3_ + 53), 0)
  end
  for _FORV_3_ = 1, 5 do
    setEffectivenessOn(string.format("az2_a_08_%02d", _FORV_3_ + 54), true)
  end
  for _FORV_3_ = 1, 8 do
    setEffectivenessOn(string.format("az2_a_09_%02d", _FORV_3_ + 52), true)
  end
  for _FORV_3_ = 1, 3 do
    setEffectivenessOn(string.format("az2_a_10_%02d", _FORV_3_ + 13), true)
  end
end
function pccubesensormulti2_catwarp_OnEnter()
  print("pccubesensormulti2_catwarp_OnEnter")
end
function pccubesensormulti2_catwarp_OnLeave()
  print("pccubesensormulti2_catwarp_OnLeave")
  invokeTask(function()
    Fn_catWarp()
    waitSeconds(1)
    if GameDatabase:get(ggd.EventFlags__ep09__flag03) == 1 then
      Fn_captionViewLock("ep09_09012")
    else
      GameDatabase:set(ggd.EventFlags__ep09__flag03, 1)
      Fn_captionViewLock("ep09_09011")
    end
  end)
end
function pccubesensormulti2_caution_OnLeave()
  print("pccubesensormulti2_caution_OnLeave")
  invokeTask(function()
    if Player:getAbility(Player.kAbility_GravityShift) then
      Fn_coercionGravityShift()
    end
    if not Fn_isCaptionView("ep09_00101") then
      Fn_captionViewLock("ep09_00101")
    end
  end)
end
function pcspheresensor2_CandleFire_OnEnter()
  print("pcspheresensor2_CandleFire_OnEnter")
  if _candle_fire == false then
    _candle_fire = true
    _candle_fire_se = Sound:playSEHandle("ep09_candle_fire")
    Sound:playSE("pc1_009")
    Fn_captionView("ep09_09015")
  end
end
function pcspheresensor2_CandleFire_OnLeave()
  print("pcspheresensor2_CandleFire_OnLeave")
  _candle_fire = false
  if _candle_fire_se ~= nil then
    Sound:stopSEHandle(_candle_fire_se)
  end
end
