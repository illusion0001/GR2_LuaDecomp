dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/MineCommon2.lua")
dofile("/Game/Misc/lithograph_controller.lua")
_isFirstTimeSliderBroken = false
mine_name = "ep19_mine"
_gravityOre = {
  mineOreEvdName = mine_name,
  instance_flg = nil,
  manager_name = nil,
  deploy_areas = nil,
  exclusion_areas = nil
}
_progress_table = {
  ep19_a = {
    false,
    false,
    false,
    false,
    false,
    false,
    id = 1,
    ak = false
  },
  ep19_b = {
    false,
    false,
    false,
    false,
    false,
    false,
    id = 1,
    ak = false
  },
  ep19_c = {
    true,
    false,
    false,
    false,
    false,
    false,
    id = 2,
    ak = false
  },
  ep19_d = {
    true,
    false,
    false,
    false,
    false,
    false,
    id = 2,
    ak = false
  },
  ep19_e = {
    true,
    true,
    false,
    false,
    false,
    false,
    id = 3,
    ak = false
  },
  ep19_f = {
    true,
    true,
    false,
    false,
    false,
    false,
    id = 3,
    ak = true
  },
  ep19_g = {
    true,
    true,
    false,
    false,
    false,
    false,
    id = 3,
    ak = true,
    start = true
  },
  ep19_h = {
    true,
    true,
    true,
    false,
    false,
    false,
    id = 4,
    ak = false
  },
  ep19_i = {
    true,
    true,
    true,
    false,
    false,
    false,
    id = 4,
    ak = false
  },
  ep19_j = {
    true,
    true,
    true,
    true,
    false,
    false,
    id = 5,
    ak = true
  },
  ep19_k = {
    true,
    true,
    true,
    true,
    false,
    false,
    id = 5,
    ak = true
  },
  ep19_l = {
    true,
    true,
    true,
    true,
    false,
    false,
    id = 5,
    ak = true
  },
  ep19_m = {
    true,
    true,
    true,
    true,
    false,
    false,
    id = 5,
    ak = false,
    start = true
  },
  ep19_n = {
    true,
    true,
    true,
    true,
    true,
    false,
    id = 6,
    ak = false
  },
  ep19_o = {
    true,
    true,
    true,
    true,
    true,
    false,
    id = 6,
    ak = false
  },
  ep19_p = {
    true,
    true,
    true,
    true,
    true,
    false,
    id = 6,
    ak = true,
    start = true
  },
  ep19_q = {
    true,
    true,
    true,
    true,
    true,
    true,
    id = 7,
    ak = true
  }
}
_wall_table = {
  ep19_a = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_b = {
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_c = {
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_d = {
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_e = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_f = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_g = {
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false
  },
  ep19_h = {
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep19_i = {
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false
  },
  ep19_j = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep19_k = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep19_l = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep19_m = {
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false
  },
  ep19_n = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep19_o = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep19_p = {
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false
  },
  ep19_q = {
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false
  }
}
_mission_text_table = {
  {text = "ep19_09002", se = "skb_003"},
  {text = "ep19_09003", se = "skb_003"},
  {text = "ep19_09004", se = "skb_001"},
  {text = "ep19_09005", se = "skb_003"},
  {text = "ep19_09006", se = "skb_001"},
  {text = "ep19_09007", se = "skb_002"}
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
        aim = "locator2_hand_01"
      },
      cut3 = {
        cam = "locator2_cam_03",
        aim = "locator2_wall_01"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_aim_01"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_move_pos_01",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      },
      cut2 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    },
    second_half = {
      warp = "locator2_pc_move_pos_01",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_aim_01"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_aim_01"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      }
    },
    second_half = {
      warp = "locator2_pc_move_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_aim_01"
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
      warp = "locator2_pc_start_pos",
      cut1 = {
        cam = "locator2_cam_01",
        aim = "locator2_litho_01"
      },
      cut2 = {
        cam = "locator2_cam_02",
        aim = "locator2_hand_06"
      },
      cut3 = {
        cam = "locator2_cam_02",
        aim = "locator2_wall_06"
      }
    }
  }
}
_guide_eff_table = {
  "ef_ev_hndpar03_01",
  "ef_ev_hndpar03_02",
  "ef_ev_hndpar03_03",
  "ef_ev_hndpar03_04",
  "ef_ev_hndpar03_05",
  "ef_ev_hndpar03_06"
}
_gc_spawn_request = nil
_gc_warp_request = nil
_gc_idling_request = nil
_gc_release_request = nil
_gc_move_request = nil
_gc_reset_request = nil
_spawn_request = nil
_warp_request = nil
_release_request = nil
_move_request = nil
_walk_request = nil
_reset_request = nil
_jem_request = false
_gc_spawn_node = nil
_gc_warp_node = nil
_spawn_node = nil
_first_action = nil
_wait = false
_isFeline = false
_isBattle = false
_isBattle2 = false
_isBattle3 = false
_warp_node = nil
_action = nil
_gc_end_move_node = nil
_gc_middle_move_node = nil
_gc_move_vel = nil
_end_move_node = nil
_middle_move_node = nil
_move_vel = nil
_idling_node = nil
_walk_node = nil
_mot_name = nil
_repeat_count = 0
_blend = 0
_gcPuppet = nil
_gcBrain = nil
_gcSpawn = false
_akPuppet = nil
_akBrain = nil
_akSpawn = false
himmeli = {}
himmeli_max = 68
_poison_in = false
poison_effect = {}
poison_effect_max = 15
slider = {}
slider_max = 531
slider_breaktime = 0.4
wall = {}
wall_max = 6
gem2_l = {}
gem2_m = {}
gem2_vital = {}
gem2_l_num = 7
gem2_m_num = 153
gem2_vital_num = 5
gem2_az3_a_09_s = {}
gem2_az3_a_09_m = {}
gem2_az3_a_09_l = {}
gem2_az3_a_09_vital = {}
gem2_num_az3_a_09_s = 90
gem2_num_az3_a_09_m = 30
gem2_num_az3_a_09_l = 35
gem2_num_az3_a_09_vital = 2
gem2_ep19_g = {}
gem2_num_ep19_g = 92
gem2_num_ep19_g_01 = 24
gem2_num_ep19_g_02 = 23
gem2_num_ep19_g_03 = 23
gem2_num_ep19_g_04 = 22
_phase_num = 0
gcrPuppet = nil
gcrBrain = nil
gcrEffect = nil
se_poison = nil
function Lithograph_OnInitialize(A0_0)
  local L1_1, L2_2
  if A0_0 ~= nil then
    L1_1 = Fn_getMissionPart
    L1_1 = L1_1()
    L2_2 = A0_0.getName
    L2_2 = L2_2(A0_0)
    return _progress_table[L1_1][tonumber(string.sub(L2_2, -2))]
  end
  L1_1 = false
  return L1_1
