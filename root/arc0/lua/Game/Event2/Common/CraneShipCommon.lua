local L1_1
function L0_0(A0_2)
  bgManager:sendEvent("requestBgSet", {switchArea = A0_2})
end
Fn_setEffectivenessMineArea = L0_0
function L0_0(A0_3)
  bgManager:sendEvent("setCraneShipInformation", A0_3)
end
Fn_setCraneShipInformation = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    ship = {standby = true}
  })
  repeat
    wait()
  until bgManager:sendEvent("getStateCraneShip", {
    ship = {is_crew = true}
  })
end
Fn_setCrew = L0_0
function L0_0(A0_4)
  bgManager:sendEvent("requestCraneShip", {
    ship = {crew_active = A0_4}
  })
end
Fn_setCrewActive = L0_0
function L0_0(A0_5, A1_6)
  bgManager:sendEvent("requestCraneShip", {
    ship = {departure = A0_5, route = A1_6}
  })
end
Fn_departure = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    ship = {ready_return_to_port = true}
  })
end
Fn_readyReturnToPort = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    ship = {return_to_port = true}
  })
end
Fn_returnToPort = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    cage = {ship_func = true}
  })
end
Fn_setCraneOperationFunc = L0_0
function L0_0(A0_7, A1_8)
  bgManager:sendEvent("requestCraneShip", {
    cage = {
      move = true,
      is_player_in = A0_7,
      is_user_ctrl = A1_8,
      ship_func = true
    }
  })
end
Fn_cageMove = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    cage = {stop = true}
  })
  wait(3)
end
Fn_cageStop = L0_0
function L0_0(A0_9, A1_10, A2_11)
  local L3_12, L4_13
  if A0_9 then
    L3_12 = true
  else
    L3_12 = L3_12 or false
  end
  if A1_10 == false then
    L4_13 = true
  else
    L4_13 = L4_13 or false
  end
  bgManager:sendEvent("requestCraneShip", {
    cage = {
      warp = L3_12,
      warp_ship = L4_13,
      warp_pos = A0_9,
      set_down = A1_10,
      set_player_in = A2_11
    }
  })
  wait(3)
end
Fn_setCagePos = L0_0
function L0_0(A0_14)
  bgManager:sendEvent("requestCraneShip", {
    cage = {set_mov_param = A0_14}
  })
  wait()
end
Fn_setCageMoveParam = L0_0
function L0_0(A0_15)
  bgManager:sendEvent("requestCraneShip", {
    cage = {
      marker = true,
      move_skip_marker = A0_15,
      set_down = false
    }
  })
end
Fn_setCageMarker = L0_0
function L0_0(A0_16)
  bgManager:sendEvent("requestCraneShip", {
    cage = {move_skip = A0_16}
  })
end
Fn_setCageMoveSkip = L0_0
function L0_0(A0_17)
  bgManager:sendEvent("requestCraneShip", {
    cage = {invisible_col = A0_17}
  })
end
Fn_setInvisibleColltion = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    cage = {
      warp = true,
      warp_ship = false,
      warp_move = true,
      set_down = false,
      switch_mine_wire = true
    }
  })
end
Fn_warpCageMineArea = L0_0
function L0_0(A0_18)
  bgManager:sendEvent("requestCraneShip", {
    gstm = {set_active = A0_18}
  })
end
Fn_setGravityStorm = L0_0
function L0_0()
  if bgManager:sendEvent("getStateCraneShip", {
    cage = {is_move_end = true}
  }) then
    bgManager:sendEvent("requestCraneShip", {
      gstm = {set_mine_gate = true}
    })
  end
end
Fn_setMineGravityStorm = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    gstm = {all_off = true}
  })
end
Fn_setMineGravityStormAllOff = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    gstm = {set_indoor_cat_warp = true}
  })
end
Fn_setGravityStormIndoorCatWarpOn = L0_0
function L0_0()
  repeat
    wait()
  until bgManager:sendEvent("getStateCraneShip", {
    ship = {is_ready_port = true}
  })
end
Fn_waitReturnToPortReady = L0_0
function L0_0()
  repeat
    wait()
  until bgManager:sendEvent("getStateCraneShip", {
    ship = {is_return_to_port_finish = true}
  })
end
Fn_waitReturnToPortFinish = L0_0
function L0_0()
  return bgManager:sendEvent("getStateCraneShip", {
    cage = {get_handle = true}
  })
end
Fn_getCageHandle = L0_0
function L0_0()
  return bgManager:sendEvent("getStateCraneShip", {
    cage = {get_move_dist = true}
  })
end
Fn_getCageMoveDist = L0_0
function L0_0()
  bgManager:sendEvent("requestCraneShip", {
    cage = {set_skip_fadein = true}
  })
  repeat
    wait()
  until bgManager:sendEvent("getStateCraneShip", {
    cage = {is_move_end = true}
  })
  bgManager:sendEvent("requestCraneShip", {
    gstm = {stop = true}
  })
