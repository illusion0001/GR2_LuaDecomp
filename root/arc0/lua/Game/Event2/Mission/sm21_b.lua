import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Mission/sm21_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Mob/mob_event_util.lua")
_BIRD_MAX = 46
_puppet_tbl = {}
_brd_task = {}
_count = 0
_out_range = false
_talk_ing = false
_turn_ing = false
_talk_end = false
_bird_retry = false
_retry = false
_retry_count = 0
_gf_front = false
_failed_cnt = 0
_lookback_erea = false
_gf_motion_task = nil
_bf_motion_task = nil
_npc = nil
_birdClassTable = {}
_reset_pos = nil
_navi_target = nil
birdClass = {}
function birdClass.new(A0_0)
  local L1_1
  L1_1 = {}
  L1_1.BIRD_STATUS_WAIT = 1
  L1_1.BIRD_STATUS_MOVE_START = 2
  L1_1.BIRD_STATUS_MOVE_WAIT = 3
  L1_1.BIRD_STATUS_FLY_START = 4
  L1_1.BIRD_STATUS_FLY_WAIT = 5
  L1_1.CALLBACK_WAIT_START = 1
  L1_1.CALLBACK_WAIT_END = 2
  L1_1.CALLBACK_MOVE_START = 3
  L1_1.CALLBACK_MOVE_END = 4
  L1_1.CALLBACK_FLY_START = 5
  L1_1.CALLBACK_FLY_END = 6
  L1_1.CALLBACK_CHANGE_STATUS = 7
  L1_1.CALLBACK_MAX = 8
  L1_1.actionTask = nil
  L1_1.moveTask = nil
  L1_1.status = L1_1.BIRD_STATUS_WAIT
  L1_1.moveTbl = {}
  L1_1.flyTbl = {}
  L1_1.flySpeed = 10
  L1_1.hdlNpc = Fn_findNpc(A0_0)
  L1_1.hdlPuppet = Fn_findNpcPuppet(A0_0)
  L1_1.strName = A0_0
  L1_1.moveIndex = 0
  L1_1.funcCallback = {}
  L1_1.loopend = false
  for _FORV_5_ = 1, L1_1.CALLBACK_MAX do
    L1_1.funcCallback[_FORV_5_] = nil
  end
  L1_1.setMoveTbl = _FOR_
  function L1_1.setFlyTbl(A0_2)
    local L1_3
    L1_1.flyTbl = A0_2
  end
  function L1_1.setFlySpeed(A0_4)
    local L1_5
    L1_1.flySpeed = A0_4
  end
  function L1_1.setCallbaskFunc(A0_6, A1_7)
    if A0_6 < L1_1.CALLBACK_MOVE_START or A0_6 >= L1_1.CALLBACK_MAX then
      return
    end
    if A1_7 == nil then
      return
    end
    if A0_6(A1_7) ~= "function" then
      return
    end
    L1_1.funcCallback[A0_6] = A1_7
  end
  function L1_1.FuncChangeStatus(A0_8)
    L1_1.status = A0_8
    L1_1.callBackFuncRun(L1_1.CALLBACK_CHANGE_STATUS)
    if L1_1.status == L1_1.BIRD_STATUS_FLY_START then
      L1_1.loopend = true
    end
  end
  function L1_1.FuncActionRun()
    if L1_1.actionTask ~= nil then
      return
    end
    L1_1.actionTask = invokeTask(function()
      while true do
        if L1_1.status == L1_1.BIRD_STATUS_WAIT then
          L1_1.moveTask = Mv_safeTaskAbort(L1_1.moveTask)
          L1_1.callBackFuncRun(L1_1.CALLBACK_WAIT_START)
          L1_1.hdlNpc:playMotion("quack_00")
          repeat
            while not L1_1.loopend do
              wait()
            end
          until L1_1.hdlNpc:isMotionEnd()
        elseif L1_1.status == L1_1.BIRD_STATUS_MOVE_START then
          L1_1.callBackFuncRun(L1_1.CALLBACK_MOVE_START)
          L1_1.moveTask = Mv_safeTaskAbort(L1_1.moveTask)
          L1_1.moveTask = Fn_moveNpc(L1_1.strName, L1_1.moveTbl[L1_1.moveIndex + 1])
          while L1_1.moveTask ~= nil and L1_1.moveTask:isRunning() and not L1_1.loopend do
            wait()
          end
          if #L1_1.moveTbl > 0 then
            L1_1.moveIndex = L1_1.moveIndex + 1
            L1_1.moveIndex = L1_1.moveIndex % #L1_1.moveTbl
          end
          L1_1.moveTask = Mv_safeTaskAbort(L1_1.moveTask)
          L1_1.callBackFuncRun(L1_1.CALLBACK_MOVE_END)
          if L1_1.loopend then
            if L1_1.status ~= L1_1.BIRD_STATUS_MOVE_WAIT then
            end
          else
            L1_1.FuncChangeStatus(L1_1.BIRD_STATUS_MOVE_START)
          end
        elseif L1_1.status == L1_1.BIRD_STATUS_FLY_START then
          L1_1.callBackFuncRun(L1_1.CALLBACK_FLY_START)
          L1_1.hdlNpc:fly(L1_1.flyTbl, {
            moveSpeed = L1_1.flySpeed
          })
          L1_1.FuncChangeStatus(L1_1.BIRD_STATUS_FLY_WAIT)
        else
          if L1_1.status == L1_1.BIRD_STATUS_FLY_WAIT then
            repeat
              wait()
            until L1_1.hdlNpc:isFlyEnd()
            L1_1.callBackFuncRun(L1_1.CALLBACK_FLY_END)
            L1_1.FuncChangeStatus(999)
          else
          end
        end
        wait()
      end
    end)
  end
  function L1_1.callBackFuncRun(A0_9)
    if L1_1.funcCallback[A0_9] ~= nil then
      L1_1.funcCallback[A0_9](L1_1)
    end
  end
  return L1_1
