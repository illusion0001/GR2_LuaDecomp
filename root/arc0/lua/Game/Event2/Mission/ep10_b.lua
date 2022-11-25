dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/ep10_common.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Misc/area_controller.lua")
import("math")
import("DebugDraw")
TOO_LATE_TIME = 300
TOO_DETECTION_TIME = 240
_debug_sdemo_skip = false
_debug_enemy_eye = false
_npcTable = {}
_soldierInstance = {}
_mechskytask = nil
_sol_dead_flag = false
_soldier_max = 2
_mnavi = {}
_mnavi_max = 1
_reset_phase = false
_puppet_tbl = {}
_npc_tbl = {}
_grab_task = {hst06 = nil}
_grab_caption_flag = {hst06 = false}
_reaction_stop_flag = {hst06 = false}
_ship_navi_flag = {hst06 = false}
_hostage_rescue_check_tbl = {hst06 = false}
_move_task = {hst06 = nil}
_markTask = nil
_cage_unbroken_hdl = nil
_puppet_crow = nil
_brain_crow = nil
_crow_jointstruggle_flag = false
_crow_target_set = false
_ryzMotionTask = nil
_restart_warship = false
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
  local L0_16, L1_17, L2_18, L3_19, L4_20, L5_21
  L0_16 = setUpCageCollision
  L0_16()
  L0_16 = Fn_coercionPoseNomal
  L0_16()
  L0_16 = Fn_setAreaWarp
  L1_17 = "ve_crane_root"
  L0_16(L1_17, L2_18)
  _npc_event_soldier_01 = "npcgen2_event_soldier_01"
  _npc_event_soldier_02 = "npcgen2_event_soldier_02"
  L0_16 = Fn_userCtrlAllOff
  L0_16()
  L0_16 = {
    L1_17,
    L2_18,
    L3_19,
    L4_20,
    L5_21,
    {
      name = "ryz01",
      type = "ryz02",
      node = "locator2_ryz_01"
    },
    {
      name = "phi01",
      type = "phi01",
      node = "locator2_phi_01",
      attach = false
    },
    {
      name = "adv01",
      type = "man57",
      color_variation = 1,
      node = "locator2_advance_02",
      attach = false
    }
  }
  L1_17 = {}
  L1_17.name = "hst01"
  L1_17.type = "man36"
  L1_17.node = "locator2_hst01_pos"
  L2_18.name = "hst02"
  L2_18.type = "chi11"
  L2_18.node = "locator2_hst02_pos"
  L3_19.name = "hst03"
  L3_19.type = "chi12"
  L3_19.node = "locator2_hst03_pos"
  L4_20.name = "hst04"
  L4_20.type = "wom17"
  L4_20.node = "locator2_hst04_pos"
  L5_21 = {}
  L5_21.name = "hst05"
  L5_21.type = "wom18"
  L5_21.node = "locator2_hst05_pos"
  L1_17 = {L2_18}
  L2_18.name = "hst06"
  L2_18.type = "man32"
  L2_18.node = "locator2_hst06_01"
  L2_18.anim_name = "sit_floor_01"
  L2_18(L3_19)
  L2_18(L3_19)
  for L5_21, _FORV_6_ in L2_18(L3_19) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
    _npc_tbl[_FORV_6_.name] = Fn_findNpc(_FORV_6_.name)
    _mnavi[_FORV_6_.name] = HUD:mnaviNew({
      name = _FORV_6_.name,
      PochFadeLen0 = 5,
      PochFadeLen100 = 20
    })
  end
  for L5_21 = 1, 9 do
    findGameObject2("Sensor", "cubesensormulti2_RescueArea_" .. string.format("%02d", L5_21)):setDetectMode(1)
    findGameObject2("Sensor", "cubesensormulti2_RescueArea_" .. string.format("%02d", L5_21)):setFilterType("Puppet")
  end
  L5_21 = "man01_talk_00"
  L5_21 = L2_18
  L3_19(L4_20, L5_21)
  L5_21 = "phi01"
  L4_20(L5_21, L3_19)
  L5_21 = "ryz02_talk_in_00"
  L5_21 = Fn_loadNpcEventMotion
  L5_21("ryz01", L4_20)
  L5_21 = setNpcSenser
  L5_21(_puppet_tbl.hst06, Vector(10, 10, 10), "hst06_sensor")
  L5_21 = SDemo
  L5_21 = L5_21.create
  L5_21 = L5_21("cut01")
  _sdemo_cut01 = L5_21
end
function Ingame()
  local L0_22, L1_23, L2_24, L3_25, L4_26
  L0_22 = detectWarship
  L0_22()
  L0_22 = setVeCreanAreaGroup
  L0_22()
  L0_22 = Fn_disappearNpc
  L0_22(L1_23, L2_24)
  L0_22 = Fn_setNpcVisible
  L0_22(L1_23, L2_24)
  L0_22 = Fn_setCatWarp
  L0_22(L1_23)
  L0_22 = {}
  for L4_26 = 1, 2 do
    L0_22[L4_26] = findGameObject2("EnemyBrain", "mechsky" .. string.format("%02d", L4_26))
    L0_22[L4_26]:setEnableHomingTarget(false)
  end
  for L4_26, _FORV_5_ in L1_23(L2_24) do
    _FORV_5_:setTarget(_puppet_tbl[L4_26])
  end
  L1_23()
  L1_23()
  L1_23(L2_24)
  L1_23()
  L1_23()
  L1_23()
  L1_23()
  if L1_23 == true then
    L1_23(L2_24)
    for L4_26 = 1, #L2_24 do
      _npcTable[L4_26]:setSightParam(0, 0)
    end
  end
  L1_23(L2_24)
  L1_23(L2_24)
  L1_23()
  L1_23(L2_24)
  L1_23(L2_24)
  L1_23(L2_24)
  L1_23(L2_24)
  L1_23(L2_24)
  L1_23(L2_24)
  L1_23(L2_24)
  while true do
    if L1_23 == false then
      if L1_23 == L2_24 then
        if L1_23 == L2_24 then
          if L1_23 ~= true then
            _sol_dead_flag = true
            L1_23(L2_24)
            L4_26 = "locator2_cage_navi"
            L4_26 = L2_24(L3_25, L4_26)
            L1_23(L2_24, L3_25, L4_26, L2_24(L3_25, L4_26))
            L1_23(L2_24)
            L1_23(L2_24)
          end
        end
      end
    end
    if L1_23 == true then
      L4_26 = true
      L1_23(L2_24, L3_25, L4_26)
      L1_23(L2_24)
      break
    end
    L1_23()
  end
  L1_23(L2_24)
  L1_23(L2_24)
  L4_26 = true
  L1_23(L2_24, L3_25, L4_26, 0, true, false)
  L1_23(L2_24)
  L1_23()
  L1_23()
  L1_23()
  L1_23()
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
  local L0_27, L1_28, L2_29, L3_30, L4_31
  L0_27 = Fn_getBgsetHandle
  L0_27 = L0_27()
  for L4_31 = 1, 20 do
    _cage_hdl[L4_31] = L0_27:findGameObject2("GimmickBg", string.format("go_jailcage_a_%02d_brk", L4_31))
    print(_cage_hdl[L4_31])
    if _cage_hdl[L4_31] == nil then
      _cage_hdl[L4_31] = L0_27:findGameObject2("GimmickBg", string.format("go_jailcage_a_%02d_brk", L4_31))
      wait()
    end
    if L4_31 == kCAGE4 then
      _cage_unbroken_hdl = L0_27:findGameObject2("GimmickBg", string.format("go_jailcage_a_%02d", L4_31))
      print(_cage_hdl[L4_31])
      if _cage_hdl[L4_31] == nil then
        _cage_hdl[L4_31] = L0_27:findGameObject2("GimmickBg", string.format("go_jailcage_a_%02d", L4_31))
        wait()
      end
    end
    _cage_hdl[L4_31]:setLockonPermission(true)
    _cage_hdl[L4_31]:setCollidableBlockEnable(false)
  end
  L0_27 = nil
  L4_31 = "broken"
  L2_29(L3_30, L4_31, function(A0_32)
    local L1_33
    L1_33 = ggd
    L1_33 = L1_33["Savedata__BrokenObj__ep10__go_jailcage_a_" .. string.format("%02d", kCAGE4) .. "_brk"]
    if L1_33 then
      GameDatabase:set(val, true)
    end
    L1_28(4)
    Fn_setGrabNpc("hst06", false, true)
    Fn_playMotionNpc("hst06", "scared_in_00", false)
    Fn_playMotionNpc("hst06", "scared_out_00", false)
    Sound:playSE("m02_933c", 1, "", _npc_tbl.hst06)
    Fn_playMotionNpc("hst06", "stay", false, {isRepeat = true})
    if _sol_dead_flag == true then
      Fn_naviKill()
      hostageGrabTask("hst06")
    end
  end)
  L4_31 = "broken"
  L2_29(L3_30, L4_31, function(A0_34)
    local L1_35
    L1_35 = ggd
    L1_35 = L1_35["Savedata__BrokenObj__ep10__go_jailcage_a_" .. string.format("%02d", kCAGE4)]
    if L1_35 then
      GameDatabase:set(val, true)
    end
    _cage_hdl[kCAGE4]:setActive(true)
    if _sol_dead_flag == false then
      print("\230\169\139\227\129\174\228\184\138\227\129\174\229\133\181\229\163\171\227\130\146\229\133\168\230\187\133\227\129\149\227\129\155\227\130\139\229\137\141\227\129\171\227\128\129\228\186\186\232\179\170\227\130\146\229\138\169\227\129\145\227\130\136\227\129\134\227\129\168\227\129\151\227\129\159")
      detectedBySoldier()
    end
  end)