end
Fn_waitCageMoveEnd = L0_0
function L0_0()
  repeat
    wait()
  until bgManager:sendEvent("getStateCraneShip", {
    gstm = {is_gate_in = true}
  })
end
Fn_waitGravityStormIn = L0_0
function L0_0()
  repeat
    wait()
  until not bgManager:sendEvent("getStateCraneShip", {
    gstm = {is_gate_in = true}
  })
end
Fn_waitGravityStormOut = L0_0
function L0_0()
  local L0_19, L1_20, L2_21
  L0_19 = false
  L1_20 = false
  L2_21 = false
  while true do
    L2_21 = bgManager:sendEvent("getStateCraneShip", {
      cage = {is_skip = true}
    })
    L0_19 = bgManager:sendEvent("getStateCraneShip", {
      gstm = {is_gate_in = true}
    })
    if L2_21 then
      L1_20 = true
    end
    if L1_20 then
      L0_19 = bgManager:sendEvent("getStateCraneShip", {
        gstm = {is_running = true}
      })
    end
    if L0_19 or L2_21 then
      wait()
    end
  end
end
Fn_waitGravityStormOutAndCageSkip = L0_0
function L0_0()
  local L0_22, L1_23, L2_24
  L0_22 = false
  L1_23 = false
  L2_24 = false
  while true do
    L0_22 = bgManager:sendEvent("getStateCraneShip", {
      gstm = {is_gate_in = true}
    })
    L1_23 = bgManager:sendEvent("getStateCraneShip", {
      ship = {is_departure = true}
    })
    L2_24 = bgManager:sendEvent("getStateCraneShip", {
      cage = {is_skip = true}
    })
    if not L0_22 and not L1_23 and not L2_24 then
      wait()
    end
  end
  if L1_23 then
    return 0
  end
  if L2_24 then
    return 2
  end
  return 1
end
Fn_waitGravityStormInOrDeparture = L0_0
function L0_0(A0_25)
  local L1_26, L2_27, L3_28, L4_29
  L1_26 = false
  L2_27 = false
  L3_28 = false
  L4_29 = true
  print(" - cs com - \231\177\160\227\129\140\229\129\156\230\173\162\227\129\153\227\130\139\229\190\133\227\129\161\227\129\190\227\129\153")
  while true do
    if not bgManager:sendEvent("getStateCraneShip", {
      cage = {is_move_end = true}
    }) then
      wait()
    end
  end
  print(" - cs com - \231\177\160\227\129\140\231\167\187\229\139\149\227\129\153\227\130\139\229\190\133\227\129\161\227\129\190\227\129\153")
  while true do
    L1_26 = bgManager:sendEvent("getStateCraneShip", {
      gstm = {is_gate_in = true}
    })
    L3_28 = bgManager:sendEvent("getStateCraneShip", {
      cage = {is_skip = true}
    })
    L4_29 = bgManager:sendEvent("getStateCraneShip", {
      cage = {is_move_end = true}
    })
    if not L4_29 and not false and A0_25 then
      print(" - cs com - \229\139\149\227\129\132\227\129\159\230\153\130\227\129\171\228\184\128\229\155\158\227\129\160\227\129\145\229\174\159\232\161\140\227\129\151\227\129\159\227\129\132\233\150\162\230\149\176\227\130\146\229\174\159\232\161\140")
      A0_25()
    end
    if not L1_26 and not L3_28 then
      wait()
    end
  end
  print(" - cs com - \227\130\178\227\131\188\227\131\136\227\129\171\229\133\165\227\129\163\227\129\159\227\129\139\227\128\129\227\130\185\227\130\173\227\131\131\227\131\151\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159")
  if L1_26 then
    return 1
  end
  return 0
end
Fn_waitGravityStormInOrCageMoveSkip = L0_0
function L0_0()
  while true do
    if bgManager:sendEvent("getStateCraneShip", {
      gstm = {is_brack_hole = true}
    }) then
      print(" CraneShipCommon : \233\135\141\229\138\155\229\181\144\227\129\140\227\129\167\227\129\141\227\129\159")
      break
    end
    print(" CraneShipCommon : \233\135\141\229\138\155\229\181\144\227\129\140\227\129\167\227\129\141\227\130\139\227\129\174\227\130\146\229\190\133\227\129\164")
    wait()
  end
end
Fn_waitGravityStormPlay = L0_0
function L0_0()
  while true do
    if not bgManager:sendEvent("getStateCraneShip", {
      gstm = {is_indoor_catwarp = true}
    }) then
      wait()
    end
  end
end
Fn_waitGravityStormIndoorCatWarp = L0_0