end
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp",
      locator = "locator_01",
      name = "enemy01"
    },
    {
      type = "gellyfish",
      locator = "locator_02",
      name = "enemy02"
    },
    {
      type = "gellyfish",
      locator = "locator_03",
      name = "enemy03"
    }
  },
  onUpdate = function(A0_10)
    local L1_11
  end,
  onEnter = function(A0_12)
    local L1_13
  end,
  onLeave = function(A0_14)
    local L1_15
  end,
  onObjectDead = function(A0_16, A1_17)
    __enemy_cnt = __enemy_cnt - 1
  end
}
_event_motion_table = {
  label01 = "kit01_stay_00"
}
function Initialize()
  local L0_18, L1_19
  L0_18 = {
    L1_19,
    {
      name = "bf01",
      type = "man36",
      node = "locator2_bf_talk_02"
    },
    {
      name = "brdman01",
      type = "man37",
      node = "locator2_brd_man_02"
    }
  }
  L1_19.name = "gf01"
  L1_19.type = "wom29"
  L1_19.node = "locator2_gf_talk_02"
  _npc = L1_19
  L1_19(L0_18)
  for _FORV_4_, _FORV_5_ in L1_19(L0_18) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  Fn_setupNpc(L1_19)
  for _FORV_5_, _FORV_6_ in pairs(L1_19) do
    _puppet_tbl[_FORV_6_.name] = Fn_findNpcPuppet(_FORV_6_.name)
    _puppet_tbl[_FORV_6_.name]:setCollidable(false)
  end
  _dad_npc = Fn_findNpc("sm21_client")
  _dad_hdl = Fn_findNpcPuppet("sm21_client")
  _bf_npc = Fn_findNpc("bf01")
  _sdemo_cut01 = SDemo.create("sm21_b_cut01")
  _sdemo_cut02 = SDemo.create("sm21_b_cut02")
  _sdemo_cut03 = SDemo.create("sm21_b_cut03")
  _sdemo_cut04 = SDemo.create("sm21_b_cut04")
  _sdemo_cut05 = SDemo.create("sm21_b_cut05")
  Fn_loadPlayerMotion(_event_motion_table)
  Fn_pcSensorOff("pccubesensor2_warp_area_02")
  Fn_pcSensorOff("pccubesensor2_warp_warning_02")
  Mob:restrictFromEnteringForDaruma(true)
