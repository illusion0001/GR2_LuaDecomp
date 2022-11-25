dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Misc/lithograph_controller.lua")
dofile("/Game/Event2/Mission/ep21_common.lua")
function warpCrow02()
  local L0_0
  L0_0 = _brain_crow
  L0_0 = L0_0.setIdling
  L0_0(L0_0, true)
  L0_0 = findGameObject2
  L0_0 = L0_0("Node", "locator2_crow_02")
  _brain_crow:warpToNode(L0_0, Supporter.FirstAction.Ground)
  litho_start = true
end
function warpCrow04()
  local L0_1
  L0_1 = findGameObject2
  L0_1 = L0_1("Node", "locator2_crow_04")
  _brain_crow:warpToNode(L0_1, Supporter.FirstAction.Ground)
  _brain_crow:setIdling(true)
end
function warpCrow05()
  local L0_2
  L0_2 = findGameObject2
  L0_2 = L0_2("Node", "locator2_crow_05")
  _brain_crow:warpToNode(L0_2, Supporter.FirstAction.Ground)
  _brain_crow:setIdling(true)
end
function warpCrow06()
  local L0_3
  L0_3 = findGameObject2
  L0_3 = L0_3("Node", "locator2_crow_06")
  _brain_crow:warpToNode(L0_3, Supporter.FirstAction.Ground)
  _brain_crow:setIdling(true)