end
function putGimmickBg(A0_3, A1_4, A2_5, A3_6)
  createGameObject2("GimmickBg"):setDrawModelName(A3_6)
  createGameObject2("GimmickBg"):setCollisionName(A3_6)
  createGameObject2("GimmickBg"):setAttributeName(A3_6)
  createGameObject2("GimmickBg"):setPos(A0_3)
  createGameObject2("GimmickBg"):setRot(A1_4)
  createGameObject2("GimmickBg"):setForceMove()
  createGameObject2("GimmickBg"):setName(A2_5)
  return (createGameObject2("GimmickBg"))
end
function putWall(A0_7, A1_8, A2_9)
  return putGimmickBg(A0_7, A1_8, A2_9, "az3_wall_oc_02_a")
end
function brokenSliderCallback(A0_10)
  if _isFirstTimeSliderBroken == false then
    Fn_captionView("ep19_09014")
    _isFirstTimeSliderBroken = true
  end
end
function restoreSliderCallback(A0_11)
  A0_11:pushJob("J", "S", slider_breaktime, "B")
end
function brokenWallCallback(A0_12)
  local L1_13
end
function brokenCallbackHimmeli(A0_14)
  local L1_15
end
function restoreCallbackHimmeli(A0_16)
  local L1_17
end
function putHimmeli()
  local L0_18, L1_19, L2_20, L3_21
  for L3_21 = 1, himmeli_max do
    himmeli[L3_21] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_oc_06_%02d", L3_21))
    if himmeli[L3_21] ~= nil then
      himmeli[L3_21]:setEventListener("broken", brokenCallbackHimmeli)
      himmeli[L3_21]:setEventListener("restore", restoreCallbackHimmeli)
      himmeli[L3_21]:setAutoRestore(5)
    end
  end