end
function Ingame()
  local L0_20, L1_21, L2_22, L3_23, L4_24, L5_25, L6_26, L7_27, L8_28, L9_29, L10_30, L11_31, L12_32, L13_33, L14_34, L15_35, L16_36, L17_37, L18_38, L19_39, L20_40, L21_41, L22_42, L23_43, L24_44, L25_45, L26_46, L27_47, L28_48, L29_49, L30_50, L31_51, L32_52, L33_53
  _reset_pos = "locator2_pc_start_pos"
  L0_20(L1_21)
  L0_20(L1_21)
  for L3_23 = 1, _BIRD_MAX do
    L4_24 = _birdClassTable
    L5_25 = birdClass
    L5_25 = L5_25.new
    L6_26 = "brd_"
    L6_26 = L6_26 .. L7_27
    L5_25 = L5_25(L6_26)
    L4_24[L3_23] = L5_25
  end
  while true do
    if not L0_20 then
      L0_20()
    end
  end
  L3_23 = "locator2_ship_stay_02"
  L3_23 = "Node"
  L4_24 = "locator2_brd_man_02"
  L3_23 = L2_22
  L33_53 = L2_22(L3_23)
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[2] = L2_22
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[3] = L3_23
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[4] = L4_24
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[5] = L5_25
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[6] = L6_26
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[7] = L7_27
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[8] = L8_28
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[9] = L9_29
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[10] = L10_30
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[11] = L11_31
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[12] = L12_32
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[13] = L13_33
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[14] = L14_34
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[15] = L15_35
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[16] = L16_36
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[17] = L17_37
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[18] = L18_38
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[19] = L19_39
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[20] = L20_40
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[21] = L21_41
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[22] = L22_42
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[23] = L23_43
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[24] = L24_44
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[25] = L25_45
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[26] = L26_46
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[27] = L27_47
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[28] = L28_48
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[29] = L29_49
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[30] = L30_50
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[31] = L31_51
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[32] = L32_52
  ;({
    L1_21,
    [34] = L2_22(L3_23)
  })[33] = L33_53
  pos_route_tbl = L0_20
  L3_23 = "ship_01"
  L4_24 = "locator2_ship_stay_02"
  L5_25 = false
  L3_23 = L0_20
  L4_24 = 0
  L2_22(L3_23, L4_24)
  L3_23 = L0_20
  L4_24 = 0
  L2_22(L3_23, L4_24)
  L3_23 = L0_20
  L4_24 = false
  L2_22(L3_23, L4_24)
  L3_23 = pos_route_tbl
  L4_24 = "ForSm21Ship01"
  L5_25 = "ship_02"
  L6_26 = "locator2_ship_stay_ve01_01"
  L3_23 = L2_22(L3_23, L4_24, L5_25, L6_26, L7_27)
  L5_25 = L2_22
  L4_24 = L2_22.setBaseSpeed
  L6_26 = 0
  L4_24(L5_25, L6_26)
  L5_25 = L2_22
  L4_24 = L2_22.setMomentRate
  L6_26 = 0
  L4_24(L5_25, L6_26)
  L5_25 = L2_22
  L4_24 = L2_22.procHorn
  L6_26 = false
  L4_24(L5_25, L6_26)
  L4_24 = start_game_obj
  L4_24()
  L4_24 = {}
  L4_24.snatched_00 = "wom01_snatched_00"
  L5_25 = Fn_loadNpcEventMotion
  L6_26 = "gf01"
  L5_25(L6_26, L7_27)
  L5_25 = Fn_disappearNpc
  L6_26 = "sm21_guid"
  L5_25(L6_26)
  L5_25 = _npc
  if L5_25 == nil then
    L5_25 = Fn_warpNpc
    L6_26 = "sm21_client"
    L5_25(L6_26, L7_27)
  end
  L5_25 = Fn_repeatPlayMotion
  L6_26 = "sm21_client"
  L10_30 = 6
  L5_25 = L5_25(L6_26, L7_27, L8_28, L9_29, L10_30)
  L6_26 = Fn_repeatPlayMotion
  L10_30 = "talk_00"
  L10_30 = 1
  L11_31 = 5
  L6_26 = L6_26(L7_27, L8_28, L9_29, L10_30, L11_31)
  _gf_motion_task = L6_26
  L6_26 = Fn_repeatPlayMotion
  L10_30 = "talk_01"
  L10_30 = 1
  L11_31 = 5
  L6_26 = L6_26(L7_27, L8_28, L9_29, L10_30, L11_31)
  _bf_motion_task = L6_26
  L6_26 = invokeTask
  L6_26(L7_27)
  L6_26 = setBard
  L6_26()
  L6_26 = {}
  for L10_30 = 1, 6 do
    L11_31 = findGameObject2
    L12_32 = "GimmickBg"
    L16_36 = L10_30
    L11_31 = L11_31(L12_32, L13_33)
    L6_26[L10_30] = L11_31
  end
  L7_27()
  L7_27()
  L10_30 = "gf01"
  L10_30 = Fn_setCatWarpCheckPoint
  L11_31 = "locator2_pc_start_pos"
  L10_30(L11_31)
  L10_30 = Fn_missionView
  L11_31 = "sm21_01000"
  L10_30(L11_31)
  L10_30 = waitSeconds
  L11_31 = 1.3
  L10_30(L11_31)
  _navi_target = "locator2_forbid_pc_01"
  L10_30 = Fn_naviSet
  L11_31 = findGameObject2
  L12_32 = "Node"
  L33_53 = L11_31(L12_32, L13_33)
  L10_30(L11_31, L12_32, L13_33, L14_34, L15_35, L16_36, L17_37, L18_38, L19_39, L20_40, L21_41, L22_42, L23_43, L24_44, L25_45, L26_46, L27_47, L28_48, L29_49, L30_50, L31_51, L32_52, L33_53, L11_31(L12_32, L13_33))
  L10_30 = 0
  while true do
    L11_31 = Fn_getDistanceToPlayer
    L12_32 = _puppet_tbl
    L12_32 = L12_32.gf01
    L11_31 = L11_31(L12_32)
    L10_30 = L11_31
    L11_31 = Fn_getDistanceToPlayer
    L12_32 = "locator2_forbid_pc_01"
    L11_31 = L11_31(L12_32)
    if L7_27 <= 5 or L10_30 <= 28 then
      L11_31 = Mv_gotoNextPhase
      L11_31()
      break
    end
    L11_31 = wait
    L11_31()
  end
  L11_31 = Fn_naviKill
  L11_31()
  _navi_target = nil
  _reset_pos = "locator2_forbid_pc_01"
  L11_31 = Fn_userCtrlAllOff
  L11_31()
  L11_31 = Player
  L12_32 = L11_31
  L11_31 = L11_31.setStay
  L11_31(L12_32, L13_33)
  L11_31 = Fn_setCatWarpCheckPoint
  L12_32 = "locator2_demoend_pc_start"
  L11_31(L12_32)
  L11_31 = waitSeconds
  L12_32 = 0.5
  L11_31(L12_32)
  L11_31 = Player
  L12_32 = L11_31
  L11_31 = L11_31.getPuppet
  L11_31 = L11_31(L12_32)
  L12_32 = _sdemo_cut01
  L12_32 = L12_32.set
  L12_32(L13_33, L14_34, L15_35)
  L12_32 = _sdemo_cut01
  L12_32 = L12_32.play
  L12_32(L13_33)
  L12_32 = waitSeconds
  L12_32(L13_33)
  L12_32 = Fn_resetPcPos
  L12_32(L13_33)
  L12_32 = _sdemo_cut01
  L12_32 = L12_32.set
  L12_32(L13_33, L14_34, L15_35)
  L12_32 = _sdemo_cut01
  L12_32 = L12_32.play
  L12_32(L13_33)
  L12_32 = Fn_captionViewWait
  L12_32(L13_33)
  L12_32 = {L13_33}
  L13_33.pos = "locator2_brd_fly_front_02"
  L13_33.attr = "takeoff"
  for L16_36 = 1, 2 do
    L17_37 = Fn_findNpc
    L18_38 = "escape_brd_"
    L19_39 = string
    L19_39 = L19_39.format
    L19_39 = L19_39(L20_40, L21_41)
    L18_38 = L18_38 .. L19_39
    L17_37 = L17_37(L18_38)
    L18_38 = RandI
    L19_39 = 10
    L18_38 = L18_38(L19_39, L20_40)
    L19_39 = Sound
    L19_39 = L19_39.playSE
    L19_39(L20_40, L21_41, L22_42, L23_43)
    L19_39 = L17_37.fly
    L22_42.moveSpeed = L18_38
    L19_39(L20_40, L21_41, L22_42)
    L19_39 = waitSeconds
    L19_39(L20_40)
  end
  L13_33(L14_34)
  L16_36 = _puppet_tbl
  L16_36 = L16_36.escape_brd_01
  L17_37 = true
  L13_33(L14_34, L15_35, L16_36, L17_37)
  L13_33(L14_34)
  _gf_motion_task = L13_33
  _bf_motion_task = L13_33
  L16_36 = {L17_37}
  L17_37 = "talk_00"
  L17_37 = 1
  L18_38 = 5
  _gf_motion_task = L13_33
  L16_36 = {L17_37}
  L17_37 = "talk_01"
  L17_37 = 1
  L18_38 = 5
  _bf_motion_task = L13_33
  L13_33(L14_34)
  L13_33(L14_34)
  L16_36 = _puppet_tbl
  L16_36 = L16_36.escape_brd_01
  L17_37 = false
  L13_33(L14_34, L15_35, L16_36, L17_37)
  L13_33(L14_34)
  L13_33(L14_34)
  L16_36 = "locator2_forbid_aim_01"
  L13_33(L14_34, L15_35, L16_36)
  L13_33(L14_34)
  L13_33()
  L13_33(L14_34)
  L13_33(L14_34, L15_35)
  _bf_motion_task = L13_33
  L16_36 = false
  L13_33(L14_34, L15_35, L16_36)
  L16_36 = false
  L13_33(L14_34, L15_35, L16_36)
  L13_33(L14_34)
  L13_33(L14_34, L15_35)
  L13_33(L14_34)
  L13_33()
  L13_33(L14_34)
  L13_33(L14_34)
  L16_36 = "Node"
  L17_37 = "locator2_turn_01"
  L16_36 = L15_35
  L16_36 = 2
  L17_37 = 2
  L13_33(L14_34, L15_35, L16_36, L17_37)
  L16_36 = "gf01"
  L13_33(L14_34, L15_35)
  L13_33(L14_34)
  L13_33(L14_34)
  L13_33()
  L13_33()
  L13_33(L14_34, L15_35)
  L13_33(L14_34, L15_35)
  while true do
    if not L13_33 then
      L13_33()
    end
  end
  _gf_motion_task = L13_33
  _bf_motion_task = L13_33
  L16_36 = {L17_37}
  L17_37 = "talk_00"
  L17_37 = 1
  L18_38 = 5
  _gf_motion_task = L13_33
  L16_36 = {L17_37}
  L17_37 = "talk_01"
  L17_37 = 1
  L18_38 = 5
  _bf_motion_task = L13_33
  L16_36 = invokeTask
  function L17_37()
    local L0_54, L1_55, L2_56, L3_57, L4_58, L5_59, L6_60, L7_61, L8_62, L9_63, L10_64, L11_65, L12_66, L13_67, L14_68, L15_69
    while true do
      if L0_54 == false then
        for L3_57 = 1, _BIRD_MAX do
          L4_58 = Fn_getDistanceToPlayer
          L8_62 = "%02d"
          L4_58 = L4_58(L5_59)
          if L3_57 == 13 or L3_57 == 20 or L3_57 == 21 or L3_57 == 23 or L3_57 == 24 or L3_57 == 26 or L3_57 >= 40 then
            L14_34 = L5_59
          else
            L14_34 = L5_59
          end
          if L4_58 <= L5_59 then
            if L5_59 == false then
              if L5_59 == false then
                _bird_retry = true
                _talk_ing = true
                _turn_ing = true
                for L8_62 = 1, _BIRD_MAX do
                  L9_63[L8_62] = L10_64
                end
                L5_59()
                if not L5_59 then
                  L8_62 = 25
                  if L5_59 == 1 then
                    L8_62 = {}
                    L8_62.pos = "locator2_brd_fly_left_01"
                    L8_62.attr = "takeoff"
                    L13_33 = L7_61
                  elseif L5_59 == 2 then
                    L8_62 = {}
                    L8_62.pos = "locator2_brd_fly_right_01"
                    L8_62.attr = "takeoff"
                    L13_33 = L7_61
                  else
                    L8_62 = {}
                    L8_62.pos = "locator2_brd_fly_front_01"
                    L8_62.attr = "takeoff"
                    L13_33 = L7_61
                  end
                  L8_62 = L7_61
                  L7_61(L8_62, L9_63, L10_64, L11_65)
                  L8_62 = L13_33
                  L7_61(L8_62)
                  L8_62 = L6_60
                  L7_61(L8_62)
                  L8_62 = _birdClassTable
                  L8_62 = L8_62[L3_57]
                  L8_62 = L8_62.BIRD_STATUS_FLY_START
                  L7_61(L8_62)
                  L8_62 = _puppet_tbl
                  L12_66 = L3_57
                  L8_62 = L8_62[L9_63]
                  L8_62 = L8_62.getWorldPos
                  L8_62 = L8_62(L9_63)
                  L15_69 = L9_63(L10_64)
                  if L7_61 <= 7 then
                    L8_62 = Fn_playMotionNpc
                    L8_62(L9_63, L10_64, L11_65)
                  end
                  L8_62 = 0
                  for L12_66 = 1, _BIRD_MAX do
                    if L12_66 ~= L3_57 then
                      L13_67 = Fn_get_distance
                      L14_68 = _puppet_tbl
                      L15_69 = "brd_"
                      L15_69 = L15_69 .. string.format("%02d", L12_66)
                      L14_68 = L14_68[L15_69]
                      L15_69 = L14_68
                      L14_68 = L14_68.getWorldPos
                      L14_68 = L14_68(L15_69)
                      L15_69 = _puppet_tbl
                      L15_69 = L15_69["brd_" .. string.format("%02d", L3_57)]
                      L15_69 = L15_69.getWorldPos
                      L15_69 = L15_69(L15_69)
                      L13_67 = L13_67(L14_68, L15_69, L15_69(L15_69))
                      if L13_67 <= 6 then
                        L14_68 = waitSeconds
                        L15_69 = 0.1
                        L14_68(L15_69)
                        L14_68 = RandI
                        L15_69 = 1
                        L14_68 = L14_68(L15_69, 3)
                        L15_69 = RandI
                        L15_69 = L15_69(10, 25)
                        if L14_68 == 1 then
                          L13_33 = {
                            {
                              pos = "locator2_brd_fly_left_01",
                              attr = "takeoff"
                            }
                          }
                        elseif L14_68 == 2 then
                          L13_33 = {
                            {
                              pos = "locator2_brd_fly_right_01",
                              attr = "takeoff"
                            }
                          }
                        else
                          L13_33 = {
                            {
                              pos = "locator2_brd_fly_front_01",
                              attr = "takeoff"
                            }
                          }
                        end
                        _birdClassTable[L12_66].setFlyTbl(L13_33)
                        _birdClassTable[L12_66].setFlySpeed(L15_69)
                        _birdClassTable[L12_66].FuncChangeStatus(_birdClassTable[L12_66].BIRD_STATUS_FLY_START)
                        L8_62 = L8_62 + 1
                      end
                    end
                    if not (L8_62 >= 7) then
                    end
                  end
                  _bf_motion_task = L9_63
                  L12_66 = false
                  L9_63(L10_64, L11_65, L12_66)
                  L9_63()
                  _gf_motion_task = L9_63
                  L9_63(L10_64)
                  L15_35 = L9_63
                  L9_63(L10_64)
                  L9_63()
                  _bird_retry = false
                  _gf_front = false
                end
              end
            end
          end
        end
        L0_54()
      end
    end
  end
  L16_36 = L16_36(L17_37)
  L17_37 = invokeTask
  function L18_38()
    while true do
      if _retry == false and _gf_front == true then
        _retry = true
        _gf_motion_task = Mv_safeTaskAbort(_gf_motion_task)
        Fn_turnNpc("gf01")
        Fn_turnNpc("bf01")
        L15_35 = Mv_safeTaskAbort(L15_35)
        setRetry()
        _gf_front = false
        _retry = false
      end
      wait()
    end
  end
  L17_37 = L17_37(L18_38)
  L18_38 = invokeTask
  function L19_39()
    local L0_70, L1_71, L2_72, L3_73, L4_74, L5_75, L6_76, L7_77
    while true do
      L0_70 = _talk_end
      if L0_70 == false then
        L0_70 = Fn_getDistanceToPlayer
        L0_70 = L0_70(L1_71)
        L7_27 = L0_70
        L0_70 = false
        if L1_71 == false then
          L8_28 = L1_71
          for L4_74 = 1, L2_72 * 10 do
            L5_75 = _bird_retry
            if not L5_75 then
              L5_75 = _retry
              L5_75 = L5_75 or _gf_front
            end
            if not L5_75 then
              L5_75 = waitSeconds
              L6_76 = 0.1
              L5_75(L6_76)
            end
          end
          while true do
            if L1_71 then
              L7_27 = L1_71
              L1_71()
            end
          end
          L4_74 = false
          L1_71(L2_72, L3_73, L4_74)
          L1_71(L2_72)
          L15_35 = L1_71
          L4_74 = 1
          L5_75 = ""
          L6_76 = _puppet_tbl
          L6_76 = L6_76.gf01
          L1_71(L2_72, L3_73, L4_74, L5_75, L6_76)
          if not L1_71 then
            L1_71(L2_72)
          end
          L1_71(L2_72)
          _gf_motion_task = L1_71
          if not L1_71 then
            L1_71(L2_72)
            L1_71(L2_72, L3_73)
          end
          L7_27 = L1_71
          _turn_ing = true
          L1_71()
          if not L1_71 then
            _bf_motion_task = L1_71
            L4_74 = false
            L1_71(L2_72, L3_73, L4_74)
            for L4_74 = 1, 50 do
              L5_75 = _puppet_tbl
              L5_75 = L5_75.gf01
              L6_76 = L5_75
              L5_75 = L5_75.getWorldPos
              L5_75 = L5_75(L6_76)
              L6_76 = L5_75.y
              L6_76 = L6_76 + 1
              L5_75.y = L6_76
              L6_76 = _puppet_tbl
              L6_76 = L6_76.gf01
              L7_77 = L6_76
              L6_76 = L6_76.getWorldRot
              L6_76 = L6_76(L7_77)
              L7_77 = Fn_getPlayerWorldPos
              L7_77 = L7_77()
              Query:setEyeSightTransform(L5_75, L6_76)
              Query:setEyeSightAngle(Deg2Rad(60))
              Query:setEyeSightRange(40)
              if Query:checkEyeSightSphere(L7_77, 10) and Query:raycastEyeSight(L7_77) == nil then
                if not _talk_ing then
                  _retry = true
                  Fn_turnNpc("gf01")
                  Fn_turnNpc("bf01")
                  L15_35 = Mv_safeTaskAbort(L15_35)
                  setRetry()
                  break
                end
              elseif not _talk_end and not _bird_retry and not _retry and not _gf_front then
                if L0_70 == false then
                  L0_70 = true
                  _gf_motion_task = Mv_safeTaskAbort(_gf_motion_task)
                  Fn_playMotionNpc("gf01", "lookaround", false)
                end
                waitSeconds(0.1)
              end
            end
            if L1_71 then
              _turn_ing = false
              break
            end
          end
          if L1_71 == false then
            if L1_71 == false then
              if L1_71 == false then
                L1_71(L2_72)
                _turn_ing = false
                L1_71(L2_72)
                while true do
                  if not L1_71 then
                    L1_71()
                  end
                end
                if L1_71 == nil then
                  _gf_motion_task = L1_71
                  L4_74 = {L5_75}
                  L5_75 = "talk_00"
                  L5_75 = 1
                  L6_76 = 5
                  _gf_motion_task = L1_71
                  L15_35 = L1_71
                  if L1_71 == nil then
                    L15_35 = L1_71
                  end
                end
              end
            end
          end
        end
      end
      L1_71()
    end
  end
  L18_38 = L18_38(L19_39)
  L19_39 = false
  while true do
    if L20_40 == false then
      if L20_40 == false then
        if L20_40 == false then
          if L7_27 <= 15 and L7_27 > 2 then
            if L20_40 == 0 then
              L20_40(L21_41)
              L20_40(L21_41)
              L20_40(L21_41, L22_42, L23_43)
              _count = L20_40
            end
          elseif L7_27 <= 9 and L7_27 > 2 then
            if L20_40 >= 1 then
              L20_40(L21_41, L22_42, L23_43)
              L20_40(L21_41)
              L20_40(L21_41, L22_42, L23_43)
              _count = L20_40
              L19_39 = true
            end
          end
        end
      end
      if L7_27 > 10 and L19_39 then
        if L20_40 >= 1 then
          L20_40()
          L19_39 = false
          L20_40(L21_41, L22_42, L23_43)
          L20_40()
        end
      end
      L20_40()
    end
  end
  L20_40(L21_41, L22_42, L23_43, L24_44, L25_45)
  L20_40(L21_41, L22_42)
  L20_40()
  L20_40()
  _talk_end = true
  L17_37 = L20_40
  L16_36 = L20_40
  L18_38 = L20_40
  L20_40()
  for L23_43 = 1, _BIRD_MAX do
    L24_44[L23_43] = L25_45
  end
  _bf_motion_task = L20_40
  _gf_motion_task = L20_40
  L20_40()
  L20_40(L21_41, L22_42, L23_43)
  L20_40(L21_41, L22_42)
  L20_40(L21_41)
  L20_40()
  L5_25 = L20_40
  _gf_motion_task = L20_40
  _bf_motion_task = L20_40
  L20_40()
  L20_40(L21_41)
  L20_40(L21_41)
  L20_40(L21_41, L22_42)
  L20_40(L21_41, L22_42)
  L20_40(L21_41)
  L20_40(L21_41, L22_42)
  L20_40(L21_41)
  L20_40(L21_41, L22_42)
  L22_42(L23_43, L24_44, L25_45)
  L22_42(L23_43, L24_44, L25_45)
  L22_42(L23_43)
  L22_42()
  _bf_motion_task = L22_42
  L22_42(L23_43, L24_44, L25_45)
  L22_42(L23_43)
  L22_42(L23_43, L24_44)
  L23_43()
  L23_43(L24_44, L25_45, L26_46)
  L23_43(L24_44, L25_45, L26_46)
  L23_43(L24_44)
  for L26_46 = 1, _BIRD_MAX do
    L27_47 = RandI
    L28_48 = 1
    L29_49 = 3
    L27_47 = L27_47(L28_48, L29_49)
    L28_48 = RandI
    L29_49 = 10
    L30_50 = 25
    L28_48 = L28_48(L29_49, L30_50)
    if L27_47 == 1 then
      L29_49 = {L30_50}
      L30_50 = {}
      L30_50.pos = "locator2_brd_fly_left_01"
      L30_50.attr = "takeoff"
    elseif L27_47 == 2 then
      L29_49 = {L30_50}
      L30_50 = {}
      L30_50.pos = "locator2_brd_fly_right_01"
      L30_50.attr = "takeoff"
    else
      L29_49 = {L30_50}
      L30_50 = {}
      L30_50.pos = "locator2_brd_fly_front_01"
      L30_50.attr = "takeoff"
    end
    if L26_46 <= 2 then
      L29_49 = Sound
      L30_50 = L29_49
      L29_49 = L29_49.playSE
      L31_51 = "gull_cry"
      L32_52 = 1
      L33_53 = ""
      L29_49(L30_50, L31_51, L32_52, L33_53)
    end
    L29_49 = _birdClassTable
    L29_49 = L29_49[L26_46]
    L29_49 = L29_49.setFlyTbl
    L30_50 = L13_33
    L29_49(L30_50)
    L29_49 = _birdClassTable
    L29_49 = L29_49[L26_46]
    L29_49 = L29_49.setFlySpeed
    L30_50 = L28_48
    L29_49(L30_50)
    L29_49 = _birdClassTable
    L29_49 = L29_49[L26_46]
    L29_49 = L29_49.FuncChangeStatus
    L30_50 = _birdClassTable
    L30_50 = L30_50[L26_46]
    L30_50 = L30_50.BIRD_STATUS_FLY_START
    L29_49(L30_50)
  end
  L23_43(L24_44, L25_45, L26_46)
  L26_46.runLength = -1
  L24_44(L25_45)
  L27_47 = false
  L24_44(L25_45, L26_46, L27_47)
  L24_44(L25_45)
  L24_44(L25_45, L26_46)
  L27_47 = false
  L24_44(L25_45, L26_46, L27_47)
  while true do
    if L24_44 then
      L24_44()
    end
  end
  L24_44(L25_45)
  L24_44(L25_45)
  L24_44(L25_45)
  for L27_47 = 1, _BIRD_MAX do
    L28_48 = Fn_disappearNpc
    L29_49 = "brd_"
    L30_50 = string
    L30_50 = L30_50.format
    L31_51 = "%02d"
    L32_52 = L27_47
    L30_50 = L30_50(L31_51, L32_52)
    L29_49 = L29_49 .. L30_50
    L28_48(L29_49)
  end
  L24_44(L25_45)
  L27_47 = "locator2_bf_move_01"
  L27_47 = Fn_moveNpc
  L28_48 = "sm21_client"
  L29_49 = L24_44
  L30_50 = {}
  L30_50.runLength = -1
  L27_47 = L27_47(L28_48, L29_49, L30_50)
  L28_48 = Fn_moveNpc
  L29_49 = "gf01"
  L30_50 = L25_45
  L31_51 = {}
  L31_51.runLength = -1
  L28_48 = L28_48(L29_49, L30_50, L31_51)
  L29_49 = Fn_moveNpc
  L30_50 = "bf01"
  L31_51 = L26_46
  L32_52 = {}
  L32_52.runLength = -1
  L29_49 = L29_49(L30_50, L31_51, L32_52)
  L30_50 = {L31_51}
  L31_51 = {}
  L31_51.pos = "locator2_gf_move_01"
  L31_51.time = 2.5
  L31_51 = _sdemo_cut03
  L32_52 = L31_51
  L31_51 = L31_51.play
  L33_53 = nil
  L31_51(L32_52, L33_53, L30_50)
  L31_51 = waitSeconds
  L32_52 = 1.5
  L31_51(L32_52)
  L31_51 = _sdemo_cut04
  L32_52 = L31_51
  L31_51 = L31_51.set
  L33_53 = "locator2_cam_04"
  L31_51(L32_52, L33_53, "locator2_aim_04")
  L31_51 = _sdemo_cut04
  L32_52 = L31_51
  L31_51 = L31_51.set
  L33_53 = node
  L31_51(L32_52, L33_53, aim)
  L31_51 = _sdemo_cut04
  L32_52 = L31_51
  L31_51 = L31_51.play
  L31_51(L32_52)
  L31_51 = Fn_sendEventComSb
  L32_52 = "requestSpawnEnemy"
  L33_53 = "enmgen2_01"
  L31_51(L32_52, L33_53)
  L31_51 = Fn_sendEventComSb
  L32_52 = "requestEnemyMove"
  L33_53 = "enmgen2_01"
  L31_51(L32_52, L33_53, true)
  L31_51 = waitSeconds
  L32_52 = 0.3
  L31_51(L32_52)
  L31_51 = Fn_setBgmPoint
  L32_52 = "battle"
  L31_51(L32_52)
  L31_51 = waitSeconds
  L32_52 = 0.5
  L31_51(L32_52)
  L31_51 = Mv_safeTaskAbort
  L32_52 = L28_48
  L31_51 = L31_51(L32_52)
  L28_48 = L31_51
  L31_51 = wait
  L31_51()
  L31_51 = invokeTask
  function L32_52()
    Fn_playNpcEventMotion("gf01", L4_24.snatched_00, false, 0.1, false)
    Fn_playMotionNpc("gf01", "stay", false)
  end
  L31_51(L32_52)
  L31_51 = invokeTask
  function L32_52()
    L29_49 = Mv_safeTaskAbort(L29_49)
    Fn_playMotionNpc("bf01", "surprise", false)
  end
  L31_51(L32_52)
  L31_51 = waitSeconds
  L32_52 = 0.5
  L31_51(L32_52)
  L31_51 = 2
  L32_52 = {L33_53}
  L33_53 = {}
  L33_53.pos = "locator2_cam_05"
  L33_53.time = L31_51
  L33_53 = {
    {
      pos = "locator2_aim_05",
      time = L31_51
    }
  }
  _sdemo_cut04:play(L32_52, L33_53)
  for _FORV_37_ = 1, 6 do
    if L6_26[_FORV_37_] ~= nil then
      L6_26[_FORV_37_]:setActive(false)
    end
  end
  Fn_sendEventComSb("requestBtlobjActive")
  while _sdemo_cut04:isPlay() do
    wait()
  end
  waitSeconds(1)
  Fn_kaiwaDemoView("sm21_01100k")
  Camera:lookTo(findGameObject2("Node", "locator2_cam_05"):getWorldPos(), 2, 2)
  _sdemo_cut04:stop()
  Fn_sendEventComSb("requestEnemyMove", "enmgen2_01", false)
  Fn_userCtrlOn()
  wait()
  Fn_sendEventComSb("setPrevPhaseContinue", true)
  Fn_setKeepPlayerPos()
  Fn_setNextMissionFlag()
  Fn_nextMission()
  Fn_exitSandbox()