end
function hostageGrabTask(A0_36)
  local L1_37
  L1_37 = print
  L1_37("\228\186\186\232\179\170" .. A0_36 .. "\227\129\174\230\149\145\229\135\186\227\130\191\227\130\185\227\130\175\232\181\183\229\139\149")
  L1_37 = false
  _grab_task[A0_36] = invokeTask(function()
    _npc_tbl[A0_36]:setEventListener("npcFall", fallHostage)
    _mnavi[A0_36]:setActive(true)
    while true do
      if _hostage_rescue_check_tbl[A0_36] == true then
        print("\228\186\186\232\179\170" .. A0_36 .. "\227\129\174\230\149\145\229\135\186\229\174\140\228\186\134")
        _grab_caption_flag[A0_36] = false
        _ship_navi_flag[A0_36] = false
        _mnavi[A0_36]:setActive(false)
        _mnavi[A0_36]:del()
        _reaction_stop_flag[A0_36] = true
        Fn_pcSensorOff(A0_36 .. "_sensor")
        Fn_naviKill()
        _grab_task[A0_36]:abort()
        _grab_task[A0_36] = nil
        break
      elseif _reset_phase == true then
        print("\228\186\186\232\179\170" .. A0_36 .. "\227\129\174\230\149\145\229\135\186\227\130\191\227\130\185\227\130\175\231\160\180\230\163\132")
        _grab_caption_flag[A0_36] = false
        _ship_navi_flag[A0_36] = false
        _mnavi[A0_36]:setActive(false)
        Fn_naviKill()
        _grab_task[A0_36]:abort()
        _grab_task[A0_36] = nil
        if _markTask == nil then
          _markTask = invokeTask(function()
            while _reset_phase ~= false do
              wait()
            end
            Fn_naviSet(findGameObject2("Node", "locator2_cage_navi"))
            _markTask = nil
          end)
        end
        break
      elseif L1_37 == false then
        if _npc_tbl[A0_36]:isGrabbed() then
          print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\228\186\186\232\179\170\227\130\146\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\239\188\136\231\155\174\231\154\132\229\156\176\227\130\146\230\142\161\230\142\152\232\136\185\227\129\171\229\164\137\230\155\180\239\188\137")
          L1_37 = true
          _grab_caption_flag[A0_36] = false
          _mnavi[A0_36]:setActive(false)
          _reaction_stop_flag[A0_36] = true
          Fn_pcSensorOff(A0_36 .. "_sensor")
          _ship_navi_flag[A0_36] = true
          Fn_naviSet(findGameObject2("Node", "locator2_navi_05"))
          Fn_captionView("ep10_00126")
          Fn_tutorialCaptionKill()
        elseif _grab_caption_flag[A0_36] == false then
          if Fn_getDistanceToPlayer(_puppet_tbl[A0_36]) < 4 then
            print("\228\186\186\232\179\170\227\129\1744m\228\187\165\229\134\133\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159\227\130\137\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\129\174\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\230\147\141\228\189\156\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\146\232\161\168\231\164\186")
            _grab_caption_flag[A0_36] = true
            Fn_tutorialCaption("grab")
          end
        elseif _grab_caption_flag[A0_36] == true and Fn_getDistanceToPlayer(_puppet_tbl[A0_36]) >= 10 then
          print("\228\186\186\232\179\170\227\129\139\227\130\13710m\228\187\165\228\184\138\233\155\162\227\130\140\227\129\159\227\130\137\227\130\173\227\131\163\227\131\151\227\130\183\227\131\167\227\131\179\227\129\174\233\135\141\229\138\155\227\130\176\227\131\169\227\131\150\227\129\174\230\147\141\228\189\156\227\131\129\227\131\165\227\131\188\227\131\136\227\131\170\227\130\162\227\131\171\227\130\146\233\157\158\232\161\168\231\164\186\227\129\171")
          _grab_caption_flag[A0_36] = false
          Fn_tutorialCaptionKill()
        end
      elseif L1_37 == true and _npc_tbl[A0_36]:isGrabbed() == false and _reset_phase == false then
        print("\227\130\173\227\131\136\227\130\165\227\131\179\227\129\140\228\186\186\232\179\170\227\129\174\227\130\176\227\131\169\227\131\150\227\130\146\232\167\163\233\153\164\227\129\151\227\129\159\239\188\136\231\155\174\231\154\132\229\156\176\227\130\146\228\186\186\232\179\170\227\129\171\229\164\137\230\155\180\239\188\137")
        L1_37 = false
        _ship_navi_flag[A0_36] = false
        _mnavi[A0_36]:setActive(true)
        _reaction_stop_flag[A0_36] = false
        Fn_pcSensorOn(A0_36 .. "_sensor")
        Fn_naviKill()
      end
      wait()
    end
  end)
end
function fallHostage()
  if _next_phase == true then
    return
  end
  print("\228\186\186\232\179\170\227\130\146\232\144\189\227\129\168\227\129\151\227\129\166\227\129\151\227\129\190\227\129\163\227\129\159")
  if _reset_phase == false then
    _reset_phase = true
    invokeTask(function()
      Fn_userCtrlOff()
      Fn_captionViewWait("ep10_00123")
      Fn_blackout()
      resetPhase()
      Fn_fadein()
      Fn_userCtrlOn()
    end)
  end