end
function Initialize()
  local L0_22, L1_23, L2_24, L3_25, L4_26
  L0_22 = Fn_sendBulkMineSetupRun
  L0_22(L1_23, L2_24, L3_25)
  repeat
    L0_22 = wait
    L0_22()
    L0_22 = Fn_sendIsRunMine
    L0_22 = L0_22()
  until L0_22
  L0_22 = Fn_getMissionPart
  L0_22 = L0_22()
  _litho_ctrls = nil
  L4_26 = _mission_text_table
  _litho_ctrls = L1_23
  for L4_26, _FORV_5_ in L1_23(L2_24) do
    if findGameObject2("Node", string.format("locator2_wall_%02d", L4_26)) ~= nil and _FORV_5_ == false then
      wall[L4_26] = putWall(findGameObject2("Node", string.format("locator2_wall_%02d", L4_26)):getPos(), findGameObject2("Node", string.format("locator2_wall_%02d", L4_26)):getRot(), string.format("wall_%02d", L4_26))
      wall[L4_26]:setEventListener("broken", brokenWallCallback)
    end
  end
  for L4_26 = 1, slider_max do
    slider[L4_26] = findGameObject2("GimmickBg", string.format("bg2_az3_himmeli_oc_03_%02d", L4_26))
    if slider[L4_26] ~= nil then
      slider[L4_26]:pushJob("J", "S", slider_breaktime, "B")
      slider[L4_26]:setEventListener("broken", brokenSliderCallback)
      slider[L4_26]:setEventListener("restore", restoreSliderCallback)
      slider[L4_26]:setAutoRestore(5)
    end
  end
  L1_23()
  L1_23(L2_24)
  for L4_26 = 1, gem2_l_num do
    gem2_l[L4_26] = findGameObject2("Gem", string.format("gem2_l_%02d", L4_26))
    if gem2_l[L4_26] ~= nil then
      gem2_l[L4_26]:setVisibleBlockHalfSize(150)
    end
  end
  for L4_26 = 1, gem2_m_num do
    gem2_m[L4_26] = findGameObject2("Gem", string.format("gem2_m_%02d", L4_26))
    if gem2_m[L4_26] ~= nil then
      gem2_m[L4_26]:setVisibleBlockHalfSize(150)
    end
  end
  for L4_26 = 1, gem2_vital_num do
    gem2_vital[L4_26] = findGameObject2("Gem", string.format("gem2_vital_%02d", L4_26))
    if gem2_vital[L4_26] ~= nil then
      gem2_vital[L4_26]:setVisibleBlockHalfSize(150)
    end
  end
  for L4_26 = 1, gem2_num_az3_a_09_s do
    gem2_az3_a_09_s[L4_26] = findGameObject2("Gem", string.format("gem2_az3_a_09_s_%02d", L4_26))
    if L0_22 ~= "ep19_l" and L0_22 ~= "ep19_m" then
      gem2_az3_a_09_s[L4_26]:setActive(false)
    end
  end
  for L4_26 = 1, gem2_num_az3_a_09_m do
    gem2_az3_a_09_m[L4_26] = findGameObject2("Gem", string.format("gem2_az3_a_09_m_%02d", L4_26))
    if L0_22 ~= "ep19_l" and L0_22 ~= "ep19_m" then
      gem2_az3_a_09_m[L4_26]:setActive(false)
    end
  end
  for L4_26 = 1, gem2_num_az3_a_09_l do
    gem2_az3_a_09_l[L4_26] = findGameObject2("Gem", string.format("gem2_az3_a_09_l_%02d", L4_26))
    if L0_22 ~= "ep19_l" and L0_22 ~= "ep19_m" then
      gem2_az3_a_09_l[L4_26]:setActive(false)
    end
  end
  for L4_26 = 1, gem2_num_az3_a_09_vital do
    gem2_az3_a_09_vital[L4_26] = findGameObject2("Gem", string.format("gem2_az3_a_09_vital_%02d", L4_26))
    if L0_22 ~= "ep19_l" and L0_22 ~= "ep19_m" then
      gem2_az3_a_09_vital[L4_26]:setActive(false)
    end
  end
  for L4_26 = 1, gem2_num_ep19_g do
    gem2_ep19_g[L4_26] = findGameObject2("Gem", string.format("gem2_ep19_g_%02d", L4_26))
    gem2_ep19_g[L4_26]:setActive(false)
  end
end
function Ingame()
  while true do
    if _gc_spawn_request then
      ghostCrowSpawn(_gc_spawn_node)
      _gc_spawn_request = false
    elseif _gc_warp_request then
      ghostCrowWarp(_gc_warp_node)
      _gc_warp_request = false
    elseif _gc_idling_request then
      ghostCrowIdling()
      _gc_idling_request = false
    elseif _gc_release_request then
      ghostCrowReleaseIdling()
      _gc_release_request = false
    elseif _gc_move_request then
      ghostCrowMove(_gc_end_move_node, _gc_middle_move_node, _gc_move_vel)
      _gc_move_request = false
    elseif _gc_reset_request then
      ghostCrowReset()
      _gc_reset_request = false
    elseif _gc_replay_request then
      ghostCrowReplayStart()
      _gc_replay_request = false
    elseif _spawn_request then
      anotherKittenSpawn(_spawn_node, _first_action, _wait, _isFeline, _isBattle, _isBattle2, _isBattle3)
      _spawn_request = false
    elseif _warp_request then
      anotherKittenWarp(_warp_node, _action)
      _warp_request = false
    elseif _release_request then
      anotherKittenReleaseWait()
      _release_request = false
    elseif _move_request then
      anotherKittenMove(_end_move_node, _middle_move_node, _move_vel, _idling_node)
      _move_request = false
    elseif _walk_request then
      anotherKittenWalk(_walk_node)
      _walk_request = false
    elseif _reset_request then
      anotherKittenReset()
      _reset_request = false
    elseif _jem_request then
      jemActive(_phase_num)
      _jem_request = false
    end
    wait()
  end
end
function Finalize()
  azSeUnload()
  mineFinalize()
  _poison_in = false
  if Fn_getPlayer() then
    Player:applyPoisonDamage(0, 0.1)
  end
  if se_poison ~= nil then
    Sound:stopSEHandle(se_poison)
  end
end
function com_a_hdl(A0_27, A1_28)
  if findGameObject2(A0_27, A1_28) == nil then
    return nil
  else
    return (findGameObject2(A0_27, A1_28))
  end
end
function requestGhostCrowSpawn(A0_29)
  if not _gc_spawn_request then
    _gc_spawn_node = A0_29
    _gc_spawn_request = true
    return true
  end
  return false
end
function requestGhostCrowPuppet()
  local L0_30, L1_31
  L0_30 = _gcPuppet
  return L0_30