end
function Finalize()
  if Fn_getPlayer() then
    Player:setGrabExceptionalObject({})
  end
  Mob:restrictFromEnteringForDaruma(false)
end
function pccubesensor2_daruma_area_01_OnLeave()
  away_task = invokeTask(function()
    Fn_turnNpc(_dad_npc)
    Fn_captionView("sm21_01011")
    waitSeconds(3)
    if _navi_target ~= nil then
      if _navi_target == "locator2_gf_talk_02" then
        Fn_naviSet(findGameObject2("Node", "locator2_gf_talk_02"))
      end
    else
      _navi_target = "locator2_gf_talk_02"
      Fn_naviSet(findGameObject2("Node", "locator2_gf_talk_02"))
    end
    Fn_playMotionNpc("sm21_client", "talk_angry_00", true)
    Fn_playMotionNpc("sm21_client", "stay_01", false)
  end)
end
function pccubesensor2_daruma_area_01_OnEnter()
  if _navi_target == "locator2_gf_talk_02" then
    Fn_naviKill()
  end
  invokeTask(function()
    away_task = Mv_safeTaskAbort(away_task)
    wait()
    Fn_playMotionNpc("sm21_client", "stay", false)
    Fn_turnNpc(_dad_npc, "locator2_gf_talk_02")
  end)