end
function resetPhase()
  local L0_38, L1_39, L2_40, L3_41
  L0_38(L1_39)
  for L3_41, _FORV_4_ in L0_38(L1_39) do
    _npc_tbl[L3_41]:setEventListener("npcFall", nil)
  end
  if L0_38 == true then
    L0_38(L1_39)
    L3_41 = L2_40
    L2_40(L3_41, true)
    L3_41 = L2_40
    L2_40(L3_41, L0_38, L1_39)
    L3_41 = L2_40
    L2_40(L3_41)
    L3_41 = L2_40
    L2_40(L3_41, false)
  elseif L0_38 == true then
    L0_38(L1_39)
    L3_41 = L2_40
    L2_40(L3_41, L0_38, L1_39)
  else
    L0_38(L1_39)
  end
  L0_38()
  for L3_41, _FORV_4_ in L0_38(L1_39) do
    if _hostage_rescue_check_tbl[L3_41] == false then
      Fn_warpNpc(L3_41, "locator2_" .. L3_41 .. "_01")
      Fn_setGrabNpc(L3_41, true, false)
      _reaction_stop_flag[L3_41] = false
      Fn_pcSensorOn(L3_41 .. "_sensor")
    end
  end
  _reset_phase = false
  if L0_38 == false then
    L0_38(L1_39)
    L0_38(L1_39)
  end
  L0_38(L1_39)
end
function pccubesensor2_upside_OnEnter()
  print("\228\184\138\229\177\164\227\129\174\228\186\186\232\179\170\227\129\174\230\149\145\229\138\169\229\174\140\228\186\134\229\137\141\227\129\171\231\183\143\231\157\163\229\186\156\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159")
  detectedBySoldier()
end
function pccubesensor2_mechsky_sensor_01_OnEnter()
  print("\228\184\138\229\177\164\227\129\174\228\186\186\232\179\170\227\129\174\230\149\145\229\138\169\229\174\140\228\186\134\229\137\141\227\129\171\231\183\143\231\157\163\229\186\156\227\129\171\232\191\145\227\129\165\227\129\132\227\129\159")
  detectedBySoldier()
end
function detectedBySoldier(A0_42)
  if A0_42 == nil then
    print("\227\131\170\227\130\185\227\130\191\227\131\188\227\131\136\229\135\166\231\144\134\227\130\146\229\174\159\232\161\140\233\150\139\229\167\139")
  else
    print("\229\183\161\229\155\158\228\184\173\227\129\174\229\133\181\229\163\171\227\129\171\231\153\186\232\166\139\227\129\149\227\130\140\227\129\159")
    print("\227\130\173\227\131\136\227\130\165\227\131\179\227\130\146\231\153\186\232\166\139\227\129\151\227\129\159\229\133\181\229\163\171\239\188\154" .. A0_42)
  end
  if _reset_phase == false then
    _reset_phase = true
    invokeTask(function()
      local L0_43, L1_44, L2_45, L3_46, L4_47, L5_48, L6_49
      L0_43 = CautionLevel
      L0_43 = L0_43.setKeepVisible
      L1_44 = false
      L0_43(L1_44)
      L0_43 = CautionLevel
      L0_43 = L0_43.allTerminate
      L0_43()
      L0_43 = _mechskytask
      L1_44 = L0_43
      L0_43 = L0_43.abort
      L0_43(L1_44)
      L0_43 = Fn_findAreaHandle
      L1_44 = "go_a_root"
      L0_43 = L0_43(L1_44)
      L1_44 = Sound
      L2_45 = L1_44
      L1_44 = L1_44.playSEHandle
      L6_49 = L0_43
      L1_44 = L1_44(L2_45, L3_46, L4_47, L5_48, L6_49)
      _se_handle = L1_44
      L1_44 = _too_late
      if L1_44 == true then
        L1_44 = Fn_captionView
        L2_45 = "ep10_00155"
        L1_44(L2_45)
        L1_44 = waitSeconds
        L2_45 = 3
        L1_44(L2_45)
      end
      L1_44 = _restart_warship
      if L1_44 == false then
        L1_44 = Fn_captionView
        L2_45 = "ep10_00120"
        L1_44(L2_45)
      else
        L1_44 = Fn_captionView
        L2_45 = "ic_warship_00100"
        L1_44(L2_45)
        _restart_warship = false
      end
      L1_44 = Fn_findNpcPuppet
      L2_45 = A0_42
      L1_44 = L1_44(L2_45)
      L2_45 = Fn_lookAtObject
      L2_45 = L2_45(L3_46)
      if L3_46 ~= nil then
        L6_49 = _npc_event_soldier_01
        if L5_48 == L6_49 then
        else
        end
        L6_49 = L3_46
        if L5_48 ~= false then
          L6_49 = NPC_STATUS
          L6_49 = L6_49.DEAD
          if L5_48 ~= L6_49 then
            L6_49 = A0_42
            L5_48(L6_49)
            L6_49 = "\229\133\181\229\163\171\227\130\146\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\184\229\144\145\227\129\145\227\130\139"
            L5_48(L6_49)
          end
        end
      else
        L6_49 = false
        L3_46(L4_47, L5_48, L6_49)
        L3_46()
      end
      L3_46(L4_47)
      L3_46(L4_47)
      L3_46(L4_47)
      L3_46()
      L3_46(L4_47)
      if L3_46 == false then
        for L6_49 = 1, #L4_47 do
          if _npcTable[L6_49].npc:isEnemy() then
            _npcTable[L6_49].npc:changeNpc()
          end
          _npcTable[L6_49].npc:reset()
          if _npcTable[L6_49].status == NPC_STATUS.DEAD then
            Fn_disappearNpc(_npcTable[L6_49].npcName)
            Fn_setupNpc({
              {
                name = _npcTable[L6_49].npcName,
                type = "soldier",
                node = string.format("locator2_event_soldier_%02d_01", L6_49),
                start = true
              }
            })
          end
          Fn_warpNpc(_npcTable[L6_49].npcName, string.format("locator2_event_soldier_%02d_01", L6_49))
        end
        L3_46()
      else
        L3_46(L4_47)
      end
      if L3_46 then
        L3_46(L4_47, L5_48)
        _se_handle = nil
      end
      L3_46()
      L3_46()
      L3_46()
      L3_46()
      L3_46(L4_47, L5_48)
      L3_46()
      L3_46()
      L3_46()
    end)
  end
end
function supporterNpc_crow_setup()
  _puppet_crow = Fn_spawnSuppotCrow(false, Supporter.FirstAction.Air)
  _brain_crow = _puppet_crow:getBrain()
  _brain_crow:setIdling(true)
  _brain_crow:lockToWarp(findGameObject2("Node", "locator2_crow_initial_pos"))
  _brain_crow:setAbility(Supporter.Ability.ActionInAir, false)
  _brain_crow:setDetectThreatDistance(0)
  wait()
end
function backstairs_gossip()
  local L0_50, L1_51
  L0_50 = {
    L1_51,
    "talk_01",
    "reply_yes",
    "reply_no",
    "stay"
  }
  L1_51 = "talk_00"
  L1_51 = {}
  L1_51.isRepeat = true
  L1_51.isRandom = true
  Fn_playMotionNpc("phi01", {
    "phi01_idle_00"
  }, false, L1_51)
  startRyzMotionTask()
  Fn_playMotionNpc("hst01", L0_50, false, L1_51)
  Fn_playMotionNpc("hst02", L0_50, false, L1_51)
  Fn_playMotionNpc("hst03", L0_50, false, L1_51)
  Fn_playMotionNpc("hst04", L0_50, false, L1_51)
  Fn_playMotionNpc("hst05", L0_50, false, L1_51)