end
function requestGhostCrowBrain()
  local L0_32, L1_33
  L0_32 = _gcBrain
  return L0_32
end
function requestGhostCrowSpawnEnd()
  local L0_34, L1_35
  L0_34 = _gcSpawn
  return L0_34
end
function requestGhostCrowWarp(A0_36)
  if not _gc_warp_request then
    _gc_warp_node = A0_36
    _gc_warp_request = true
    return true
  end
  return false
end
function requestGhostCrowIdle()
  local L1_37
  L1_37 = _gc_idling_request
  if not L1_37 then
    _gc_idling_request = true
    L1_37 = true
    return L1_37
  end
  L1_37 = false
  return L1_37
end
function requestGhostCrowReleaseIdle()
  local L1_38
  L1_38 = _gc_release_request
  if not L1_38 then
    _gc_release_request = true
    L1_38 = true
    return L1_38
  end
  L1_38 = false
  return L1_38
end
function requestGhostCrowMove(A0_39, A1_40, A2_41)
  if not _gc_move_request then
    _gc_end_move_node = A0_39
    _gc_middle_move_node = A1_40
    _gc_move_vel = A2_41
    _gc_move_request = true
    return true
  end
  return false
end
function requestGhostCrowReset()
  local L1_42
  L1_42 = _gc_reset_request
  if not L1_42 then
    _gc_reset_request = true
    L1_42 = true
    return L1_42
  end
  L1_42 = false
  return L1_42
end
function requestGhostCrowKill()
  invokeTask(function()
    if _gcPuppet ~= nil then
      _gcPuppet:kill()
      _gcPuppet = nil
    end
    if _gcBrain ~= nil then
      _gcBrain:kill()
      _gcBrain = nil
    end
    _gcSpawn = false
  end)
end
function requestGhostCrowReplayStart()
  local L1_43
  L1_43 = _gc_replay_request
  if not L1_43 then
    _gc_replay_request = true
    L1_43 = true
    return L1_43
  end
  L1_43 = false
  return L1_43
end
function requestGhostCrowReplayKill()
  invokeTask(function()
    if gcrPuppet ~= nil then
      gcrPuppet:kill()
      gcrPuppet = nil
    end
    if gcrBrain ~= nil then
      gcrBrain:kill()
      gcrBrain = nil
    end
    if gcrEffect ~= nil then
      gcrEffect:kill()
      gcrEffect = nil
    end
  end)
end
function requestAnotherKittenSpawn(A0_44, A1_45, A2_46, A3_47, A4_48, A5_49, A6_50)
  if not _spawn_request then
    _spawn_node = A0_44
    _first_action = A1_45
    _wait = A2_46
    _isFeline = A3_47
    _isBattle = A4_48
    _isBattle2 = A5_49
    _isBattle3 = A6_50
    _spawn_request = true
    return true
  end
  return false
end
function requestAnotherKittenPuppet()
  local L0_51, L1_52
  L0_51 = _akPuppet
  return L0_51
end
function requestAnotherKittenBrain()
  local L0_53, L1_54
  L0_53 = _akBrain
  return L0_53
end
function requestAnotherKittenSpawnEnd()
  local L0_55, L1_56
  L0_55 = _akSpawn
  return L0_55
end
function requestAnotherKittenWarp(A0_57, A1_58)
  if not _warp_request then
    _warp_node = A0_57
    _action = A1_58
    _warp_request = true
    return true
  end
  return false
end
function requestAnotherKittenReleaseIdle()
  local L1_59
  L1_59 = _release_request
  if not L1_59 then
    _release_request = true
    L1_59 = true
    return L1_59
  end
  L1_59 = false
  return L1_59
end
function requestAnotherKittenMove(A0_60, A1_61, A2_62, A3_63)
  if not _move_request then
    _end_move_node = A0_60
    _middle_move_node = A1_61
    _move_vel = A2_62
    _idling_node = A3_63
    _move_request = true
    return true
  end
  return false
end
function requestAnotherKittenWalk(A0_64)
  if not _walk_request then
    _walk_node = A0_64
    _walk_request = true
    return true
  end
  return false
end
function requestAnotherKittenReset()
  local L1_65
  L1_65 = _reset_request
  if not L1_65 then
    _reset_request = true
    L1_65 = true
    return L1_65
  end
  L1_65 = false
  return L1_65
end
function requestAnotherKittenKill()
  invokeTask(function()
    if _akPuppet ~= nil then
      _akPuppet:kill()
      _akPuppet = nil
    end
    if _akBrain ~= nil then
      _akBrain:kill()
      _akBrain = nil
    end
    _akSpawn = false
  end)
end
function requestJemActive(A0_66)
  if not _jem_request then
    _jem_request = true
    _phase_num = A0_66
    return true
  end
  return false
end
function requestSetCatWarpCheckPoint(A0_67)
  if A0_67 ~= nil then
    Fn_setCatWarpCheckPoint(A0_67)
    return true
  end
  return false
end
function requestComSensorOn(A0_68)
  if A0_68 ~= nil then
    Fn_pcSensorOn(A0_68)
    return true
  end
  return false