end
function pccubesensor2_daruma_area_02_OnLeave()
  invokeTask(function()
    local L0_78, L1_79, L2_80, L3_81, L4_82
    L0_78 = Fn_blackout
    L0_78()
    L0_78 = Mv_safeTaskAbort
    L0_78 = L0_78(L1_79)
    view_task = L0_78
    L0_78 = Fn_resetPcPos
    L0_78(L1_79)
    L0_78 = Fn_warpNpc
    L0_78(L1_79, L2_80)
    L0_78 = Fn_warpNpc
    L0_78(L1_79, L2_80)
    L0_78 = Fn_warpNpc
    L0_78(L1_79, L2_80)
    L0_78 = Fn_findNpc
    L0_78 = L0_78(L1_79)
    if L1_79 == false then
      L1_79(L2_80)
    end
    _gf_motion_task = L1_79
    _bf_motion_task = L1_79
    L4_82 = {"talk_00"}
    _gf_motion_task = L1_79
    L4_82 = {"talk_01"}
    _bf_motion_task = L1_79
    for L4_82 = 1, _BIRD_MAX do
      Fn_warpNpc("brd_" .. string.format("%02d", L4_82), "locator2_brd_" .. string.format("%02d", L4_82))
      Fn_playMotionNpc("brd_" .. string.format("%02d", L4_82), "stay", false)
    end
    if L1_79 then
      L1_79()
    end
    _count = 0
    _retry = false
    _talk_ing = false
    _turn_ing = false
    _out_range = false
    _gf_front = false
    L1_79()
    L1_79(L2_80)
  end)
