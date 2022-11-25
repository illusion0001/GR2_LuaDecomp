dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep10_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/area_controller.lua")
_debug_sdemo_skip = false
_debug_enemy_eye = false
_npcTable = {}
_soldierInstance = {}
_mechskytask = nil
_cage_insight = {}
_downward_cage_area = false
_is_playing_sdemo_cut03 = false
_is_in_upside_sensor = false
_restart_warship = false
_sensor_on_enter = false
_cage_destruction_tutorial_task = nil
_sender1 = nil
_sender2 = nil
_sender3 = nil
_mnavi = {}
_mnavi_max = 5
_grab_tutorial = false
_reset_phase = false
_hos_cnt = 0
_puppet_tbl = {}
_npc_tbl = {}
_grab_task = {
  hst01 = nil,
  hst02 = nil,
  hst03 = nil,
  hst04 = nil,
  hst05 = nil
}
_grab_execution_flag = {
  hst01 = false,
  hst02 = false,
  hst03 = false,
  hst04 = false,
  hst05 = false
}
_crow_grab_execution_flag = {
  hst01 = false,
  hst02 = false,
  hst03 = false,
  hst04 = false,
  hst05 = false
}
_grab_caption_flag = {
  hst01 = false,
  hst02 = false,
  hst03 = false,
  hst04 = false,
  hst05 = false
}
_reaction_stop_flag = {
  hst01 = false,
  hst02 = false,
  hst03 = false,
  hst04 = false,
  hst05 = false
}
_ship_navi_flag = {
  hst01 = false,
  hst02 = false,
  hst03 = false,
  hst04 = false,
  hst05 = false
}
_hostage_rescue_check_tbl = {
  hst01 = false,
  hst02 = false,
  hst03 = false,
  hst04 = false,
  hst05 = false
}
_move_task = {
  hst01 = nil,
  hst02 = nil,
  hst03 = nil,
  hst04 = nil,
  hst05 = nil
}
_shipnpc_move_flag = false
_move_shipnpc_task = {
  ryz01 = nil,
  phi01 = nil,
  adv01 = nil
}
_backstairs_gossip2_start_flag_shipnpc = false
_backstairs_gossip2_start_flag_hostage = false
_brain_crow = nil
_puppet_crow = nil
_access_cage = {
  cage1 = false,
  cage2 = false,
  cage3 = false
}
_crow_now_cage = {
  cage1 = false,
  cage2 = false,
  cage3 = false
}
_crow_access_cage_flag = false
_kaiwa_111k_flag = false
_crow_back_flag = false
_crow_mission_completion_flag = false
_hostage_at = false
_catwarp = false
enmgen2_mechsky = {
  spawnOnStart = true,
  autoPrepare = true,
  autoRebirthFlag = false,
  spawnSet = {
    {
      type = "mechsky",
      locator = "locator2_mechsky_01",
      name = "mechsky01"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_01",
      name = "mechsky_sol01",
      target_vehicle = "mechsky01"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_02",
      name = "mechsky02"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_02",
      name = "mechsky_sol02",
      target_vehicle = "mechsky02"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_03",
      name = "mechsky03"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_03",
      name = "mechsky_sol03",
      target_vehicle = "mechsky03"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_04",
      name = "mechsky04"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_04",
      name = "mechsky_sol04",
      target_vehicle = "mechsky04"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_05",
      name = "mechsky05"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_05",
      name = "mechsky_sol05",
      target_vehicle = "mechsky05"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_06",
      name = "mechsky06"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_06",
      name = "mechsky_sol06",
      target_vehicle = "mechsky06"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_07",
      name = "mechsky07"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_07",
      name = "mechsky_sol07",
      target_vehicle = "mechsky07"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_08",
      name = "mechsky08"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_08",
      name = "mechsky_sol08",
      target_vehicle = "mechsky08"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_09",
      name = "mechsky09"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_09",
      name = "mechsky_sol09",
      target_vehicle = "mechsky09"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_10",
      name = "mechsky10"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_10",
      name = "mechsky_sol10",
      target_vehicle = "mechsky10"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_11",
      name = "mechsky11"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_11",
      name = "mechsky_sol11",
      target_vehicle = "mechsky11"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_12",
      name = "mechsky12"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_12",
      name = "mechsky_sol12",
      target_vehicle = "mechsky12"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_13",
      name = "mechsky13"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_13",
      name = "mechsky_sol13",
      target_vehicle = "mechsky13"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_14",
      name = "mechsky14"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_14",
      name = "mechsky_sol14",
      target_vehicle = "mechsky14"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_15",
      name = "mechsky15"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_15",
      name = "mechsky_sol15",
      target_vehicle = "mechsky15"
    },
    {
      type = "mechsky",
      locator = "locator2_mechsky_16",
      name = "mechsky16"
    },
    {
      type = "soldier_rifle",
      locator = "locator2_mechsky_16",
      name = "mechsky_sol16",
      target_vehicle = "mechsky16"
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
  end,
  onObjectAsh = function(A0_8, A1_9)
    A0_8:getSpecTable().enemyDeadNum = A0_8:getSpecTable().enemyDeadNum + 1
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_10)
    return #A0_10.spawnSet
  end,
  getEnemyDeadNum = function(A0_11)
    local L1_12
    L1_12 = A0_11.enemyDeadNum
    return L1_12
  end,
  getEnemyName = function(A0_13, A1_14)
    local L2_15
    L2_15 = A0_13.spawnSet
    L2_15 = L2_15[A1_14]
    L2_15 = L2_15.name
    return L2_15
  end
}
function Initialize()
  local L0_16, L1_17, L2_18, L3_19
  L0_16()
  L0_16()
  L0_16()
  L0_16(L1_17, L2_18)
  _npc_event_soldier_01 = "npcgen2_event_soldier_01"
  _npc_event_soldier_02 = "npcgen2_event_soldier_02"
  L0_16()
  L1_17.name = "ryz01"
  L1_17.type = "ryz02"
  L1_17.node = "locator2_ryz_kdemo"
  L2_18.name = "phi01"
  L2_18.type = "phi01"
  L2_18.node = "locator2_phi_kdemo"
  L3_19 = {}
  L3_19.name = "adv01"
  L3_19.type = "man57"
  L3_19.color_variation = 1
  L3_19.node = "locator2_advance_kdemo"
  L3_19.anim_name = "talk_03"
  L3_19.attach = false
  chara_table = L0_16
  L1_17.name = "hst01"
  L1_17.type = "man36"
  L1_17.node = "locator2_hst01_01"
  L1_17.anim_name = "sit_floor_01"
  L2_18.name = "hst02"
  L2_18.type = "chi11"
  L2_18.node = "locator2_hst02_01"
  L2_18.anim_name = "sit_floor_01"
  L3_19 = {}
  L3_19.name = "hst03"
  L3_19.type = "chi12"
  L3_19.node = "locator2_hst03_01"
  L3_19.anim_name = "sit_floor_00"
  hst_tbl = L0_16
  L0_16(L1_17)
  L0_16(L1_17)
  for L3_19, _FORV_4_ in L0_16(L1_17) do
    _puppet_tbl[_FORV_4_.name] = Fn_findNpcPuppet(_FORV_4_.name)
    _npc_tbl[_FORV_4_.name] = Fn_findNpc(_FORV_4_.name)
    _mnavi[_FORV_4_.name] = HUD:mnaviNew({
      name = _FORV_4_.name,
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    })
  end
  for L3_19 = 1, 9 do
    findGameObject2("Sensor", "cubesensormulti2_RescueArea_" .. string.format("%02d", L3_19)):setDetectMode(1)
    findGameObject2("Sensor", "cubesensormulti2_RescueArea_" .. string.format("%02d", L3_19)):setFilterType("Puppet")
  end
  L3_19 = 10
  L3_19 = "hst01_sensor"
  L0_16(L1_17, L2_18, L3_19)
  L3_19 = 10
  L3_19 = "hst02_sensor"
  L0_16(L1_17, L2_18, L3_19)
  L3_19 = 10
  L3_19 = "hst03_sensor"
  L0_16(L1_17, L2_18, L3_19)
  L3_19 = 10
  L3_19 = "hst04_sensor"
  L0_16(L1_17, L2_18, L3_19)
  L3_19 = 10
  L3_19 = "hst05_sensor"
  L0_16(L1_17, L2_18, L3_19)
  for L3_19 = 1, 3 do
    _cage_insight[L3_19] = findGameObject2("Node", "locator2_viewpoint_cage" .. L3_19)
  end
  _sdemo_cut01 = L0_16
  _sdemo_cut02 = L0_16
  _sdemo_cut03 = L0_16
  _sdemo_cut04 = L0_16
  _ship_ctrl = L0_16
  L3_19 = "man01_talk_00"
  L3_19 = L0_16
  L1_17(L2_18, L3_19)
  L3_19 = "phi01"
  L2_18(L3_19, L1_17)
  L3_19 = "ryz02_talk_in_00"
  L3_19 = Fn_loadNpcEventMotion
  L3_19("ryz01", L2_18)
end
function Ingame()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25
  L0_20()
  L0_20()
  L0_20(L1_21, L2_22)
  L0_20(L1_21, L2_22)
  L0_20(L1_21)
  for L3_23, L4_24 in L0_20(L1_21) do
    L5_25 = L4_24.setTarget
    L5_25(L4_24, _puppet_tbl[L3_23])
  end
  L0_20()
  L0_20()
  L0_20(L1_21)
  if L0_20 == false then
    L0_20()
    L0_20(L1_21, L2_22, L3_23)
    L0_20()
    L0_20()
    L0_20()
    L0_20(L1_21)
    L0_20()
    L0_20()
    L0_20()
  elseif L0_20 == true then
    L0_20(L1_21)
    L0_20(L1_21, L2_22)
    L0_20(L1_21)
    L4_24 = "locator2_aim_reset"
    L4_24 = 1
    L0_20(L1_21, L2_22, L3_23, L4_24)
    L0_20()
    L0_20()
  end
  L0_20(L1_21)
  L0_20()
  if L0_20 == true then
    L0_20(L1_21)
    L0_20(L1_21)
  end
  L0_20(L1_21)
  L0_20()
  L0_20(L1_21)
  L0_20(L1_21)
  L0_20()
  L0_20(L1_21)
  L0_20(L1_21)
  L0_20(L1_21)
  L0_20(L1_21)
  repeat
    L0_20()
  until L0_20
  for L3_23 = 1, 20 do
    L4_24 = _cage_hdl
    L4_24 = L4_24[L3_23]
    L5_25 = L4_24
    L4_24 = L4_24.setCollidablePermission
    L4_24(L5_25, true)
    L4_24 = _cage_hdl_org
    L4_24 = L4_24[L3_23]
    L5_25 = L4_24
    L4_24 = L4_24.setCollidablePermission
    L4_24(L5_25, true)
  end
  repeat
    L0_20()
  until L0_20
  _hos_cnt = 0
  while true do
    if L1_21 == true then
      _next_phase = false
      _hos_cnt = 0
      for L4_24, L5_25 in L1_21(L2_22) do
        print(L4_24, L5_25)
        if L5_25 == true then
          Fn_setGrabNpc(tostring(L4_24), true, true)
          _hos_cnt = _hos_cnt + 1
        end
      end
      L1_21(L2_22)
    end
    if L1_21 >= 3 then
      if L1_21 == false then
        L1_21(L2_22)
        _crow_back_flag = true
      end
    end
    if L0_20 == false then
      if L1_21 >= 1 then
        if L1_21 < 4 then
          if L1_21 <= 0 then
            if L1_21 == false then
              L1_21(L2_22)
            end
          end
        end
      end
    end
    if L1_21 == true then
      L1_21()
    end
  end
  L4_24 = true
  L1_21(L2_22, L3_23, L4_24)
  L4_24 = true
  L1_21(L2_22, L3_23, L4_24)
  L4_24 = true
  L1_21(L2_22, L3_23, L4_24)
  L4_24 = true
  L1_21(L2_22, L3_23, L4_24)
  L4_24 = true
  L1_21(L2_22, L3_23, L4_24)
  L1_21(L2_22)
  L1_21()
  L1_21()
  L1_21()
  L1_21()
  L1_21()
end
function Finalize()
  returnVeCreanAreaGroup()
  Fn_tutorialCaptionKill()
  if _se_handle then
    Sound:stopSEHandle(_se_handle)
    _se_handle = nil
  end
end
function getCageHandle()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32
  L0_26 = Fn_getBgsetHandle
  L0_26 = L0_26()
  for L4_30 = 1, 20 do
    L5_31 = _cage_hdl
    L6_32 = L0_26.findGameObject2
    L6_32 = L6_32(L0_26, "GimmickBg", string.format("go_jailcage_a_%02d_brk", L4_30))
    L5_31[L4_30] = L6_32
    L5_31 = _cage_hdl_org
    L6_32 = L0_26.findGameObject2
    L6_32 = L6_32(L0_26, "GimmickBg", string.format("go_jailcage_a_%02d", L4_30))
    L5_31[L4_30] = L6_32
    L5_31 = print
    L6_32 = _cage_hdl
    L6_32 = L6_32[L4_30]
    L5_31(L6_32)
    L5_31 = _cage_hdl
    L5_31 = L5_31[L4_30]
    if L5_31 == nil then
      L5_31 = _cage_hdl
      L6_32 = L0_26.findGameObject2
      L6_32 = L6_32(L0_26, "GimmickBg", string.format("go_jailcage_a_%02d_brk", L4_30))
      L5_31[L4_30] = L6_32
      L5_31 = wait
      L5_31()
    end
    L5_31 = _cage_hdl_org
    L5_31 = L5_31[L4_30]
    if L5_31 == nil then
      L5_31 = _cage_hdl_org
      L6_32 = L0_26.findGameObject2
      L6_32 = L6_32(L0_26, "GimmickBg", string.format("go_jailcage_a_%02d", L4_30))
      L5_31[L4_30] = L6_32
      L5_31 = wait
      L5_31()
    end
    L5_31 = _cage_hdl
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.setLockonPermission
    L5_31(L6_32, false)
    L5_31 = _cage_hdl
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.setCollidableBlockEnable
    L5_31(L6_32, false)
    L5_31 = _cage_hdl
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.setCollidablePermission
    L5_31(L6_32, false)
    L5_31 = _cage_hdl_org
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.setLockonPermission
    L5_31(L6_32, false)
    L5_31 = _cage_hdl_org
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.setCollidableBlockEnable
    L5_31(L6_32, false)
    L5_31 = _cage_hdl_org
    L5_31 = L5_31[L4_30]
    L6_32 = L5_31
    L5_31 = L5_31.setCollidablePermission
    L5_31(L6_32, false)
    L5_31 = ggd
    L6_32 = "Savedata__BrokenObj__ep10__go_jailcage_a_"
    L6_32 = L6_32 .. string.format("%02d", L4_30)
    L5_31 = L5_31[L6_32]
    if L5_31 then
      L6_32 = GameDatabase
      L6_32 = L6_32.set
      L6_32(L6_32, L5_31, false)
    end
    L6_32 = ggd
    L6_32 = L6_32["Savedata__BrokenObj__ep10__go_jailcage_a_" .. string.format("%02d", L4_30) .. "_brk"]
    if L5_31 then
      GameDatabase:set(L6_32, false)
    end
  end
  L0_26 = nil
  L4_30 = "broken"
  function L5_31(A0_33)
    local L1_34
    L1_34 = ggd
    L1_34 = L1_34["Savedata__BrokenObj__ep10__go_jailcage_a_" .. string.format("%02d", kCAGE1) .. "_brk"]
    if L1_34 then
      GameDatabase:set(L1_34, true)
    end
    L1_27(1)
    Fn_setGrabNpc("hst01", false, true)
    Fn_playMotionNpc("hst01", "scared_in_00", false)
    Fn_playMotionNpc("hst01", "scared_out_00", false)
    Sound:playSE("m05_933c", 1, "", _npc_tbl.hst01)
    Fn_playMotionNpc("hst01", "stay", false, {isRepeat = true})
    if _sender1 == "player" then
      hostageGrabTask("hst01")
    end
  end
  L2_28(L3_29, L4_30, L5_31)
  L4_30 = "judge"
  function L5_31(A0_35, A1_36, A2_37, A3_38)
    print("judge:" .. A1_36 .. "=" .. A2_37)
    if A3_38:getName() ~= nil then
      print("sender:" .. A3_38:getName())
      _sender1 = A3_38:getName()
    end
    return 2
  end
  L2_28(L3_29, L4_30, L5_31)
  L4_30 = "broken"
  function L5_31(A0_39)
    local L1_40
    L1_40 = ggd
    L1_40 = L1_40["Savedata__BrokenObj__ep10__go_jailcage_a_" .. string.format("%02d", kCAGE2) .. "_brk"]
    if L1_40 then
      GameDatabase:set(L1_40, true)
    end
    L1_27(2)
    Fn_setGrabNpc("hst02", false, true)
    Fn_setGrabNpc("hst03", false, true)
    invokeTask(function()
      local L0_41
      L0_41 = RandI
      L0_41 = L0_41(1, 10)
      wait(L0_41)
      Fn_playMotionNpc("hst02", "surprise_01", false)
      Sound:playSE("m08_933c", 1, "", _npc_tbl.hst02)
      Fn_playMotionNpc("hst02", "stay", false, {isRepeat = true})
    end)
    invokeTask(function()
      local L0_42
      L0_42 = RandI
      L0_42 = L0_42(1, 30)
      wait(L0_42)
      Fn_playMotionNpc("hst03", "stoop_in_00", false)
      Fn_playMotionNpc("hst03", "stoop_out_00", false)
      Sound:playSE("w09_933c", 1, "", _npc_tbl.hst03)
      Fn_playMotionNpc("hst03", "stay", false, {isRepeat = true})
    end)
    if _sender2 == "player" then
      hostageGrabTask("hst02")
      hostageGrabTask("hst03")
    end
  end
  L2_28(L3_29, L4_30, L5_31)
  L4_30 = "judge"
  function L5_31(A0_43, A1_44, A2_45, A3_46)
    print("judge:" .. A1_44 .. "=" .. A2_45)
    if A3_46:getName() ~= nil then
      print("sender:" .. A3_46:getName())
      _sender2 = A3_46:getName()
    end
    return 2
  end
  L2_28(L3_29, L4_30, L5_31)
  L4_30 = "broken"
  function L5_31(A0_47)
    local L1_48
    L1_48 = ggd
    L1_48 = L1_48["Savedata__BrokenObj__ep10__go_jailcage_a_" .. string.format("%02d", kCAGE3) .. "_brk"]
    if L1_48 then
      GameDatabase:set(L1_48, true)
    end
    L1_27(3)
    Fn_setGrabNpc("hst04", false, true)
    Fn_setGrabNpc("hst05", false, true)
    invokeTask(function()
      local L0_49
      L0_49 = RandI
      L0_49 = L0_49(1, 10)
      wait(L0_49)
      Fn_playMotionNpc("hst04", "surprise_01", false)
      Sound:playSE("w07_933c", 1, "", _npc_tbl.hst04)
      Fn_playMotionNpc("hst04", "stay", false, {isRepeat = true})
    end)
    invokeTask(function()
      local L0_50
      L0_50 = RandI
      L0_50 = L0_50(1, 30)
      wait(L0_50)
      Fn_playMotionNpc("hst05", "shock_in_00", false)
      Fn_playMotionNpc("hst05", "shock_out_00", false)
      Sound:playSE("w03_933c", 1, "", _npc_tbl.hst05)
      Fn_playMotionNpc("hst05", "stay", false, {isRepeat = true})
    end)
    if _sender3 == "player" then
      hostageGrabTask("hst04")
      hostageGrabTask("hst05")
    end
  end
  L2_28(L3_29, L4_30, L5_31)
  L4_30 = "judge"
  function L5_31(A0_51, A1_52, A2_53, A3_54)
    print("judge:" .. A1_52 .. "=" .. A2_53)
    if A3_54:getName() ~= nil then
      print("sender:" .. A3_54:getName())
      _sender3 = A3_54:getName()
    end
    return 2
  end
  L2_28(L3_29, L4_30, L5_31)
end
function grab_tutorial()
  Fn_naviKill()
  invokeTask(function()
    waitSeconds(2)
    Fn_captionViewWait("ep10_00109")
    HUD:info("ep10_info_02", true, 5)
    Fn_missionViewWait("ep10_00110")
  end)
end
function hostageGrabTask(A0_55)
  local L1_56
  L1_56 = print
  L1_56("\228\186\186\232\179\170" .. A0_55 .. "\227\129\174\230\149\145\229\135\186\227\130\191\227\130\185\227\130\175\232\181\183\229\139\149")
  L1_56 = false
  _grab_task[A0_55] = invokeTask(function()
    _npc_tbl[A0_55]:setEventListener("npcFall", fallHostage)
    _mnavi[A0_55]:setActive(true)
    while true do
      if _hostage_rescue_check_tbl[A0_55] == true then
        print("\228\186\186\232\179\170" .. A0_55 .. "\227\129\174\230\149\145\229\135\186\229\174\140\228\186\134")
        _grab_caption_flag[A0_55] = false
        _ship_navi_flag[A0_55] = false
        _mnavi[A0_55]:setActive(false)
        _mnavi[A0_55]:del()
        _reaction_stop_flag[A0_55] = true
        Fn_pcSensorOff(A0_55 .. "_sensor")
        if _ship_navi_flag.hst01 == false and _ship_navi_flag.hst02 == false and _ship_navi_flag.hst03 == false and _ship_navi_flag.hst04 == false and _ship_navi_flag.hst05 == false then
          print("\232\135\170\229\136\134\228\187\165\229\164\150\227\129\174\232\170\176\227\130\130\230\142\161\230\142\152\232\136\185\227\129\184\227\129\174\227\131\138\227\131\147\227\129\174\232\161\168\231\164\186\229\135\166\231\144\134\227\130\146\232\161\140\227\129\163\227\129\166\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\161\168\231\164\186\228\184\173\227\129\174\227\131\138\227\131\147\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
          Fn_naviKill()
        end
        _grab_task[A0_55]:abort()
        _grab_task[A0_55] = nil
        break
      elseif _reset_phase == true then
        print("\228\186\186\232\179\170" .. A0_55 .. "\227\129\174\230\149\145\229\135\186\227\130\191\227\130\185\227\130\175\231\160\180\230\163\132")
        _grab_caption_flag[A0_55] = false
        _ship_navi_flag[A0_55] = false
        _mnavi[A0_55]:setActive(false)
        Fn_naviKill()
        _grab_task[A0_55]:abort()
        _grab_task[A0_55] = nil
        break
      elseif L1_56 == false then
        if _npc_tbl[A0_55]:isGrabbed() and not _brain_crow:isGrabOwner(_puppet_tbl[A0_55]) then
          print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\228\186\186\232\179\170\227\130\146\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\239\188\136\231\155\174\231\154\132\229\156\176\227\130\146\230\142\161\230\142\152\232\136\185\227\129\171\229\164\137\230\155\180\239\188\137")
          _grab_execution_flag[A0_55] = true
          L1_56 = true
          _grab_caption_flag[A0_55] = false
          _mnavi[A0_55]:setActive(false)
          _reaction_stop_flag[A0_55] = true
          Fn_pcSensorOff(A0_55 .. "_sensor")
          if _kaiwa_111k_flag == false then
            print("\228\188\154\232\169\177\227\131\135\227\131\162\239\188\154\227\130\175\227\131\173\227\130\166\227\130\130\227\130\136\227\130\141\227\129\151\227\129\143 \227\130\146\229\134\141\231\148\159")
            _kaiwa_111k_flag = true
            waitSeconds(1)
            Fn_kaiwaDemoView("ep10_00111k")
          end
          for _FORV_4_, _FORV_5_ in pairs(_puppet_tbl) do
            if A0_55 ~= _FORV_4_ and _ship_navi_flag[_FORV_4_] == true then
              print("\228\187\150\227\129\174\228\186\186\232\179\170\227\129\174\229\135\166\231\144\134\227\129\167\230\142\161\230\142\152\232\136\185\227\129\184\227\129\174\227\131\138\227\131\147\227\130\146\232\161\168\231\164\186\228\184\173\227\129\174\231\130\186\227\128\129\227\131\149\227\131\169\227\130\176\227\129\174\227\129\191\232\168\173\229\174\154")
              _ship_navi_flag[A0_55] = true
              break
            end
          end
          if _ship_navi_flag[A0_55] == false then
            print("\232\135\170\229\136\134\228\187\165\229\164\150\227\129\174\232\170\176\227\130\130\230\142\161\230\142\152\232\136\185\227\129\184\227\129\174\227\131\138\227\131\147\227\129\174\232\161\168\231\164\186\229\135\166\231\144\134\227\130\146\232\161\140\227\129\163\227\129\166\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\230\142\161\230\142\152\232\136\185\227\129\184\227\129\174\227\131\138\227\131\147\227\130\146\232\161\168\231\164\186")
            _ship_navi_flag[A0_55] = true
            Fn_naviSet(findGameObject2("Node", "locator2_navi_05"))
            Fn_captionView("ep10_00124")
          end
          if _grab_caption_flag.hst01 == false and _grab_caption_flag.hst02 == false and _grab_caption_flag.hst03 == false and _grab_caption_flag.hst04 == false and _grab_caption_flag.hst05 == false then
            print("\232\135\170\229\136\134\228\187\165\229\164\150\227\129\174\232\170\176\227\130\130\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\129\174\232\161\168\231\164\186\229\135\166\231\144\134\227\130\146\232\161\140\227\129\163\227\129\166\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\161\168\231\164\186\228\184\173\227\129\174\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
            Fn_tutorialCaptionKill()
          end
        elseif _grab_caption_flag[A0_55] == false then
          if Fn_getDistanceToPlayer(_puppet_tbl[A0_55]) < 4 and _grab_tutorial == true then
            for _FORV_4_, _FORV_5_ in pairs(_puppet_tbl) do
              if A0_55 ~= _FORV_4_ and _grab_caption_flag[_FORV_4_] == true then
                print("\228\187\150\227\129\174\228\186\186\232\179\170\227\129\174\229\135\166\231\144\134\227\129\167\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\232\161\168\231\164\186\228\184\173\227\129\174\231\130\186\227\128\129\227\131\149\227\131\169\227\130\176\227\129\174\227\129\191\232\168\173\229\174\154")
                _grab_caption_flag[A0_55] = true
                break
              end
            end
            if _grab_caption_flag[A0_55] == false then
              print("\228\186\186\232\179\170\227\129\1744m\228\187\165\229\134\133\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159\227\130\137\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\129\174\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\230\147\141\228\189\156\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\146\232\161\168\231\164\186")
              _grab_caption_flag[A0_55] = true
              Fn_tutorialCaption("grab")
            end
          end
        elseif _grab_caption_flag[A0_55] == true and Fn_getDistanceToPlayer(_puppet_tbl[A0_55]) >= 10 then
          for _FORV_4_, _FORV_5_ in pairs(_puppet_tbl) do
            if A0_55 ~= _FORV_4_ and _grab_caption_flag[_FORV_4_] == true then
              print("\228\187\150\227\129\174\228\186\186\232\179\170\227\129\174\229\135\166\231\144\134\227\129\167\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\130\146\232\161\168\231\164\186\228\184\173\227\129\174\231\130\186\227\128\129\227\131\149\227\131\169\227\130\176\227\129\174\227\129\191\232\167\163\233\153\164")
              _grab_caption_flag[A0_55] = false
              break
            end
          end
          if _grab_caption_flag[A0_55] == true then
            print("\228\186\186\232\179\170\227\129\139\227\130\13710m\228\187\165\228\184\138\233\155\162\227\130\140\227\129\159\227\130\137\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\129\174\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\230\147\141\228\189\156\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
            _grab_caption_flag[A0_55] = false
            Fn_tutorialCaptionKill()
          end
        end
      elseif L1_56 == true and _npc_tbl[A0_55]:isGrabbed() == false and _reset_phase == false then
        print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\228\186\186\232\179\170\227\129\174\227\130\176\227\131\169\227\131\150\227\130\146\232\167\163\233\153\164\227\129\151\227\129\159\239\188\136\231\155\174\231\154\132\229\156\176\227\130\146\228\186\186\232\179\170\227\129\171\229\164\137\230\155\180\239\188\137")
        L1_56 = false
        _ship_navi_flag[A0_55] = false
        _mnavi[A0_55]:setActive(true)
        _reaction_stop_flag[A0_55] = false
        Fn_pcSensorOn(A0_55 .. "_sensor")
        if _ship_navi_flag.hst01 == false and _ship_navi_flag.hst02 == false and _ship_navi_flag.hst03 == false and _ship_navi_flag.hst04 == false and _ship_navi_flag.hst05 == false then
          print("\232\135\170\229\136\134\228\187\165\229\164\150\227\129\174\232\170\176\227\130\130\230\142\161\230\142\152\232\136\185\227\129\184\227\129\174\227\131\138\227\131\147\227\129\174\232\161\168\231\164\186\229\135\166\231\144\134\227\130\146\232\161\140\227\129\163\227\129\166\227\129\132\227\129\170\227\129\139\227\129\163\227\129\159\227\129\174\227\129\167\227\128\129\232\161\168\231\164\186\228\184\173\227\129\174\227\131\138\227\131\147\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
          Fn_naviKill()
        end
      end
      wait()
    end
  end)
end
function fallHostage()
  print("\228\186\186\232\179\170\227\130\146\232\144\189\227\129\168\227\129\151\227\129\166\227\129\151\227\129\190\227\129\163\227\129\159")
  _fallhostage = true
  if _is_in_upside_sensor == false and _reset_phase == false then
    _reset_phase = true
    invokeTask(function()
      while _catwarp do
        wait()
      end
      Fn_userCtrlOff()
      Fn_captionViewWait("ep10_00123")
      Fn_blackout()
      resetPhase()
      Fn_fadein()
      Fn_userCtrlOn()
      _fallhostage = false
    end)
  end
end
function resetPhase()
  local L0_57, L1_58, L2_59, L3_60, L4_61
  L0_57(L1_58)
  for L3_60, L4_61 in L0_57(L1_58) do
    _npc_tbl[L3_60]:setEventListener("npcFall", nil)
  end
  L0_57(L1_58)
  L0_57()
  L0_57(L1_58)
  if L0_57 == 5 then
    if L0_57 > 5 then
      L0_57.hst01 = false
      _hos_cnt = L0_57
    else
      L0_57.hst04 = false
      L0_57.hst05 = false
      _hos_cnt = L0_57
    end
  end
  for L3_60, L4_61 in L0_57(L1_58) do
    if _hostage_rescue_check_tbl[L3_60] == false and not _brain_crow:isGrabOwner(L4_61) then
      Fn_warpNpc(L3_60, "locator2_" .. L3_60 .. "_01")
      Fn_setGrabNpc(L3_60, true, false)
      _reaction_stop_flag[L3_60] = false
      Fn_pcSensorOn(L3_60 .. "_sensor")
      _grab_execution_flag[L3_60] = false
    end
  end
  _reset_phase = false
  if L0_57 == false then
    if not L0_57 then
      L0_57(L1_58)
      L0_57(L1_58)
    end
  end
  if L0_57 == false then
    if L0_57 == false then
      if L0_57 then
      elseif not L0_57 then
        L0_57(L1_58)
        L0_57(L1_58)
      end
    end
  elseif L0_57 == true then
    if L0_57 == false then
      L3_60 = true
      L0_57(L1_58, L2_59, L3_60)
      L0_57(L1_58)
    end
  elseif L0_57 == false then
    if L0_57 == true then
      L3_60 = true
      L0_57(L1_58, L2_59, L3_60)
      L0_57(L1_58)
    end
  end
  if L0_57 == false then
    if L0_57 == false then
      if L0_57 then
      elseif not L0_57 then
        L0_57(L1_58)
        L0_57(L1_58)
      end
    end
  elseif L0_57 == true then
    if L0_57 == false then
      L3_60 = true
      L0_57(L1_58, L2_59, L3_60)
      L0_57(L1_58)
    end
  elseif L0_57 == false then
    if L0_57 == true then
      L3_60 = true
      L0_57(L1_58, L2_59, L3_60)
      L0_57(L1_58)
    end
  end
  L0_57(L1_58)
end
function pccubesensor2_upside_OnEnter()
  local L0_62, L1_63
  L0_62 = _catwarp
  if L0_62 then
    return
  end
  L0_62 = _is_playing_sdemo_cut03
  if L0_62 then
    L0_62 = findGameObject2
    L1_63 = "Node"
    L0_62 = L0_62(L1_63, "locator2_viewpoint_02")
    L1_63 = L0_62
    L0_62 = L0_62.getWorldTransform
    L1_63 = L0_62(L1_63)
    invokeTask(function()
      while HUD:faderAlpha() ~= 1 do
        wait()
      end
      Fn_setPcPosRot(L0_62, L1_63, Player.kReset_Floating)
      print("\228\189\141\231\189\174\232\170\191\230\149\180")
    end)
    return
  else
  end
  _is_in_upside_sensor = true
  L0_62 = print
  L1_63 = "\228\184\139\229\177\164\227\129\174\229\133\168\227\129\166\227\129\174\228\186\186\232\179\170\227\129\174\230\149\145\229\138\169\229\174\140\228\186\134\229\137\141\227\129\171\228\184\138\229\177\164\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159"
  L0_62(L1_63)
  L0_62 = detectedBySoldier
  L0_62()
end
function detectedBySoldier(A0_64)
  if A0_64 == nil then
    print("\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136\229\135\166\231\144\134\227\130\146\229\174\159\232\161\140\233\150\139\229\167\139")
  else
    print("\229\183\161\229\155\158\228\184\173\227\129\174\229\133\181\229\163\171\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
    print("\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\231\153\186\232\166\139\227\129\151\227\129\159\229\133\181\229\163\171\239\188\154" .. A0_64)
  end
  if _reset_phase == false then
    _reset_phase = true
    if _catwarp == false then
      invokeTask(function()
        local L0_65, L1_66, L2_67, L3_68, L4_69, L5_70, L6_71
        L0_65 = CautionLevel
        L0_65 = L0_65.setKeepVisible
        L1_66 = false
        L0_65(L1_66)
        L0_65 = CautionLevel
        L0_65 = L0_65.allTerminate
        L0_65()
        L0_65 = _mechskytask
        L1_66 = L0_65
        L0_65 = L0_65.abort
        L0_65(L1_66)
        L0_65 = Fn_findAreaHandle
        L1_66 = "go_a_root"
        L0_65 = L0_65(L1_66)
        L1_66 = Sound
        L2_67 = L1_66
        L1_66 = L1_66.playSEHandle
        L6_71 = L0_65
        L1_66 = L1_66(L2_67, L3_68, L4_69, L5_70, L6_71)
        _se_handle = L1_66
        L1_66 = _restart_warship
        if L1_66 == false then
          L1_66 = Fn_captionView
          L2_67 = "ep10_00120"
          L1_66(L2_67)
        else
          L1_66 = Fn_captionView
          L2_67 = "ic_warship_00100"
          L1_66(L2_67)
          _restart_warship = false
        end
        L1_66 = Player
        L2_67 = L1_66
        L1_66 = L1_66.setStay
        L1_66(L2_67, L3_68, L4_69)
        L1_66 = setPlayerIdle
        L1_66()
        L1_66 = Fn_userCtrlAllOff
        L1_66()
        L1_66 = Fn_findNpcPuppet
        L2_67 = A0_64
        L1_66 = L1_66(L2_67)
        L2_67 = Fn_lookAtObject
        L2_67 = L2_67(L3_68)
        if L3_68 ~= nil then
          L3_68(L4_69)
        end
        L3_68(L4_69)
        L3_68(L4_69)
        L3_68()
        L3_68(L4_69)
        L3_68()
        for L6_71 = 1, #L4_69 do
          if _npcTable[L6_71].npc:isEnemy() then
            _npcTable[L6_71].npc:changeNpc()
          end
          if _npcTable[L6_71].status == NPC_STATUS.DEAD then
            Fn_disappearNpc(_npcTable[L6_71].npcName)
            Fn_setupNpc({
              {
                name = _npcTable[L6_71].npcName,
                type = "soldier",
                node = string.format("locator2_event_soldier_%02d_01", L6_71),
                start = true
              }
            })
          end
          Fn_warpNpc(_npcTable[L6_71].npcName, string.format("locator2_event_soldier_%02d_01", L6_71))
        end
        L3_68()
        if L3_68 then
          L3_68(L4_69, L5_70)
          _se_handle = nil
        end
        L3_68()
        L3_68()
        L3_68()
        L3_68(L4_69, L5_70)
        L3_68()
        L3_68()
        _is_in_upside_sensor = false
      end)
    end
  end
end
function ep10a_sdemo_cut01_start()
  local L0_72, L1_73
  L0_72 = findGameObject2
  L1_73 = "Node"
  L0_72 = L0_72(L1_73, "locator2_cam_01")
  L1_73 = findGameObject2
  L1_73 = L1_73("Node", "locator2_aim_01")
  _sdemo_cut01:set(L0_72, L1_73)
  _sdemo_cut01:play()
  wait()
end
function ep10a_sdemo_cut01_half_start()
  local L0_74, L1_75, L2_76, L3_77
  L0_74 = findGameObject2
  L1_75 = "Node"
  L2_76 = "locator2_cam_01"
  L0_74 = L0_74(L1_75, L2_76)
  L1_75 = findGameObject2
  L2_76 = "Node"
  L3_77 = "locator2_aim_01"
  L1_75 = L1_75(L2_76, L3_77)
  L2_76 = _sdemo_cut01
  L3_77 = L2_76
  L2_76 = L2_76.set
  L2_76(L3_77, L0_74, L1_75)
  L2_76 = _ship_ctrl
  L3_77 = L2_76
  L2_76 = L2_76.setMoveParam
  L2_76(L3_77, {velocity = 10, move_wait = false})
  L2_76 = _ship_ctrl
  L3_77 = L2_76
  L2_76 = L2_76.move
  L2_76(L3_77, "locator2_demo_crane_ship_pos1")
  L2_76 = {L3_77}
  L3_77 = {}
  L3_77.pos = "locator2_cam_02"
  L3_77.time = 24
  L3_77.hashfunc = "Linear"
  L3_77 = {
    {
      pos = "locator2_aim_02",
      time = 6
    }
  }
  _sdemo_cut01:play(L2_76, L3_77)
  wait()
  waitSeconds(5)
end
function ep10a_sdemo_cut02_start()
  local L0_78, L1_79, L2_80, L3_81
  L0_78 = findGameObject2
  L1_79 = "Node"
  L2_80 = "locator2_cam_04"
  L0_78 = L0_78(L1_79, L2_80)
  L1_79 = findGameObject2
  L2_80 = "Node"
  L3_81 = "locator2_aim_03"
  L1_79 = L1_79(L2_80, L3_81)
  L2_80 = _sdemo_cut02
  L3_81 = L2_80
  L2_80 = L2_80.set
  L2_80(L3_81, L0_78, L1_79, true)
  L2_80 = Fn_blackout
  L3_81 = 0.8
  L2_80(L3_81)
  L2_80 = _ship_ctrl
  L3_81 = L2_80
  L2_80 = L2_80.stop
  L2_80(L3_81)
  L2_80 = _ship_ctrl
  L3_81 = L2_80
  L2_80 = L2_80.warp
  L2_80(L3_81, "locator2_crane_ship_pos")
  L2_80 = wait
  L2_80()
  L2_80 = _sdemo_cut02
  L3_81 = L2_80
  L2_80 = L2_80.play
  L2_80(L3_81)
  L2_80 = wait
  L2_80()
  L2_80 = _sdemo_cut01
  L3_81 = L2_80
  L2_80 = L2_80.stop
  L2_80(L3_81, 0)
  _sdemo_cut01 = nil
  L2_80 = {L3_81}
  L3_81 = {}
  L3_81.pos = "locator2_cam_05"
  L3_81.time = 9
  L3_81.hashfunc = "Linear"
  L3_81 = {
    {
      pos = "locator2_aim_05",
      time = 9
    }
  }
  Fn_fadein(0.8)
  _sdemo_cut02:play(L2_80, L3_81)
  waitSeconds(6.5)
end
function ep10a_sdemo_cut02_end()
  _sdemo_cut02:stop(1)
  Camera:lookTo(findGameObject2("Node", "locator2_aim_reset"):getWorldPos(), 0, 1)
end
function supporterNpc_crow_setup()
  _puppet_crow = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Ground)
  _brain_crow = _puppet_crow:getBrain()
  _brain_crow:setIdling(true)
  _brain_crow:lockToWarp(findGameObject2("Node", "locator2_crow_kdemo"))
  _brain_crow:setAbility(Supporter.Ability.ActionInAir, false)
  _brain_crow:setDetectThreatDistance(0)
  wait()
end
function setupMechSkyTask()
  _mechskytask = invokeTask(function()
    local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87
    L0_82 = {}
    L1_83 = findGameObject2
    L1_83 = L1_83(L2_84, L3_85)
    for L5_87 = 1, 16 do
      L0_82[L5_87] = findGameObject2("EnemyBrain", "mechsky" .. string.format("%02d", L5_87))
      repeat
        wait()
      until L0_82[L5_87]:isReadyEnemy()
    end
    for L5_87, _FORV_6_ in L2_84(L3_85) do
      _FORV_6_:setEnableHomingTarget(false)
      _FORV_6_:setVisibleEnemyMarker(false)
    end
    L2_84.loop = true
    L5_87 = {
      "locator2_mechsky_01_move01",
      "locator2_mechsky_01_move02",
      "locator2_mechsky_01_move03",
      "locator2_mechsky_01_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_02_move01",
      "locator2_mechsky_02_move02",
      "locator2_mechsky_02_move03",
      "locator2_mechsky_02_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_03_move01",
      "locator2_mechsky_03_move02",
      "locator2_mechsky_03_move03",
      "locator2_mechsky_03_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_04_move01",
      "locator2_mechsky_04_move02",
      "locator2_mechsky_04_move03",
      "locator2_mechsky_04_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_05_move01",
      "locator2_mechsky_05_move02",
      "locator2_mechsky_05_move03",
      "locator2_mechsky_05_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_07_move01",
      "locator2_mechsky_07_move02",
      "locator2_mechsky_07_move03",
      "locator2_mechsky_07_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_08_move01",
      "locator2_mechsky_08_move02",
      "locator2_mechsky_08_move03",
      "locator2_mechsky_08_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_10_move01",
      "locator2_mechsky_10_move02",
      "locator2_mechsky_10_move03",
      "locator2_mechsky_10_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_11_move01",
      "locator2_mechsky_11_move02",
      "locator2_mechsky_11_move03",
      "locator2_mechsky_11_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_12_move01",
      "locator2_mechsky_12_move02",
      "locator2_mechsky_12_move03",
      "locator2_mechsky_12_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_13_move01",
      "locator2_mechsky_13_move02",
      "locator2_mechsky_13_move03",
      "locator2_mechsky_13_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_15_move01",
      "locator2_mechsky_15_move02",
      "locator2_mechsky_15_move03",
      "locator2_mechsky_15_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
    L5_87 = {
      "locator2_mechsky_16_move01",
      "locator2_mechsky_16_move02",
      "locator2_mechsky_16_move03",
      "locator2_mechsky_16_move04"
    }
    L3_85(L4_86, L5_87, L2_84)
  end)
end
function npcInit()
  local L0_88, L1_89, L2_90, L3_91, L4_92, L5_93, L6_94
  L0_88 = 2
  L1_89 = {}
  for L5_93 = 1, L0_88 do
    L6_94 = string
    L6_94 = L6_94.format
    L6_94 = L6_94("npcgen2_event_soldier_%02d", L5_93)
    table.insert(L1_89, L6_94)
  end
  L4_92.pos = "locator2_event_soldier_01_01"
  L4_92.opt = nil
  L5_93.pos = "locator2_event_soldier_01_02"
  L5_93.opt = nil
  L5_93.pos = "locator2_event_soldier_02_01"
  L5_93.opt = nil
  L6_94 = {}
  L6_94.pos = "locator2_event_soldier_02_02"
  L6_94.opt = nil
  for L6_94 = 1, L0_88 do
    if _soldierInstance[L6_94] ~= nil and _soldierInstance[L6_94].task ~= nil then
      _soldierInstance[L6_94].task:abort()
      _soldierInstance[L6_94].task = nil
    end
    _soldierInstance[L6_94] = PerceivableNpc.new(L1_89[L6_94])
    _soldierInstance[L6_94]:setPosList(L2_90[L6_94])
    _soldierInstance[L6_94]:setMoveOption(_move_option_soldier_normal)
    _soldierInstance[L6_94]:setLoop(true)
    _soldierInstance[L6_94]:setChaseMoveOption(_move_option_soldier_alert)
    if _downward_cage_area == true then
      _soldierInstance[L6_94]:setSightParam(_NPC_SIGHT_DEG, _NPC_SIGHT_LEN)
    else
      _soldierInstance[L6_94]:setSightParam(0, 0)
    end
    _soldierInstance[L6_94]:setAlertRange(3)
    _soldierInstance[L6_94]:setCautionCoefficient(_NPC_CAUTION_INC, _NPC_CAUTION_DEC)
    _soldierInstance[L6_94]:setOnChangeState(soldierAction)
    _soldierInstance[L6_94]:setCombatReady(true)
    _soldierInstance[L6_94]:setCombatTimeEnable(true)
    _soldierInstance[L6_94]:setCombatTime(2)
    _soldierInstance[L6_94]:setIndicationEnable(true)
    _soldierInstance[L6_94]:setIndicationRange(10)
    _soldierInstance[L6_94]:setIndicationCoefficient(15, 3)
    _soldierInstance[L6_94]:setDismissMotion("stay")
    _soldierInstance[L6_94]:action()
    Fn_findNpc(L1_89[L6_94]):enableHomingTarget(true)
    Fn_findNpc(L1_89[L6_94]):setDamage(false)
    Fn_findNpc(L1_89[L6_94]):getBrain():setInvincibility(true)
    _npcTable[L6_94] = _soldierInstance[L6_94]
  end
  L3_91(L4_92)
  L3_91(L4_92)
  L3_91()
  L3_91(L4_92)
end
function backstairs_gossip()
  invokeTask(function()
    local L0_95, L1_96, L2_97, L3_98, L4_99, L5_100, L6_101
    L0_95 = {L1_96, L2_97}
    L1_96 = "locator2_ryz_01"
    L2_97 = "locator2_ryz_02"
    L1_96 = Fn_moveNpc
    L2_97 = "ryz01"
    L3_98 = L0_95
    L4_99 = {}
    L4_99.anim_walk_speed = 1
    L4_99.arrivedLength = 0.5
    L4_99.navimesh = false
    L1_96 = L1_96(L2_97, L3_98, L4_99)
    while true do
      L3_98 = L1_96
      L2_97 = L1_96.isRunning
      L2_97 = L2_97(L3_98)
      if L2_97 then
        L2_97 = wait
        L2_97()
      end
    end
    L2_97 = wait
    L2_97()
    L2_97 = {
      L3_98,
      [5] = L4_99(L5_100)
    }
    L3_98 = Fn_findNpc
    L4_99 = "ryz01"
    L3_98 = L3_98(L4_99)
    L4_99 = Fn_findNpc
    L5_100 = "adv01"
    L5_100 = L4_99(L5_100)
    ;({
      L3_98,
      [5] = L4_99(L5_100)
    })[2] = L4_99
    ;({
      L3_98,
      [5] = L4_99(L5_100)
    })[3] = L5_100
    ;({
      L3_98,
      [5] = L4_99(L5_100)
    })[4] = L6_101
    L3_98 = {L4_99, L5_100}
    L4_99 = "locator2_advance_kdemo"
    L5_100 = "locator2_ryz_02"
    L4_99 = Vector
    L5_100 = 0
    L4_99 = L4_99(L5_100, L6_101, 0)
    L5_100 = {
      L6_101,
      false,
      false
    }
    for _FORV_9_ = 1, 2 do
      if L2_97[_FORV_9_] ~= nil then
        L4_99 = L3_98[_FORV_9_]
        if L3_98[_FORV_9_] == nil then
          L4_99 = Player:getPuppet()
        end
        L2_97[_FORV_9_]:turn(L4_99)
      end
      print("turnnpc = " .. L2_97[_FORV_9_]:getName())
      print("target = " .. L3_98[_FORV_9_])
    end
    while true do
      for _FORV_9_ = 1, 2 do
        if L2_97[_FORV_9_]:isRunning() and L2_97[_FORV_9_]:getBrain() and L2_97[_FORV_9_]:getBrain():isStopped() == false and L2_97[_FORV_9_]:isTurnEnd() then
          L5_100[_FORV_9_] = true
        end
      end
      if L6_101 ~= true then
        L6_101()
      end
    end
    L6_101.isRepeat = true
    L6_101.isRandom = true
    Fn_playMotionNpc("phi01", "phi01_idle_00", false, L6_101)
    Fn_playMotionNpc("adv01", "talk_03", false, L6_101)
    Fn_playMotionNpc("ryz01", "talk_00", false, L6_101)
  end)
end
function pccubesensor2_hostage_a_near_OnEnter(A0_102)
  if _catwarp == true or _is_in_upside_sensor == true or _reset_phase == true then
    return
  end
  _downward_cage_area = true
  _is_playing_sdemo_cut03 = true
  Fn_pcSensorOff(A0_102)
  Fn_naviKill()
  invokeTask(function()
    Player:setStay(true, false)
    Fn_blackout()
    Fn_captionViewEnd()
    if _debug_sdemo_skip == false then
      ep10a_sdemo_cut03()
    elseif _debug_sdemo_skip == true then
      print("///\227\131\135\227\131\144\227\131\131\227\130\176\230\169\159\232\131\189\227\129\168\227\129\151\227\129\166\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\131\135\227\131\162\227\130\146OFF\227\129\171\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153\227\128\130\227\130\181\227\131\150\227\131\159\227\131\131\227\131\136\227\129\153\227\130\139\233\154\155\227\129\171\227\129\175\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\131\135\227\131\162\227\129\140\229\174\159\232\161\140\227\129\149\227\130\140\227\130\139\231\138\182\230\133\139\227\129\171\230\136\187\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\239\188\129\239\188\129\239\188\129///")
    end
    Fn_fadein()
    Fn_userCtrlOn()
    Player:setStay(false)
    _is_playing_sdemo_cut03 = false
    for _FORV_3_ = 1, #_npcTable do
      _npcTable[_FORV_3_]:setSightParam(_NPC_SIGHT_DEG, _NPC_SIGHT_LEN)
    end
  end)
end
function ep10a_sdemo_cut03()
  local L0_103, L1_104, L2_105, L3_106
  L0_103 = findGameObject2
  L1_104 = "Node"
  L2_105 = "locator2_sdemo_cam_01"
  L0_103 = L0_103(L1_104, L2_105)
  L1_104 = findGameObject2
  L2_105 = "Node"
  L3_106 = "locator2_vctrl_01"
  L1_104 = L1_104(L2_105, L3_106)
  L2_105 = _sdemo_cut03
  L3_106 = L2_105
  L2_105 = L2_105.set
  L2_105(L3_106, L0_103, L1_104)
  L2_105 = Fn_setKittenAndCatActive
  L3_106 = false
  L2_105(L3_106)
  L2_105 = Fn_setRavenActive
  L3_106 = false
  L2_105(L3_106)
  L2_105 = _puppet_crow
  L3_106 = L2_105
  L2_105 = L2_105.setVisible
  L2_105(L3_106, false)
  L2_105 = {L3_106}
  L3_106 = {}
  L3_106.pos = "locator2_sdemo_cam_01"
  L3_106.time = 10
  L3_106 = {
    {
      pos = "locator2_vctrl_02",
      time = 10
    }
  }
  _sdemo_cut03:play(L2_105, L3_106)
  wait()
  CautionLevel.setKeepVisible(false)
  Fn_fadein()
  waitSeconds(2)
  Fn_captionView("ep10_00112")
  waitSeconds(6)
  Fn_captionViewWait("ep10_00125")
  wait()
  waitSeconds(1)
  Fn_blackout()
  Fn_setKittenAndCatActive(true)
  Fn_setRavenActive(true)
  _puppet_crow:setVisible(true)
  CautionLevel.setKeepVisible(true)
  _sdemo_cut03:stop(0)
end
function pccubesensor2_cage_1_OnEnter()
  if _kaiwa_111k_flag == false then
    _access_cage.cage1 = true
  end
  if _sensor_on_enter == false then
    print("\228\186\186\232\179\170\227\129\174\227\129\132\227\130\139\230\170\187\227\129\171\229\136\157\227\130\129\227\129\166\232\191\145\227\129\165\227\129\132\227\129\159")
    _sensor_on_enter = true
    rescueHostageTutorial(1)
  end
end
function pccubesensor2_cage_2_OnEnter()
  if _kaiwa_111k_flag == false then
    _access_cage.cage2 = true
  end
  if _sensor_on_enter == false then
    print("\228\186\186\232\179\170\227\129\174\227\129\132\227\130\139\230\170\187\227\129\171\229\136\157\227\130\129\227\129\166\232\191\145\227\129\165\227\129\132\227\129\159")
    _sensor_on_enter = true
    rescueHostageTutorial(2)
  end
end
function pccubesensor2_cage_3_OnEnter()
  if _kaiwa_111k_flag == false then
    _access_cage.cage3 = true
  end
  if _sensor_on_enter == false then
    print("\228\186\186\232\179\170\227\129\174\227\129\132\227\130\139\230\170\187\227\129\171\229\136\157\227\130\129\227\129\166\232\191\145\227\129\165\227\129\132\227\129\159")
    _sensor_on_enter = true
    rescueHostageTutorial(3)
  end
end
function rescueHostageTutorial(A0_107)
  print("\230\170\187\231\160\180\229\163\138\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\146\232\181\183\229\139\149")
  _cage_destruction_tutorial_task = invokeTask(function()
    local L0_108, L1_109
    L0_108 = "locator2_navi_0"
    L1_109 = A0_107
    L0_108 = L0_108 .. L1_109
    L1_109 = findGameObject2
    L1_109 = L1_109("Node", L0_108)
    while Fn_isInSightTarget(L1_109, 0.7) ~= true do
      wait()
    end
    Fn_lookAtObject(L1_109, 1):abort()
    Fn_captionViewWait("ep10_00107")
    Fn_missionView("ep10_00108")
    Fn_naviSet(findGameObject2("Node", L0_108))
    for _FORV_6_ = 1, 20 do
      _cage_hdl[_FORV_6_]:setLockonPermission(true)
      _cage_hdl_org[_FORV_6_]:setLockonPermission(true)
    end
  end)
end
function hst01_sensor_OnEnter()
  if _reaction_stop_flag.hst01 == false then
    print("\228\186\186\232\179\1701\227\129\140\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\131\170\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179")
    _npc_tbl.hst01:turn(Player:getPuppet())
    Fn_playMotionNpc("hst01", "wavehand_far_00", false)
    Sound:playSE("m05_901b", 1, "", _npc_tbl.hst01)
    Fn_playMotionNpc("hst01", "stay", false, {isRepeat = true})
  end
end
function hst02_sensor_OnEnter()
  if _reaction_stop_flag.hst02 == false then
    print("\228\186\186\232\179\1702\227\129\140\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\131\170\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179")
    _npc_tbl.hst02:turn(Player:getPuppet())
    Fn_playMotionNpc("hst02", "greeting", false)
    Sound:playSE("m08_901b", 1, "", _npc_tbl.hst02)
    Fn_playMotionNpc("hst02", "stay", false, {isRepeat = true})
  end
end
function hst03_sensor_OnEnter()
  if _reaction_stop_flag.hst03 == false then
    print("\228\186\186\232\179\1703\227\129\140\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\131\170\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179")
    _npc_tbl.hst03:turn(Player:getPuppet())
    Fn_playMotionNpc("hst03", "wavehand_00", false)
    Sound:playSE("w09_901b", 1, "", _npc_tbl.hst03)
    Fn_playMotionNpc("hst03", "stay", false, {isRepeat = true})
  end
end
function hst04_sensor_OnEnter()
  if _reaction_stop_flag.hst04 == false then
    print("\228\186\186\232\179\1704\227\129\140\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\131\170\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179")
    _npc_tbl.hst04:turn(Player:getPuppet())
    Fn_playMotionNpc("hst04", "wavehand_near_00", false)
    Sound:playSE("w07_901b", 1, "", _npc_tbl.hst04)
    Fn_playMotionNpc("hst04", "stay", false, {isRepeat = true})
  end
end
function hst05_sensor_OnEnter()
  if _reaction_stop_flag.hst05 == false then
    print("\228\186\186\232\179\1705\227\129\140\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\131\170\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179")
    _npc_tbl.hst05:turn(Player:getPuppet())
    Fn_playMotionNpc("hst05", "wavehand_far_00", false)
    Sound:playSE("w03_901b", 1, "", _npc_tbl.hst05)
    Fn_playMotionNpc("hst05", "stay", false, {isRepeat = true})
  end
end
function pccubesensor2_cage_1_OnLeave(A0_110)
  if _kaiwa_111k_flag == false then
    _access_cage.cage1 = false
    _crow_access_cage_flag = false
  end
  if _npc_tbl.hst01:isGrabbed() then
    if not _brain_crow:isGrabOwner(_puppet_tbl.hst01) then
      Fn_captionView("ep10_00113")
      Sound:playSE("m05_924c", 1, "", _npc_tbl.hst01)
    end
    Fn_pcSensorOff(A0_110)
  end
end
function pccubesensor2_cage_2_OnLeave(A0_111)
  if _kaiwa_111k_flag == false then
    _access_cage.cage2 = false
    _crow_access_cage_flag = false
  end
  if _npc_tbl.hst02:isGrabbed() or _npc_tbl.hst03:isGrabbed() then
    if not _brain_crow:isGrabOwner(_puppet_tbl.hst02) or not _brain_crow:isGrabOwner(_puppet_tbl.hst03) then
      Fn_captionView("ep10_00114")
      Sound:playSE("m08_924c", 1, "", _npc_tbl.hst02)
    end
    Fn_pcSensorOff(A0_111)
  end
end
function pccubesensor2_cage_3_OnLeave(A0_112)
  if _kaiwa_111k_flag == false then
    _access_cage.cage3 = false
    _crow_access_cage_flag = false
  end
  if _npc_tbl.hst04:isGrabbed() or _npc_tbl.hst05:isGrabbed() then
    if not _brain_crow:isGrabOwner(_puppet_tbl.hst04) or not _brain_crow:isGrabOwner(_puppet_tbl.hst05) then
      Fn_captionView("ep10_00115")
      Sound:playSE("w07_924c", 1, "", _npc_tbl.hst04)
    end
    Fn_pcSensorOff(A0_112)
  end
end
function crow_process()
  local L0_113, L1_114, L2_115, L3_116, L4_117, L5_118, L6_119, L7_120, L8_121, L9_122, L10_123, L11_124, L12_125, L13_126, L14_127, L15_128, L16_129, L17_130, L18_131, L19_132, L20_133, L21_134, L22_135, L23_136, L24_137, L25_138, L26_139, L27_140, L28_141, L29_142, L30_143, L31_144, L32_145, L33_146, L34_147, L35_148, L36_149, L37_150, L38_151, L39_152, L40_153, L41_154, L42_155, L43_156, L44_157, L45_158, L46_159
  L0_113 = print
  L1_114 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\130\191\227\130\185\227\130\175\232\181\183\229\139\149"
  L0_113(L1_114)
  L0_113 = _brain_crow
  L1_114 = L0_113
  L0_113 = L0_113.setAbility
  L2_115 = Supporter
  L2_115 = L2_115.Ability
  L2_115 = L2_115.ActionInAir
  L3_116 = true
  L0_113(L1_114, L2_115, L3_116)
  L0_113 = _brain_crow
  L1_114 = L0_113
  L0_113 = L0_113.unlockToWarp
  L0_113(L1_114)
  L0_113 = _puppet_crow
  L1_114 = L0_113
  L0_113 = L0_113.getWorldPos
  L0_113 = L0_113(L1_114)
  L1_114 = findGameObject2
  L2_115 = "Node"
  L3_116 = "locator2_crow_phase0_movepoints_00"
  L1_114 = L1_114(L2_115, L3_116)
  L2_115 = L1_114
  L1_114 = L1_114.getWorldPos
  L1_114 = L1_114(L2_115)
  L2_115 = findGameObject2
  L3_116 = "Node"
  L4_117 = "locator2_crow_phase0_movepoints_01"
  L2_115 = L2_115(L3_116, L4_117)
  L3_116 = L2_115
  L2_115 = L2_115.getWorldPos
  L2_115 = L2_115(L3_116)
  L3_116 = findGameObject2
  L4_117 = "Node"
  L5_118 = "locator2_crow_phase0_movepoints_02"
  L3_116 = L3_116(L4_117, L5_118)
  L4_117 = L3_116
  L3_116 = L3_116.getWorldPos
  L3_116 = L3_116(L4_117)
  L4_117 = findGameObject2
  L5_118 = "Node"
  L6_119 = "locator2_crow_phase0_movepoints_03"
  L4_117 = L4_117(L5_118, L6_119)
  L5_118 = L4_117
  L4_117 = L4_117.getWorldPos
  L4_117 = L4_117(L5_118)
  L5_118 = {
    L6_119,
    L7_120,
    L8_121,
    L9_122,
    L10_123,
    L11_124
  }
  L6_119 = {}
  L6_119.pos = L0_113
  L7_120 = Supporter
  L7_120 = L7_120.MovePoint
  L7_120 = L7_120.Takeoff
  L6_119.action = L7_120
  L6_119.vel = 10
  L7_120 = {}
  L7_120.pos = L0_113
  L8_121 = Supporter
  L8_121 = L8_121.MovePoint
  L8_121 = L8_121.Air
  L7_120.action = L8_121
  L7_120.vel = 10
  L8_121 = {}
  L8_121.pos = L1_114
  L9_122 = Supporter
  L9_122 = L9_122.MovePoint
  L9_122 = L9_122.Air
  L8_121.action = L9_122
  L8_121.vel = 10
  L9_122 = {}
  L9_122.pos = L2_115
  L10_123 = Supporter
  L10_123 = L10_123.MovePoint
  L10_123 = L10_123.Air
  L9_122.action = L10_123
  L9_122.vel = 15
  L10_123 = {}
  L10_123.pos = L3_116
  L11_124 = Supporter
  L11_124 = L11_124.MovePoint
  L11_124 = L11_124.Air
  L10_123.action = L11_124
  L10_123.vel = 15
  L11_124 = {}
  L11_124.pos = L4_117
  L12_125 = Supporter
  L12_125 = L12_125.MovePoint
  L12_125 = L12_125.Air
  L11_124.action = L12_125
  L11_124.vel = 5
  L6_119 = _brain_crow
  L7_120 = L6_119
  L6_119 = L6_119.setMovePoints
  L8_121 = L5_118
  L6_119(L7_120, L8_121)
  L6_119 = _brain_crow
  L7_120 = L6_119
  L6_119 = L6_119.startMovePoint
  L6_119(L7_120)
  L6_119 = print
  L7_120 = "\227\130\175\227\131\173\227\130\166\239\188\154\229\144\132\228\186\186\232\179\170\227\129\140\227\129\132\227\130\139\230\170\187\227\129\174\227\129\130\227\130\139\227\130\168\227\131\170\227\130\162\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139"
  L6_119(L7_120)
  while true do
    while true do
      L6_119 = _brain_crow
      L7_120 = L6_119
      L6_119 = L6_119.isMovePointEnd
      L6_119 = L6_119(L7_120)
      if L6_119 then
        L6_119 = _brain_crow
        L7_120 = L6_119
        L6_119 = L6_119.clearMovePoint
        L6_119(L7_120)
        L6_119 = _brain_crow
        L7_120 = L6_119
        L6_119 = L6_119.setIdling
        L8_121 = true
        L6_119(L7_120, L8_121)
        L6_119 = print
        L7_120 = "\227\130\175\227\131\173\227\130\166\239\188\154\229\144\132\228\186\186\232\179\170\227\129\140\227\129\132\227\130\139\230\170\187\227\129\174\227\129\130\227\130\139\227\130\168\227\131\170\227\130\162\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
        L6_119(L7_120)
        break
      end
      L6_119 = wait
      L6_119()
    end
  end
  while true do
    L6_119 = _downward_cage_area
    if not L6_119 then
      L6_119 = wait
      L6_119()
    end
  end
  L6_119 = print
  L7_120 = "\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\232\191\145\227\129\165\227\129\132\227\129\159\230\170\187\227\129\174\232\191\145\227\129\143\227\129\184\227\129\174\232\191\189\229\176\190\231\167\187\229\139\149\229\135\166\231\144\134\233\150\139\229\167\139"
  L6_119(L7_120)
  L6_119 = findGameObject2
  L7_120 = "Node"
  L8_121 = "locator2_crow_phase1_movepoints_00"
  L6_119 = L6_119(L7_120, L8_121)
  L7_120 = L6_119
  L6_119 = L6_119.getWorldPos
  L6_119 = L6_119(L7_120)
  L7_120 = findGameObject2
  L8_121 = "Node"
  L9_122 = "locator2_crow_temppoints_hst01_00"
  L7_120 = L7_120(L8_121, L9_122)
  L8_121 = L7_120
  L7_120 = L7_120.getWorldPos
  L7_120 = L7_120(L8_121)
  L8_121 = findGameObject2
  L9_122 = "Node"
  L10_123 = "locator2_crow_temppoints_hst02_00"
  L8_121 = L8_121(L9_122, L10_123)
  L9_122 = L8_121
  L8_121 = L8_121.getWorldPos
  L8_121 = L8_121(L9_122)
  L9_122 = findGameObject2
  L10_123 = "Node"
  L11_124 = "locator2_crow_temppoints_hst04_00"
  L9_122 = L9_122(L10_123, L11_124)
  L10_123 = L9_122
  L9_122 = L9_122.getWorldPos
  L9_122 = L9_122(L10_123)
  while true do
    L10_123 = _access_cage
    L10_123 = L10_123.cage1
    if L10_123 == true then
      L10_123 = _crow_access_cage_flag
      if L10_123 == false then
        L10_123 = _crow_now_cage
        L10_123 = L10_123.cage1
        if L10_123 == false then
          L10_123 = print
          L11_124 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\129\132\227\130\139\230\170\187\226\145\160\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139"
          L10_123(L11_124)
          _crow_access_cage_flag = true
          L10_123 = _puppet_crow
          L11_124 = L10_123
          L10_123 = L10_123.getWorldPos
          L10_123 = L10_123(L11_124)
          L0_113 = L10_123
          L10_123 = _brain_crow
          L11_124 = L10_123
          L10_123 = L10_123.addMovePoint
          L12_125 = L0_113
          L13_126 = Supporter
          L13_126 = L13_126.MovePoint
          L13_126 = L13_126.Air
          L14_127 = 15
          L10_123(L11_124, L12_125, L13_126, L14_127)
          L10_123 = _brain_crow
          L11_124 = L10_123
          L10_123 = L10_123.addMovePoint
          L12_125 = L6_119
          L13_126 = Supporter
          L13_126 = L13_126.MovePoint
          L13_126 = L13_126.Air
          L14_127 = 15
          L10_123(L11_124, L12_125, L13_126, L14_127)
          L10_123 = _brain_crow
          L11_124 = L10_123
          L10_123 = L10_123.addMovePoint
          L12_125 = L7_120
          L13_126 = Supporter
          L13_126 = L13_126.MovePoint
          L13_126 = L13_126.Air
          L14_127 = 15
          L10_123(L11_124, L12_125, L13_126, L14_127)
          L10_123 = _brain_crow
          L11_124 = L10_123
          L10_123 = L10_123.startMovePoint
          L10_123(L11_124)
          while true do
            L10_123 = _brain_crow
            L11_124 = L10_123
            L10_123 = L10_123.isMovePointEnd
            L10_123 = L10_123(L11_124)
            if L10_123 then
              L10_123 = _brain_crow
              L11_124 = L10_123
              L10_123 = L10_123.clearMovePoint
              L10_123(L11_124)
              L10_123 = _brain_crow
              L11_124 = L10_123
              L10_123 = L10_123.setIdling
              L12_125 = true
              L10_123(L11_124, L12_125)
              L10_123 = _crow_now_cage
              L10_123.cage1 = true
              L10_123 = _crow_now_cage
              L10_123.cage2 = false
              L10_123 = _crow_now_cage
              L10_123.cage3 = false
              L10_123 = print
              L11_124 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\129\132\227\130\139\230\170\187\226\145\160\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
              L10_123(L11_124)
            else
              L10_123 = wait
              L10_123()
              else
                L10_123 = _access_cage
                L10_123 = L10_123.cage2
                if L10_123 == true then
                  L10_123 = _crow_access_cage_flag
                  if L10_123 == false then
                    L10_123 = _crow_now_cage
                    L10_123 = L10_123.cage2
                    if L10_123 == false then
                      L10_123 = print
                      L11_124 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\129\132\227\130\139\230\170\187\226\145\161\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139"
                      L10_123(L11_124)
                      _crow_access_cage_flag = true
                      L10_123 = _puppet_crow
                      L11_124 = L10_123
                      L10_123 = L10_123.getWorldPos
                      L10_123 = L10_123(L11_124)
                      L0_113 = L10_123
                      L10_123 = _brain_crow
                      L11_124 = L10_123
                      L10_123 = L10_123.addMovePoint
                      L12_125 = L0_113
                      L13_126 = Supporter
                      L13_126 = L13_126.MovePoint
                      L13_126 = L13_126.Air
                      L14_127 = 15
                      L10_123(L11_124, L12_125, L13_126, L14_127)
                      L10_123 = _brain_crow
                      L11_124 = L10_123
                      L10_123 = L10_123.addMovePoint
                      L12_125 = L6_119
                      L13_126 = Supporter
                      L13_126 = L13_126.MovePoint
                      L13_126 = L13_126.Air
                      L14_127 = 15
                      L10_123(L11_124, L12_125, L13_126, L14_127)
                      L10_123 = _brain_crow
                      L11_124 = L10_123
                      L10_123 = L10_123.addMovePoint
                      L12_125 = L8_121
                      L13_126 = Supporter
                      L13_126 = L13_126.MovePoint
                      L13_126 = L13_126.Air
                      L14_127 = 15
                      L10_123(L11_124, L12_125, L13_126, L14_127)
                      L10_123 = _brain_crow
                      L11_124 = L10_123
                      L10_123 = L10_123.startMovePoint
                      L10_123(L11_124)
                      while true do
                        L10_123 = _brain_crow
                        L11_124 = L10_123
                        L10_123 = L10_123.isMovePointEnd
                        L10_123 = L10_123(L11_124)
                        if L10_123 then
                          L10_123 = _brain_crow
                          L11_124 = L10_123
                          L10_123 = L10_123.clearMovePoint
                          L10_123(L11_124)
                          L10_123 = _brain_crow
                          L11_124 = L10_123
                          L10_123 = L10_123.setIdling
                          L12_125 = true
                          L10_123(L11_124, L12_125)
                          L10_123 = _crow_now_cage
                          L10_123.cage1 = false
                          L10_123 = _crow_now_cage
                          L10_123.cage2 = true
                          L10_123 = _crow_now_cage
                          L10_123.cage3 = false
                          L10_123 = print
                          L11_124 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\129\132\227\130\139\230\170\187\226\145\161\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
                          L10_123(L11_124)
                        else
                          L10_123 = wait
                          L10_123()
                          else
                            L10_123 = _access_cage
                            L10_123 = L10_123.cage3
                            if L10_123 == true then
                              L10_123 = _crow_access_cage_flag
                              if L10_123 == false then
                                L10_123 = _crow_now_cage
                                L10_123 = L10_123.cage3
                                if L10_123 == false then
                                  L10_123 = print
                                  L11_124 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\129\132\227\130\139\230\170\187\226\145\162\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139"
                                  L10_123(L11_124)
                                  _crow_access_cage_flag = true
                                  L10_123 = _puppet_crow
                                  L11_124 = L10_123
                                  L10_123 = L10_123.getWorldPos
                                  L10_123 = L10_123(L11_124)
                                  L0_113 = L10_123
                                  L10_123 = _brain_crow
                                  L11_124 = L10_123
                                  L10_123 = L10_123.addMovePoint
                                  L12_125 = L0_113
                                  L13_126 = Supporter
                                  L13_126 = L13_126.MovePoint
                                  L13_126 = L13_126.Air
                                  L14_127 = 15
                                  L10_123(L11_124, L12_125, L13_126, L14_127)
                                  L10_123 = _brain_crow
                                  L11_124 = L10_123
                                  L10_123 = L10_123.addMovePoint
                                  L12_125 = L6_119
                                  L13_126 = Supporter
                                  L13_126 = L13_126.MovePoint
                                  L13_126 = L13_126.Air
                                  L14_127 = 15
                                  L10_123(L11_124, L12_125, L13_126, L14_127)
                                  L10_123 = _brain_crow
                                  L11_124 = L10_123
                                  L10_123 = L10_123.addMovePoint
                                  L12_125 = L9_122
                                  L13_126 = Supporter
                                  L13_126 = L13_126.MovePoint
                                  L13_126 = L13_126.Air
                                  L14_127 = 15
                                  L10_123(L11_124, L12_125, L13_126, L14_127)
                                  L10_123 = _brain_crow
                                  L11_124 = L10_123
                                  L10_123 = L10_123.startMovePoint
                                  L10_123(L11_124)
                                  while true do
                                    L10_123 = _brain_crow
                                    L11_124 = L10_123
                                    L10_123 = L10_123.isMovePointEnd
                                    L10_123 = L10_123(L11_124)
                                    if L10_123 then
                                      L10_123 = _brain_crow
                                      L11_124 = L10_123
                                      L10_123 = L10_123.clearMovePoint
                                      L10_123(L11_124)
                                      L10_123 = _brain_crow
                                      L11_124 = L10_123
                                      L10_123 = L10_123.setIdling
                                      L12_125 = true
                                      L10_123(L11_124, L12_125)
                                      L10_123 = _crow_now_cage
                                      L10_123.cage1 = false
                                      L10_123 = _crow_now_cage
                                      L10_123.cage2 = false
                                      L10_123 = _crow_now_cage
                                      L10_123.cage3 = true
                                      L10_123 = print
                                      L11_124 = "\227\130\175\227\131\173\227\130\166\239\188\154\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\129\132\227\130\139\230\170\187\226\145\162\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
                                      L10_123(L11_124)
                                      break
                                    end
                                    L10_123 = wait
                                    L10_123()
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
              end
            end
          end
        end
      end
    L10_123 = _kaiwa_111k_flag
    if not L10_123 then
      L10_123 = wait
      L10_123()
    end
  end
  L10_123 = print
  L11_124 = "\227\130\175\227\131\173\227\130\166\227\129\174\228\186\186\232\179\170\227\129\174\230\149\145\229\138\169\229\135\166\231\144\134\233\150\139\229\167\139"
  L10_123(L11_124)
  L10_123 = getGrabHostage
  L10_123 = L10_123()
  L11_124 = _puppet_crow
  L12_125 = L11_124
  L11_124 = L11_124.getWorldPos
  L11_124 = L11_124(L12_125)
  L0_113 = L11_124
  L11_124 = {
    L12_125,
    L13_126,
    L14_127,
    L15_128
  }
  L12_125 = {}
  L12_125.pos = L0_113
  L13_126 = Supporter
  L13_126 = L13_126.MovePoint
  L13_126 = L13_126.Air
  L12_125.action = L13_126
  L12_125.vel = 15
  L13_126 = {}
  L13_126.pos = L8_121
  L14_127 = Supporter
  L14_127 = L14_127.MovePoint
  L14_127 = L14_127.Air
  L13_126.action = L14_127
  L13_126.vel = 15
  L14_127 = {}
  L14_127.pos = L6_119
  L15_128 = Supporter
  L15_128 = L15_128.MovePoint
  L15_128 = L15_128.Air
  L14_127.action = L15_128
  L14_127.vel = 15
  L15_128 = {}
  L15_128.pos = L7_120
  L16_129 = Supporter
  L16_129 = L16_129.MovePoint
  L16_129 = L16_129.Air
  L15_128.action = L16_129
  L15_128.vel = 15
  L12_125 = {
    L13_126,
    L14_127,
    L15_128,
    L16_129
  }
  L13_126 = {}
  L13_126.pos = L0_113
  L14_127 = Supporter
  L14_127 = L14_127.MovePoint
  L14_127 = L14_127.Air
  L13_126.action = L14_127
  L13_126.vel = 15
  L14_127 = {}
  L14_127.pos = L9_122
  L15_128 = Supporter
  L15_128 = L15_128.MovePoint
  L15_128 = L15_128.Air
  L14_127.action = L15_128
  L14_127.vel = 15
  L15_128 = {}
  L15_128.pos = L6_119
  L16_129 = Supporter
  L16_129 = L16_129.MovePoint
  L16_129 = L16_129.Air
  L15_128.action = L16_129
  L15_128.vel = 15
  L16_129 = {}
  L16_129.pos = L7_120
  L17_130 = Supporter
  L17_130 = L17_130.MovePoint
  L17_130 = L17_130.Air
  L16_129.action = L17_130
  L16_129.vel = 15
  L13_126 = {
    L14_127,
    L15_128,
    L16_129,
    L17_130
  }
  L14_127 = {}
  L14_127.pos = L0_113
  L15_128 = Supporter
  L15_128 = L15_128.MovePoint
  L15_128 = L15_128.Air
  L14_127.action = L15_128
  L14_127.vel = 15
  L15_128 = {}
  L15_128.pos = L7_120
  L16_129 = Supporter
  L16_129 = L16_129.MovePoint
  L16_129 = L16_129.Air
  L15_128.action = L16_129
  L15_128.vel = 15
  L16_129 = {}
  L16_129.pos = L6_119
  L17_130 = Supporter
  L17_130 = L17_130.MovePoint
  L17_130 = L17_130.Air
  L16_129.action = L17_130
  L16_129.vel = 15
  L17_130 = {}
  L17_130.pos = L9_122
  L18_131 = Supporter
  L18_131 = L18_131.MovePoint
  L18_131 = L18_131.Air
  L17_130.action = L18_131
  L17_130.vel = 15
  L14_127 = nil
  L15_128 = _puppet_tbl
  L15_128 = L15_128.hst01
  if L10_123 == L15_128 then
    L14_127 = L13_126
    L15_128 = _brain_crow
    L16_129 = L15_128
    L15_128 = L15_128.setMovePoints
    L17_130 = L14_127
    L15_128(L16_129, L17_130)
    L15_128 = _brain_crow
    L16_129 = L15_128
    L15_128 = L15_128.startMovePoint
    L15_128(L16_129)
    L15_128 = print
    L16_129 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\163\239\188\136hst04\239\188\137\239\188\134\228\186\186\232\179\170\226\145\164\239\188\136hst05\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139"
    L15_128(L16_129)
  else
    L15_128 = _puppet_tbl
    L15_128 = L15_128.hst02
    if L10_123 ~= L15_128 then
      L15_128 = _puppet_tbl
      L15_128 = L15_128.hst03
    else
      if L10_123 == L15_128 then
        L14_127 = L11_124
        L15_128 = _brain_crow
        L16_129 = L15_128
        L15_128 = L15_128.setMovePoints
        L17_130 = L14_127
        L15_128(L16_129, L17_130)
        L15_128 = _brain_crow
        L16_129 = L15_128
        L15_128 = L15_128.startMovePoint
        L15_128(L16_129)
        L15_128 = print
        L16_129 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\160\239\188\136hst01\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139\239\188\156\228\186\186\232\179\170\226\145\161\239\188\136hst02\239\188\137\239\188\134\228\186\186\232\179\170\226\145\162\239\188\136hst03\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\139\227\130\137\239\188\158"
        L15_128(L16_129)
    end
    else
      L15_128 = _puppet_tbl
      L15_128 = L15_128.hst04
      if L10_123 ~= L15_128 then
        L15_128 = _puppet_tbl
        L15_128 = L15_128.hst05
      elseif L10_123 == L15_128 then
        L14_127 = L12_125
        L15_128 = _brain_crow
        L16_129 = L15_128
        L15_128 = L15_128.setMovePoints
        L17_130 = L14_127
        L15_128(L16_129, L17_130)
        L15_128 = _brain_crow
        L16_129 = L15_128
        L15_128 = L15_128.startMovePoint
        L15_128(L16_129)
        L15_128 = print
        L16_129 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\160\239\188\136hst01\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139\239\188\156\228\186\186\232\179\170\226\145\163\239\188\136hst04\239\188\137\239\188\134\228\186\186\232\179\170\226\145\164\239\188\136hst05\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\139\227\130\137\239\188\158"
        L15_128(L16_129)
      end
    end
  end
  while true do
    L15_128 = _brain_crow
    L16_129 = L15_128
    L15_128 = L15_128.isMovePointEnd
    L15_128 = L15_128(L16_129)
    if L15_128 then
      L15_128 = _brain_crow
      L16_129 = L15_128
      L15_128 = L15_128.clearMovePoint
      L15_128(L16_129)
      L15_128 = _brain_crow
      L16_129 = L15_128
      L15_128 = L15_128.setIdling
      L17_130 = true
      L15_128(L16_129, L17_130)
      L15_128 = print
      L16_129 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\227\129\140\227\129\132\227\130\139\230\170\187\229\137\141\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
      L15_128(L16_129)
      break
    end
    L15_128 = wait
    L15_128()
  end
  L15_128 = _cage_hdl
  L16_129 = kCAGE1
  L15_128 = L15_128[L16_129]
  L16_129 = _cage_hdl
  L17_130 = kCAGE3
  L16_129 = L16_129[L17_130]
  L17_130 = {L18_131}
  L18_131 = {}
  L18_131.pos = L7_120
  L19_132 = Supporter
  L19_132 = L19_132.MovePoint
  L19_132 = L19_132.FallKick
  L18_131.action = L19_132
  L18_131.target = L15_128
  L18_131.vel = 15
  L18_131 = {L19_132}
  L19_132 = {}
  L19_132.pos = L9_122
  L20_133 = Supporter
  L20_133 = L20_133.MovePoint
  L20_133 = L20_133.FallKick
  L19_132.action = L20_133
  L19_132.target = L16_129
  L19_132.vel = 15
  L19_132 = nil
  L20_133 = 1
  L21_134 = 0
  L22_135 = false
  L23_136 = _puppet_tbl
  L23_136 = L23_136.hst01
  if L10_123 == L23_136 then
    L19_132 = L18_131
    L20_133 = kCAGE3
    L23_136 = print
    L24_137 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\163\239\188\136hst04\239\188\137\239\188\134\228\186\186\232\179\170\226\145\164\239\188\136hst05\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\184\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\233\150\139\229\167\139"
    L23_136(L24_137)
  else
    L23_136 = _puppet_tbl
    L23_136 = L23_136.hst02
    if L10_123 ~= L23_136 then
      L23_136 = _puppet_tbl
      L23_136 = L23_136.hst03
      if L10_123 ~= L23_136 then
        L23_136 = _puppet_tbl
        L23_136 = L23_136.hst04
        if L10_123 ~= L23_136 then
          L23_136 = _puppet_tbl
          L23_136 = L23_136.hst05
        end
      end
    elseif L10_123 == L23_136 then
      L19_132 = L17_130
      L20_133 = kCAGE1
      L23_136 = print
      L24_137 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\160\239\188\136hst01\239\188\137\227\129\140\227\129\132\227\130\139\230\170\187\227\129\184\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\233\150\139\229\167\139"
      L23_136(L24_137)
    end
  end
  L23_136 = _brain_crow
  L24_137 = L23_136
  L23_136 = L23_136.setMovePoints
  L25_138 = L19_132
  L23_136(L24_137, L25_138)
  L23_136 = _brain_crow
  L24_137 = L23_136
  L23_136 = L23_136.startMovePoint
  L23_136(L24_137)
  while true do
    L23_136 = _brain_crow
    L24_137 = L23_136
    L23_136 = L23_136.isMovePointEnd
    L23_136 = L23_136(L24_137)
    if L23_136 then
      L23_136 = _brain_crow
      L24_137 = L23_136
      L23_136 = L23_136.clearMovePoint
      L23_136(L24_137)
      L23_136 = _brain_crow
      L24_137 = L23_136
      L23_136 = L23_136.setIdling
      L25_138 = true
      L23_136(L24_137, L25_138)
      L21_134 = L21_134 + 1
      L23_136 = _cage_hdl
      L23_136 = L23_136[L20_133]
      L24_137 = L23_136
      L23_136 = L23_136.getActive
      L23_136 = L23_136(L24_137)
      if L23_136 then
        L23_136 = _cage_hdl
        L23_136 = L23_136[L20_133]
        L24_137 = L23_136
        L23_136 = L23_136.isBroken
        L23_136 = L23_136(L24_137)
        if L23_136 then
          L23_136 = print
          L24_137 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\227\129\140\227\129\132\227\130\139\230\170\187\227\129\174\231\160\180\229\163\138\229\174\140\228\186\134"
          L23_136(L24_137)
          break
        end
      else
        if L21_134 >= 4 then
          if L22_135 == false then
            L23_136 = Fn_getBgsetHandle
            L23_136 = L23_136()
            L25_138 = L23_136
            L24_137 = L23_136.findGameObject2
            L26_139 = "GimmickBg"
            L27_140 = string
            L27_140 = L27_140.format
            L28_141 = "go_jailcage_a_%02d"
            L29_142 = L20_133
            L46_159 = L27_140(L28_141, L29_142)
            L24_137 = L24_137(L25_138, L26_139, L27_140, L28_141, L29_142, L30_143, L31_144, L32_145, L33_146, L34_147, L35_148, L36_149, L37_150, L38_151, L39_152, L40_153, L41_154, L42_155, L43_156, L44_157, L45_158, L46_159, L27_140(L28_141, L29_142))
            L26_139 = L24_137
            L25_138 = L24_137.requestBreak
            L27_140 = _puppet_crow
            L28_141 = L27_140
            L27_140 = L27_140.getWorldPos
            L27_140 = L27_140(L28_141)
            L28_141 = 100
            L25_138(L26_139, L27_140, L28_141)
            L22_135 = true
            L23_136 = nil
          else
            L23_136 = _cage_hdl
            L23_136 = L23_136[L20_133]
            L24_137 = L23_136
            L23_136 = L23_136.requestBreak
            L25_138 = _puppet_crow
            L26_139 = L25_138
            L25_138 = L25_138.getWorldPos
            L25_138 = L25_138(L26_139)
            L26_139 = 100
            L23_136(L24_137, L25_138, L26_139)
          end
        end
        if L22_135 == true then
          L23_136 = _brain_crow
          L24_137 = L23_136
          L23_136 = L23_136.setMovePoints
          L25_138 = L19_132
          L23_136(L24_137, L25_138)
          L23_136 = _brain_crow
          L24_137 = L23_136
          L23_136 = L23_136.startMovePoint
          L23_136(L24_137)
        end
      end
    end
    L23_136 = wait
    L23_136()
  end
  L23_136 = _brain_crow
  L24_137 = L23_136
  L23_136 = L23_136.clearMovePoint
  L23_136(L24_137)
  L23_136 = _brain_crow
  L24_137 = L23_136
  L23_136 = L23_136.setIdling
  L25_138 = true
  L23_136(L24_137, L25_138)
  L23_136 = waitSeconds
  L24_137 = 1
  L23_136(L24_137)
  L23_136 = _puppet_crow
  L24_137 = L23_136
  L23_136 = L23_136.getWorldPos
  L23_136 = L23_136(L24_137)
  L24_137, L25_138 = nil, nil
  L26_139 = kCAGE1
  if L20_133 == L26_139 then
    L26_139 = findGameObject2
    L27_140 = "Node"
    L28_141 = "locator2_crow_temppoints_hst01_02"
    L26_139 = L26_139(L27_140, L28_141)
    L27_140 = L26_139
    L26_139 = L26_139.getWorldPos
    L26_139 = L26_139(L27_140)
    L24_137 = L26_139
    L26_139 = findGameObject2
    L27_140 = "Node"
    L28_141 = "locator2_viewpoint_cage1"
    L26_139 = L26_139(L27_140, L28_141)
    L25_138 = L26_139
  else
    L26_139 = kCAGE3
    if L20_133 == L26_139 then
      L26_139 = findGameObject2
      L27_140 = "Node"
      L28_141 = "locator2_crow_temppoints_hst04_02"
      L26_139 = L26_139(L27_140, L28_141)
      L27_140 = L26_139
      L26_139 = L26_139.getWorldPos
      L26_139 = L26_139(L27_140)
      L24_137 = L26_139
      L26_139 = findGameObject2
      L27_140 = "Node"
      L28_141 = "locator2_viewpoint_cage3"
      L26_139 = L26_139(L27_140, L28_141)
      L25_138 = L26_139
    end
  end
  L26_139 = {
    L27_140,
    L28_141,
    L29_142
  }
  L27_140 = {}
  L27_140.pos = L23_136
  L28_141 = Supporter
  L28_141 = L28_141.MovePoint
  L28_141 = L28_141.Air
  L27_140.action = L28_141
  L27_140.vel = 1
  L28_141 = {}
  L28_141.pos = L24_137
  L29_142 = Supporter
  L29_142 = L29_142.MovePoint
  L29_142 = L29_142.Air
  L28_141.action = L29_142
  L28_141.vel = 1
  L29_142 = {}
  L30_143 = attack_pos
  L29_142.pos = L30_143
  L30_143 = Supporter
  L30_143 = L30_143.MovePoint
  L30_143 = L30_143.Turn
  L29_142.action = L30_143
  L29_142.duraion = 0.25
  L29_142.node_lookat = L25_138
  L27_140 = _brain_crow
  L28_141 = L27_140
  L27_140 = L27_140.setMovePoints
  L29_142 = L26_139
  L27_140(L28_141, L29_142)
  L27_140 = _brain_crow
  L28_141 = L27_140
  L27_140 = L27_140.startMovePoint
  L27_140(L28_141)
  while true do
    L27_140 = _brain_crow
    L28_141 = L27_140
    L27_140 = L27_140.isMovePointEnd
    L27_140 = L27_140(L28_141)
    if L27_140 then
      L27_140 = _brain_crow
      L28_141 = L27_140
      L27_140 = L27_140.clearMovePoint
      L27_140(L28_141)
      L27_140 = _brain_crow
      L28_141 = L27_140
      L27_140 = L27_140.setIdling
      L29_142 = true
      L27_140(L28_141, L29_142)
      L27_140 = print
      L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\227\129\140\227\129\132\227\130\139\230\170\187\229\137\141\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
      L27_140(L28_141)
      break
    end
    L27_140 = wait
    L27_140()
  end
  L27_140 = waitSeconds
  L28_141 = 0.5
  L27_140(L28_141)
  L27_140 = _puppet_tbl
  L27_140 = L27_140.hst01
  if L10_123 == L27_140 then
    L27_140 = Fn_setGrabNpc
    L28_141 = "hst04"
    L29_142 = false
    L30_143 = true
    L27_140(L28_141, L29_142, L30_143)
    L27_140 = Fn_setGrabNpc
    L28_141 = "hst05"
    L29_142 = false
    L30_143 = true
    L27_140(L28_141, L29_142, L30_143)
    L27_140 = _brain_crow
    L28_141 = L27_140
    L27_140 = L27_140.grabObject
    L29_142 = _puppet_tbl
    L29_142 = L29_142.hst04
    L27_140(L28_141, L29_142)
    L27_140 = _brain_crow
    L28_141 = L27_140
    L27_140 = L27_140.grabObject
    L29_142 = _puppet_tbl
    L29_142 = L29_142.hst05
    L27_140(L28_141, L29_142)
    L27_140 = _npc_tbl
    L27_140 = L27_140.hst04
    L28_141 = L27_140
    L27_140 = L27_140.isGrabbed
    L27_140 = L27_140(L28_141)
    if L27_140 == true then
      L27_140 = print
      L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\163\239\188\136hst04\239\188\137\227\129\174\227\130\176\227\131\169\227\131\150\229\174\140\228\186\134"
      L27_140(L28_141)
      L27_140 = _crow_grab_execution_flag
      L27_140.hst04 = true
      L27_140 = _reaction_stop_flag
      L27_140.hst04 = true
      L27_140 = Fn_pcSensorOff
      L28_141 = "hst04_sensor"
      L27_140(L28_141)
      L27_140 = _grab_task
      L27_140 = L27_140.hst04
      if L27_140 ~= nil then
        L27_140 = print
        L28_141 = "\227\130\175\227\131\173\227\130\166\227\129\171\227\130\176\227\131\169\227\131\150\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\227\128\129\228\186\186\232\179\170\226\145\163\239\188\136hst04\239\188\137\227\129\174\230\149\145\229\138\169\229\135\166\231\144\134\227\130\146\229\188\183\229\136\182\231\181\130\228\186\134"
        L27_140(L28_141)
        L27_140 = _npc_tbl
        L27_140 = L27_140.hst04
        L28_141 = L27_140
        L27_140 = L27_140.setEventListener
        L29_142 = "npcFall"
        L30_143 = nil
        L27_140(L28_141, L29_142, L30_143)
        L27_140 = _grab_task
        L27_140 = L27_140.hst04
        L28_141 = L27_140
        L27_140 = L27_140.abort
        L27_140(L28_141)
        L27_140 = _grab_task
        L27_140.hst04 = nil
        L27_140 = _mnavi
        L27_140 = L27_140.hst04
        L28_141 = L27_140
        L27_140 = L27_140.setActive
        L29_142 = false
        L27_140(L28_141, L29_142)
      end
    else
      L27_140 = print
      L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\163\239\188\136hst04\239\188\137\227\129\174\227\130\176\227\131\169\227\131\150\229\164\177\230\149\151"
      L27_140(L28_141)
    end
    L27_140 = _npc_tbl
    L27_140 = L27_140.hst05
    L28_141 = L27_140
    L27_140 = L27_140.isGrabbed
    L27_140 = L27_140(L28_141)
    if L27_140 == true then
      L27_140 = print
      L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\164\239\188\136hst05\239\188\137\227\129\174\227\130\176\227\131\169\227\131\150\229\174\140\228\186\134"
      L27_140(L28_141)
      L27_140 = _crow_grab_execution_flag
      L27_140.hst05 = true
      L27_140 = _reaction_stop_flag
      L27_140.hst05 = true
      L27_140 = Fn_pcSensorOff
      L28_141 = "hst05_sensor"
      L27_140(L28_141)
      L27_140 = _grab_task
      L27_140 = L27_140.hst05
      if L27_140 ~= nil then
        L27_140 = print
        L28_141 = "\227\130\175\227\131\173\227\130\166\227\129\171\227\130\176\227\131\169\227\131\150\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\227\128\129\228\186\186\232\179\170\226\145\164\239\188\136hst05\239\188\137\227\129\174\230\149\145\229\138\169\229\135\166\231\144\134\227\130\146\229\188\183\229\136\182\231\181\130\228\186\134"
        L27_140(L28_141)
        L27_140 = _npc_tbl
        L27_140 = L27_140.hst05
        L28_141 = L27_140
        L27_140 = L27_140.setEventListener
        L29_142 = "npcFall"
        L30_143 = nil
        L27_140(L28_141, L29_142, L30_143)
        L27_140 = _grab_task
        L27_140 = L27_140.hst05
        L28_141 = L27_140
        L27_140 = L27_140.abort
        L27_140(L28_141)
        L27_140 = _grab_task
        L27_140.hst05 = nil
        L27_140 = _mnavi
        L27_140 = L27_140.hst05
        L28_141 = L27_140
        L27_140 = L27_140.setActive
        L29_142 = false
        L27_140(L28_141, L29_142)
      end
    else
      L27_140 = print
      L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\164\239\188\136hst05\239\188\137\227\129\174\227\130\176\227\131\169\227\131\150\229\164\177\230\149\151"
      L27_140(L28_141)
    end
  else
    L27_140 = _puppet_tbl
    L27_140 = L27_140.hst02
    if L10_123 ~= L27_140 then
      L27_140 = _puppet_tbl
      L27_140 = L27_140.hst03
      if L10_123 ~= L27_140 then
        L27_140 = _puppet_tbl
        L27_140 = L27_140.hst04
        if L10_123 ~= L27_140 then
          L27_140 = _puppet_tbl
          L27_140 = L27_140.hst05
        end
      end
    elseif L10_123 == L27_140 then
      L27_140 = Fn_setGrabNpc
      L28_141 = "hst01"
      L29_142 = false
      L30_143 = true
      L27_140(L28_141, L29_142, L30_143)
      L27_140 = _brain_crow
      L28_141 = L27_140
      L27_140 = L27_140.grabObject
      L29_142 = _puppet_tbl
      L29_142 = L29_142.hst01
      L27_140(L28_141, L29_142)
      L27_140 = _npc_tbl
      L27_140 = L27_140.hst01
      L28_141 = L27_140
      L27_140 = L27_140.isGrabbed
      L27_140 = L27_140(L28_141)
      if L27_140 == true then
        L27_140 = print
        L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\160\239\188\136hst01\239\188\137\227\129\174\227\130\176\227\131\169\227\131\150\229\174\140\228\186\134"
        L27_140(L28_141)
        L27_140 = _crow_grab_execution_flag
        L27_140.hst01 = true
        L27_140 = _reaction_stop_flag
        L27_140.hst01 = true
        L27_140 = Fn_pcSensorOff
        L28_141 = "hst01_sensor"
        L27_140(L28_141)
        L27_140 = _grab_task
        L27_140 = L27_140.hst01
        if L27_140 ~= nil then
          L27_140 = print
          L28_141 = "\227\130\175\227\131\173\227\130\166\227\129\171\227\130\176\227\131\169\227\131\150\227\129\149\227\130\140\227\129\159\227\129\174\227\129\167\227\128\129\228\186\186\232\179\170\226\145\160\239\188\136hst01\239\188\137\227\129\174\230\149\145\229\138\169\229\135\166\231\144\134\227\130\146\229\188\183\229\136\182\231\181\130\228\186\134"
          L27_140(L28_141)
          L27_140 = _npc_tbl
          L27_140 = L27_140.hst01
          L28_141 = L27_140
          L27_140 = L27_140.setEventListener
          L29_142 = "npcFall"
          L30_143 = nil
          L27_140(L28_141, L29_142, L30_143)
          L27_140 = _grab_task
          L27_140 = L27_140.hst01
          L28_141 = L27_140
          L27_140 = L27_140.abort
          L27_140(L28_141)
          L27_140 = _grab_task
          L27_140.hst01 = nil
          L27_140 = _mnavi
          L27_140 = L27_140.hst01
          L28_141 = L27_140
          L27_140 = L27_140.setActive
          L29_142 = false
          L27_140(L28_141, L29_142)
        end
      else
        L27_140 = print
        L28_141 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\186\186\232\179\170\226\145\160\239\188\136hst01\239\188\137\227\129\174\227\130\176\227\131\169\227\131\150\229\164\177\230\149\151"
        L27_140(L28_141)
      end
    end
  end
  L27_140 = waitSeconds
  L28_141 = 0.5
  L27_140(L28_141)
  L27_140 = print
  L28_141 = "\227\130\175\227\131\173\227\130\166\227\129\174\229\164\150\227\130\140\230\170\187\227\129\174\229\183\161\229\155\158\229\135\166\231\144\134\233\150\139\229\167\139"
  L27_140(L28_141)
  L27_140 = findGameObject2
  L28_141 = "Node"
  L29_142 = "locator2_crow_phase1_movepoints_04"
  L27_140 = L27_140(L28_141, L29_142)
  L28_141 = L27_140
  L27_140 = L27_140.getWorldPos
  L27_140 = L27_140(L28_141)
  L28_141 = findGameObject2
  L29_142 = "Node"
  L30_143 = "locator2_crow_phase1_movepoints_05"
  L28_141 = L28_141(L29_142, L30_143)
  L29_142 = L28_141
  L28_141 = L28_141.getWorldPos
  L28_141 = L28_141(L29_142)
  L29_142 = findGameObject2
  L30_143 = "Node"
  L31_144 = "locator2_crow_phase1_movepoints_06"
  L29_142 = L29_142(L30_143, L31_144)
  L30_143 = L29_142
  L29_142 = L29_142.getWorldPos
  L29_142 = L29_142(L30_143)
  L30_143 = findGameObject2
  L31_144 = "Node"
  L32_145 = "locator2_crow_phase1_movepoints_07"
  L30_143 = L30_143(L31_144, L32_145)
  L31_144 = L30_143
  L30_143 = L30_143.getWorldPos
  L30_143 = L30_143(L31_144)
  L31_144 = findGameObject2
  L32_145 = "Node"
  L33_146 = "locator2_crow_phase1_movepoints_08"
  L31_144 = L31_144(L32_145, L33_146)
  L32_145 = L31_144
  L31_144 = L31_144.getWorldPos
  L31_144 = L31_144(L32_145)
  L32_145 = findGameObject2
  L33_146 = "Node"
  L34_147 = "locator2_crow_phase1_movepoints_09"
  L32_145 = L32_145(L33_146, L34_147)
  L33_146 = L32_145
  L32_145 = L32_145.getWorldPos
  L32_145 = L32_145(L33_146)
  L33_146 = findGameObject2
  L34_147 = "Node"
  L35_148 = "locator2_crow_phase1_movepoints_10"
  L33_146 = L33_146(L34_147, L35_148)
  L34_147 = L33_146
  L33_146 = L33_146.getWorldPos
  L33_146 = L33_146(L34_147)
  L34_147 = {
    L35_148,
    L36_149,
    L37_150,
    L38_151,
    L39_152,
    L40_153,
    L41_154
  }
  L35_148 = {}
  L35_148.pos = L27_140
  L36_149 = Supporter
  L36_149 = L36_149.MovePoint
  L36_149 = L36_149.Air
  L35_148.action = L36_149
  L35_148.vel = 5
  L36_149 = {}
  L36_149.pos = L28_141
  L36_149.action = L37_150
  L36_149.vel = 5
  L37_150.pos = L29_142
  L37_150.action = L38_151
  L37_150.vel = 5
  L38_151.pos = L30_143
  L38_151.action = L39_152
  L38_151.vel = 5
  L39_152.pos = L31_144
  L40_153 = Supporter
  L40_153 = L40_153.MovePoint
  L40_153 = L40_153.Air
  L39_152.action = L40_153
  L39_152.vel = 5
  L40_153 = {}
  L40_153.pos = L32_145
  L41_154 = Supporter
  L41_154 = L41_154.MovePoint
  L41_154 = L41_154.Air
  L40_153.action = L41_154
  L40_153.vel = 5
  L41_154 = {}
  L41_154.pos = L33_146
  L42_155 = Supporter
  L42_155 = L42_155.MovePoint
  L42_155 = L42_155.Air
  L41_154.action = L42_155
  L41_154.vel = 5
  L35_148 = {
    L36_149,
    L37_150,
    L38_151,
    L39_152,
    L40_153,
    L41_154,
    L42_155
  }
  L36_149 = {}
  L36_149.pos = L33_146
  L36_149.action = L37_150
  L36_149.vel = 5
  L37_150.pos = L28_141
  L37_150.action = L38_151
  L37_150.vel = 5
  L38_151.pos = L32_145
  L38_151.action = L39_152
  L38_151.vel = 5
  L39_152.pos = L31_144
  L40_153 = Supporter
  L40_153 = L40_153.MovePoint
  L40_153 = L40_153.Air
  L39_152.action = L40_153
  L39_152.vel = 5
  L40_153 = {}
  L40_153.pos = L30_143
  L41_154 = Supporter
  L41_154 = L41_154.MovePoint
  L41_154 = L41_154.Air
  L40_153.action = L41_154
  L40_153.vel = 5
  L41_154 = {}
  L41_154.pos = L29_142
  L42_155 = Supporter
  L42_155 = L42_155.MovePoint
  L42_155 = L42_155.Air
  L41_154.action = L42_155
  L41_154.vel = 5
  L42_155 = {}
  L42_155.pos = L27_140
  L42_155.action = L43_156
  L42_155.vel = 5
  L36_149 = false
  L37_150(L38_151, L39_152)
  L37_150(L38_151)
  L37_150(L38_151)
  while true do
    if L37_150 then
      L37_150(L38_151)
      if L36_149 == false then
        L37_150(L38_151, L39_152)
        L37_150(L38_151)
        L36_149 = true
      elseif L36_149 == true then
        L36_149 = false
        L37_150(L38_151, L39_152)
        L37_150(L38_151)
      end
      L37_150(L38_151)
      L37_150(L38_151)
    end
    if L37_150 == true then
      L37_150(L38_151)
      L37_150(L38_151)
      break
    end
    L37_150()
  end
  L37_150(L38_151)
  for L40_153, L41_154 in L37_150(L38_151) do
    L42_155 = _hostage_rescue_check_tbl
    L42_155 = L42_155[L40_153]
    if L42_155 == false then
      L42_155 = _grab_execution_flag
      L42_155 = L42_155[L40_153]
      if L42_155 == false then
        L42_155 = L41_154.isGrabbed
        L42_155 = L42_155(L43_156)
        if L42_155 == false then
          L42_155 = print
          L42_155(L43_156)
          L42_155 = _puppet_crow
          L42_155 = L42_155.getWorldPos
          L42_155 = L42_155(L43_156)
          L0_113 = L42_155
          L42_155 = _brain_crow
          L42_155 = L42_155.addMovePoint
          L46_159 = 20
          L42_155(L43_156, L44_157, L45_158, L46_159)
          L42_155 = _brain_crow
          L42_155 = L42_155.addMovePoint
          L46_159 = 80
          L42_155(L43_156, L44_157, L45_158, L46_159)
          if L40_153 == "hst01" then
            L42_155 = _brain_crow
            L42_155 = L42_155.addMovePoint
            L46_159 = 80
            L42_155(L43_156, L44_157, L45_158, L46_159)
          elseif L40_153 == "hst02" or L40_153 == "hst03" then
            L42_155 = _brain_crow
            L42_155 = L42_155.addMovePoint
            L46_159 = 80
            L42_155(L43_156, L44_157, L45_158, L46_159)
          elseif L40_153 == "hst04" or L40_153 == "hst05" then
            L42_155 = _brain_crow
            L42_155 = L42_155.addMovePoint
            L46_159 = 80
            L42_155(L43_156, L44_157, L45_158, L46_159)
          end
          _hostage_at = true
          L42_155 = _brain_crow
          L42_155 = L42_155.startMovePoint
          L42_155(L43_156)
          while true do
            L42_155 = _brain_crow
            L42_155 = L42_155.isMovePointEnd
            L42_155 = L42_155(L43_156)
            if L42_155 then
              L42_155 = _brain_crow
              L42_155 = L42_155.clearMovePoint
              L42_155(L43_156)
              L42_155 = _brain_crow
              L42_155 = L42_155.setIdling
              L42_155(L43_156, L44_157)
              L42_155 = print
              L42_155(L43_156)
              break
            end
            L42_155 = wait
            L42_155()
          end
          L42_155 = _brain_crow
          L42_155 = L42_155.grabAround
          L42_155(L43_156)
          L42_155 = L41_154.isGrabbed
          L42_155 = L42_155(L43_156)
          if L42_155 == true then
            L42_155 = print
            L42_155(L43_156)
            L42_155 = _crow_grab_execution_flag
            L42_155[L40_153] = true
            L42_155 = _reaction_stop_flag
            L42_155[L40_153] = true
            L42_155 = Fn_pcSensorOff
            L42_155(L43_156)
            L42_155 = _grab_task
            L42_155 = L42_155[L40_153]
            if L42_155 ~= nil then
              L42_155 = print
              L42_155(L43_156)
              L42_155 = _npc_tbl
              L42_155 = L42_155[L40_153]
              L42_155 = L42_155.setEventListener
              L42_155(L43_156, L44_157, L45_158)
              L42_155 = _grab_task
              L42_155 = L42_155[L40_153]
              L42_155 = L42_155.abort
              L42_155(L43_156)
              L42_155 = _grab_task
              L42_155[L40_153] = nil
              L42_155 = _mnavi
              L42_155 = L42_155[L40_153]
              L42_155 = L42_155.setActive
              L42_155(L43_156, L44_157)
            end
          else
            L42_155 = print
            L42_155(L43_156)
          end
        end
      end
    end
  end
  L40_153 = "locator2_crow_phase2_movepoints_02"
  L40_153 = "Node"
  L41_154 = "locator2_crow_phase2_movepoints_03"
  L40_153 = L39_152
  L40_153 = findGameObject2
  L41_154 = "Node"
  L42_155 = "locator2_crow_phase2_movepoints_04"
  L40_153 = L40_153(L41_154, L42_155)
  L41_154 = L40_153
  L40_153 = L40_153.getWorldPos
  L40_153 = L40_153(L41_154)
  L41_154 = findGameObject2
  L42_155 = "Node"
  L41_154 = L41_154(L42_155, L43_156)
  L42_155 = L41_154
  L41_154 = L41_154.getWorldPos
  L41_154 = L41_154(L42_155)
  L42_155 = {
    L43_156,
    L44_157,
    L45_158,
    L46_159,
    {
      pos = L41_154,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L41_154,
      action = Supporter.MovePoint.Alight,
      vel = 10
    }
  }
  L43_156.pos = L37_150
  L43_156.action = L44_157
  L43_156.vel = 80
  L44_157.pos = L38_151
  L44_157.action = L45_158
  L44_157.vel = 70
  L45_158.pos = L39_152
  L46_159 = Supporter
  L46_159 = L46_159.MovePoint
  L46_159 = L46_159.Air
  L45_158.action = L46_159
  L45_158.vel = 60
  L46_159 = {}
  L46_159.pos = L40_153
  L46_159.action = Supporter.MovePoint.Air
  L46_159.vel = 30
  L43_156(L44_157, L45_158)
  L43_156(L44_157)
  L43_156(L44_157)
  while true do
    if L43_156 then
      L43_156(L44_157)
      L43_156(L44_157, L45_158)
      L43_156(L44_157)
      for L46_159, _FORV_47_ in L43_156(L44_157) do
        if _FORV_47_ == true then
          Fn_setGrabNpc(L46_159, true, false)
        end
      end
      L43_156(L44_157)
      break
    end
    L43_156()
  end
  L43_156(L44_157)
  while true do
    if not L43_156 then
      L43_156()
    end
  end
  L43_156(L44_157)
end
function getGrabHostage()
  local L0_160, L1_161, L2_162, L3_163, L4_164, L5_165
  L0_160(L1_161)
  for L3_163, L4_164 in L0_160(L1_161) do
    L5_165 = L4_164.getPuppet
    L5_165 = L5_165(L4_164)
    if L4_164:isGrabbed() and not _brain_crow:isGrabOwner(L5_165) then
      print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\227\129\174\227\129\175\239\188\154" .. L3_163)
      return _puppet_tbl[L3_163]
    end
  end
  L0_160(L1_161)
  if L0_160 then
    L0_160(L1_161)
    return L0_160
  elseif L0_160 then
    L0_160(L1_161)
    return L0_160
  elseif L0_160 then
    L0_160(L1_161)
    return L0_160
  end
end
function cubesensormulti2_RescueArea_01_OnEnter(A0_166, A1_167)
  local L2_168, L3_169, L4_170, L5_171
  for L5_171, _FORV_6_ in L2_168(L3_169) do
    if A1_167:getName() == L5_171 and _hostage_rescue_check_tbl[L5_171] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16201\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_171] = true
      releasenps_move(L5_171, {
        "locator2_hst_movepoint_01",
        "locator2_" .. L5_171 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_02_OnEnter(A0_172, A1_173)
  local L2_174, L3_175, L4_176, L5_177
  for L5_177, _FORV_6_ in L2_174(L3_175) do
    if A1_173:getName() == L5_177 and _hostage_rescue_check_tbl[L5_177] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16202\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_177] = true
      releasenps_move(L5_177, "locator2_" .. L5_177 .. "_pos")
    end
    if A1_173:getName() == L5_177 and _shipnpc_move_flag == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16202\227\129\171\228\186\186\232\179\170NPC\227\129\140\229\133\165\227\129\163\227\129\166\227\129\141\227\129\159\227\129\174\227\129\167\227\128\129\227\131\170\227\130\182\233\129\148\227\129\140\228\186\186\232\179\170\233\129\148\227\129\174\229\133\131\227\129\184\231\167\187\229\139\149\233\150\139\229\167\139")
      _shipnpc_move_flag = true
      ryz_and_others_move("ryz01", "locator2_ryz_03")
      advance_move("adv01", {
        "locator2_advance_01",
        "locator2_advance_02"
      })
    end
  end
end
function cubesensormulti2_RescueArea_03_OnEnter(A0_178, A1_179)
  local L2_180, L3_181, L4_182, L5_183
  for L5_183, _FORV_6_ in L2_180(L3_181) do
    if A1_179:getName() == L5_183 and _hostage_rescue_check_tbl[L5_183] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16203\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_183] = true
      releasenps_move(L5_183, {
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_183 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_04_OnEnter(A0_184, A1_185)
  local L2_186, L3_187, L4_188, L5_189
  for L5_189, _FORV_6_ in L2_186(L3_187) do
    if A1_185:getName() == L5_189 and _hostage_rescue_check_tbl[L5_189] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16204\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_189] = true
      releasenps_move(L5_189, {
        "locator2_hst_movepoint_03",
        "locator2_" .. L5_189 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_05_OnEnter(A0_190, A1_191)
  local L2_192, L3_193, L4_194, L5_195
  for L5_195, _FORV_6_ in L2_192(L3_193) do
    if A1_191:getName() == L5_195 and _hostage_rescue_check_tbl[L5_195] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16205\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_195] = true
      releasenps_move(L5_195, {
        "locator2_hst_movepoint_04",
        "locator2_" .. L5_195 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_06_OnEnter(A0_196, A1_197)
  local L2_198, L3_199, L4_200, L5_201
  for L5_201, _FORV_6_ in L2_198(L3_199) do
    if A1_197:getName() == L5_201 and _hostage_rescue_check_tbl[L5_201] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16206\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_201] = true
      releasenps_move(L5_201, {
        "locator2_hst_movepoint_05",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_201 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_07_OnEnter(A0_202, A1_203)
  local L2_204, L3_205, L4_206, L5_207
  for L5_207, _FORV_6_ in L2_204(L3_205) do
    if A1_203:getName() == L5_207 and _hostage_rescue_check_tbl[L5_207] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16207\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_207] = true
      releasenps_move(L5_207, {
        "locator2_hst_movepoint_06",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_207 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_08_OnEnter(A0_208, A1_209)
  local L2_210, L3_211, L4_212, L5_213
  for L5_213, _FORV_6_ in L2_210(L3_211) do
    if A1_209:getName() == L5_213 and _hostage_rescue_check_tbl[L5_213] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16208\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_213] = true
      releasenps_move(L5_213, {
        "locator2_hst_movepoint_07",
        "locator2_hst_movepoint_06",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_213 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_09_OnEnter(A0_214, A1_215)
  local L2_216, L3_217, L4_218, L5_219
  for L5_219, _FORV_6_ in L2_216(L3_217) do
    if A1_215:getName() == L5_219 and _hostage_rescue_check_tbl[L5_219] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16209\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_219] = true
      releasenps_move(L5_219, {
        "locator2_hst_movepoint_08",
        "locator2_hst_movepoint_06",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_219 .. "_pos"
      })
    end
  end
end
function releasenps_move(A0_220, A1_221)
  _move_task[A0_220] = invokeTask(function()
    local L0_222, L1_223, L2_224, L3_225, L4_226, L5_227
    L0_222 = Fn_setGrabReleaseNpc
    L1_223 = A0_220
    L0_222(L1_223)
    _next_phase = true
    L0_222 = Fn_appendNpcArea
    L1_223 = A0_220
    L2_224 = "locator2_"
    L3_225 = A0_220
    L4_226 = "_pos"
    L2_224 = L2_224 .. L3_225 .. L4_226
    L0_222(L1_223, L2_224)
    L0_222 = Fn_moveNpc
    L1_223 = A0_220
    L2_224 = A1_221
    L3_225 = {}
    L3_225.anim_walk_speed = 1
    L3_225.recast = true
    L0_222 = L0_222(L1_223, L2_224, L3_225)
    L1_223 = Fn_findNpc
    L2_224 = A0_220
    L1_223 = L1_223(L2_224)
    L2_224 = Fn_findNpcPuppet
    L3_225 = A0_220
    L2_224 = L2_224(L3_225)
    L3_225 = 0
    while true do
      L5_227 = L0_222
      L4_226 = L0_222.isRunning
      L4_226 = L4_226(L5_227)
      if L4_226 then
        L5_227 = L1_223
        L4_226 = L1_223.isFall
        L4_226 = L4_226(L5_227)
        if L4_226 then
          L4_226 = Fn_get_distance
          L5_227 = L2_224.getWorldPos
          L5_227 = L5_227(L2_224)
          L4_226 = L4_226(L5_227, findGameObject2("Node", "locator2_navi_05"):getWorldPos())
          if L4_226 >= 30 then
            L4_226 = Fn_warpNpc
            L5_227 = A0_220
            L4_226(L5_227, "locator2_" .. A0_220 .. "_pos")
            L4_226 = print
            L5_227 = "\231\167\187\229\139\149\228\184\173\227\129\171\232\144\189\228\184\139\227\129\151\227\129\159\227\129\174\227\129\167\227\131\175\227\131\188\227\131\151"
            L4_226(L5_227, A0_220, L1_223)
            break
          end
        end
      end
      L4_226 = wait
      L4_226()
      L3_225 = L3_225 + 1
    end
    L4_226 = wait
    L4_226()
    L4_226 = Fn_turnNpc
    L5_227 = A0_220
    L4_226(L5_227, "locator2_ryz_03")
    _backstairs_gossip2_start_flag_hostage = true
    while true do
      L4_226 = _backstairs_gossip2_start_flag_shipnpc
      if L4_226 == true then
        L4_226 = _backstairs_gossip2_start_flag_hostage
      end
      if L4_226 ~= true then
        L4_226 = wait
        L4_226()
      end
    end
    L4_226 = {
      L5_227,
      "talk_01",
      "reply_yes",
      "reply_no",
      "stay"
    }
    L5_227 = "talk_00"
    L5_227 = {}
    L5_227.isRepeat = true
    L5_227.isRandom = true
    Fn_playMotionNpc(A0_220, L4_226, false, L5_227)
  end)
end
function ryz_and_others_move(A0_228, A1_229)
  _move_shipnpc_task[A0_228] = invokeTask(function()
    local L0_230, L1_231, L2_232
    L0_230 = Fn_moveNpc
    L1_231 = A0_228
    L2_232 = A1_229
    L0_230 = L0_230(L1_231, L2_232, {anim_walk_speed = 1, recast = true})
    while true do
      L2_232 = L0_230
      L1_231 = L0_230.isRunning
      L1_231 = L1_231(L2_232)
      if L1_231 then
        L1_231 = wait
        L1_231()
      end
    end
    L1_231 = wait
    L1_231()
    L1_231 = Fn_turnNpc
    L2_232 = A0_228
    L1_231(L2_232, "locator2_hst01_pos")
    _backstairs_gossip2_start_flag_shipnpc = true
    while true do
      L1_231 = _backstairs_gossip2_start_flag_shipnpc
      if L1_231 == true then
        L1_231 = _backstairs_gossip2_start_flag_hostage
      end
      if L1_231 ~= true then
        L1_231 = wait
        L1_231()
      end
    end
    L1_231 = A0_228
    if L1_231 == "ryz01" then
      L1_231 = startRyzMotionTask
      L1_231()
    else
      L1_231 = {L2_232, "stay"}
      L2_232 = "talk_00"
      L2_232 = {}
      L2_232.isRepeat = true
      L2_232.isRandom = true
      Fn_playMotionNpc(A0_228, L1_231, false, L2_232)
    end
  end)
end
function advance_move(A0_233, A1_234)
  _move_shipnpc_task[A0_233] = invokeTask(function()
    local L0_235, L1_236, L2_237, L3_238
    L0_235 = {}
    L0_235.anim_walk = "man01_walk_00"
    L0_235.anim_walk_speed = 1
    L0_235.recast = true
    L0_235.anim_turn_l = "man01_turn_l_00"
    L0_235.anim_turn_r = "man01_turn_r_00"
    L1_236 = Fn_moveNpc
    L2_237 = A0_233
    L3_238 = A1_234
    L1_236 = L1_236(L2_237, L3_238, L0_235)
    while true do
      L3_238 = L1_236
      L2_237 = L1_236.isRunning
      L2_237 = L2_237(L3_238)
      if L2_237 then
        L2_237 = wait
        L2_237()
      end
    end
    L2_237 = wait
    L2_237()
    L2_237 = Fn_turnNpc
    L3_238 = A0_233
    L2_237(L3_238, "locator2_hst01_pos")
    _backstairs_gossip2_start_flag_shipnpc = true
    while true do
      L2_237 = _backstairs_gossip2_start_flag_shipnpc
      if L2_237 == true then
        L2_237 = _backstairs_gossip2_start_flag_hostage
      end
      if L2_237 ~= true then
        L2_237 = wait
        L2_237()
      end
    end
    L2_237 = {
      L3_238,
      "man01_talk_01",
      "reply_yes",
      "reply_no",
      "man01_stay_00"
    }
    L3_238 = "man01_talk_00"
    L3_238 = {}
    L3_238.isRepeat = true
    L3_238.isRandom = true
    Fn_playMotionNpc(A0_233, L2_237, false, L3_238)
  end)
end
function startRyzMotionTask()
  _ryzMotionTask = invokeTask(function()
    local L0_239, L1_240, L2_241, L3_242
    L0_239 = {}
    L0_239.isRepeat = true
    L0_239.isRandom = false
    L0_239.isStop = true
    L1_240 = {}
    L1_240.isRepeat = false
    L1_240.isRandom = false
    L1_240.isStop = true
    L2_241 = {L3_242}
    L3_242 = "stay"
    L3_242 = {
      "ryz02_talk_in_00",
      "talk_00",
      "ryz02_talk_out_00"
    }
    while true do
      Fn_playMotionNpc("ryz01", L2_241, false, L0_239)
      wait(122 + RandI(0, 122))
      Fn_playMotionNpc("ryz01", L3_242, true, L1_240)
    end
  end)
end
function endRyzMotionTask()
  if _ryzMotionTask ~= nil and _ryzMotionTask:isRunning() then
    _ryzMotionTask:abort()
    _ryzMotionTask = nil
  end
end
function pccubesensor2_ep10a_area_01_OnLeave()
  local L0_243
  L0_243 = nil
  if _brain_crow ~= nil then
    if isGrabHostage() == true then
      L0_243 = invokeTask(function()
        Fn_captionView("ep10_00117")
        L0_243:abort()
      end)
    elseif isGrabHostage() == false then
      L0_243 = invokeTask(function()
        if _sensor_on_enter == false and _downward_cage_area == true then
          Fn_naviSet(findGameObject2("Node", "locator2_navi_ep10a_area"))
        elseif _sensor_on_enter == true and (_cage_hdl[kCAGE1]:isBroken() or _cage_hdl[kCAGE2]:isBroken() or _cage_hdl[kCAGE3]:isBroken()) then
          for _FORV_4_, _FORV_5_ in pairs(_puppet_tbl) do
            if _grab_task[_FORV_4_] ~= nil then
              break
            end
          end
          if false == true then
            Fn_naviSet(findGameObject2("Node", "locator2_navi_ep10a_area"))
          end
        end
        Fn_captionView("ep10_00118")
        L0_243:abort()
      end)
    end
  end
end
function pccubesensor2_ep10a_area_01_OnEnter()
  local L0_244
  L0_244 = nil
  if _brain_crow ~= nil then
    if isGrabHostage() == true then
      L0_244 = invokeTask(function()
        if Fn_isCaptionView("ep10_00117") == true then
          Fn_captionViewEnd()
        end
        L0_244:abort()
      end)
    elseif isGrabHostage() == false then
      L0_244 = invokeTask(function()
        if _sensor_on_enter == false and _downward_cage_area == true then
          Fn_naviKill()
        elseif _sensor_on_enter == true and (_cage_hdl[kCAGE1]:isBroken() or _cage_hdl[kCAGE2]:isBroken() or _cage_hdl[kCAGE3]:isBroken()) then
          for _FORV_4_, _FORV_5_ in pairs(_puppet_tbl) do
            if _grab_task[_FORV_4_] ~= nil then
              break
            end
          end
          if false == true then
            Fn_naviKill()
          end
        end
        if Fn_isCaptionView("ep10_00118") == true then
          Fn_captionViewEnd()
        end
        L0_244:abort()
      end)
    end
  end
end
function pccubesensor2_ep10a_area_02_OnLeave()
  local L0_245
  L0_245 = _catwarp
  if L0_245 == false then
    L0_245 = _is_in_upside_sensor
    if L0_245 == false then
      L0_245 = _reset_phase
      if L0_245 == false then
        _catwarp = true
        function L0_245()
          local L0_246, L1_247, L2_248, L3_249, L4_250, L5_251
          for L3_249, L4_250 in L0_246(L1_247) do
            L5_251 = L4_250.getPuppet
            L5_251 = L5_251(L4_250)
            if L4_250:isGrabbed() and not _brain_crow:isGrabOwner(L5_251) then
              L4_250:setEventListener("npcFall", nil)
              Fn_setGrabReleaseNpc(L4_250)
              Fn_warpNpc(L4_250, "locator2_catwarp_npcpos")
            end
          end
        end
        invokeTask(function()
          Fn_catWarp(nil, nil, L0_245)
          _catwarp = false
        end)
      end
    end
  else
  end
end
function isGrabHostage()
  local L0_252, L1_253, L2_254, L3_255, L4_256, L5_257
  for L3_255, L4_256 in L0_252(L1_253) do
    L5_257 = L4_256.getPuppet
    L5_257 = L5_257(L4_256)
    if L4_256:isGrabbed() and not _brain_crow:isGrabOwner(L5_257) then
      return true
    end
  end
  return L0_252
end
function nextmission_Preparations()
  local L0_258, L1_259, L2_260, L3_261
  _crow_mission_completion_flag = true
  for L3_261, _FORV_4_ in L0_258(L1_259) do
    if _move_task[L3_261] ~= nil and _move_task[L3_261]:isRunning() then
      print("\228\186\186\232\179\170" .. L3_261 .. "\227\129\174\231\167\187\229\139\149\229\135\166\231\144\134\227\130\146\229\188\183\229\136\182\231\181\130\228\186\134\227\129\151\227\128\129\230\156\128\231\181\130\231\167\187\229\139\149\231\155\174\230\168\153\227\129\184\228\186\186\232\179\170" .. L3_261 .. "\227\130\146\227\131\175\227\131\188\227\131\151")
      _move_task[L3_261]:abort()
      _move_task[L3_261] = nil
      npcGrabRelease(L3_261, "locator2_" .. L3_261 .. "_pos")
    end
  end
  if L0_258 == true then
    if L0_258 ~= nil then
      if L0_258 then
        L0_258(L1_259)
        L0_258(L1_259)
        L0_258[L1_259] = nil
        L0_258(L1_259, L2_260)
      end
    end
    if L0_258 ~= nil then
      if L0_258 then
        L0_258(L1_259)
        L0_258(L1_259)
        L0_258[L1_259] = nil
        L0_258(L1_259, L2_260)
      end
    end
    if L0_258 ~= nil then
      if L0_258 then
        L0_258(L1_259)
        L0_258(L1_259)
        L0_258[L1_259] = nil
        L0_258(L1_259, L2_260)
      end
    end
  elseif L0_258 == false then
    L0_258(L1_259)
    L0_258(L1_259, L2_260)
    L0_258(L1_259, L2_260)
    L0_258(L1_259, L2_260)
  end
  L0_258()
end
function detectWarship()
  invokeTask(function()
    local L0_262
    L0_262 = nil
    while true do
      if L0_262 == nil then
        L0_262 = Fn_findAreaHandle("ar_a_root")
      elseif Fn_getDistanceToPlayer(L0_262) < 250 then
        print("\230\142\165\232\191\145\227\129\151\227\129\166\227\130\139\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\129", Fn_getDistanceToPlayer(L0_262))
        _restart_warship = true
        detectedBySoldier()
        break
      end
      wait(4)
    end
  end)
end
