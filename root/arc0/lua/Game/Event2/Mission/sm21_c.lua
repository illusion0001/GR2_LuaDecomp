import("Vehicle")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/sm21_common.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
_puppet_tbl = {}
_plus_enemy_cunt = 3
_once_leave = false
_stick = nil
_turn_end_01 = false
_turn_end_02 = false
_talk_far_flag = false
_sdemo = nil
_npc = nil
enmgen2_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_04",
      name = "enemy05"
    },
    {
      type = "stalker",
      locator = "locator2_01",
      name = "enemy06"
    },
    {
      type = "stalker",
      locator = "locator2_02",
      name = "enemy07"
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
    _plus_enemy_cunt = _plus_enemy_cunt - 1
  end
}
_event_motion_table = {
  label01 = "kit01_greeting_00"
}
function Initialize()
  local L0_8, L1_9, L2_10, L3_11
  L0_8 = Fn_pcSensorOff
  L0_8(L1_9)
  L0_8 = {L1_9, L2_10}
  L1_9.name = "gf01"
  L1_9.type = "wom29"
  L1_9.node = "locator2_gf_start_c"
  L1_9.reset = false
  L1_9.not_mob = true
  L2_10.name = "bf01"
  L2_10.type = "man36"
  L2_10.node = "locator2_bf_start_c"
  L2_10.reset = false
  L2_10.not_mob = true
  _npc = L1_9
  L1_9(L2_10)
  for _FORV_4_, _FORV_5_ in L1_9(L2_10) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
    _puppet_tbl[_FORV_5_.name]:setCollidable(false)
  end
  _sdemo = L1_9
  _dad_hdl = L1_9
  L1_9(L2_10, L3_11)
  L1_9(L2_10)
  L1_9.attack = "man01_attack_sm21_00"
  L1_9.photo = "man01_photo_sm21_00"
  L1_9.run_afraid = "man01_run_afraid_01"
  L2_10(L3_11, L1_9)
  L2_10.nurse = "wom01_nurse_sm21_00"
  L2_10.photo = "wom01_photo_sm21_00"
  L2_10.run_afraid = "wom01_run_afraid_01"
  L2_10.scared_nevy_in = "wom01_scared_nevy_in_00"
  L2_10.scared_nevy = "wom01_scared_nevy_00"
  L2_10.scared_nevy_out = "wom01_scared_out_00"
  L3_11("gf01", L2_10)
  L3_11.hurt = "man01_hurt_sm21_00"
  L3_11.photo = "man01_photo_sm21_01"
  Fn_loadNpcEventMotion("sm21_client", L3_11)
  _stick = createGameObject2("GimmickBg")
  _stick:setDrawModelName("cisteelpipe01_base")
  _stick:setName("cigun02")
  Fn_attachJoint(_stick, _puppet_tbl.bf01, "loc_r_hand")
  _stick:setPos(Vector(0, -0.5, 0))
  _stick:setVisible(false)