end
function startRyzMotionTask()
  _ryzMotionTask = invokeTask(function()
    local L0_52, L1_53, L2_54, L3_55
    L0_52 = {}
    L0_52.isRepeat = true
    L0_52.isRandom = false
    L0_52.isStop = true
    L1_53 = {}
    L1_53.isRepeat = false
    L1_53.isRandom = false
    L1_53.isStop = true
    L2_54 = {L3_55}
    L3_55 = "stay"
    L3_55 = {
      "ryz02_talk_in_00",
      "talk_00",
      "ryz02_talk_out_00"
    }
    while true do
      Fn_playMotionNpc("ryz01", L2_54, false, L0_52)
      wait(122 + RandI(0, 122))
      Fn_playMotionNpc("ryz01", L3_55, true, L1_53)
    end
  end)
end
function endRyzMotionTask()
  if _ryzMotionTask ~= nil and _ryzMotionTask:isRunning() then
    _ryzMotionTask:abort()
    _ryzMotionTask = nil
  end
end
function setupMechSkyTask()
  _mechskytask = invokeTask(function()
    local L0_56, L1_57, L2_58, L3_59, L4_60, L5_61
    L0_56 = {}
    L1_57 = findGameObject2
    L1_57 = L1_57(L2_58, L3_59)
    for L5_61 = 1, 16 do
      L0_56[L5_61] = findGameObject2("EnemyBrain", "mechsky" .. string.format("%02d", L5_61))
      repeat
        wait()
      until L0_56[L5_61]:isReadyEnemy()
    end
    for L5_61, _FORV_6_ in L2_58(L3_59) do
      _FORV_6_:setVisibleEnemyMarker(false)
    end
    L2_58.loop = true
    L5_61 = {
      "locator2_mechsky_01_move01",
      "locator2_mechsky_01_move02",
      "locator2_mechsky_01_move03",
      "locator2_mechsky_01_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_02_move01",
      "locator2_mechsky_02_move02",
      "locator2_mechsky_02_move03",
      "locator2_mechsky_02_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_03_move01",
      "locator2_mechsky_03_move02",
      "locator2_mechsky_03_move03",
      "locator2_mechsky_03_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_04_move01",
      "locator2_mechsky_04_move02",
      "locator2_mechsky_04_move03",
      "locator2_mechsky_04_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_05_move01",
      "locator2_mechsky_05_move02",
      "locator2_mechsky_05_move03",
      "locator2_mechsky_05_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_07_move01",
      "locator2_mechsky_07_move02",
      "locator2_mechsky_07_move03",
      "locator2_mechsky_07_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_08_move01",
      "locator2_mechsky_08_move02",
      "locator2_mechsky_08_move03",
      "locator2_mechsky_08_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_10_move01",
      "locator2_mechsky_10_move02",
      "locator2_mechsky_10_move03",
      "locator2_mechsky_10_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_11_move01",
      "locator2_mechsky_11_move02",
      "locator2_mechsky_11_move03",
      "locator2_mechsky_11_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_12_move01",
      "locator2_mechsky_12_move02",
      "locator2_mechsky_12_move03",
      "locator2_mechsky_12_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_13_move01",
      "locator2_mechsky_13_move02",
      "locator2_mechsky_13_move03",
      "locator2_mechsky_13_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_15_move01",
      "locator2_mechsky_15_move02",
      "locator2_mechsky_15_move03",
      "locator2_mechsky_15_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
    L5_61 = {
      "locator2_mechsky_16_move01",
      "locator2_mechsky_16_move02",
      "locator2_mechsky_16_move03",
      "locator2_mechsky_16_move04"
    }
    L3_59(L4_60, L5_61, L2_58)
  end)
end
function npcInit()
  local L0_62, L1_63, L2_64, L3_65, L4_66, L5_67
  L0_62 = {}
  for L4_66 = 1, _soldier_max do
    L5_67 = string
    L5_67 = L5_67.format
    L5_67 = L5_67("npcgen2_event_soldier_%02d", L4_66)
    table.insert(L0_62, L5_67)
  end
  L3_65.pos = "locator2_event_soldier_01_01"
  L3_65.opt = nil
  L4_66.pos = "locator2_event_soldier_01_02"
  L4_66.opt = nil
  L4_66.pos = "locator2_event_soldier_02_01"
  L4_66.opt = nil
  L5_67 = {}
  L5_67.pos = "locator2_event_soldier_02_02"
  L5_67.opt = nil
  for L5_67 = 1, _soldier_max do
    if _soldierInstance[L5_67] ~= nil and _soldierInstance[L5_67].task ~= nil then
      _soldierInstance[L5_67].task:abort()
      _soldierInstance[L5_67].task = nil
    end
    Fn_findNpc(L0_62[L5_67]):changeNpc()
    _soldierInstance[L5_67] = PerceivableNpc.new(L0_62[L5_67])
    _soldierInstance[L5_67]:setPosList(L1_63[L5_67])
    _soldierInstance[L5_67]:setMoveOption(_move_option_soldier_normal)
    _soldierInstance[L5_67]:setLoop(true)
    _soldierInstance[L5_67]:setChaseMoveOption(_move_option_soldier_alert)
    _soldierInstance[L5_67]:setSightParam(_NPC_SIGHT_DEG, _NPC_SIGHT_LEN)
    _soldierInstance[L5_67]:setAlertRange(3)
    _soldierInstance[L5_67]:setCautionCoefficient(_NPC_CAUTION_INC, _NPC_CAUTION_DEC)
    _soldierInstance[L5_67]:setOnChangeState(soldierActionep10b)
    _soldierInstance[L5_67]:setCombatReady(true)
    _soldierInstance[L5_67]:setCombatTimeEnable(true)
    _soldierInstance[L5_67]:setCombatTime(2)
    _soldierInstance[L5_67]:setIndicationEnable(true)
    _soldierInstance[L5_67]:setIndicationRange(10)
    _soldierInstance[L5_67]:setIndicationCoefficient(15, 3)
    _soldierInstance[L5_67]:setDismissMotion("stay")
    _soldierInstance[L5_67]:action()
    Fn_findNpc(L0_62[L5_67]):enableHomingTarget(true)
    Fn_findNpc(L0_62[L5_67]):setDamage(true)
    Fn_findNpc(L0_62[L5_67]):setKnockbackAshFlag()
    _npcTable[L5_67] = _soldierInstance[L5_67]
  end
  L2_64(L3_65)
  L2_64(L3_65)
  L2_64()
  L2_64(L3_65)
end
function crow_process()
  local L0_68, L1_69, L2_70, L3_71, L4_72, L5_73, L6_74, L7_75, L8_76, L9_77, L10_78, L11_79, L12_80, L13_81, L14_82
  L0_68 = print
  L1_69 = "\227\130\175\227\131\173\227\130\166\227\129\174\227\130\191\227\130\185\227\130\175\232\181\183\229\139\149"
  L0_68(L1_69)
  L0_68 = _brain_crow
  L1_69 = L0_68
  L0_68 = L0_68.setAbility
  L2_70 = Supporter
  L2_70 = L2_70.Ability
  L2_70 = L2_70.ActionInAir
  L3_71 = true
  L0_68(L1_69, L2_70, L3_71)
  L0_68 = _brain_crow
  L1_69 = L0_68
  L0_68 = L0_68.unlockToWarp
  L0_68(L1_69)
  L0_68 = _puppet_crow
  L1_69 = L0_68
  L0_68 = L0_68.getWorldPos
  L0_68 = L0_68(L1_69)
  L1_69 = findGameObject2
  L2_70 = "Node"
  L3_71 = "locator2_crow_phase3_movepoints_01"
  L1_69 = L1_69(L2_70, L3_71)
  L2_70 = L1_69
  L1_69 = L1_69.getWorldPos
  L1_69 = L1_69(L2_70)
  L2_70 = findGameObject2
  L3_71 = "Node"
  L4_72 = "locator2_crow_phase3_movepoints_02"
  L2_70 = L2_70(L3_71, L4_72)
  L3_71 = L2_70
  L2_70 = L2_70.getWorldPos
  L2_70 = L2_70(L3_71)
  L3_71 = findGameObject2
  L4_72 = "Node"
  L5_73 = "locator2_crow_phase3_movepoints_03"
  L3_71 = L3_71(L4_72, L5_73)
  L4_72 = L3_71
  L3_71 = L3_71.getWorldPos
  L3_71 = L3_71(L4_72)
  L4_72 = findGameObject2
  L5_73 = "Node"
  L6_74 = "locator2_crow_phase3_movepoints_04"
  L4_72 = L4_72(L5_73, L6_74)
  L5_73 = L4_72
  L4_72 = L4_72.getWorldPos
  L4_72 = L4_72(L5_73)
  L5_73 = findGameObject2
  L6_74 = "Node"
  L7_75 = "locator2_crow_phase3_movepoints_05"
  L5_73 = L5_73(L6_74, L7_75)
  L6_74 = L5_73
  L5_73 = L5_73.getWorldPos
  L5_73 = L5_73(L6_74)
  L6_74 = findGameObject2
  L7_75 = "Node"
  L8_76 = "locator2_crow_phase3_movepoints_06"
  L6_74 = L6_74(L7_75, L8_76)
  L7_75 = L6_74
  L6_74 = L6_74.getWorldPos
  L6_74 = L6_74(L7_75)
  L7_75 = findGameObject2
  L8_76 = "Node"
  L9_77 = "locator2_crow_phase3_movepoints_07"
  L7_75 = L7_75(L8_76, L9_77)
  L8_76 = L7_75
  L7_75 = L7_75.getWorldPos
  L7_75 = L7_75(L8_76)
  L8_76 = findGameObject2
  L9_77 = "Node"
  L10_78 = "locator2_crow_phase3_movepoints_08"
  L8_76 = L8_76(L9_77, L10_78)
  L9_77 = L8_76
  L8_76 = L8_76.getWorldPos
  L8_76 = L8_76(L9_77)
  L9_77 = nil
  L10_78 = _brain_crow
  L11_79 = L10_78
  L10_78 = L10_78.isAir
  L10_78 = L10_78(L11_79)
  if L10_78 == false then
    L10_78 = Supporter
    L10_78 = L10_78.MovePoint
    L9_77 = L10_78.Takeoff
  else
    L10_78 = _brain_crow
    L11_79 = L10_78
    L10_78 = L10_78.isAir
    L10_78 = L10_78(L11_79)
    if L10_78 == true then
      L10_78 = Supporter
      L10_78 = L10_78.MovePoint
      L9_77 = L10_78.Air
    end
  end
  L10_78 = {
    L11_79,
    L12_80,
    L13_81,
    L14_82,
    {
      pos = L5_73,
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = L6_74,
      action = Supporter.MovePoint.Air,
      vel = 20
    },
    {
      pos = L7_75,
      action = Supporter.MovePoint.Air,
      vel = 10
    },
    {
      pos = L7_75,
      action = Supporter.MovePoint.Alight,
      vel = 6.6
    }
  }
  L11_79 = {}
  L11_79.pos = L0_68
  L11_79.action = L9_77
  L11_79.vel = 15
  L12_80 = {}
  L12_80.pos = L2_70
  L13_81 = Supporter
  L13_81 = L13_81.MovePoint
  L13_81 = L13_81.Air
  L12_80.action = L13_81
  L12_80.vel = 15
  L13_81 = {}
  L13_81.pos = L3_71
  L14_82 = Supporter
  L14_82 = L14_82.MovePoint
  L14_82 = L14_82.Air
  L13_81.action = L14_82
  L13_81.vel = 20
  L14_82 = {}
  L14_82.pos = L4_72
  L14_82.action = Supporter.MovePoint.Air
  L14_82.vel = 20
  L11_79 = _brain_crow
  L12_80 = L11_79
  L11_79 = L11_79.setMovePoints
  L13_81 = L10_78
  L11_79(L12_80, L13_81)
  L11_79 = _brain_crow
  L12_80 = L11_79
  L11_79 = L11_79.startMovePoint
  L11_79(L12_80)
  while true do
    while true do
      L11_79 = _brain_crow
      L12_80 = L11_79
      L11_79 = L11_79.isMovePointEnd
      L11_79 = L11_79(L12_80)
      if L11_79 then
        L11_79 = _brain_crow
        L12_80 = L11_79
        L11_79 = L11_79.clearMovePoint
        L11_79(L12_80)
        L11_79 = _brain_crow
        L12_80 = L11_79
        L11_79 = L11_79.setIdling
        L13_81 = true
        L11_79(L12_80, L13_81)
        L11_79 = print
        L12_80 = "\227\130\175\227\131\173\227\130\166\239\188\154\228\184\138\229\177\164\230\170\187\227\130\168\227\131\170\227\130\162\227\129\174\229\187\186\231\137\169\227\129\174\228\184\138\227\129\184\231\167\187\229\139\149\229\174\140\228\186\134"
        L11_79(L12_80)
        break
      end
      L11_79 = wait
      L11_79()
    end
  end
  while true do
    L11_79 = _crow_jointstruggle_flag
    if L11_79 ~= true then
      L11_79 = _sol_dead_flag
    end
    if L11_79 ~= true then
      L11_79 = wait
      L11_79()
    end
  end
  L11_79 = false
  L12_80 = false
  repeat
    L13_81 = _brain_crow
    L14_82 = L13_81
    L13_81 = L13_81.setIdling
    L13_81(L14_82, false)
    L13_81 = {L14_82}
    L14_82 = {}
    L14_82.pos = L8_76
    L14_82.action = Supporter.MovePoint.Takeoff
    L14_82.vel = 6.6
    L14_82 = _brain_crow
    L14_82 = L14_82.setMovePoints
    L14_82(L14_82, L13_81)
    L14_82 = _brain_crow
    L14_82 = L14_82.startMovePoint
    L14_82(L14_82)
    while true do
      L14_82 = _brain_crow
      L14_82 = L14_82.isMovePointEnd
      L14_82 = L14_82(L14_82)
      if L14_82 then
        L14_82 = _brain_crow
        L14_82 = L14_82.clearMovePoint
        L14_82(L14_82)
        break
      end
      L14_82 = wait
      L14_82()
    end
    L14_82 = _sol_dead_flag
    if L14_82 == false then
      L14_82 = {}
      L14_82.action = Supporter.SpAction.WaitForPlayerAttackStart_Fixed
      L14_82.target_type = Supporter.TargetType.TargetTable
      L14_82.targets = {
        Fn_findNpc(_npc_event_soldier_01):getPuppet(),
        Fn_findNpc(_npc_event_soldier_02):getPuppet()
      }
      L14_82.power = 1000
      L14_82.forced = true
      L12_80 = false
      setIdlingMode(false)
      _crow_target_set = false
      while true do
        if _wait_time == false and L12_80 == false then
          _brain_crow:clearMovePoint()
          setIdlingMode(true)
          _brain_crow:setSpAction(L14_82)
          setNpcDamagedTask(_npc_event_soldier_01, _npc_event_soldier_02, _soldierInstance[1], _soldierInstance[2])
          setNpcDamagedTask(_npc_event_soldier_02, _npc_event_soldier_01, _soldierInstance[2], _soldierInstance[1])
          L12_80 = true
        end
        if _sol_dead_flag == true then
          _brain_crow:clearSpAction()
          L11_79 = true
          break
        end
        if _reset_phase == true then
          _brain_crow:clearSpAction()
          resetNPCtarget(_npc_event_soldier_01)
          resetNPCtarget(_npc_event_soldier_02)
          _brain_crow:setIdling(true)
          while true do
            if _reset_phase then
              wait()
              do break end
              wait()
            end
          end
        end
      end
    end
  until L11_79
  L13_81 = _brain_crow
  L14_82 = L13_81
  L13_81 = L13_81.setAbility
  L13_81(L14_82, Supporter.Ability.Attack, false)
end
function setIdlingMode(A0_83)
  _brain_crow:setIdling(not A0_83)
  _brain_crow:setAbility(Supporter.Ability.Parallel.Normal, A0_83)
  _brain_crow:setAbility(Supporter.Ability.Parallel.Mars, A0_83)
  _brain_crow:setAbility(Supporter.Ability.Parallel.Jupiter, A0_83)
  _brain_crow:setAbility(Supporter.Ability.Parallel.NormalSp, A0_83)
  _brain_crow:setAbility(Supporter.Ability.Damaged, A0_83)
  _brain_crow:setAbility(Supporter.Ability.Avoid, A0_83)
end
function setNpcDamagedTask(A0_84, A1_85, A2_86, A3_87)
  Fn_findNpc(A0_84):setEventListener("npcDamaged", function(A0_88)
    if _crow_target_set == false and A3_87.status ~= NPC_STATUS.DEAD and A0_88.attacker ~= "supporter" then
      setCrowAction_FallKick(Fn_findNpc(A1_85):getPuppet())
      print("\227\130\175\227\131\173\227\130\166\227\129\140\230\148\187\230\146\131\229\190\133\230\169\159\228\184\173\227\129\171\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\140\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\187\165\229\164\150\227\129\174\230\148\187\230\146\131\227\130\146\227\129\151\227\129\159")
    end
  end)
  Fn_findNpc(A0_84):setEventListener("npcDead", function(A0_89)
    if _crow_target_set == false and A3_87.status ~= NPC_STATUS.DEAD and A0_89.attacker ~= "supporter" then
      setCrowAction_FallKick(Fn_findNpc(A1_85):getPuppet())
      print("\227\130\175\227\131\173\227\130\166\227\129\140\230\148\187\230\146\131\229\190\133\230\169\159\228\184\173\227\129\171\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\140\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\228\187\165\229\164\150\227\129\174\230\148\187\230\146\131\227\130\146\227\129\151\227\129\159")
    end
    A2_86.status = NPC_STATUS.DEAD
  end)
end
function setCrowAction_FallKick(A0_90)
  local L1_91
  L1_91 = _brain_crow
  L1_91 = L1_91.clearSpAction
  L1_91(L1_91)
  L1_91 = {
    {
      pos = _puppet_crow:getWorldPos(),
      action = Supporter.MovePoint.FallKick,
      target = A0_90,
      power = 1000,
      vel = 30
    }
  }
  _brain_crow:clearMovePoint()
  _brain_crow:setMovePoints(L1_91)
  _brain_crow:startMovePoint()
  _crow_target_set = true
  print("\230\140\135\229\174\154\227\129\174\230\149\181\227\129\171\229\144\145\227\129\139\227\129\163\227\129\166\227\130\175\227\131\173\227\130\166\227\129\174\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\231\153\186\229\139\149")
  invokeTask(function()
    while true do
      if _brain_crow:isMovePointEnd() then
        _brain_crow:clearMovePoint()
        print("\230\140\135\229\174\154\227\129\174\230\149\181\227\129\171\229\144\145\227\129\139\227\129\163\227\129\166\227\130\175\227\131\173\227\130\166\227\129\174\233\135\141\229\138\155\227\130\173\227\131\131\227\130\175\231\153\186\229\139\149\229\174\140\228\186\134")
        break
      end
      wait()
    end
  end)
end
function resetNPCtarget(A0_92)
  Fn_findNpc(A0_92):setEventListener("npcDamaged", nil)
  Fn_findNpc(A0_92):setEventListener("npcDead", nil)
end
function pccubesensor2_cage_4_OnEnter()
  if _sol_dead_flag == false then
    Fn_captionView("ep10_00111")
  end
end
function hst06_sensor_OnEnter()
  if _reaction_stop_flag.hst06 == false then
    print("\228\186\186\232\179\1706\227\129\140\227\131\151\227\131\172\227\130\164\227\131\164\227\131\188\227\129\171\227\131\170\227\130\162\227\130\175\227\130\183\227\131\167\227\131\179")
    _npc_tbl.hst06:turn(Player:getPuppet())
    Fn_playMotionNpc("hst06", "wavehand_far_00", false)
    Sound:playSE("m02_901b", 1, "", _npc_tbl.hst06)
    Fn_playMotionNpc("hst06", "stay", false, {isRepeat = true})
  end
end
function pccubesensor2_crow_rendezvous_01_OnEnter(A0_93)
  if _soldierInstance[1] and _soldierInstance[2] and (_soldierInstance[1].status >= 3 or _soldierInstance[2].status >= 3) then
    return
  end
  if _reset_phase == true then
    return
  end
  Fn_pcSensorOff(A0_93)
  Fn_naviKill()
  Fn_coercionGravityRevert()
  invokeTask(function()
    local L0_94, L1_95, L2_96, L3_97, L4_98
    L0_94 = Fn_userCtrlAllOff
    L0_94()
    L0_94 = Fn_blackout
    L0_94()
    L0_94 = Fn_resetPcPos
    L1_95 = "locator2_pc_tower_pos"
    L0_94(L1_95)
    L0_94 = _brain_crow
    L1_95 = L0_94
    L0_94 = L0_94.warpToNode
    L2_96 = findGameObject2
    L3_97 = "Node"
    L4_98 = "locator2_crow_phase3_movepoints_08"
    L4_98 = L2_96(L3_97, L4_98)
    L0_94(L1_95, L2_96, L3_97, L4_98, L2_96(L3_97, L4_98))
    L0_94 = Player
    L1_95 = L0_94
    L0_94 = L0_94.setEnergy
    L2_96 = Player
    L2_96 = L2_96.kEnergy_Gravity
    L3_97 = 100
    L4_98 = true
    L0_94(L1_95, L2_96, L3_97, L4_98)
    L0_94 = _debug_sdemo_skip
    if L0_94 == false then
      L0_94 = ep10b_sdemo_cut01
      L0_94()
    else
      L0_94 = _debug_sdemo_skip
      if L0_94 == true then
        L0_94 = print
        L1_95 = "///\227\131\135\227\131\144\227\131\131\227\130\176\230\169\159\232\131\189\227\129\168\227\129\151\227\129\166\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\131\135\227\131\162\227\130\146OFF\227\129\171\227\129\151\227\129\166\227\129\132\227\129\190\227\129\153\227\128\130\227\130\181\227\131\150\227\131\159\227\131\131\227\131\136\227\129\153\227\130\139\233\154\155\227\129\171\227\129\175\227\130\185\227\130\175\227\131\170\227\131\151\227\131\136\227\131\135\227\131\162\227\129\140\229\174\159\232\161\140\227\129\149\227\130\140\227\130\139\231\138\182\230\133\139\227\129\171\230\136\187\227\129\151\227\129\166\227\129\143\227\129\160\227\129\149\227\129\132\239\188\129\239\188\129\239\188\129///"
        L0_94(L1_95)
      end
    end
    L0_94 = Fn_missionView
    L1_95 = "ep10_00119"
    L0_94(L1_95)
    L0_94 = {L1_95, L2_96}
    L1_95 = {L2_96}
    L2_96 = {}
    L2_96.pos = "locator2_event_soldier_01_02"
    L2_96.opt = nil
    L2_96 = {L3_97}
    L3_97 = {}
    L3_97.pos = "locator2_event_soldier_02_02"
    L3_97.opt = nil
    L1_95 = {}
    L1_95.isRepeat = true
    L2_96 = {L3_97}
    L3_97 = "man57_talk_01"
    L3_97, L4_98 = nil, nil
    _crow_jointstruggle_flag = true
    Fn_userCtrlOn()
    repeat
      _wait_time = true
      _too_early = false
      _too_late = false
      _detection_mode = false
      L3_97 = Fn_findNpc(_npc_event_soldier_01)
      L4_98 = Fn_findNpc(_npc_event_soldier_02)
      Fn_loadNpcEventMotion(_npc_event_soldier_01, L2_96)
      Fn_loadNpcEventMotion(_npc_event_soldier_02, L2_96)
      L3_97:changeNpc()
      L4_98:changeNpc()
      _soldierInstance[1]:setPosList(L0_94[1])
      _soldierInstance[1]:setLoop(false)
      _soldierInstance[2]:setPosList(L0_94[2])
      _soldierInstance[2]:setLoop(false)
      Fn_captionView("ep10_00151")
      while true do
        if L3_97:isMoveEnd() and false == false and _reset_phase == false then
          if L3_97:isEnemy() then
            L3_97:changeNpc()
          end
          L3_97:turn(L4_98:getWorldPos())
          L3_97:playMotion("man57_talk_01", L1_95)
        end
        if L4_98:isMoveEnd() and false == false and _reset_phase == false then
          if L4_98:isEnemy() then
            L4_98:changeNpc()
          end
          L4_98:turn(L3_97:getWorldPos())
          L4_98:playMotion("man57_talk_01", L1_95)
        end
        if _too_early == true then
          Fn_userCtrlOff()
          Fn_captionView("ep10_00155")
          waitSeconds(2)
          if _sol_dead_flag == false then
            detectedBySoldier()
            break
          end
        end
        if _too_early == false and true == true and true == true then
          waitSeconds(2)
          if _too_early == false then
            Fn_captionView("ep10_00152")
            Sound:playSE("pc2_044")
            _wait_time = false
            break
          end
        end
        wait()
      end
      if _wait_time == false then
        _too_late = true
        while true do
          if _sol_dead_flag == true then
            break
          end
          if 0 >= TOO_DETECTION_TIME and _too_late == true and _detection_mode == false then
            Fn_captionView("ep10_09001")
            if L3_97:isEnemy() then
              L3_97:changeNpc()
            end
            L3_97:turn(Fn_getPlayer():getWorldPos())
            if L4_98:isEnemy() then
              L4_98:changeNpc()
            end
            L4_98:turn(Fn_getPlayer():getWorldPos())
            for _FORV_13_, _FORV_14_ in pairs(_soldierInstance) do
              _FORV_14_:setSightParam(360, 300)
            end
            _detection_mode = true
          end
          if 0 >= TOO_LATE_TIME then
            Fn_userCtrlOff()
            detectedBySoldier()
            break
          end
          if _reset_phase ~= true then
            wait()
          end
        end
      end
      if _reset_phase == true then
        while _reset_phase ~= false do
          wait()
        end
      end
      wait(10)
    until true
  end)
end
function ep10b_sdemo_cut01()
  local L0_99, L1_100, L2_101, L3_102
  L0_99 = findGameObject2
  L1_100 = "Node"
  L2_101 = "locator2_cam_01"
  L0_99 = L0_99(L1_100, L2_101)
  L1_100 = findGameObject2
  L2_101 = "Node"
  L3_102 = "locator2_aim_01"
  L1_100 = L1_100(L2_101, L3_102)
  L2_101 = _sdemo_cut01
  L3_102 = L2_101
  L2_101 = L2_101.set
  L2_101(L3_102, L0_99, L1_100, true)
  L2_101 = _sdemo_cut01
  L3_102 = L2_101
  L2_101 = L2_101.play
  L2_101(L3_102)
  L2_101 = {L3_102}
  L3_102 = {}
  L3_102.pos = "locator2_cam_01"
  L3_102.time = 5
  L3_102.hashfunc = "Linear"
  L3_102 = {
    {
      pos = "locator2_aim_02",
      time = 5
    }
  }
  _sdemo_cut01:play(cam_point_01cam_point_01, L3_102)
  wait()
  CautionLevel.setKeepVisible(false)
  Fn_fadein()
  waitSeconds(5)
  Fn_kaiwaDemoView("ep10_00120k")
  CautionLevel.setKeepVisible(true)
  _sdemo_cut01:stop(0)
  _sdemo_cut01 = nil
end
function pccubesensor2_cage_4_OnLeave(A0_103)
  if _npc_tbl.hst06:isGrabbed() then
    Fn_captionView("ep10_00116")
    Sound:playSE("m02_924c", 1, "", _npc_tbl.hst06)
    Fn_pcSensorOff(A0_103)
  end
end
function cubesensormulti2_RescueArea_01_OnEnter(A0_104, A1_105)
  local L2_106, L3_107, L4_108, L5_109
  for L5_109, _FORV_6_ in L2_106(L3_107) do
    if A1_105:getName() == L5_109 and _hostage_rescue_check_tbl[L5_109] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16201\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_109] = true
      releasenps_move(L5_109, {
        "locator2_hst_movepoint_01",
        "locator2_" .. L5_109 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_02_OnEnter(A0_110, A1_111)
  local L2_112, L3_113, L4_114, L5_115
  for L5_115, _FORV_6_ in L2_112(L3_113) do
    if A1_111:getName() == L5_115 and _hostage_rescue_check_tbl[L5_115] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16202\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_115] = true
      releasenps_move(L5_115, "locator2_" .. L5_115 .. "_pos")
    end
  end
end
function cubesensormulti2_RescueArea_03_OnEnter(A0_116, A1_117)
  local L2_118, L3_119, L4_120, L5_121
  for L5_121, _FORV_6_ in L2_118(L3_119) do
    if A1_117:getName() == L5_121 and _hostage_rescue_check_tbl[L5_121] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16203\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_121] = true
      releasenps_move(L5_121, {
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_121 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_04_OnEnter(A0_122, A1_123)
  local L2_124, L3_125, L4_126, L5_127
  for L5_127, _FORV_6_ in L2_124(L3_125) do
    if A1_123:getName() == L5_127 and _hostage_rescue_check_tbl[L5_127] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16204\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_127] = true
      releasenps_move(L5_127, {
        "locator2_hst_movepoint_03",
        "locator2_" .. L5_127 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_05_OnEnter(A0_128, A1_129)
  local L2_130, L3_131, L4_132, L5_133
  for L5_133, _FORV_6_ in L2_130(L3_131) do
    if A1_129:getName() == L5_133 and _hostage_rescue_check_tbl[L5_133] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16205\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_133] = true
      releasenps_move(L5_133, {
        "locator2_hst_movepoint_04",
        "locator2_" .. L5_133 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_06_OnEnter(A0_134, A1_135)
  local L2_136, L3_137, L4_138, L5_139
  for L5_139, _FORV_6_ in L2_136(L3_137) do
    if A1_135:getName() == L5_139 and _hostage_rescue_check_tbl[L5_139] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16206\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_139] = true
      releasenps_move(L5_139, {
        "locator2_hst_movepoint_05",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_139 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_07_OnEnter(A0_140, A1_141)
  local L2_142, L3_143, L4_144, L5_145
  for L5_145, _FORV_6_ in L2_142(L3_143) do
    if A1_141:getName() == L5_145 and _hostage_rescue_check_tbl[L5_145] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16207\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_145] = true
      releasenps_move(L5_145, {
        "locator2_hst_movepoint_06",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_145 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_08_OnEnter(A0_146, A1_147)
  local L2_148, L3_149, L4_150, L5_151
  for L5_151, _FORV_6_ in L2_148(L3_149) do
    if A1_147:getName() == L5_151 and _hostage_rescue_check_tbl[L5_151] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16208\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_151] = true
      releasenps_move(L5_151, {
        "locator2_hst_movepoint_07",
        "locator2_hst_movepoint_06",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_151 .. "_pos"
      })
    end
  end
end
function cubesensormulti2_RescueArea_09_OnEnter(A0_152, A1_153)
  local L2_154, L3_155, L4_156, L5_157
  for L5_157, _FORV_6_ in L2_154(L3_155) do
    if A1_153:getName() == L5_157 and _hostage_rescue_check_tbl[L5_157] == false then
      print("\230\149\145\229\135\186\227\130\168\227\131\170\227\130\16209\227\129\171\228\186\186\232\179\170\227\130\146\233\128\163\227\130\140\227\129\166\227\129\141\227\129\159")
      _hostage_rescue_check_tbl[L5_157] = true
      releasenps_move(L5_157, {
        "locator2_hst_movepoint_08",
        "locator2_hst_movepoint_06",
        "locator2_hst_movepoint_02",
        "locator2_" .. L5_157 .. "_pos"
      })
    end
  end
end
function releasenps_move(A0_158, A1_159)
  _move_task[A0_158] = invokeTask(function()
    local L0_160, L1_161, L2_162
    L0_160 = Fn_setGrabReleaseNpc
    L1_161 = A0_158
    L0_160(L1_161)
    L0_160 = Fn_pcSensorOff
    L1_161 = A0_158
    L2_162 = "_sensor"
    L1_161 = L1_161 .. L2_162
    L0_160(L1_161)
    _next_phase = true
    L0_160 = Fn_appendNpcArea
    L1_161 = A0_158
    L2_162 = "locator2_"
    L2_162 = L2_162 .. A0_158 .. "_pos"
    L0_160(L1_161, L2_162)
    L0_160 = Fn_moveNpc
    L1_161 = A0_158
    L2_162 = A1_159
    L0_160 = L0_160(L1_161, L2_162, {anim_walk_speed = 1, recast = true})
    while true do
      L2_162 = L0_160
      L1_161 = L0_160.isRunning
      L1_161 = L1_161(L2_162)
      if L1_161 then
        L1_161 = wait
        L1_161()
      end
    end
    L1_161 = wait
    L1_161()
    L1_161 = Fn_turnNpc
    L2_162 = A0_158
    L1_161(L2_162, "locator2_ryz_01")
    L1_161 = {
      L2_162,
      "talk_01",
      "reply_yes",
      "reply_no",
      "stay"
    }
    L2_162 = "talk_00"
    L2_162 = {}
    L2_162.isRepeat = true
    L2_162.isRandom = true
    Fn_playMotionNpc(A0_158, L1_161, false, L2_162)
  end)
end
function pccubesensor2_ep10a_area_01_OnLeave()
  local L0_163
  L0_163 = nil
  if isGrabHostage() == true then
    L0_163 = invokeTask(function()
      Fn_captionView("ep10_00117")
      L0_163:abort()
    end)
  elseif isGrabHostage() == false then
    L0_163 = invokeTask(function()
      if _crow_jointstruggle_flag == true and _sol_dead_flag == false then
        Fn_naviSet(findGameObject2("Node", "locator2_navi_ep10a_area"))
      end
      Fn_captionView("ep10_00118")
      L0_163:abort()
    end)
  end
end
function pccubesensor2_ep10a_area_01_OnEnter()
  local L0_164
  L0_164 = nil
  if isGrabHostage() == true then
    L0_164 = invokeTask(function()
      if Fn_isCaptionView("ep10_00117") == true then
        Fn_captionViewEnd()
      end
      L0_164:abort()
    end)
  elseif isGrabHostage() == false then
    L0_164 = invokeTask(function()
      if _crow_jointstruggle_flag == true and _sol_dead_flag == false then
        Fn_naviKill()
      end
      if Fn_isCaptionView("ep10_00118") == true then
        Fn_captionViewEnd()
      end
      L0_164:abort()
    end)
  end
end
function isGrabHostage()
  for _FORV_3_, _FORV_4_ in pairs(_npc_tbl) do
    if _FORV_4_:isGrabbed() then
      return true
    end
  end
  return false
end
function nextmission_Preparations()
  local L0_165, L1_166, L2_167, L3_168
  _crow_mission_completion_flag = true
  for L3_168, _FORV_4_ in L0_165(L1_166) do
    if _move_task[L3_168] ~= nil and _move_task[L3_168]:isRunning() then
      print("\228\186\186\232\179\170" .. L3_168 .. "\227\129\174\231\167\187\229\139\149\229\135\166\231\144\134\227\130\146\229\188\183\229\136\182\231\181\130\228\186\134\227\129\151\227\128\129\230\156\128\231\181\130\231\167\187\229\139\149\231\155\174\230\168\153\227\129\184\228\186\186\232\179\170" .. L3_168 .. "\227\130\146\227\131\175\227\131\188\227\131\151")
      _move_task[L3_168]:abort()
      _move_task[L3_168] = nil
      npcGrabRelease(L3_168, "locator2_" .. L3_168 .. "_pos")
    end
  end
  L0_165()
end
function detectWarship()
  invokeTask(function()
    local L0_169
    L0_169 = nil
    while true do
      if L0_169 == nil then
        L0_169 = Fn_findAreaHandle("ar_a_root")
      elseif Fn_getDistanceToPlayer(L0_169) < 250 then
        print("\230\142\165\232\191\145\227\129\151\227\129\166\227\130\139\227\129\174\227\129\167\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\239\188\129", Fn_getDistanceToPlayer(L0_169))
        _restart_warship = true
        detectedBySoldier()
        break
      end
      wait(4)
    end
  end)
end