end
_crow_puppet = nil
_next_crow = nil
crow_stapos = nil
crow_call = false
crow_ward = 0
storm2 = false
_progress_table = {
  ep21_a = {
    false,
    false,
    false,
    false
  },
  ep21_b = {
    false,
    false,
    false,
    false
  },
  ep21_c = {
    false,
    false,
    false,
    false
  },
  ep21_d = {
    true,
    false,
    false,
    false
  },
  ep21_e = {
    true,
    false,
    false,
    false
  },
  ep21_f = {
    true,
    true,
    false,
    false
  },
  ep21_g = {
    true,
    true,
    false,
    false
  },
  ep21_h = {
    true,
    true,
    true,
    false
  },
  ep21_i = {
    true,
    true,
    true,
    true
  }
}
_mission_text_table = {
  "ep21_09500",
  "ep21_09501",
  "ep21_09502",
  "ep21_09503"
}
_guide_eff_table = {
  "",
  "",
  "",
  "ef_ev_hndpar05_01"
}
_demo_table = {
  {
    first_half = {
      warp = "locator2_reset_02",
      func = warpCrow02,
      cut1 = {
        cam = "locator2_cam_02",
        aim = "locator2_aim_02",
        waittime = 1.6
      }
    },
    second_half = {
      warp = "locator2_reset_02_b",
      cut1 = {
        cam = "locator2_cam_02_b",
        aim = "locator2_aim_02"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_reset_04_b",
      cut1 = {
        cam = "locator2_cam_04_b",
        aim = "locator2_aim_04"
      }
    }
  },
  {
    first_half = {
      warp = "locator2_reset_05_b",
      func = warpCrow05,
      cut1 = {
        cam = "locator2_cam_05_b",
        aim = "locator2_aim_05",
        waittime = 1.7
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_cam_05",
        aim = "locator2_aim_05"
      }
    }
  },
  {
    first_half = {},
    second_half = {
      warp = "locator2_reset_07_b",
      cut1 = {
        cam = "locator2_cam_07_b",
        aim = "locator2_aim_07_b",
        waittime = 1
      }
    },
    failure = {
      cut1 = {
        cam = "locator2_cam_06",
        aim = "locator2_aim_06"
      }
    }
  }
}
function Initialize()
  _litho_ctrls = nil
  _litho_ctrls = Lithograph_controller.create(_progress_table, _demo_table, _mission_text_table, _guide_eff_table)
  storm_hdl_00 = findGameObject2("Node", "pccubesensor2_nekostorm_00")
  storm_hdl_01 = findGameObject2("Node", "pccubesensor2_nekostorm_01")
  storm_hdl_02 = findGameObject2("Node", "pccubesensor2_nekostorm_02")
  storm_hdl_03 = findGameObject2("Node", "pccubesensor2_nekostorm_03")
  Fn_pcSensorOff("pccubesensor2_nekostorm_01")
  Fn_pcSensorOff("pccubesensor2_nekostorm_02")
  filmyeff_hdl_1 = Fn_createEffect("film1", "ef_ev_bkpartition_01", "locator2_film_01", true)
  filmyeff_hdl_2 = Fn_createEffect("film2", "ef_ev_bkpartition_01", "locator2_film_02", true)
  filmyeff_hdl_3 = Fn_createEffect("film3", "ef_ev_bkpartition_01", "locator2_film_03", true)
  filmyeff_hdl_4 = Fn_createEffect("film4", "ef_ev_bkpartition_01", "locator2_film_04", true)
  gravityeff_hdl_0 = Fn_createEffect("gravity", "ef_ev_dscbk_01", "pccubesensor2_nekostorm_00", true)
end
function Ingame()
  local L0_4, L1_5, L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  L0_4 = Fn_getPlayer
  L0_4 = L0_4()
  L1_5 = storm_00
  if L1_5 == nil then
    L1_5 = Sound
    L2_6 = L1_5
    L1_5 = L1_5.playSEHandleBox
    L3_7 = "ep21_storm"
    L1_5 = L1_5(L2_6, L3_7, L4_8, L5_9, L6_10)
    storm_00 = L1_5
    L1_5 = print
    L2_6 = "\233\135\141\229\138\155\229\181\144\239\188\144\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
    L1_5(L2_6)
  end
  L1_5 = Fn_getMissionPart
  L1_5 = L1_5()
  mission_part = L1_5
  L1_5 = mission_part
  if L1_5 == "ep21_e" then
    L1_5 = Sound
    L2_6 = L1_5
    L1_5 = L1_5.playSEHandleBox
    L3_7 = "ep21_storm"
    L1_5 = L1_5(L2_6, L3_7, L4_8, L5_9, L6_10)
    storm_02 = L1_5
    L1_5 = print
    L2_6 = "\233\135\141\229\138\155\229\181\144\239\188\146\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
    L1_5(L2_6)
    L1_5 = findGameObject2
    L2_6 = "Node"
    L3_7 = "locator2_se_02"
    L1_5 = L1_5(L2_6, L3_7)
    storm_hdl_02i = L1_5
    L1_5 = Sound
    L2_6 = L1_5
    L1_5 = L1_5.playSEHandle
    L3_7 = "ep21_storm"
    L1_5 = L1_5(L2_6, L3_7, L4_8, L5_9, L6_10)
    storm_02i = L1_5
    L1_5 = print
    L2_6 = "\233\135\141\229\138\155\229\181\144\239\188\146\229\134\133\233\131\168\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
    L1_5(L2_6)
  end
  L1_5 = storm_03
  if L1_5 == nil then
    L1_5 = Sound
    L2_6 = L1_5
    L1_5 = L1_5.playSEHandleBox
    L3_7 = "ep21_storm"
    L1_5 = L1_5(L2_6, L3_7, L4_8, L5_9, L6_10)
    storm_03 = L1_5
    L1_5 = print
    L2_6 = "\233\135\141\229\138\155\229\181\144\239\188\147\233\159\179\233\179\180\227\130\137\227\129\151\227\129\159"
    L1_5(L2_6)
  end
  repeat
    L1_5 = Fn_getMissionPart
    L1_5 = L1_5()
    mission_part = L1_5
    L1_5 = print
    L2_6 = "\227\131\145\227\131\188\227\131\136\229\136\164\229\136\165"
    L3_7 = mission_part
    L1_5(L2_6, L3_7)
    L1_5 = mission_part
  until L1_5 ~= nil
  L1_5 = mission_part
  if L1_5 == "ep21_a" then
    crow_stapos = "locator2_crow_start_pos_a"
  else
    L1_5 = mission_part
    if L1_5 == "ep21_b" then
      crow_stapos = "locator2_crow_start_pos_b"
    else
      L1_5 = mission_part
      if L1_5 == "ep21_c" then
        crow_stapos = "locator2_crow_start_pos_c"
      else
        L1_5 = mission_part
        if L1_5 == "ep21_d" then
          crow_stapos = "locator2_crow_start_pos_d"
        else
          L1_5 = mission_part
          if L1_5 == "ep21_e" then
            crow_stapos = "locator2_crow_start_pos_e"
          else
            L1_5 = mission_part
            if L1_5 == "ep21_f" then
              crow_stapos = "locator2_crow_start_pos_f"
            else
              L1_5 = mission_part
              if L1_5 == "ep21_g" then
                crow_stapos = "locator2_crow_start_pos_g"
              else
                L1_5 = mission_part
                if L1_5 == "ep21_h" then
                  crow_stapos = "locator2_crow_start_pos_h"
                end
              end
            end
          end
        end
      end
    end
  end
  L1_5 = Fn_spawnSuppotCrow
  L2_6 = false
  L3_7 = Supporter
  L3_7 = L3_7.FirstAction
  L3_7 = L3_7.Ground
  L1_5 = L1_5(L2_6, L3_7, L4_8)
  _crow_puppet = L1_5
  L1_5 = _crow_puppet
  L2_6 = L1_5
  L1_5 = L1_5.getBrain
  L1_5 = L1_5(L2_6)
  _brain_crow = L1_5
  L1_5 = _brain_crow
  L2_6 = L1_5
  L1_5 = L1_5.setIdling
  L3_7 = true
  L1_5(L2_6, L3_7)
  crow_call = true
  L1_5 = print
  L2_6 = "\227\130\175\227\131\173\227\130\166\231\148\159\230\136\144"
  L1_5(L2_6)
  L1_5 = false
  L2_6 = 0
  L3_7 = {}
  if L4_8 ~= "ep21_c" then
  else
    if L4_8 == "ep21_d" then
      L2_6 = 4
      for L7_11 = 1, 4 do
        Fn_pcSensorOff("pccubesensor2_crow_" .. string.format("%02d", L7_11))
      end
  end
  else
    if L4_8 ~= "ep21_e" then
    else
      if L4_8 == "ep21_f" then
        for L7_11 = 1, 10 do
          Fn_pcSensorOff("pccubesensor2_crow_" .. string.format("%02d", L7_11))
        end
        L2_6 = 10
    end
    elseif L4_8 ~= "ep21_g" then
    elseif L4_8 == "ep21_h" then
      L2_6 = 11
      for L7_11 = 1, 11 do
        Fn_pcSensorOff("pccubesensor2_crow_" .. string.format("%02d", L7_11))
      end
    end
  end
  repeat
    if L4_8 == true then
      L3_7[0] = L4_8
      L3_7[1] = L4_8
      L3_7[2] = L4_8
      L3_7[3] = L4_8
      L3_7[4] = L4_8
      L3_7[5] = L4_8
      L3_7[6] = L4_8
      L3_7[7] = L4_8
      L3_7[8] = L4_8
      L3_7[9] = L4_8
      L3_7[10] = L4_8
      L3_7[11] = L4_8
      L4_8()
      L2_6 = L2_6 + 1
      _next_crow = false
    end
    if L4_8 == true then
      L7_11 = 1
      storm_02 = L4_8
      L4_8(L5_9)
      storm2 = false
    end
    L4_8()
  until L2_6 >= 11
end
function Finalize()
  _litho_ctrls:azSeUnload()
  if Fn_getPlayer() then
    Player:setParameter(Player.kParam_GravPowConsumFactor)
  end
end
function pccubesensor2_crow_01_OnEnter(A0_12)
  A0_12:setActive(false)
  _next_crow = true
end
function pccubesensor2_litholook_03_OnEnter(A0_13)
  invokeTask(function()
    local L0_14
    L0_14 = findGameObject2
    L0_14 = L0_14("Node", "lithograph_01")
    repeat
      if Fn_isInSightTarget(L0_14, 1) and Fn_getMissionPart() == "ep21_b" then
        Fn_captionView("ep21_09015")
        A0_13:setActive(false)
        break
      end
      wait()
    until false
  end)
end
function navi_on()
  local L0_15, L1_16
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function crow_name()
  local L0_17, L1_18
  L0_17 = _crow_puppet
  return L0_17
end
function crowInvisible()
  _brain_crow:setIdling(true)
  _crow_puppet:setActive(false)
  _crow_puppet:setVisible(false)
  print("\227\130\175\227\131\173\227\130\166\230\182\136\227\129\151\227\129\159")
end
function crowVisible()
  _crow_puppet:setActive(true)
  _crow_puppet:setVisible(true)
  _brain_crow:setIdling(false)
  print("\227\130\175\227\131\173\227\130\166\230\136\187\227\129\151\227\129\159")
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
function resetFirstHalfProcess()
  return _litho_ctrls:resetFirstHalfProcess()
end
function missionComplete()
  invokeTask(function()
    _litho_ctrls:setSecondHalfProcessEnd()
    _litho_ctrls:missionComplete()
  end)
end
function setSecondHalfProcessEnd()
  _litho_ctrls:setSecondHalfProcessEnd()
end
function isSecondHalfProcessEnd()
  return _litho_ctrls:isSecondHalfProcessEnd()
end
function missionFailure()
  invokeTask(function()
    _litho_ctrls:missionFailure()
  end)
end
function isFailureProcessEnd()
  return _litho_ctrls:isFailureProcessEnd()
end
function lithoStart()
  local L0_19, L1_20
  L0_19 = litho_start
  return L0_19
end
function pccubesensor2_outrange_OnLeave()
  invokeTask(function()
    print(Fn_getPcPosRot().y)
    findGameObject2("Node", "locator2_warp_01"):setTransform(Vector(120, Fn_getPcPosRot().y, 0))
    Fn_setCatWarpCheckPoint("locator2_warp_01")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\145")
    Fn_catWarp()
  end)
end
function pccubesensor2_outrangestart_01_OnLeave()
  invokeTask(function()
    Fn_setCatWarpCheckPoint("locator2_start_01")
    print("\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\145")
    Fn_catWarp()
  end)
end
function pccubesensor2_in_OnEnter(A0_21)
  A0_21:setActive(false)
  Sound:playSE("ep21_pillar_film", 1, "", Fn_getPlayer())
  GravPowConsumUp()
  Fn_pcSensorOff("pccubesensor2_nekostorm_00")
  Fn_pcSensorOn("pccubesensor2_out_01")
  Fn_pcSensorOn("pccubesensor2_out_02")
  Fn_pcSensorOn("pccubesensor2_out_03")
  Fn_pcSensorOn("pccubesensor2_out_04")
  print("\230\159\177\227\129\171\229\133\165\227\129\163\227\129\166\233\135\141\229\138\155\227\130\178\227\131\188\227\130\184\230\182\136\232\178\187\233\135\143\227\130\162\227\131\131\227\131\151com")
  Player:setSpecialTuning(Player.kSpecialTuning_Ep21InnerPillar)
  print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\129\170\227\129\132\227\130\136\227\129\134\227\129\171com")
  Sound:stopSEHandle(storm_00)
  if storm_00 ~= nil then
    storm_00 = nil
  end
  if gravityeff_hdl_0 ~= nil then
    gravityeff_hdl_0:setVisible(false)
  end
  Sound:stopSEHandle(storm_03)
  if storm_03 ~= nil then
    storm_03 = nil
  end
  if gravityeff_hdl_3 ~= nil then
  end
end
function pccubesensor2_out_OnEnter(A0_22)
  A0_22:setActive(false)
  Sound:playSE("ep21_pillar_film", 1, "", Fn_getPlayer())
  GravPowConsumDown()
  Fn_pcSensorOn("pccubesensor2_nekostorm_00")
  Fn_pcSensorOn("pccubesensor2_in_01")
  Fn_pcSensorOn("pccubesensor2_in_02")
  Fn_pcSensorOn("pccubesensor2_in_03")
  Fn_pcSensorOn("pccubesensor2_in_04")
  print("\230\159\177\227\129\139\227\130\137\229\135\186\227\129\166\233\135\141\229\138\155\227\130\178\227\131\188\227\130\184\230\182\136\232\178\187\233\135\143\227\131\128\227\130\166\227\131\179com")
  Player:setSpecialTuning(Player.kSpecialTuning_None)
  print("\229\163\129\227\130\184\227\131\163\227\131\179\227\131\151\227\129\167\227\129\141\227\130\139\227\130\136\227\129\134\227\129\171com")
  if storm_00 == nil then
    storm_00 = Sound:playSEHandleBox("ep21_storm", 1, "", storm_hdl_00)
    print("\233\135\141\229\138\155\229\181\144\239\188\144\233\159\179\233\179\180\227\130\137\227\129\151\231\155\180\227\129\151\227\129\159")
  end
  if gravityeff_hdl_0 ~= nil then
    gravityeff_hdl_0:setVisible(true)
  end
  if storm_03 == nil then
    storm_03 = Sound:playSEHandleBox("ep21_storm", 1, "", storm_hdl_03)
    print("\233\135\141\229\138\155\229\181\144\239\188\147\233\159\179\233\179\180\227\130\137\227\129\151\231\155\180\227\129\151\227\129\159")
  end
  if gravityeff_hdl_3 ~= nil then
  end
end
function pccubesensor2_nekostorm_00_OnEnter(A0_23)
  invokeTask(function()
    Fn_catWarp()
    Player:setGravityControlMode(true)
  end)
end
function start_storm_00()
  Fn_pcSensorOn("pccubesensor2_nekostorm_00")
end
function stop_storm_00()
  Fn_pcSensorOff("pccubesensor2_nekostorm_00")
end
function start_storm_02()
  local L0_24, L1_25
  storm2 = true
end
function stop_stormse_01()
  Sound:stopSEHandle(storm_01)
  Sound:stopSEHandle(storm_01i)
end
function stop_stormse_02()
  Sound:stopSEHandle(storm_02)
  Sound:stopSEHandle(storm_02i)
end