end
function Ingame()
  local L0_12, L1_13, L2_14, L3_15, L4_16, L5_17, L6_18, L7_19, L8_20, L9_21, L10_22, L11_23, L12_24, L13_25, L14_26, L15_27, L16_28, L17_29, L18_30, L19_31, L20_32, L21_33, L22_34, L23_35, L24_36, L25_37, L26_38, L27_39, L28_40, L29_41, L30_42, L31_43, L32_44, L33_45, L34_46, L35_47, L36_48, L37_49, L38_50, L39_51, L40_52
  L0_12, L1_13, L2_14, L3_15 = nil, nil, nil, nil
  L4_16 = Fn_setCatWarp
  L5_17 = false
  L4_16(L5_17)
  L4_16 = anoterCatWarp
  L4_16 = L4_16()
  L5_17 = Fn_setCatWarpCheckPoint
  L6_18 = "locator2_pc_start_pos"
  L5_17(L6_18)
  while true do
    L5_17 = Vehicle
    L6_18 = L5_17
    L5_17 = L5_17.isReady
    L5_17 = L5_17(L6_18)
    if not L5_17 then
      L5_17 = wait
      L5_17()
    end
  end
  L5_17 = Fn_sendEventComSb
  L6_18 = "getPrevPhaseContinue"
  L5_17 = L5_17(L6_18)
  if not L5_17 then
    L5_17 = GameDatabase
    L6_18 = L5_17
    L5_17 = L5_17.get
    L7_19 = ggd
    L7_19 = L7_19.GlobalSystemFlags__GameRetry
    L5_17 = L5_17(L6_18, L7_19)
    if not L5_17 then
      L5_17 = {
        L6_18,
        [36] = L7_19(L8_20)
      }
      L6_18 = findGameObject2
      L7_19 = "Node"
      L8_20 = "locator2_ship_stay_03"
      L6_18 = L6_18(L7_19, L8_20)
      L7_19 = L6_18
      L6_18 = L6_18.getWorldPos
      L6_18 = L6_18(L7_19)
      L7_19 = findGameObject2
      L8_20 = "Node"
      L9_21 = "locator2_ship_stay_ve01_02"
      L7_19 = L7_19(L8_20, L9_21)
      L8_20 = L7_19
      L7_19 = L7_19.getWorldPos
      L40_52 = L7_19(L8_20)
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[2] = L7_19
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[3] = L8_20
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[4] = L9_21
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[5] = L10_22
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[6] = L11_23
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[7] = L12_24
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[8] = L13_25
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[9] = L14_26
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[10] = L15_27
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[11] = L16_28
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[12] = L17_29
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[13] = L18_30
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[14] = L19_31
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[15] = L20_32
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[16] = L21_33
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[17] = L22_34
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[18] = L23_35
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[19] = L24_36
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[20] = L25_37
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[21] = L26_38
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[22] = L27_39
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[23] = L28_40
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[24] = L29_41
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[25] = L30_42
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[26] = L31_43
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[27] = L32_44
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[28] = L33_45
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[29] = L34_46
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[30] = L35_47
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[31] = L36_48
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[32] = L37_49
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[33] = L38_50
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[34] = L39_51
      ;({
        L6_18,
        [36] = L7_19(L8_20)
      })[35] = L40_52
      L6_18 = {
        L7_19,
        [35] = L8_20(L9_21)
      }
      L7_19 = findGameObject2
      L8_20 = "Node"
      L9_21 = "locator2_ship_stay_ve01_02"
      L7_19 = L7_19(L8_20, L9_21)
      L8_20 = L7_19
      L7_19 = L7_19.getWorldPos
      L7_19 = L7_19(L8_20)
      L8_20 = findGameObject2
      L9_21 = "Node"
      L10_22 = "locator2_ship_stay_03"
      L8_20 = L8_20(L9_21, L10_22)
      L9_21 = L8_20
      L8_20 = L8_20.getWorldPos
      L40_52 = L8_20(L9_21)
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[2] = L8_20
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[3] = L9_21
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[4] = L10_22
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[5] = L11_23
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[6] = L12_24
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[7] = L13_25
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[8] = L14_26
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[9] = L15_27
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[10] = L16_28
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[11] = L17_29
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[12] = L18_30
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[13] = L19_31
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[14] = L20_32
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[15] = L21_33
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[16] = L22_34
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[17] = L23_35
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[18] = L24_36
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[19] = L25_37
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[20] = L26_38
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[21] = L27_39
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[22] = L28_40
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[23] = L29_41
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[24] = L30_42
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[25] = L31_43
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[26] = L32_44
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[27] = L33_45
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[28] = L34_46
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[29] = L35_47
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[30] = L36_48
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[31] = L37_49
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[32] = L38_50
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[33] = L39_51
      ;({
        L7_19,
        [35] = L8_20(L9_21)
      })[34] = L40_52
      L7_19 = Mv_createScriptVehicle
      L8_20 = L5_17
      L9_21 = "ForSm21Ship02"
      L10_22 = "ship_01"
      L11_23 = "locator2_ship_stay_03"
      L12_24 = false
      L8_20 = L7_19(L8_20, L9_21, L10_22, L11_23, L12_24)
      L1_13 = L8_20
      L0_12 = L7_19
      L8_20 = L0_12
      L7_19 = L0_12.setBaseSpeed
      L9_21 = 0
      L7_19(L8_20, L9_21)
      L8_20 = L0_12
      L7_19 = L0_12.setMomentRate
      L9_21 = 0
      L7_19(L8_20, L9_21)
      L8_20 = L0_12
      L7_19 = L0_12.procHorn
      L9_21 = false
      L7_19(L8_20, L9_21)
      L7_19 = Mv_createScriptVehicle
      L8_20 = L6_18
      L9_21 = "ForSm21Ship01"
      L10_22 = "ship_02"
      L11_23 = "locator2_ship_stay_ve01_02"
      L12_24 = false
      L8_20 = L7_19(L8_20, L9_21, L10_22, L11_23, L12_24)
      L3_15 = L8_20
      L2_14 = L7_19
      L8_20 = L2_14
      L7_19 = L2_14.setBaseSpeed
      L9_21 = 0
      L7_19(L8_20, L9_21)
      L8_20 = L2_14
      L7_19 = L2_14.setMomentRate
      L9_21 = 0
      L7_19(L8_20, L9_21)
      L8_20 = L2_14
      L7_19 = L2_14.procHorn
      L9_21 = false
      L7_19(L8_20, L9_21)
      L7_19 = Fn_sendEventComSb
      L8_20 = "requestSpawnLuna"
      L7_19(L8_20)
    end
  end
  L5_17 = start_game_obj
  L5_17()
  L5_17 = Fn_sendEventComSb
  L6_18 = "setPrevPhaseContinue"
  L7_19 = false
  L5_17(L6_18, L7_19)
  L5_17 = Fn_setBgmPoint
  L6_18 = "battle"
  L5_17(L6_18)
  L5_17 = Fn_warpNpc
  L6_18 = "sm21_client"
  L7_19 = "locator2_dad_start_c"
  L5_17(L6_18, L7_19)
  L5_17 = findGameObject2
  L6_18 = "EnemyGenerator"
  L7_19 = "enmgen2_02"
  L5_17 = L5_17(L6_18, L7_19)
  L7_19 = L5_17
  L6_18 = L5_17.requestPrepare
  L6_18(L7_19)
  L6_18 = Fn_sendEventComSb
  L7_19 = "requestBtlobjActive"
  L6_18(L7_19)
  L6_18 = Fn_disappearNpc
  L7_19 = "sm21_guid"
  L6_18(L7_19)
  L6_18 = Fn_missionStart
  L6_18()
  L6_18 = Mob
  L7_19 = L6_18
  L6_18 = L6_18.makeSituationPanic
  L8_20 = true
  L6_18(L7_19, L8_20)
  L6_18 = {
    L7_19,
    L8_20,
    L9_21
  }
  L7_19 = "locator2_dad_btl_01"
  L8_20 = "locator2_dad_btl_02"
  L9_21 = "locator2_dad_btl_03"
  L7_19 = {
    L8_20,
    L9_21,
    L10_22
  }
  L8_20 = "locator2_gf_btl_01"
  L9_21 = "locator2_gf_btl_02"
  L10_22 = "locator2_gf_btl_03"
  L8_20 = {
    L9_21,
    L10_22,
    L11_23
  }
  L9_21 = "locator2_bf_btl_01"
  L10_22 = "locator2_bf_btl_02"
  L11_23 = "locator2_bf_btl_03"
  L9_21 = Fn_moveNpc
  L10_22 = "sm21_client"
  L11_23 = L6_18
  L12_24 = {}
  L12_24.runLength = -1
  L12_24.anim_run_speed = 1.1
  L12_24.anim_speed_over = true
  L9_21 = L9_21(L10_22, L11_23, L12_24)
  L10_22 = Fn_moveNpc
  L11_23 = "gf01"
  L12_24 = L7_19
  L13_25 = {}
  L13_25.runLength = -1
  L13_25.anim_run_speed = 1.2
  L13_25.anim_speed_over = true
  L13_25.anim_run = "wom01_run_afraid_01"
  L10_22 = L10_22(L11_23, L12_24, L13_25)
  L11_23 = Fn_moveNpc
  L12_24 = "bf01"
  L13_25 = L8_20
  L14_26 = {}
  L14_26.runLength = -1
  L14_26.anim_run_speed = 1.3
  L14_26.anim_speed_over = true
  L14_26.anim_run = "man01_run_afraid_01"
  L11_23 = L11_23(L12_24, L13_25, L14_26)
  L12_24 = invokeTask
  function L13_25()
    if L9_21 ~= nil then
      while L9_21:isRunning() do
        wait()
      end
    end
    Fn_playMotionNpc("sm21_client", "breath_00", false)
  end
  L12_24(L13_25)
  L12_24 = invokeTask
  function L13_25()
    if L10_22 ~= nil then
      while L10_22 ~= nil and L10_22:isRunning() do
        wait()
      end
    end
    Fn_playMotionNpc("gf01", "wom01_scared_nevy_in_00", true, {
      isStop = true,
      animBlendDuration = 0.1,
      animSpeed = 2
    })
    wait()
    Fn_playMotionNpc("gf01", "wom01_scared_nevy_00")
  end
  L12_24(L13_25)
  L12_24 = invokeTask
  function L13_25()
    if L11_23 ~= nil then
      while L11_23 ~= nil and L11_23:isRunning() do
        wait()
      end
    end
    Fn_playMotionNpc("bf01", "scared_00", false)
  end
  L12_24(L13_25)
  L12_24 = Fn_userCtrlOn
  L12_24()
  L12_24 = Fn_missionViewWait
  L13_25 = "sm21_02000"
  L12_24(L13_25)
  L12_24 = Fn_captionView
  L13_25 = "sm21_02001"
  L12_24(L13_25)
  while true do
    L12_24 = Fn_sendEventComSb
    L13_25 = "isBattleEnd"
    L14_26 = "enmgen2_01"
    L12_24 = L12_24(L13_25, L14_26)
    if not L12_24 then
      L12_24 = wait
      L12_24()
    end
  end
  if L4_16 ~= nil then
    L13_25 = L4_16
    L12_24 = L4_16.isRunning
    L12_24 = L12_24(L13_25)
    if L12_24 == true then
      L13_25 = L4_16
      L12_24 = L4_16.abort
      L12_24(L13_25)
    end
  end
  L12_24 = Fn_pcSensorOff
  L13_25 = "pccubesensor2_btl_area"
  L12_24(L13_25)
  L12_24 = Fn_pcSensorOff
  L13_25 = "pccubesensor2_btl_warp_01"
  L12_24(L13_25)
  L12_24 = Fn_captionViewWait
  L13_25 = "sm21_02002"
  L12_24(L13_25)
  L12_24 = invokeTask
  function L13_25()
    Sound:playSE("m04_936_sm21", 1, "")
  end
  L12_24(L13_25)
  L12_24 = invokeTask
  function L13_25()
    waitSeconds(0.5)
    Sound:playSE("w08_934_sm21", 1, "")
  end
  L12_24(L13_25)
  L12_24 = invokeTask
  function L13_25()
    waitSeconds(2)
    Sound:playSE("m05_936_sm21", 1, "")
  end
  L12_24(L13_25)
  if L5_17 ~= nil then
    _plus_enemy_cunt = 3
    L13_25 = L5_17
    L12_24 = L5_17.requestSpawn
    L12_24(L13_25)
  end
  L12_24 = Fn_blackout
  L12_24()
  L12_24 = Player
  L13_25 = L12_24
  L12_24 = L12_24.setStay
  L14_26 = true
  L12_24(L13_25, L14_26)
  L12_24 = Fn_userCtrlAllOff
  L12_24()
  L12_24 = Fn_resetPcPos
  L13_25 = "locator2_resetpos_btl_01"
  L12_24(L13_25)
  L12_24 = Fn_warpNpc
  L13_25 = "sm21_client"
  L14_26 = "locator2_dad_btl_04"
  L12_24(L13_25, L14_26)
  L12_24 = Fn_warpNpc
  L13_25 = "gf01"
  L14_26 = "locator2_gf_btl_04"
  L12_24(L13_25, L14_26)
  L12_24 = Fn_warpNpc
  L13_25 = "bf01"
  L14_26 = "locator2_bf_btl_04"
  L12_24(L13_25, L14_26)
  L12_24 = Mv_safeObjectKill
  L13_25 = Fn_findVehicle
  L14_26 = "ship_01"
  L40_52 = L13_25(L14_26)
  L12_24(L13_25, L14_26, L15_27, L16_28, L17_29, L18_30, L19_31, L20_32, L21_33, L22_34, L23_35, L24_36, L25_37, L26_38, L27_39, L28_40, L29_41, L30_42, L31_43, L32_44, L33_45, L34_46, L35_47, L36_48, L37_49, L38_50, L39_51, L40_52, L13_25(L14_26))
  L12_24 = Mv_safeObjectKill
  L13_25 = Fn_findVehicle
  L14_26 = "ship_02"
  L40_52 = L13_25(L14_26)
  L12_24(L13_25, L14_26, L15_27, L16_28, L17_29, L18_30, L19_31, L20_32, L21_33, L22_34, L23_35, L24_36, L25_37, L26_38, L27_39, L28_40, L29_41, L30_42, L31_43, L32_44, L33_45, L34_46, L35_47, L36_48, L37_49, L38_50, L39_51, L40_52, L13_25(L14_26))
  L13_25 = L5_17
  L12_24 = L5_17.setEnemyMarker
  L14_26 = false
  L12_24(L13_25, L14_26)
  L13_25 = L5_17
  L12_24 = L5_17.requestIdlingEnemy
  L14_26 = true
  L12_24(L13_25, L14_26)
  L12_24 = findGameObject2
  L13_25 = "Puppet"
  L14_26 = "enemy06"
  L12_24 = L12_24(L13_25, L14_26)
  L13_25 = findGameObject2
  L14_26 = "Puppet"
  L15_27 = "enemy07"
  L13_25 = L13_25(L14_26, L15_27)
  L15_27 = L12_24
  L14_26 = L12_24.getBrain
  L14_26 = L14_26(L15_27)
  L16_28 = L13_25
  L15_27 = L13_25.getBrain
  L15_27 = L15_27(L16_28)
  repeat
    L16_28 = wait
    L16_28()
    L17_29 = L14_26
    L16_28 = L14_26.isReadyEnemy
    L16_28 = L16_28(L17_29)
  until L16_28
  repeat
    L16_28 = wait
    L16_28()
    L17_29 = L15_27
    L16_28 = L15_27.isReadyEnemy
    L16_28 = L16_28(L17_29)
  until L16_28
  L16_28 = true
  L17_29 = true
  L18_30 = invokeTask
  function L19_31()
    local L0_53
    L0_53 = 0
    while L16_28 do
      if L0_53 % 2 == 0 then
        L14_26:move({
          "locator2_stalker_move_01",
          "locator2_stalker_move_02"
        })
      else
        L14_26:move({
          "locator2_stalker_move_02",
          "locator2_stalker_move_01"
        })
      end
      repeat
        wait()
      until L14_26:isMoveEnd()
      L0_53 = L0_53 + 1
      L0_53 = L0_53 % 2
    end
  end
  L18_30(L19_31)
  L18_30 = invokeTask
  function L19_31()
    local L0_54
    L0_54 = 0
    while L17_29 do
      if L0_54 % 2 == 0 then
        L15_27:move({
          "locator2_stalker_move2_01",
          "locator2_stalker_move2_02"
        })
      else
        L15_27:move({
          "locator2_stalker_move2_02",
          "locator2_stalker_move2_01"
        })
      end
      repeat
        wait()
      until L15_27:isMoveEnd()
      L0_54 = L0_54 + 1
      L0_54 = L0_54 % 2
    end
  end
  L18_30(L19_31)
  L18_30 = findGameObject2
  L19_31 = "EnemyBrain"
  L20_32 = "enemy05"
  L18_30 = L18_30(L19_31, L20_32)
  repeat
    L19_31 = wait
    L19_31()
    L20_32 = L18_30
    L19_31 = L18_30.isReadyEnemy
    L19_31 = L19_31(L20_32)
  until L19_31
  L19_31 = Mv_safeTaskAbort
  L20_32 = L9_21
  L19_31 = L19_31(L20_32)
  L9_21 = L19_31
  L19_31 = Mv_safeTaskAbort
  L20_32 = L10_22
  L19_31 = L19_31(L20_32)
  L10_22 = L19_31
  L19_31 = Mv_safeTaskAbort
  L20_32 = L11_23
  L19_31 = L19_31(L20_32)
  L11_23 = L19_31
  L19_31 = Fn_setCatWarpCheckPoint
  L20_32 = "locator2_resetpos_btl_01"
  L19_31(L20_32)
  L19_31 = Fn_playNpcEventMotion
  L20_32 = "bf01"
  L21_33 = "man01_attack_sm21_00"
  L22_34 = true
  L19_31(L20_32, L21_33, L22_34, L23_35, L24_36)
  L19_31 = _stick
  L20_32 = L19_31
  L19_31 = L19_31.setVisible
  L21_33 = true
  L19_31(L20_32, L21_33)
  L19_31 = Fn_playNpcEventMotion
  L20_32 = "gf01"
  L21_33 = "wom01_nurse_sm21_00"
  L22_34 = true
  L19_31(L20_32, L21_33, L22_34, L23_35, L24_36)
  L19_31 = Fn_playNpcEventMotion
  L20_32 = "sm21_client"
  L21_33 = "man01_hurt_sm21_00"
  L22_34 = true
  L19_31(L20_32, L21_33, L22_34, L23_35, L24_36)
  L20_32 = L18_30
  L19_31 = L18_30.playMotion
  L21_33 = "attack"
  L19_31(L20_32, L21_33)
  L19_31 = _sdemo
  L20_32 = L19_31
  L19_31 = L19_31.set
  L21_33 = "locator2_cam_btl_01"
  L22_34 = "locator2_aim_btl_01"
  L19_31(L20_32, L21_33, L22_34)
  L19_31 = _sdemo
  L20_32 = L19_31
  L19_31 = L19_31.play
  L19_31(L20_32)
  L19_31 = Fn_fadein
  L19_31()
  L19_31 = waitSeconds
  L20_32 = 1
  L19_31(L20_32)
  L19_31 = {L20_32}
  L20_32 = {}
  L20_32.pos = "locator2_cam_btl_02"
  L20_32.time = 3
  L20_32.hashfunc = "EaseInOut"
  L20_32 = {L21_33}
  L21_33 = {}
  L21_33.pos = "locator2_aim_btl_02"
  L21_33.time = 3
  L21_33.hashfunc = "EaseInOut"
  L21_33 = _sdemo
  L22_34 = L21_33
  L21_33 = L21_33.play
  L21_33(L22_34, L23_35, L24_36)
  L21_33 = waitSeconds
  L22_34 = 5
  L21_33(L22_34)
  L21_33 = Fn_kaiwaDemoView
  L22_34 = "sm21_01200k"
  L21_33(L22_34)
  L21_33 = _sdemo
  L22_34 = L21_33
  L21_33 = L21_33.stop
  L21_33(L22_34, L23_35)
  L22_34 = L18_30
  L21_33 = L18_30.endScriptAction
  L21_33(L22_34)
  L16_28 = false
  L17_29 = false
  L22_34 = L14_26
  L21_33 = L14_26.endScriptAction
  L21_33(L22_34)
  L22_34 = L15_27
  L21_33 = L15_27.endScriptAction
  L21_33(L22_34)
  L22_34 = L5_17
  L21_33 = L5_17.setEnemyMarker
  L21_33(L22_34, L23_35)
  L22_34 = L5_17
  L21_33 = L5_17.requestIdlingEnemy
  L21_33(L22_34, L23_35)
  L21_33 = anoterCatWarp
  L21_33 = L21_33()
  L4_16 = L21_33
  L21_33 = Fn_pcSensorOn
  L22_34 = "pccubesensor2_btl_area"
  L21_33(L22_34)
  L21_33 = Fn_pcSensorOn
  L22_34 = "pccubesensor2_btl_warp_01"
  L21_33(L22_34)
  L21_33 = Fn_userCtrlOn
  L21_33()
  L21_33 = Player
  L22_34 = L21_33
  L21_33 = L21_33.setStay
  L21_33(L22_34, L23_35)
  L21_33 = Fn_missionViewWait
  L22_34 = "sm21_02003"
  L21_33(L22_34)
  while true do
    L21_33 = _plus_enemy_cunt
    if L21_33 > 0 then
      L21_33 = wait
      L21_33()
    end
  end
  L21_33 = Fn_setBgmPoint
  L22_34 = "event"
  L21_33(L22_34, L23_35)
  L21_33 = {}
  L22_34 = {}
  for L26_38 = 1, 4 do
    L27_39 = findGameObject2
    L28_40 = "Node"
    L29_41 = "gem2_vital_"
    L30_42 = string
    L30_42 = L30_42.format
    L31_43 = "%02d"
    L32_44 = L26_38
    L30_42 = L30_42(L31_43, L32_44)
    L29_41 = L29_41 .. L30_42
    L27_39 = L27_39(L28_40, L29_41)
    L21_33[L26_38] = L27_39
    L27_39 = findGameObject2
    L28_40 = "Node"
    L29_41 = "gem2_energy_"
    L30_42 = string
    L30_42 = L30_42.format
    L31_43 = "%02d"
    L32_44 = L26_38
    L30_42 = L30_42(L31_43, L32_44)
    L29_41 = L29_41 .. L30_42
    L27_39 = L27_39(L28_40, L29_41)
    L22_34[L26_38] = L27_39
    L27_39 = L21_33[L26_38]
    if L27_39 ~= nil then
      L27_39 = L21_33[L26_38]
      L28_40 = L27_39
      L27_39 = L27_39.setActive
      L29_41 = false
      L27_39(L28_40, L29_41)
    end
    L27_39 = L22_34[L26_38]
    if L27_39 ~= nil then
      L27_39 = L22_34[L26_38]
      L28_40 = L27_39
      L27_39 = L27_39.setActive
      L29_41 = false
      L27_39(L28_40, L29_41)
    end
  end
  L23_35()
  L23_35()
  L23_35(L24_36)
  L23_35(L24_36, L25_37)
  L23_35(L24_36, L25_37)
  L23_35(L24_36, L25_37)
  L23_35(L24_36, L25_37)
  L26_38 = false
  L23_35(L24_36, L25_37, L26_38)
  L26_38 = false
  L23_35(L24_36, L25_37, L26_38)
  L26_38 = true
  L27_39 = 0
  L28_40 = false
  L23_35(L24_36, L25_37, L26_38, L27_39, L28_40)
  L26_38 = "talk_01"
  L26_38 = 5
  L27_39 = 10
  L23_35(L24_36, L25_37, L26_38, L27_39)
  L23_35(L24_36)
  L23_35()
  L23_35(L24_36)
  L23_35(L24_36)
  L23_35()
  L23_35(L24_36, L25_37)
  L26_38 = "gf01"
  L26_38 = false
  L27_39 = true
  L28_40 = false
  L29_41 = Fn_missionView
  L30_42 = "sm21_02004"
  L29_41(L30_42)
  L29_41 = waitSeconds
  L30_42 = 0.5
  L29_41(L30_42)
  L29_41 = Fn_captionView
  L30_42 = "sm21_02005"
  L29_41(L30_42)
  L29_41 = Fn_playPlayerMotion
  L30_42 = _event_motion_table
  L30_42 = L30_42.label01
  L31_43 = 0
  L32_44 = 0.2
  L33_45 = true
  L29_41(L30_42, L31_43, L32_44, L33_45)
  L29_41 = waitSeconds
  L30_42 = 1
  L29_41(L30_42)
  L29_41 = Fn_moveNpc
  L30_42 = "gf01"
  L31_43 = {L32_44}
  L32_44 = "locator2_gf_photo_02"
  L32_44 = {}
  L32_44.recast = true
  L32_44.navimesh = false
  L32_44.arrivedLength = 0
  L29_41 = L29_41(L30_42, L31_43, L32_44)
  L30_42 = Fn_moveNpc
  L31_43 = "bf01"
  L32_44 = {L33_45}
  L33_45 = "locator2_bf_photo_02"
  L33_45 = {}
  L33_45.recast = true
  L33_45.navimesh = false
  L33_45.arrivedLength = 0
  L30_42 = L30_42(L31_43, L32_44, L33_45)
  L31_43 = waitSeconds
  L32_44 = 0.6
  L31_43(L32_44)
  L31_43 = Fn_moveNpc
  L32_44 = "sm21_client"
  L33_45 = {L34_46}
  L34_46 = "locator2_dad_photo_02"
  L34_46 = {}
  L34_46.recast = true
  L34_46.navimesh = false
  L34_46.arrivedLength = 0
  L31_43 = L31_43(L32_44, L33_45, L34_46)
  L32_44 = invokeTask
  function L33_45()
    while L29_41:isRunning() do
      wait()
    end
    wait()
    Fn_turnNpc("gf01")
    Fn_playNpcEventMotion("gf01", "wom01_photo_sm21_00", true, 0.3, false)
  end
  L32_44(L33_45)
  L32_44 = invokeTask
  function L33_45()
    while L30_42:isRunning() do
      wait()
    end
    wait()
    Fn_turnNpc("bf01")
    Fn_playNpcEventMotion("bf01", "man01_photo_sm21_00", true, 0.3, false)
  end
  L32_44(L33_45)
  L32_44 = invokeTask
  function L33_45()
    while L31_43:isRunning() do
      wait()
    end
    wait()
    Fn_turnNpc("sm21_client")
    Fn_playNpcEventMotion("sm21_client", "man01_photo_sm21_01", true, 0.3, false)
    L26_38 = true
  end
  L32_44(L33_45)
  L32_44 = waitSeconds
  L33_45 = 2
  L32_44(L33_45)
  L32_44 = Fn_missionViewEnd
  L32_44()
  L32_44 = invokeTask
  function L33_45()
    while true do
      if HUD:isPhotoMode() == false then
        if L27_39 == false then
          HUD:enablePhotoMode(false)
          Fn_captionViewWait("sm21_02006")
        end
        L27_39 = false
        HUD:enablePhotoMode(true)
        HUD:setPhotoMode(true)
        while HUD:isPhotoMode() == false do
          wait()
        end
      end
      wait()
    end
  end
  L32_44 = L32_44(L33_45)
  L33_45 = false
  L34_46 = Photo
  L34_46 = L34_46.create
  L35_47 = kPHOTO_CAPTION_OFF
  L36_48 = kPHOTO_TYPE_ALL
  L37_49 = true
  L38_50 = {}
  L38_50.near = 1.86
  L38_50.far = 5.5
  L39_51 = {}
  L39_51.left = -0.5
  L39_51.right = 0.5
  L39_51.top = -0.5
  L39_51.bottom = 0.5
  L40_52 = "sm21_user_photo01"
  L34_46 = L34_46(L35_47, L36_48, L37_49, L38_50, L39_51, L40_52)
  L36_48 = L34_46
  L35_47 = L34_46.set
  L37_49 = _dad_hdl
  L38_50 = bn_head
  L35_47(L36_48, L37_49, L38_50)
  L36_48 = L34_46
  L35_47 = L34_46.set
  L37_49 = _puppet_tbl
  L37_49 = L37_49.bf01
  L38_50 = bn_head
  L35_47(L36_48, L37_49, L38_50)
  L36_48 = L34_46
  L35_47 = L34_46.set
  L37_49 = _puppet_tbl
  L37_49 = L37_49.gf01
  L38_50 = bn_head
  L35_47(L36_48, L37_49, L38_50)
  while not L33_45 do
    L36_48 = L34_46
    L35_47 = L34_46.run
    L35_47(L36_48)
    repeat
      L35_47 = wait
      L35_47()
      L36_48 = L34_46
      L35_47 = L34_46.isRunning
      L35_47 = L35_47(L36_48)
    until not L35_47
    L36_48 = L34_46
    L35_47 = L34_46.getPhotoState
    L35_47 = L35_47(L36_48)
    L36_48 = 0
    L37_49 = 0
    L38_50 = 0
    L39_51 = 0
    L40_52 = nil
    if L26_38 == false then
      Fn_captionViewWait("sm21_02007")
    elseif type(L35_47) ~= "table" then
      Fn_captionViewWait("sm21_02008")
      HUD:enablePhotoMode(true)
    elseif type(L35_47) == "table" then
      if #L35_47 < 3 then
        Fn_captionViewWait("sm21_02008")
      elseif #L35_47 == 3 then
        for _FORV_44_ = 1, #L35_47 do
          if L35_47[_FORV_44_].state == kPHOTO_ANGLE or L35_47[_FORV_44_].state == kPHOTO_BACK then
            L36_48 = L36_48 + 1
          elseif L35_47[_FORV_44_].state == kPHOTO_FAR then
            L37_49 = L37_49 + 1
          elseif L35_47[_FORV_44_].state == kPHOTO_NEAR then
            L38_50 = L37_49 + 1
          else
            L39_51 = L39_51 + 1
          end
        end
        if _FOR_:isPhotoTripodMode() then
          L40_52 = "sm21_02016"
        elseif L39_51 == 3 then
          L32_44 = Mv_safeTaskAbort(L32_44)
          Sound:pulse("success")
          Fn_captionView("sm21_02010")
          L33_45 = true
          break
        elseif L36_48 >= 1 then
          L40_52 = "sm21_02011"
        elseif L37_49 > L38_50 then
          L40_52 = "sm21_02012"
        elseif L37_49 < L38_50 then
          L40_52 = "sm21_02015"
        end
        Fn_captionViewWait(L40_52)
      end
    end
    wait()
  end
  L36_48 = L34_46
  L35_47 = L34_46.kill
  L35_47(L36_48)
  L34_46 = nil
  L35_47 = HUD
  L36_48 = L35_47
  L35_47 = L35_47.setPhotoMode
  L37_49 = false
  L35_47(L36_48, L37_49)
  L35_47 = HUD
  L36_48 = L35_47
  L35_47 = L35_47.enablePhotoMode
  L37_49 = false
  L35_47(L36_48, L37_49)
  L35_47 = waitSeconds
  L36_48 = 4
  L35_47(L36_48)
  L35_47 = Fn_playMotionNpc
  L36_48 = "gf01"
  L37_49 = "talk_01"
  L38_50 = false
  L35_47(L36_48, L37_49, L38_50)
  L35_47 = Fn_playMotionNpc
  L36_48 = "bf01"
  L37_49 = "talk_01"
  L38_50 = false
  L35_47(L36_48, L37_49, L38_50)
  L35_47 = waitSeconds
  L36_48 = 1
  L35_47(L36_48)
  L35_47 = Fn_kaiwaDemoView
  L36_48 = "sm21_01400k"
  L35_47(L36_48)
  L35_47 = Fn_userCtrlOn
  L35_47()
  L35_47 = Fn_setKeepPlayerPos
  L35_47()
  L35_47 = Fn_setNextMissionFlag
  L35_47()
  L35_47 = Fn_nextMission
  L35_47()
  L35_47 = Fn_exitSandbox
  L35_47()
end
function Finalize()
  HUD:enablePhotoMode(false)
  Mob:makeSituationPanic(false)
end
function pccubesensor2_btl_area_OnEnter()
  Fn_naviKill()
end
function pccubesensor2_btl_area_OnLeave()
  invokeTask(function()
    Player:setStay(true)
    Fn_naviSet(findGameObject2("Node", "pccubesensor2_btl_area"))
    Fn_captionViewWait("sm21_02014")
    Player:setStay(false)
  end)
end
function pccubesensor2_btl_warp_01_OnLeave()
  runCatWarp()
end