end
function pccubesensor2_daruma_area_02_OnEnter()
  local L0_83, L1_84
end
function pccubesensor2_forbid_pc_01_OnEnter()
  Mv_gotoNextPhase()
end
function pccubesensor2_pc_found_01_OnEnter()
  local L0_85, L1_86
  _lookback_erea = true
end
function pccubesensor2_pc_found_01_OnLeave()
  local L0_87, L1_88
  _lookback_erea = false
end
function pccubesensor2_failed_area_01_OnEnter()
  local L0_89, L1_90
  _gf_front = true
end
function pccubesensor2_failed_area_01_OnLeave()
  local L0_91, L1_92
end
function pccubesensor2_warp_area_02_OnLeave()
  runCatWarp()
end
function pccubesensor2_warp_warning_02_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_captionViewWait("sm21_01021", nil, false)
    Player:setStay(false)
  end)
end
function setRetry()
  local L0_93, L1_94, L2_95, L3_96, L4_97
  L0_93 = _talk_end
  if L0_93 then
    return
  end
  _talk_ing = true
  L0_93 = Fn_lookAtObject
  L0_93 = L0_93(L1_94)
  _bf_motion_task = L1_94
  _gf_motion_task = L1_94
  L1_94()
  L1_94(L2_95)
  L4_97 = false
  L1_94(L2_95, L3_96, L4_97)
  L4_97 = false
  L1_94(L2_95, L3_96, L4_97)
  if L1_94 == 0 then
    L1_94(L2_95)
    L1_94(L2_95)
    _retry_count = L1_94
  elseif L1_94 then
    L1_94(L2_95)
    L1_94(L2_95)
  else
    L4_97 = 1
    L1_94(L2_95, L3_96, L4_97, "", _puppet_tbl.gf01)
    L1_94(L2_95)
    L1_94(L2_95, L3_96)
    L1_94(L2_95)
  end
  L1_94(L2_95)
  L0_93 = L1_94
  L1_94(L2_95)
  L1_94(L2_95, L3_96)
  L1_94(L2_95, L3_96)
  L1_94(L2_95, L3_96)
  if L1_94 == false then
    L1_94(L2_95)
  end
  _gf_motion_task = L1_94
  _bf_motion_task = L1_94
  L4_97 = {"talk_00"}
  _gf_motion_task = L1_94
  L4_97 = {"talk_01"}
  _bf_motion_task = L1_94
  L4_97 = false
  L1_94(L2_95, L3_96, L4_97)
  for L4_97 = 1, _BIRD_MAX do
    Fn_warpNpc("brd_" .. string.format("%02d", L4_97), "locator2_brd_" .. string.format("%02d", L4_97))
    Fn_playMotionNpc("brd_" .. string.format("%02d", L4_97), "stay", false)
  end
  if L1_94 then
    L1_94()
  end
  L1_94(L2_95)
  _count = 0
  _retry = false
  _talk_ing = false
  _turn_ing = false
  _out_range = false
  L1_94(L2_95)
  L1_94()
  L1_94(L2_95, L3_96)
  L1_94()
  L1_94(L2_95)