end
function requestComSensorOff(A0_69)
  if A0_69 ~= nil then
    Fn_pcSensorOff(A0_69)
    return true
  end
  return false
end
function requestSliderBreak(A0_70)
  slider[tonumber(A0_70)]:requestBreak(Vector(10, 1, 0), 1)
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
function missionComplete(A0_71)
  invokeTask(function()
    _poison_in = false
    Player:applyPoisonDamage(0, 0.1)
    if se_poison ~= nil then
      Sound:stopSEHandle(se_poison)
    end
    _litho_ctrls:setSecondHalfProcessEnd()
    _litho_ctrls:missionComplete()
    if A0_71 ~= nil then
      findGameObject2("GimmickBg", string.format("wall_%02d", A0_71)):requestBreak(Vector(0, 1, 0), 1)
    end
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
function guideEffOff(A0_72)
  return _litho_ctrls:guideEffOff(A0_72)
end
function setSensorVisible(A0_73)
  _litho_ctrls:setSensorVisible(A0_73)
end
function azSeUnload()
  return _litho_ctrls:azSeUnload()
end
function requestStopPoisonSE()
  Sound:stopSEHandle(se_poison)
end
function ghostCrowSpawn(A0_74)
  if _gcSpawn == false then
    if _gcPuppet == nil then
      _gcPuppet = Fn_spawnSuppotCrowGhost(false, Supporter.FirstAction.Ground, A0_74)
    end
    if _gcBrain == nil then
      _gcBrain = _gcPuppet:getBrain()
      _gcBrain:setIdling(true)
    end
    _gcSpawn = true
  end
end
function ghostCrowWarp(A0_75)
  local L1_76
  L1_76 = _gcBrain
  if L1_76 ~= nil then
    L1_76 = _gcBrain
    L1_76 = L1_76.setIdling
    L1_76(L1_76, true)
    L1_76 = findGameObject2
    L1_76 = L1_76("Node", A0_75)
    _gcBrain:lockToWarp(L1_76, Supporter.FirstAction.Ground)
  end
end
function ghostCrowIdling()
  if _gcBrain ~= nil then
    _gcBrain:setIdling(true)
  end
end
function ghostCrowReleaseIdling()
  if _gcBrain ~= nil then
    _gcBrain:setIdling(false)
    _gcBrain:unlockToWarp()
  end
end
function ghostCrowMove(A0_77, A1_78, A2_79)
  invokeTask(function()
    local L0_80, L1_81, L2_82, L3_83, L4_84
    L0_80 = assert
    L1_81 = _gcPuppet
    L0_80(L1_81)
    L0_80 = assert
    L1_81 = _gcBrain
    L0_80(L1_81)
    L0_80 = _gcPuppet
    L1_81 = L0_80
    L0_80 = L0_80.getWorldPos
    L0_80 = L0_80(L1_81)
    L1_81 = findGameObject2
    L2_82 = "Node"
    L3_83 = A0_77
    L1_81 = L1_81(L2_82, L3_83)
    L2_82 = 30
    L3_83 = A2_79
    if L3_83 ~= nil then
      L2_82 = A2_79
    end
    L3_83 = nil
    L4_84 = {}
    if A1_78 ~= nil then
      L3_83 = findGameObject2("Node", A1_78)
      L4_84 = {
        {
          pos = L0_80,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_80,
          action = Supporter.MovePoint.Air,
          vel = L2_82
        },
        {
          pos = L3_83:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_82
        },
        {
          pos = L1_81:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_82
        },
        {
          pos = L1_81:getWorldPos(),
          action = Supporter.MovePoint.Alight
        }
      }
    else
      L4_84 = {
        {
          pos = L0_80,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_80,
          action = Supporter.MovePoint.Air,
          vel = L2_82
        },
        {
          pos = L1_81:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_82
        },
        {
          pos = L1_81:getWorldPos(),
          action = Supporter.MovePoint.Alight
        }
      }
    end
    _gcBrain:setMovePoints(L4_84)
    _gcBrain:startMovePoint()
    while _gcBrain do
      if _gcBrain:isMovePointEnd() then
        _gcBrain:clearMovePoint()
        _gcBrain:setIdling(true)
        _gcBrain:lockToWarp(L1_81, Supporter.FirstAction.Ground)
        break
      end
      wait()
    end
  end)
end
function ghostCrowReset()
  if _gcBrain ~= nil then
    _gcBrain:reset()
    print("ep19_com_a : \227\130\180\227\131\188\227\130\185\227\131\136\227\130\175\227\131\173\227\130\166\227\130\146\229\136\157\230\156\159\229\140\150")
  end
end
function ghostCrowReplayStart()
  invokeTask(function()
    local L0_85, L1_86
    L0_85 = createGameObject2
    L1_86 = "Puppet"
    L0_85 = L0_85(L1_86)
    gcrPuppet = L0_85
    L0_85 = gcrPuppet
    L1_86 = L0_85
    L0_85 = L0_85.loadModel
    L0_85(L1_86, "ghs04_base")
    L0_85 = gcrPuppet
    L1_86 = L0_85
    L0_85 = L0_85.loadBaseSkeleton
    L0_85(L1_86, "ghs04_base", "ghs04_base")
    L0_85 = gcrPuppet
    L1_86 = L0_85
    L0_85 = L0_85.setPos
    L0_85(L1_86, Vector(0, 0, 0))
    L0_85 = gcrPuppet
    L1_86 = L0_85
    L0_85 = L0_85.setRot
    L0_85(L1_86, Quaternion(0, 0, 0, 1))
    L0_85 = createGameObject2
    L1_86 = "GhostBrain"
    L0_85 = L0_85(L1_86)
    gcrBrain = L0_85
    L0_85 = loadFileAsset
    L1_86 = "rep"
    L0_85 = L0_85(L1_86, "ghost/replay_ep19_01")
    L1_86 = L0_85.wait
    L1_86(L0_85)
    L1_86 = gcrBrain
    L1_86 = L1_86.setFileAsset
    L1_86(L1_86, L0_85)
    L1_86 = gcrBrain
    L1_86 = L1_86.try_init
    L1_86(L1_86)
    L1_86 = "kit01"
    loadFileAsset("evd", "AnimAttrs/" .. L1_86):wait()
    gcrPuppet:loadPoseAnimationSet(L1_86)
    wait(30)
    gcrPuppet:try_init()
    gcrBrain:try_init()
    gcrPuppet:waitForReady()
    gcrBrain:waitForReady()
    gcrPuppet:setBrain(gcrBrain)
    gcrPuppet:try_start()
    gcrBrain:try_start()
    gcrEffect = Fn_createEffect("crw_glw ", "ef_crw_glw_01", {
      obj = gcrPuppet,
      joint = "bn_pelvis"
    }, true)
    wait(30)
    gcrBrain:play()
  end)
end
function anotherKittenSpawn(A0_87, A1_88, A2_89, A3_90, A4_91, A5_92, A6_93)
  local L7_94, L8_95, L9_96, L10_97
  L7_94 = A1_88
  if L7_94 == nil then
    L8_95 = Supporter
    L8_95 = L8_95.FirstAction
    L7_94 = L8_95.Ground
  end
  L8_95 = A2_89
  if L8_95 == nil then
    L8_95 = false
  end
  L9_96 = A3_90
  if L9_96 == nil then
    L9_96 = false
  end
  L10_97 = _akPuppet
  if L10_97 == nil then
    if L9_96 then
      L10_97 = Fn_spawnSuppotKittenForFeline
      L10_97 = L10_97(L7_94, A0_87, A4_91, A5_92, A6_93)
      _akPuppet = L10_97
    else
      L10_97 = Fn_spawnSuppotKitten
      L10_97 = L10_97(L7_94, A0_87, A4_91, A5_92, A6_93)
      _akPuppet = L10_97
    end
  end
  L10_97 = _akBrain
  if L10_97 == nil then
    L10_97 = _akPuppet
    L10_97 = L10_97.getBrain
    L10_97 = L10_97(L10_97)
    _akBrain = L10_97
  end
  L10_97 = _akSpawn
  if L10_97 == false then
    _akSpawn = true
    if L8_95 then
      L10_97 = _akBrain
      L10_97 = L10_97.setIdling
      L10_97(L10_97, true)
      L10_97 = _akBrain
      if L10_97 ~= nil then
        L10_97 = findGameObject2
        L10_97 = L10_97("Node", A0_87)
        _akBrain:lockToWarp(L10_97, L7_94)
      end
    end
  end
  L10_97 = anotherKittenReset
  L10_97()
  L10_97 = _akBrain
  if L10_97 ~= nil then
    L10_97 = _akBrain
    L10_97 = L10_97.setLockonNavi
    L10_97(L10_97, false)
  end
end
function anotherKittenWarp(A0_98, A1_99)
  local L2_100, L3_101
  L2_100 = A1_99
  if L2_100 == nil then
    L3_101 = Supporter
    L3_101 = L3_101.FirstAction
    L2_100 = L3_101.Ground
  end
  L3_101 = _akBrain
  if L3_101 ~= nil then
    L3_101 = _akBrain
    L3_101 = L3_101.setIdling
    L3_101(L3_101, true)
    L3_101 = findGameObject2
    L3_101 = L3_101("Node", A0_98)
    _akBrain:lockToWarp(L3_101, L2_100)
  end
end
function anotherKittenReleaseWait()
  if _akBrain ~= nil then
    _akBrain:setIdling(false)
    _akBrain:unlockToWarp()
  end
end
function anotherKittenMove(A0_102, A1_103, A2_104, A3_105)
  invokeTask(function()
    local L0_106, L1_107, L2_108, L3_109, L4_110
    L0_106 = assert
    L1_107 = _akPuppet
    L0_106(L1_107)
    L0_106 = assert
    L1_107 = _akBrain
    L0_106(L1_107)
    L0_106 = _akPuppet
    L1_107 = L0_106
    L0_106 = L0_106.getWorldPos
    L0_106 = L0_106(L1_107)
    L1_107 = findGameObject2
    L2_108 = "Node"
    L3_109 = A0_102
    L1_107 = L1_107(L2_108, L3_109)
    L2_108 = 30
    L3_109 = A2_104
    if L3_109 ~= nil then
      L2_108 = A2_104
    end
    L3_109 = nil
    L4_110 = {}
    if A1_103 ~= nil then
      L3_109 = findGameObject2("Node", A1_103)
      L4_110 = {
        {
          pos = L0_106,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_106,
          action = Supporter.MovePoint.Air,
          vel = L2_108
        },
        {
          pos = L3_109:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_108
        },
        {
          pos = L1_107:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_108
        },
        {
          pos = L1_107:getWorldPos(),
          action = Supporter.MovePoint.Alight
        }
      }
    else
      L4_110 = {
        {
          pos = L0_106,
          action = Supporter.MovePoint.Takeoff
        },
        {
          pos = L0_106,
          action = Supporter.MovePoint.Air,
          vel = L2_108
        },
        {
          pos = L1_107:getWorldPos(),
          action = Supporter.MovePoint.Air,
          vel = L2_108
        },
        {
          pos = L1_107:getWorldPos(),
          action = Supporter.MovePoint.Alight
        }
      }
    end
    _akBrain:setDetectThreatDistance(0)
    wait()
    _akBrain:setMovePoints(L4_110)
    _akBrain:startMovePoint()
    while _akBrain do
      if _akBrain:isMovePointEnd() then
        _akBrain:clearMovePoint()
        _akBrain:setDetectThreatDistance(100)
        _akBrain:setIdling(true)
        if A3_105 ~= nil then
          _akBrain:lockToWarp(findGameObject2("Node", A3_105), Supporter.FirstAction.Ground)
          break
        end
        break
      end
      wait()
    end
  end)
end
function anotherKittenWalk(A0_111)
  invokeTask(function()
    local L0_112, L1_113, L2_114
    L0_112 = assert
    L1_113 = _akPuppet
    L0_112(L1_113)
    L0_112 = assert
    L1_113 = _akBrain
    L0_112(L1_113)
    L0_112 = _akPuppet
    L1_113 = L0_112
    L0_112 = L0_112.getWorldPos
    L0_112 = L0_112(L1_113)
    L1_113 = findGameObject2
    L2_114 = "Node"
    L1_113 = L1_113(L2_114, A0_111)
    L2_114 = L1_113
    L1_113 = L1_113.getWorldPos
    L1_113 = L1_113(L2_114)
    L2_114 = {
      {
        pos = L0_112,
        action = Supporter.MovePoint.Ground,
        vel = 20
      },
      {
        pos = L1_113,
        action = Supporter.MovePoint.Ground,
        vel = 20
      }
    }
    _akBrain:setMovePoints(L2_114)
    _akBrain:startMovePoint()
    while true do
      if _akBrain:isMovePointEnd() then
        _akBrain:clearMovePoint()
        _akBrain:setIdling(true)
        break
      end
      wait()
    end
  end)
end
function anotherKittenTurn()
  invokeTask(function()
    local L0_115, L1_116, L2_117
    L0_115 = assert
    L1_116 = _akPuppet
    L0_115(L1_116)
    L0_115 = assert
    L1_116 = _akBrain
    L0_115(L1_116)
    L0_115 = _akPuppet
    L1_116 = L0_115
    L0_115 = L0_115.getWorldPos
    L0_115 = L0_115(L1_116)
    L1_116 = Fn_getPlayer
    L1_116 = L1_116()
    L2_117 = {
      {
        pos = L0_115,
        action = Supporter.MovePoint.Turn,
        duration = 1,
        node_lookat = L1_116
      }
    }
    _akBrain:setMovePoints(L2_117)
    _akBrain:startMovePoint()
    while true do
      if _akBrain:isMovePointEnd() then
        _akBrain:clearMovePoint()
        _akBrain:setIdling(true)
        break
      end
      wait()
    end
  end)
end
function anotherKittenReset()
  if _akBrain ~= nil then
    _akBrain:reset()
    print("ep19_com_a : \227\130\162\227\131\138\227\130\182\227\131\188\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\229\136\157\230\156\159\229\140\150")
  end
end
function jemActive(A0_118)
  if Fn_getMissionPart() == "ep19_l" or Fn_getMissionPart() == "ep19_m" then
    for _FORV_5_ = 1, gem2_num_az3_a_09_s do
      if gem2_az3_a_09_s[_FORV_5_] ~= nil then
        if gem2_az3_a_09_s[_FORV_5_]:getActive() == false then
          gem2_az3_a_09_s[_FORV_5_]:setActive(true)
        end
        gem2_az3_a_09_s[_FORV_5_]:setVisibleBlockHalfSize(100)
      end
    end
    for _FORV_5_ = 1, gem2_num_az3_a_09_m do
      if gem2_az3_a_09_m[_FORV_5_] ~= nil then
        if gem2_az3_a_09_m[_FORV_5_]:getActive() == false then
          gem2_az3_a_09_m[_FORV_5_]:setActive(true)
        end
        gem2_az3_a_09_m[_FORV_5_]:setVisibleBlockHalfSize(100)
      end
    end
    for _FORV_5_ = 1, gem2_num_az3_a_09_l do
      if gem2_az3_a_09_l[_FORV_5_] ~= nil then
        if gem2_az3_a_09_l[_FORV_5_]:getActive() == false then
          gem2_az3_a_09_l[_FORV_5_]:setActive(true)
        end
        gem2_az3_a_09_l[_FORV_5_]:setVisibleBlockHalfSize(100)
      end
    end
    for _FORV_5_ = 1, gem2_num_az3_a_09_vital do
      if gem2_az3_a_09_vital[_FORV_5_] ~= nil then
        if gem2_az3_a_09_vital[_FORV_5_]:getActive() == false then
          gem2_az3_a_09_vital[_FORV_5_]:setActive(true)
        end
        gem2_az3_a_09_vital[_FORV_5_]:setVisibleBlockHalfSize(100)
      end
    end
  elseif Fn_getMissionPart() == "ep19_f" or Fn_getMissionPart() == "ep19_g" then
    if A0_118 == 1 then
      for _FORV_5_ = 1, gem2_num_ep19_g_01 do
        if gem2_ep19_g[_FORV_5_] ~= nil then
          if gem2_ep19_g[_FORV_5_]:getActive() == false then
            gem2_ep19_g[_FORV_5_]:setActive(true)
          end
          gem2_ep19_g[_FORV_5_]:setVisibleBlockHalfSize(100)
        end
      end
    elseif A0_118 == 2 then
      for _FORV_6_ = 1, gem2_num_ep19_g_02 do
        if gem2_ep19_g[_FORV_6_ + gem2_num_ep19_g_01] ~= nil then
          if gem2_ep19_g[_FORV_6_ + gem2_num_ep19_g_01]:getActive() == false then
            gem2_ep19_g[_FORV_6_ + gem2_num_ep19_g_01]:setActive(true)
          end
          gem2_ep19_g[_FORV_6_ + gem2_num_ep19_g_01]:setVisibleBlockHalfSize(100)
        end
      end
    elseif A0_118 == 3 then
      for _FORV_6_ = 1, gem2_num_ep19_g_03 do
        if gem2_ep19_g[_FORV_6_ + (gem2_num_ep19_g_01 + gem2_num_ep19_g_02)] ~= nil then
          if gem2_ep19_g[_FORV_6_ + (gem2_num_ep19_g_01 + gem2_num_ep19_g_02)]:getActive() == false then
            gem2_ep19_g[_FORV_6_ + (gem2_num_ep19_g_01 + gem2_num_ep19_g_02)]:setActive(true)
          end
          gem2_ep19_g[_FORV_6_]:setVisibleBlockHalfSize(100)
        end
      end
    elseif A0_118 == 4 then
      for _FORV_6_ = 1, gem2_num_ep19_g_04 do
        if gem2_ep19_g[_FORV_6_ + (gem2_num_ep19_g_01 + gem2_num_ep19_g_02 + gem2_num_ep19_g_03)] ~= nil then
          if gem2_ep19_g[_FORV_6_ + (gem2_num_ep19_g_01 + gem2_num_ep19_g_02 + gem2_num_ep19_g_03)]:getActive() == false then
            gem2_ep19_g[_FORV_6_ + (gem2_num_ep19_g_01 + gem2_num_ep19_g_02 + gem2_num_ep19_g_03)]:setActive(true)
          end
          gem2_ep19_g[_FORV_6_]:setVisibleBlockHalfSize(100)
        end
      end
    end
  end
end
function pcsensor2_catwarp_OnLeave()
  print("pcsensor2_catwarp_OnLeave")
  invokeTask(function()
    if not GameDatabase:get(ggd.GlobalSystemFlags__GameOver) then
      Fn_userCtrlAllOff()
      Fn_catWarpIn()
      Fn_catWarpCheckPoint()
      _poison_in = false
      Player:applyPoisonDamage(0, 0.1)
      Sound:stopSEHandle(se_poison)
      if Fn_getMissionPart() == "ep19_m" then
        for _FORV_4_ = 1, slider_max do
          if slider[_FORV_4_] ~= nil and slider[_FORV_4_]:isBroken() then
            slider[_FORV_4_]:requestRestoreForce()
          end
        end
      end
      _FOR_()
      while not HUD:faderStability() do
        wait()
      end
      wait(15)
      Fn_userCtrlOn()
    else
      print(" << ep19_com_a >> game over \227\129\171\227\129\170\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
    end
  end)
end
function pccubesensor2_poison_OnEnter()
  print("pccubesensor2_poison_OnEnter")
  if _poison_in == false then
    _poison_in = true
    Player:applyPoisonDamage(5, 999)
    se_poison = Sound:playSEHandle("pc1_poisoned", 1, "", Fn_getPlayer())
    if Fn_getMissionPart() ~= "ep19_p" and Fn_getMissionPart() ~= "ep19_q" then
      Fn_captionView("ep19_09017")
    end
  else
  end
end
function pccubesensor2_poison_OnLeave()
  print("pccubesensor2_poison_OnLeave")
  _poison_in = false
  Player:applyPoisonDamage(0, 0.1)
  if se_poison ~= nil then
    Sound:stopSEHandle(se_poison)
  end
end