end
function setBard()
  local L0_98, L1_99, L2_100, L3_101, L4_102
  for L3_101 = 1, _BIRD_MAX do
    L4_102 = _birdClassTable
    L4_102 = L4_102[L3_101]
    L4_102 = L4_102.FuncChangeStatus
    L4_102(999)
    L4_102 = _birdClassTable
    L4_102 = L4_102[L3_101]
    L4_102.loopend = true
  end
  L0_98()
  for L3_101 = 1, _BIRD_MAX do
    L4_102 = _birdClassTable
    L4_102 = L4_102[L3_101]
    L4_102.actionTask = Mv_safeTaskAbort(_birdClassTable[L3_101].actionTask)
    L4_102 = _birdClassTable
    L4_102 = L4_102[L3_101]
    L4_102.loopend = false
    if L3_101 == 1 or L3_101 == 10 or L3_101 == 13 or L3_101 == 20 or L3_101 == 32 then
      L4_102 = _birdClassTable
      L4_102 = L4_102[L3_101]
      L4_102 = L4_102.FuncChangeStatus
      L4_102(_birdClassTable[L3_101].BIRD_STATUS_WAIT)
    elseif L3_101 == 12 or L3_101 == 14 or L3_101 == 15 or L3_101 == 26 or L3_101 == 27 or L3_101 == 28 or L3_101 == 29 or L3_101 >= 40 then
      L4_102 = _birdClassTable
      L4_102 = L4_102[L3_101]
      L4_102 = L4_102.FuncChangeStatus
      L4_102(_birdClassTable[L3_101].BIRD_STATUS_WAIT)
    elseif L3_101 == 5 or L3_101 == 9 or L3_101 == 11 or L3_101 == 23 or L3_101 == 33 then
      L4_102 = _birdClassTable
      L4_102 = L4_102[L3_101]
      L4_102 = L4_102.FuncChangeStatus
      L4_102(_birdClassTable[L3_101].BIRD_STATUS_MOVE_START)
    else
      L4_102 = _birdClassTable
      L4_102 = L4_102[L3_101]
      L4_102 = L4_102.FuncChangeStatus
      L4_102(_birdClassTable[L3_101].BIRD_STATUS_WAIT)
    end
    L4_102 = {
      "locator2_brd_move_" .. string.format("%02d", L3_101),
      "locator2_brd_" .. string.format("%02d", L3_101)
    }
    _birdClassTable[L3_101].setMoveTbl(L4_102)
    _birdClassTable[L3_101].FuncActionRun()
  end
end
