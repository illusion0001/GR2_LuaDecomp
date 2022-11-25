import("common")
import("GameDatabase")
import("EventData")
import("Pad")
import("Debug")
import("Font")
import("Sound")
import("Player")
import("GlobalGem")
import("Time")
import("Ugc")
import("Yaml")
import("DeltaTimer")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Event2/Common/NpcCommon.lua")
dofile("/Game/Event2/Common/CameraCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Debug/Action/debug_stage.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/bgset/bg_crane_ship.lua")
dofile("/Game/Misc/gravity_storm.lua")
dofile("/Game/Misc/cage_controller.lua")
dofile("/Game/Misc/ship_controller.lua")
dofile("/Game/Misc/balloon.lua")
dofile("/Game/Misc/fatal_marker.lua")
dofile("/Game/Misc/gm_boss.lua")
dofile("/Game/Misc/sdemo.lua")
_debugLine = 0
_debugDispX = 0
temp_spawn_set = {
  {
    type = "stalker",
    locator = "locator_01",
    name = "lunafishowner_01"
  }
}
temp_spawn_set2 = {
  {
    type = "stalker",
    locator = "locator_01",
    name = "lunafishowner_02"
  }
}
enmgen2_01 = {
  spawnOnStart = false,
  autoPrepare = false,
  spawnSet = {
    {
      type = "hand",
      locator = "locator_01",
      name = "officer01",
      ai_spawn_option = "Hand/sample"
    }
  },
  addHandSpawnSetName0 = "handSpawnSet0",
  handSpawnSet0 = {
    {
      type = "stalker",
      locator = "locator_01",
      name = "call_soldier01"
    },
    {
      type = "stalker",
      locator = "locator_01",
      name = "call_soldier02"
    },
    {
      type = "stalker",
      locator = "locator_01",
      name = "call_soldier03"
    },
    {
      type = "stalker",
      locator = "locator_01",
      name = "call_soldier04"
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
  onSpawn = function(A0_6, A1_7)
    local L2_8
    L2_8 = print
    L2_8(tostring(A1_7:getPhase()))
    L2_8 = print
    L2_8(A1_7:getName())
  end,
  onObjectDead = function(A0_9, A1_10)
  end,
  onObjectAsh = function(A0_11, A1_12)
  end,
  enemyDeadNum = 0,
  getEnemyMax = function(A0_13)
    local L1_14
  end,
  getEnemyDeadNum = function(A0_15)
    local L1_16
  end,
  isEnemyAllDead = function(A0_17)
    local L1_18
  end,
  getEnemyName = function(A0_19)
    local L1_20
  end
}
function debugDispPrint(A0_21)
  local L1_22
  L1_22 = _debugDispX
  L1_22 = L1_22 + 50
  Font:debugPrint(L1_22, 100 + 20 * _debugLine, A0_21)
  _debugLine = _debugLine + 1
end
function createEffect(A0_23, A1_24)
  local L2_25
  L2_25 = createGameObject2
  L2_25 = L2_25("Effect")
  L2_25:setName(A0_23)
  L2_25:setModelName(A0_23)
  L2_25:setLoop(true)
  L2_25:play()
  A1_24:appendChild(L2_25)
  return L2_25
end
function main()
  local L0_26, L1_27, L2_28, L3_29, L4_30, L5_31, L6_32, L7_33, L8_34, L9_35, L10_36, L11_37, L12_38, L13_39, L14_40, L15_41, L16_42, L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62
  L0_26 = Ugc
  L1_27 = L0_26
  L0_26 = L0_26.serviceStart
  L0_26(L1_27)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {L3_29, L4_30}
  L3_29 = "Display"
  L4_30 = "File Asset Status"
  L3_29 = false
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {L3_29, L4_30}
  L3_29 = "Display"
  L4_30 = "Warning Indicator"
  L3_29 = false
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {L3_29, L4_30}
  L3_29 = "Display"
  L4_30 = "Debug Draw"
  L3_29 = true
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {L3_29, L4_30}
  L3_29 = "Display"
  L4_30 = "Screen Console"
  L3_29 = true
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {
    L3_29,
    L4_30,
    L5_31
  }
  L3_29 = "Display"
  L4_30 = "DebugDrawGroup"
  L5_31 = "ScriptQuery"
  L3_29 = true
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {
    L3_29,
    L4_30,
    L5_31
  }
  L3_29 = "Display"
  L4_30 = "DebugDrawGroup"
  L5_31 = "ScriptDebugDraw"
  L3_29 = true
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setSwitch
  L2_28 = {
    L3_29,
    L4_30,
    L5_31
  }
  L3_29 = "Development"
  L4_30 = "Console"
  L5_31 = "Script"
  L3_29 = true
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = Debug
  L1_27 = L0_26
  L0_26 = L0_26.setValue
  L2_28 = {
    L3_29,
    L4_30,
    L5_31,
    L6_32
  }
  L3_29 = "Development"
  L4_30 = "Network"
  L5_31 = "Status"
  L6_32 = "ParamTableLocal"
  L3_29 = true
  L0_26(L1_27, L2_28, L3_29)
  L0_26 = createSandbox2
  L1_27 = "father2"
  L0_26 = L0_26(L1_27)
  L2_28 = L0_26
  L1_27 = L0_26.setString
  L3_29 = "g_filename"
  L4_30 = "/Game/Event2/father2.lua"
  L1_27(L2_28, L3_29, L4_30)
  L2_28 = L0_26
  L1_27 = L0_26.try_init
  L1_27(L2_28)
  L2_28 = L0_26
  L1_27 = L0_26.waitForReady
  L1_27(L2_28)
  L1_27 = g_own
  L2_28 = L1_27
  L1_27 = L1_27.setGameObject
  L3_29 = "father2"
  L4_30 = L0_26
  L1_27(L2_28, L3_29, L4_30)
  L2_28 = L0_26
  L1_27 = L0_26.try_start
  L1_27(L2_28)
  while true do
    L1_27 = GameDatabase
    L2_28 = L1_27
    L1_27 = L1_27.get
    L3_29 = ggd
    L3_29 = L3_29.GlobalSystemFlags__PlayerSpawned
    L1_27 = L1_27(L2_28, L3_29)
    if not L1_27 then
      L1_27 = wait
      L1_27()
    end
  end
  L0_26 = nil
  L1_27 = SDemo
  L1_27 = L1_27.create
  L2_28 = "aaa"
  L1_27 = L1_27(L2_28)
  _sdemo = L1_27
  L1_27 = DeltaTimer
  L2_28 = L1_27
  L1_27 = L1_27.new
  L1_27 = L1_27(L2_28)
  L3_29 = L1_27
  L2_28 = L1_27.start
  L2_28(L3_29)
  L2_28 = createGameObject2
  L3_29 = "Area"
  L2_28 = L2_28(L3_29)
  L4_30 = L2_28
  L3_29 = L2_28.setName
  L5_31 = "pi2_a_root"
  L3_29(L4_30, L5_31)
  L3_29 = 300
  L4_30 = L3_29 + 400
  L5_31 = "ve_crane_root"
  L6_32 = "mine_po_setup"
  L7_33 = createCraneShipJir
  L10_36 = L7_33()
  L11_37 = createCraneCage
  L13_39 = L11_37()
  L14_40 = L7_33.appendChild
  L14_40(L15_41, L16_42)
  L14_40 = initializeAllGameObjects
  L14_40()
  L14_40 = waitForReadyAllGameObjects
  L14_40()
  L14_40 = startAllGameObjects
  L14_40()
  L14_40 = L2_28.getDescendant
  L14_40 = L14_40(L15_41, L16_42)
  L18_44 = true
  L15_41(L16_42, L17_43, L18_44)
  for L18_44, L19_45 in L15_41(L16_42) do
    L21_47 = L19_45
    L20_46 = L19_45.setEffectiveness
    L22_48 = false
    L23_49 = true
    L20_46(L21_47, L22_48, L23_49)
  end
  L19_45 = L7_33
  L18_44 = L7_33.getNodeLocalPosRot
  L20_46 = "ve_cage_01"
  L36_62 = L18_44(L19_45, L20_46)
  L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L18_44(L19_45, L20_46))
  L16_42(L17_43)
  L19_45 = L7_33
  L18_44 = L7_33.getNodeLocalPosRot
  L20_46 = "pos_rudder_00"
  L36_62 = L18_44(L19_45, L20_46)
  L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L18_44(L19_45, L20_46))
  L16_42(L17_43)
  if L10_36 then
    L19_45 = L7_33
    L18_44 = L7_33.getNodeLocalPosRot
    L20_46 = "pos_lever_01"
    L36_62 = L18_44(L19_45, L20_46)
    L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L18_44(L19_45, L20_46))
    L16_42(L17_43)
  end
  L18_44 = L7_33
  L19_45 = "wire_nk_01"
  L20_46 = nil
  L21_47 = L12_38
  L22_48 = nil
  L23_49 = Vector
  L24_50 = 0
  L25_51 = -0.1
  L26_52 = 0
  L36_62 = L23_49(L24_50, L25_51, L26_52)
  L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L23_49(L24_50, L25_51, L26_52))
  L16_42(L17_43)
  L18_44 = L1_27
  L36_62 = L17_43(L18_44)
  L16_42(L17_43, L18_44, L19_45, L20_46, L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L17_43(L18_44))
  L18_44 = "pi2_a_16"
  L18_44 = L16_42
  L19_45 = "ve_cage_01"
  L18_44 = L17_43(L18_44, L19_45)
  L20_46 = L7_33
  L19_45 = L7_33.setPos
  L21_47 = Vector
  L22_48 = 0
  L23_49 = L4_30
  L24_50 = 0
  L21_47 = L21_47(L22_48, L23_49, L24_50)
  L21_47 = L17_43 + L21_47
  L21_47 = L21_47 - L15_41
  L19_45(L20_46, L21_47)
  L20_46 = L7_33
  L19_45 = L7_33.setForceMove
  L19_45(L20_46)
  L19_45 = ShipCtrl
  L19_45 = L19_45.create
  L19_45 = L19_45()
  L21_47 = L19_45
  L20_46 = L19_45.standby
  L22_48 = L7_33
  L23_49 = L5_31
  L24_50 = L6_32
  L25_51 = nil
  L26_52 = L9_35
  L27_53 = L10_36
  L28_54 = L8_34
  L20_46(L21_47, L22_48, L23_49, L24_50, L25_51, L26_52, L27_53, L28_54)
  function L20_46()
    L19_45:_craneOperation()
  end
  function L21_47()
    L19_45:_craneOperation(true)
  end
  L22_48 = Cage
  L22_48 = L22_48.create
  L23_49 = L11_37
  L24_50 = L12_38
  L22_48 = L22_48(L23_49, L24_50)
  L24_50 = L22_48
  L23_49 = L22_48.setMoveFunc
  L25_51 = L20_46
  L26_52 = L21_47
  L23_49(L24_50, L25_51, L26_52)
  L24_50 = L22_48
  L23_49 = L22_48.setMovingParam
  L25_51 = L4_30
  L23_49(L24_50, L25_51)
  L24_50 = L22_48
  L23_49 = L22_48.setupMarker
  L23_49(L24_50)
  L23_49 = GravityStorm
  L23_49 = L23_49.create
  L24_50 = Vector
  L25_51 = 0
  L26_52 = L3_29
  L27_53 = 0
  L36_62 = L24_50(L25_51, L26_52, L27_53)
  L23_49 = L23_49(L24_50, L25_51, L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L24_50(L25_51, L26_52, L27_53))
  L25_51 = L23_49
  L24_50 = L23_49.run
  L24_50(L25_51)
  L24_50 = true
  L25_51 = invokeTask
  function L26_52()
    while true do
      if L23_49:isEndStorm() and L24_50 then
        L2_28:setEffectiveness(true, true)
        for _FORV_3_, _FORV_4_ in ipairs(L14_40) do
          _FORV_4_:setEffectiveness(true, true)
        end
        L24_50 = false
      end
      if not L23_49:isEndStorm() and not L24_50 then
        L2_28:setEffectiveness(false, true)
        for _FORV_3_, _FORV_4_ in ipairs(L14_40) do
          _FORV_4_:setEffectiveness(false, true)
        end
        L24_50 = true
      end
      wait()
    end
  end
  L25_51(L26_52)
  L25_51 = {}
  L25_51.motion1 = "kit01_down_a_00"
  L25_51.motion2 = "kit01_down_b_00"
  _kitMotionTable = L25_51
  L25_51 = Fn_loadPlayerMotion
  L26_52 = _kitMotionTable
  L25_51(L26_52)
  L25_51 = _loadEventData
  L26_52 = "test_kudo"
  L25_51(L26_52)
  L25_51 = Player
  L26_52 = L25_51
  L25_51 = L25_51.reset
  L27_53 = Player
  L27_53 = L27_53.kReset_Standing
  L29_55 = L12_38
  L28_54 = L12_38.getWorldPos
  L28_54 = L28_54(L29_55)
  L29_55 = Vector
  L30_56 = 0
  L31_57 = -4
  L29_55 = L29_55(L30_56, L31_57, L32_58)
  L28_54 = L28_54 + L29_55
  L29_55 = Quaternion
  L30_56 = 0
  L31_57 = 0
  L36_62 = L29_55(L30_56, L31_57, L32_58, L33_59)
  L25_51(L26_52, L27_53, L28_54, L29_55, L30_56, L31_57, L32_58, L33_59, L34_60, L35_61, L36_62, L29_55(L30_56, L31_57, L32_58, L33_59))
  L25_51 = wait
  L25_51()
  L25_51 = Area
  L26_52 = L25_51
  L25_51 = L25_51.setEnableLoading
  L27_53 = true
  L25_51(L26_52, L27_53)
  L25_51 = {}
  function L26_52()
    local L0_63
    L0_63 = {}
    L0_63.gen = findGameObject2("EnemyGenerator", "enmgen2_01")
    function L0_63.spawn()
      if L0_63.gen then
        L0_63.gen:requestSpawn()
      end
    end
    function L0_63.setSpawnSet()
      if L0_63.gen then
        L0_63.gen:getSpecTable().spawnSethand0 = temp_spawn_set
      end
    end
    return L0_63
  end
  L25_51.new = L26_52
  L26_52 = findGameObject2
  L27_53 = "EnemyGenerator"
  L28_54 = "enmgen2_01"
  L26_52 = L26_52(L27_53, L28_54)
  _enmg = L26_52
  L26_52 = _enmg
  if L26_52 then
    L26_52 = _enmg
    L27_53 = L26_52
    L26_52 = L26_52.requestSpawn
    L26_52(L27_53)
  end
  repeat
    L26_52 = wait
    L26_52()
    L26_52 = false
  until L26_52
  L26_52 = Fn_captionView
  L27_53 = "\227\130\173\227\131\163\227\131\169\228\189\156\230\136\144\228\184\173"
  L28_54 = 0
  L26_52(L27_53, L28_54)
  L26_52 = {L27_53, L28_54}
  L27_53 = "cid01"
  L28_54 = "sis01"
  L27_53 = _createNodes
  L28_54 = L26_52
  L29_55 = "locator2_main"
  L27_53(L28_54, L29_55)
  L27_53 = {}
  L28_54 = _insertTable
  L29_55 = L27_53
  L30_56 = L26_52
  L28_54(L29_55, L30_56)
  L28_54 = Fn_setupNpc
  L29_55 = L27_53
  L28_54 = L28_54(L29_55)
  L29_55 = initializeAllGameObjects
  L29_55()
  L29_55 = waitForReadyAllGameObjects
  L29_55()
  L29_55 = startAllGameObjects
  L29_55()
  L29_55 = Fn_userCtrlOff
  L29_55()
  L29_55 = Fn_captionView
  L30_56 = "\227\130\173\227\131\163\227\131\169\228\189\156\230\136\144\231\181\130\228\186\134"
  L29_55(L30_56)
  L29_55 = invokeTask
  function L30_56()
    local L0_64
    L0_64 = {}
    L0_64.mot_in = "shock_in_00"
    L0_64.mot = "shock_00"
    L0_64.mot_out = "shock_out_00"
    L0_64.stay = "stay"
    L0_64.surprise = "man01_surprise_02"
    L0_64.nevy_in = "wom01_scared_nevy_in_00"
    L0_64.nevy = "wom01_scared_nevy_00"
    L0_64.nevy_out = "man01_scared_out_00"
    L0_64.run_afraid_00 = "wom01_run_afraid_00"
    L0_64.run_afraid_01 = "wom01_run_afraid_01"
    L0_64.inform_00 = "wom01_inform_nevy_00"
    L0_64.inform_01 = "wom01_inform_nevy_01"
    Fn_loadNpcEventMotion("sis01", L0_64)
    while true do
      Fn_playMotionNpc("sis01", "wom01_scared_nevy_in_00", true, {isStop = true, animBlendDuration = 0.1})
      Fn_playMotionNpc("sis01", "wom01_scared_nevy_00", false)
      wait()
      Fn_playMotionNpc("sis01", "man01_scared_out_00", true, {isStop = true, animBlendDuration = 0.1})
      Fn_playMotionNpc("sis01", "stay", false, {animBlendDuration = 0.1})
      wait(60)
    end
  end
  L29_55(L30_56)
  _crate_max = 21
  _crate_cnt = 21
  L29_55 = {}
  function L30_56(A0_65)
    _crate_cnt = _crate_cnt - 1
    print("crate broken = " .. A0_65:getName() .. " count:" .. _crate_cnt)
  end
  function L31_57(A0_66, A1_67)
    print("callback test " .. A0_66:getName())
    print(tostring(A1_67))
  end
  for L35_61 = 1, _crate_max do
    L36_62 = findGameObject2
    L36_62 = L36_62("GimmickBg", "bg2_box_" .. string.format("%02d", L35_61 - 1))
    if L36_62 then
      L29_55[L35_61] = L36_62
      L29_55[L35_61]:setEventListener("broken", L30_56)
      L29_55[L35_61]:setLockonPermission(true)
      Fn_setGimmickBgDamageFunc(L29_55[L35_61], L31_57)
    end
  end
  L32_58(L33_59)
  resource_box_tbl = L32_58
  for L35_61 = 21, 22 do
    L36_62 = "bg2_box_"
    L36_62 = L36_62 .. string.format("%02d", L35_61)
    if findGameObject2("GimmickBg", L36_62) ~= nil then
      findGameObject2("GimmickBg", L36_62):setCollidableBlockEnable(false)
      findGameObject2("GimmickBg", L36_62):setEventListener("dynamic", function(A0_68)
        local L1_69, L2_70
        L1_69 = createGameObject2
        L2_70 = "DNode"
        L1_69 = L1_69(L2_70)
        L2_70 = A0_68.getName
        L2_70 = L2_70(A0_68)
        L1_69:setName("DNode_" .. L2_70)
        L1_69:setAsSphere(0.5)
        A0_68:getDynamicObject():setName("dyn_" .. L2_70)
        A0_68:getDynamicObject():appendChild(L1_69)
        L1_69:try_init()
        L1_69:waitForReady()
        L1_69:try_start()
        resource_box_tbl[L2_70].DNode = L1_69
      end)
      findGameObject2("GimmickBg", L36_62):setEventListener("broken", function(A0_71)
        local L1_72
        L1_72 = A0_71.getName
        L1_72 = L1_72(A0_71)
        print(L1_72 .. "\227\129\140\229\163\138\227\130\140\227\129\159")
        if not resource_box_tbl[L1_72] or resource_box_tbl[L1_72].DNode then
        end
      end)
      resource_box_tbl[L36_62] = {
        hdl = findGameObject2("GimmickBg", L36_62),
        grab = false,
        DNode = nil
      }
    end
  end
  L32_58(L33_59)
  while true do
    if L32_58 == 0 then
      L35_61 = cameraCheak
      L35_61()
    elseif L32_58 == 1 then
      L35_61 = demoCheak
      L35_61()
    elseif L32_58 == 2 then
      L35_61 = iconCheak
      L35_61()
    elseif L32_58 == 3 then
      L35_61 = npcCheak
      L35_61()
    elseif L32_58 == 4 then
      L35_61 = gaugeCheak
      L35_61()
    elseif L32_58 == 5 then
      L35_61 = pcCheak
      L35_61()
    elseif L32_58 == 6 then
      L35_61 = ambCheak
      L35_61()
    elseif L32_58 == 7 then
      L35_61 = sensorCheak
      L35_61()
    elseif L32_58 == 8 then
      L35_61 = sdemoCheak
      L35_61()
    else
      if L32_58 == 9 then
        L35_61 = camera2Cheak
        L35_61()
      else
      end
    end
    L35_61 = Pad
    L36_62 = L35_61
    L35_61 = L35_61.getButton
    L35_61 = L35_61(L36_62, Pad.kButton_LL)
    if L35_61 then
      L35_61 = Pad
      L36_62 = L35_61
      L35_61 = L35_61.getButton
      L35_61 = L35_61(L36_62, Pad.kButton_L1)
      if L35_61 == true then
        L35_61 = Fn_tutorialCaptionKill
        L35_61()
      end
    end
    L35_61 = isCratsBroken
    L36_62 = L29_55
    L35_61 = L35_61(L36_62)
    if L35_61 and not L33_59 then
      L35_61 = print
      L36_62 = "isBroken()\229\136\164\229\174\154\227\129\167\227\129\175\227\128\129\227\129\153\227\129\185\227\129\166\229\163\138\227\130\140\227\129\190\227\129\151\227\129\159"
      L35_61(L36_62)
    end
    L35_61 = _crate_cnt
    if L35_61 <= 0 and not L34_60 then
      L35_61 = print
      L36_62 = "setEventListener\229\136\164\229\174\154\227\129\167\229\164\137\230\149\176\227\130\146\230\184\155\231\174\151\227\129\151\227\129\166\227\128\129\227\129\153\227\129\185\227\129\166\229\163\138\227\130\140\227\129\190\227\129\151\227\129\159"
      L35_61(L36_62)
    end
    L35_61 = wait
    L35_61()
  end
end
function pccubesensormulti2_01_OnEnter()
  invokeTask(function()
    Fn_captionView("ic_tutorial_00210", 0)
  end)
end
function pccubesensormulti2_01_OnLeave()
  HUD:captionEnd()
end
function isCratsBroken(A0_73)
  local L2_74, L3_75
  if L2_74 == 0 then
    return L2_74
  end
  for _FORV_4_ = 1, #A0_73 do
    if A0_73[_FORV_4_]:isBroken() == false then
      return false
    end
  end
  return L2_74
end
function cratsRestore(A0_76)
  local L1_77, L2_78, L3_79
  for _FORV_4_ = 1, #A0_76 do
    A0_76[_FORV_4_]:requestRestore()
  end
end
function getCDemoTable(A0_80)
  local L1_81, L2_82, L3_83
  L1_81 = {}
  L1_81.capture_wait = false
  L1_81.finish = false
  L2_82 = {}
  function L3_83(A0_84)
    print("RequestCapture for " .. A0_84)
    invokeSystemTask(function()
      HUD:menuNeedScriptingCapture()
      while CDemo.capture_wait do
        wait()
      end
      print("\227\130\173\227\131\163\227\131\151\227\131\129\227\131\163\227\129\174\232\168\177\229\143\175\227\129\140\229\135\186\227\129\190\227\129\151\227\129\159")
      HUD:menuNotifyReadyCapture()
    end)
    return 0
  end
  L2_82.RequestCapture = L3_83
  function L3_83(A0_85, A1_86, A2_87, A3_88)
    print("OnForward to " .. A0_85 .. " by " .. A1_86)
    invokeSystemTask(function()
      waitSeconds(1)
      Sound:pulse("success")
    end)
    return A2_87
  end
  L2_82.OnForward = L3_83
  function L3_83(A0_89, A1_90, A2_91, A3_92)
    print("OnBackward to " .. A0_89 .. " by " .. A1_90)
    return A2_91
  end
  L2_82.OnBackward = L3_83
  function L3_83(A0_93, A1_94, A2_95, A3_96)
    print("OnMove to " .. A0_93 .. " by " .. A1_94)
    return 0
  end
  L2_82.OnMove = L3_83
  function L3_83()
    HUD:fadein(0.5)
    while not HUD:faderStability() do
      wait()
    end
    print("OnPlay")
    return 0
  end
  L2_82.OnPlay = L3_83
  function L3_83()
    CDemo.finish = true
    print("OnEnd")
    return 0
  end
  L2_82.OnEnd = L3_83
  function L3_83(A0_97)
    print("OnPause at " .. A0_97)
    return 0
  end
  L2_82.OnPause = L3_83
  function L3_83(A0_98)
    CDemo.finish = true
    print("OnCancel at " .. A0_98)
    return 0
  end
  L2_82.OnCancel = L3_83
  L1_81[A0_80] = L2_82
  return L1_81
end
function _createSandbox(A0_99)
  createSandbox2(A0_99):setString("g_filename", "/Game/Test/" .. A0_99 .. ".lua")
  createSandbox2(A0_99):try_init()
  createSandbox2(A0_99):waitForReady()
  createSandbox2(A0_99):try_start()
end
function _loadEventData(A0_100)
  local L1_101, L2_102, L3_103
  L1_101 = loadFileAsset
  L2_102 = "evb"
  L3_103 = "evx/"
  L3_103 = L3_103 .. A0_100
  L1_101 = L1_101(L2_102, L3_103)
  L2_102, L3_103 = nil, nil
  if L1_101 ~= nil then
    L1_101:wait()
    L2_102 = L1_101:getRoot()
    L3_103 = EventData:create(A0_100, nil, L2_102)
    L3_103:try_init()
    L3_103:waitForReady()
    L3_103:try_start()
  end
end
function _createNewMarker(A0_104, A1_105, A2_106, A3_107)
  local L4_108
  L4_108 = A2_106.getWorldPos
  L4_108 = L4_108(A2_106)
  L4_108.z = L4_108.z - 4 * A1_105
  createGameObject2("MapMarker"):setName(A0_104)
  createGameObject2("MapMarker"):setAssetName(A0_104)
  createGameObject2("MapMarker"):setupPattern(A3_107)
  createGameObject2("MapMarker"):setPos(L4_108)
end
function _createNodes(A0_109, A1_110)
  local L2_111, L3_112, L4_113, L5_114, L6_115, L7_116, L8_117, L9_118, L10_119
  L2_111 = findGameObject2
  L3_112 = "Node"
  L4_113 = A1_110
  L2_111 = L2_111(L3_112, L4_113)
  L4_113 = L2_111
  L3_112 = L2_111.getWorldTransform
  L4_113 = L3_112(L4_113)
  for L8_117, L9_118 in L5_114(L6_115) do
    L10_119 = "locator2_"
    L10_119 = L10_119 .. L9_118
    createGameObject2("Node"):setName(L10_119)
    L3_112.x = L3_112.x + 1.5
    createGameObject2("Node"):setPos(L3_112)
    createGameObject2("Node"):setRot(L4_113)
  end
end
function _insertTable(A0_120, A1_121)
  local L2_122, L3_123, L4_124, L5_125, L6_126
  for L5_125, L6_126 in L2_122(L3_123) do
    table.insert(A0_120, {
      name = L6_126,
      type = L6_126,
      node = "locator2_" .. L6_126,
      use_fall = false
    })
  end
end
function _createMNavi(A0_127)
  local L1_128
  L1_128 = Fn_findNpcPuppet
  L1_128 = L1_128(A0_127)
  HUD:mnaviNew({name = "Hoge01"}):setTarget(L1_128)
  HUD:mnaviNew({name = "Hoge01"}):setActive(true)
end
function cameraCheck()
  local L0_129, L1_130
  L0_129 = Pad
  L1_130 = L0_129
  L0_129 = L0_129.getButton
  L0_129 = L0_129(L1_130, Pad.kButton_RU)
  if L0_129 then
    L0_129 = Pad
    L1_130 = L0_129
    L0_129 = L0_129.getButton
    L0_129 = L0_129(L1_130, Pad.kButton_L1)
    if L0_129 == true then
      L0_129 = cam_hdl
      L1_130 = L0_129
      L0_129 = L0_129.setWorldPos
      L0_129(L1_130, pos_a)
      L0_129 = cam_hdl
      L1_130 = L0_129
      L0_129 = L0_129.setWorldRot
      L0_129(L1_130, rot_a)
      L0_129 = cam_hdl
      L1_130 = L0_129
      L0_129 = L0_129.switchCamera
      L0_129(L1_130, true)
    end
  end
  L0_129 = Pad
  L1_130 = L0_129
  L0_129 = L0_129.getButton
  L0_129 = L0_129(L1_130, Pad.kButton_RL)
  if L0_129 then
    L0_129 = Pad
    L1_130 = L0_129
    L0_129 = L0_129.getButton
    L0_129 = L0_129(L1_130, Pad.kButton_L1)
    if L0_129 == true then
      L0_129 = cam_hdl
      L1_130 = L0_129
      L0_129 = L0_129.setWorldPos
      L0_129(L1_130, pos_b + Vector(0, 10, 0))
      L0_129 = cam_hdl
      L1_130 = L0_129
      L0_129 = L0_129.leaveFromParent
      L0_129(L1_130, true)
      L0_129 = Player
      L1_130 = L0_129
      L0_129 = L0_129.getPuppet
      L0_129 = L0_129(L1_130)
      L1_130 = cam_hdl
      L1_130 = L1_130.setAimTarget
      L1_130(L1_130, L0_129, Vector(0, 1.5, 0))
      L1_130 = cam_hdl
      L1_130 = L1_130.setStabilityRange
      L1_130(L1_130, 0.3, 0.3)
      L1_130 = cam_hdl
      L1_130 = L1_130.switchCamera
      L1_130(L1_130, true)
    end
  end
  L0_129 = Pad
  L1_130 = L0_129
  L0_129 = L0_129.getButton
  L0_129 = L0_129(L1_130, Pad.kButton_RD)
  if L0_129 then
    L0_129 = Pad
    L1_130 = L0_129
    L0_129 = L0_129.getButton
    L0_129 = L0_129(L1_130, Pad.kButton_L1)
    if L0_129 == true then
      L0_129 = Player
      L1_130 = L0_129
      L0_129 = L0_129.getPuppet
      L0_129 = L0_129(L1_130)
      L1_130 = L0_129.appendChild
      L1_130(L0_129, cam_hdl, true)
      L1_130 = L0_129.getWorldTransform
      L1_130 = L1_130(L0_129)
      cam_hdl:setWorldPos(L1_130)
      cam_hdl:switchCamera(true)
    end
  end
  L0_129 = Pad
  L1_130 = L0_129
  L0_129 = L0_129.getButton
  L0_129 = L0_129(L1_130, Pad.kButton_RR)
  if L0_129 then
    L0_129 = Pad
    L1_130 = L0_129
    L0_129 = L0_129.getButton
    L0_129 = L0_129(L1_130, Pad.kButton_L1)
    if L0_129 == true then
      L0_129 = findGameObject2
      L1_130 = "CameraNode"
      L0_129 = L0_129(L1_130, "camnode2_01")
      L1_130 = L0_129.switchCamera
      L1_130(L0_129, true)
      L1_130 = L0_129.playAnim
      L1_130(L0_129, 0)
      while true do
        L1_130 = L0_129.isAnimEnd
        L1_130 = L1_130(L0_129)
        if not L1_130 then
          L1_130 = wait
          L1_130()
        end
      end
      L1_130 = L0_129.switchCamera
      L1_130(L0_129, false, 1.5)
      L1_130 = L0_129.resetAnim
      L1_130(L0_129)
    end
  end
end
function iconCheak()
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L1) then
    Sound:pulse("sys_chance_fail")
    findGameObject2("MapMarker", "spawner2_wom01_01_gui_marker_02"):setActive(false)
  end
  if Pad:getButton(Pad.kButton_LD) and Pad:getButton(Pad.kButton_L1) then
    Sound:pulse("sys_chance")
    findGameObject2("MapMarker", "spawner2_wom01_01_gui_marker_02"):setActive(true)
  end
end
function gaugeCheak()
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L1) then
    Player:setAbility({
      Player.kAbility_SpAttack
    }, false)
    HUD:setGaugeFourceVisible(true)
    HUD:spgDispReq_FadeIn()
  end
  if Pad:getButton(Pad.kButton_LD) and Pad:getButton(Pad.kButton_L1) then
    Player:setAbility({
      Player.kAbility_SpAttack
    }, true)
    HUD:setGaugeFourceVisible(false)
  end
end
function pcCheak()
  if Pad:getButton(Pad.kButton_LL) and (Pad:getButton(Pad.kButton_L1) or Pad:getButton(Pad.kButton_L2)) then
    Fn_setCatWarpCheckPoint("locator2_cam_pos_01")
    Fn_catWarp()
  end
  if Pad:getButton(Pad.kButton_LD) and Pad:getButton(Pad.kButton_L2) then
    Fn_setCatWarpCheckPoint("locator2_pc_start_pos")
    Fn_catWarp()
  end
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L2) then
    findGameObject2("Gem", "gem2_1"):setActive(false)
  end
  if Pad:getButton(Pad.kButton_LD) and Pad:getButton(Pad.kButton_L2) then
    findGameObject2("Gem", "gem2_1"):setActive(true)
  end
end
function demoCheak()
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L1) then
    CDemo = getCDemoTable("ep90_00100c")
    HUD:cdemo("ep90_00100c")
    wait()
    HUD:menuOpen("CDemo")
    wait(10)
    print("CDemo finish?")
  end
end
function npcCheak()
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L1) then
    Fn_findNpc("man01"):turn("man27", {upperAnim = "greeting"})
    repeat
      wait()
    until Fn_findNpc("man01"):isTurnEnd()
    wait()
    Fn_findNpc("man01"):playMotion("talk_04")
    repeat
      wait()
    until Fn_findNpc("man01"):isMotionEnd()
    Fn_findNpc("man01"):turn("cid01", {upperAnim = "greeting"})
    repeat
      wait()
    until Fn_findNpc("man01"):isTurnEnd()
  end
end
function ambCheak()
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L1) and __handle == nil then
    __handle = Sound:playSEHandle("amb001", 1, "wind_strength 1")
  end
  if Pad:getButton(Pad.kButton_RD) and Pad:getButton(Pad.kButton_L1) and __handle then
    Sound:setVariableHandle(__handle, "amb001", "wind_strength 0")
  end
  if Pad:getButton(Pad.kButton_LD) and Pad:getButton(Pad.kButton_L1) and __handle then
    Sound:stopSEHandle(__handle)
    __handle = nil
  end
end
function sdemoCheak()
  if Pad:getButton(Pad.kButton_LR) and Pad:getButton(Pad.kButton_L1) then
    _sdemo:set(Vector(0, 2, 0), Vector(0, 2, 10))
    _sdemo:play()
  end
  if Pad:getButton(Pad.kButton_LD) and Pad:getButton(Pad.kButton_L1) then
    _sdemo:stop()
    _sdemo:reset()
  end
  if not Pad:getButton(Pad.kButton_LL) or Pad:getButton(Pad.kButton_L1) then
  end
end
_debris = nil
function camera2Cheak()
  local L0_131, L1_132, L2_133, L3_134, L4_135
  L0_131 = Pad
  L1_132 = L0_131
  L0_131 = L0_131.getButton
  L2_133 = Pad
  L2_133 = L2_133.kButton_LR
  L0_131 = L0_131(L1_132, L2_133)
  if L0_131 then
    L0_131 = Pad
    L1_132 = L0_131
    L0_131 = L0_131.getButton
    L2_133 = Pad
    L2_133 = L2_133.kButton_L1
    L0_131 = L0_131(L1_132, L2_133)
    if L0_131 then
      L0_131 = _debris
      if L0_131 == nil then
        L0_131 = createGameObject2
        L1_132 = "Debris"
        L0_131 = L0_131(L1_132)
        _debris = L0_131
        L0_131 = _debris
        L1_132 = L0_131
        L0_131 = L0_131.setName
        L2_133 = "debris_01"
        L0_131(L1_132, L2_133)
        L0_131 = _debris
        L1_132 = L0_131
        L0_131 = L0_131.setModelName
        L2_133 = "rubble_go_db_cbr"
        L0_131(L1_132, L2_133)
        L0_131 = _debris
        L1_132 = L0_131
        L0_131 = L0_131.setPos
        L2_133 = Vector
        L3_134 = 0
        L4_135 = 20
        L4_135 = L2_133(L3_134, L4_135, 0)
        L0_131(L1_132, L2_133, L3_134, L4_135, L2_133(L3_134, L4_135, 0))
        L0_131 = _debris
        L1_132 = L0_131
        L0_131 = L0_131.try_init
        L0_131(L1_132)
        L0_131 = _debris
        L1_132 = L0_131
        L0_131 = L0_131.waitForReady
        L0_131(L1_132)
        L0_131 = Vector
        L1_132 = 0
        L2_133 = 20
        L3_134 = 0
        L0_131 = L0_131(L1_132, L2_133, L3_134)
        L1_132 = 1
        L2_133 = 180
        L3_134 = Vector
        L4_135 = 1000
        L3_134 = L3_134(L4_135, 2000, 1000)
        L4_135 = 0
        _debris:play(L0_131, L1_132, L2_133, L3_134, L4_135)
      else
        L0_131 = Vector
        L1_132 = 0
        L2_133 = 20
        L3_134 = 0
        L0_131 = L0_131(L1_132, L2_133, L3_134)
        L1_132 = 1
        L2_133 = 180
        L3_134 = Vector
        L4_135 = 1000
        L3_134 = L3_134(L4_135, 2000, 1000)
        L4_135 = 0
        _debris:play(L0_131, L1_132, L2_133, L3_134, L4_135)
      end
    end
  end
  L0_131 = Pad
  L1_132 = L0_131
  L0_131 = L0_131.getButton
  L2_133 = Pad
  L2_133 = L2_133.kButton_LR
  L0_131 = L0_131(L1_132, L2_133)
  if L0_131 then
    L0_131 = Pad
    L1_132 = L0_131
    L0_131 = L0_131.getButton
    L2_133 = Pad
    L2_133 = L2_133.kButton_L2
    L0_131 = L0_131(L1_132, L2_133)
    if L0_131 then
      L0_131 = Camera
      L1_132 = L0_131
      L0_131 = L0_131.lookTo
      L2_133 = Vector
      L3_134 = 0
      L4_135 = 1
      L2_133 = L2_133(L3_134, L4_135, 0)
      L3_134 = 2
      L4_135 = 0.35
      L0_131(L1_132, L2_133, L3_134, L4_135)
    end
  end
  L0_131 = Pad
  L1_132 = L0_131
  L0_131 = L0_131.getButton
  L2_133 = Pad
  L2_133 = L2_133.kButton_LD
  L0_131 = L0_131(L1_132, L2_133)
  if L0_131 then
    L0_131 = Pad
    L1_132 = L0_131
    L0_131 = L0_131.getButton
    L2_133 = Pad
    L2_133 = L2_133.kButton_L1
    L0_131 = L0_131(L1_132, L2_133)
    if L0_131 then
      L0_131 = Camera
      L1_132 = L0_131
      L0_131 = L0_131.lookTo
      L2_133 = Vector
      L3_134 = 0
      L4_135 = 1
      L2_133 = L2_133(L3_134, L4_135, 0)
      L3_134 = 0
      L4_135 = 0.35
      L0_131(L1_132, L2_133, L3_134, L4_135)
    end
  end
end
_sensor_01_in = false
_sensor_02_in = false
_sensor_03_in = false
_sensor_04_in = false
function pccubesensor2_01_OnEnter()
  print("\231\148\183\227\129\174\229\173\144\227\129\174\231\175\132\229\155\178\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  _sensor_01_in = true
end
function pccubesensor2_01_OnLeave()
  print("\231\148\183\227\129\174\229\173\144\227\129\174\231\175\132\229\155\178\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  _sensor_01_in = false
end
function pccubesensor2_02_OnEnter()
  print("\229\165\179\227\129\174\229\173\144\227\129\174\231\175\132\229\155\178\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  _sensor_02_in = true
end
function pccubesensor2_02_OnLeave()
  print("\229\165\179\227\129\174\229\173\144\227\129\174\231\175\132\229\155\178\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  _sensor_02_in = false
end
function pccubesensor2_03_OnEnter()
  print("\231\148\183\230\128\167\227\129\174\231\175\132\229\155\178\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  _sensor_03_in = true
end
function pccubesensor2_03_OnLeave()
  print("\231\148\183\230\128\167\227\129\174\231\175\132\229\155\178\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  _sensor_03_in = false
end
function pccubesensor2_04_OnEnter()
  print("\229\165\179\230\128\167\227\129\174\231\175\132\229\155\178\227\129\171\229\133\165\227\130\138\227\129\190\227\129\151\227\129\159")
  _sensor_04_in = true
end
function pccubesensor2_04_OnLeave()
  print("\229\165\179\230\128\167\227\129\174\231\175\132\229\155\178\227\129\139\227\130\137\229\135\186\227\129\190\227\129\151\227\129\159")
  _sensor_05_in = false
end
function pccubesensor2_gm_test_01_OnEnter()
  print("\228\186\161\233\156\138\233\131\189\229\184\130\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\227\131\135\227\131\188\227\130\191\227\129\171\229\133\165\227\129\163\227\129\159\227\130\136\239\188\129\239\188\129")
end
function pccubesensormulti2_02_OnEnter()
  print("\233\155\162\227\130\140\227\129\159\227\130\173\227\131\165\227\131\188\227\131\150\227\129\171\229\133\165\227\129\163\227\129\159\227\130\136\239\188\129\239\188\129")
end
function cubesensormulti2_01_OnEnter(A0_136, A1_137)
end
function cubesensor2_01_OnEnter()
  local L0_138, L1_139
end
function cubesensor2_01_OnLeave()
  local L0_140, L1_141
end
function cubesensor2_02_OnEnter()
  local L0_142, L1_143
end
function cubesensor2_02_OnLeave(A0_144, A1_145)
  local L2_146
  L2_146 = A1_145.getName
  L2_146 = L2_146(A1_145)
  print(L2_146 .. "\227\129\140\231\175\132\229\155\178\227\129\139\227\130\137\227\129\167\227\129\159\227\128\130")
  L2_146 = string.match(L2_146, "DNode_(.+)")
  if resource_box_tbl[L2_146] then
    if resource_box_tbl[L2_146].grab then
      print(L2_146 .. "\227\130\176\227\131\169\227\131\150\227\129\149\227\130\140\227\129\166\227\129\139\227\130\137\231\175\132\229\155\178\227\129\139\227\130\137\227\129\167\227\129\159")
    else
      print(L2_146 .. "\227\130\176\227\131\169\227\131\150\227\129\149\227\130\140\227\129\170\227\129\132\227\129\167\231\175\132\229\155\178\227\129\139\227\130\137\227\129\167\227\129\159")
    end
  end
end
function GemGetCallback(A0_147)
  local L1_148
  L1_148 = print
  L1_148(A0_147:getName())
end
function sensorCheak()
  local L0_149, L1_150, L2_151, L3_152, L4_153, L5_154, L6_155, L7_156, L8_157, L9_158, L10_159
  L0_149 = findGameObject2
  L1_150 = "PlayerSensor"
  L2_151 = "pccubesensor2_01"
  L0_149 = L0_149(L1_150, L2_151)
  L1_150 = findGameObject2
  L2_151 = "PlayerSensor"
  L3_152 = "pccubesensor2_02"
  L1_150 = L1_150(L2_151, L3_152)
  L2_151 = findGameObject2
  L3_152 = "PlayerSensor"
  L4_153 = "pccubesensor2_03"
  L2_151 = L2_151(L3_152, L4_153)
  L3_152 = Player
  L4_153 = L3_152
  L3_152 = L3_152.getPuppet
  L3_152 = L3_152(L4_153)
  L4_153 = true
  L5_154 = false
  L6_155 = true
  L7_156 = true
  while true do
    L9_158 = L3_152
    L8_157 = L3_152.getWorldPos
    L8_157 = L8_157(L9_158)
    L10_159 = L0_149
    L9_158 = L0_149.getWorldPos
    L9_158 = L9_158(L10_159)
    L8_157 = L8_157 - L9_158
    L9_158 = L8_157
    L8_157 = L8_157.Length
    L8_157 = L8_157(L9_158)
    L10_159 = L3_152
    L9_158 = L3_152.getWorldPos
    L9_158 = L9_158(L10_159)
    L10_159 = L1_150.getWorldPos
    L10_159 = L10_159(L1_150)
    L9_158 = L9_158 - L10_159
    L10_159 = L9_158
    L9_158 = L9_158.Length
    L9_158 = L9_158(L10_159)
    L10_159 = L3_152.getWorldPos
    L10_159 = L10_159(L3_152)
    L10_159 = L10_159 - L2_151:getWorldPos()
    L10_159 = L10_159.Length
    L10_159 = L10_159(L10_159)
    if Pad:getButton(Pad.kButton_RD) and Pad:getButton(Pad.kButton_L1) then
      L7_156 = not L7_156
      L2_151:setActive(L7_156)
    end
    if L8_157 < 3.5 then
      if Pad:getButton(Pad.kButton_RR) and Pad:getButton(Pad.kButton_L1) then
        L5_154 = not L5_154
      end
      L0_149:setActive(L5_154)
    elseif L8_157 > 10 then
      L0_149:setActive(true)
    end
    if L9_158 < 3.5 then
      if Pad:getButton(Pad.kButton_RR) and Pad:getButton(Pad.kButton_L1) then
        L6_155 = not L6_155
      end
      L1_150:setActive(L6_155)
    elseif L9_158 > 10 then
      L1_150:setActive(false)
    end
    if L10_159 < 3.5 then
      L3_152:setDetectable(false)
      L4_153 = false
    elseif L10_159 > 10 then
      L3_152:setDetectable(true)
      L4_153 = true
    end
    _debugLine = 0
    debugDispPrint("chi01 : in : " .. string.format("%-5s", tostring(_sensor_01_in)) .. " : pccubesensor2_01 : " .. string.format("%-5s", tostring(L0_149:getActive())) .. " : " .. L8_157)
    debugDispPrint("chi02 : in : " .. string.format("%-5s", tostring(_sensor_02_in)) .. " : pccubesensor2_02 : " .. string.format("%-5s", tostring(L1_150:getActive())) .. " : " .. L9_158)
    debugDispPrint("man01 : in : " .. string.format("%-5s", tostring(_sensor_03_in)) .. " : pccubesensor2_03 : " .. string.format("%-5s", tostring(L2_151:getActive())) .. " : " .. L10_159)
    debugDispPrint("player : " .. (L4_153 and "true" or "false"))
    wait()
  end
end
function RAC_RaycastEyeSight(A0_160, A1_161, A2_162, A3_163, A4_164)
  return RAC_RaycastEyeSightBase(Player:getPuppet(), A0_160, A1_161, A2_162, A3_163, A4_164)
end
function RAC_RaycastEyeSightBase(A0_165, A1_166, A2_167, A3_168, A4_169, A5_170)
  local L6_171, L7_172, L8_173
  L7_172 = A0_165
  L6_171 = A0_165.getWorldTransform
  L7_172 = L6_171(L7_172)
  if A4_169 ~= nil then
    L8_173 = L6_171.y
    L8_173 = L8_173 + A4_169
    L6_171.y = L8_173
  else
    L8_173 = L6_171.y
    L8_173 = L8_173 + 1.5
    L6_171.y = L8_173
  end
  L8_173 = Query
  L8_173 = L8_173.setEyeSightTransform
  L8_173(L8_173, L6_171, L7_172)
  if A3_168 ~= nil then
    L8_173 = Query
    L8_173 = L8_173.setEyeSightAngle
    L8_173(L8_173, Deg2Rad(A3_168))
  else
    L8_173 = Query
    L8_173 = L8_173.setEyeSightAngle
    L8_173(L8_173, Deg2Rad(180))
  end
  L8_173 = Query
  L8_173 = L8_173.setEyeSightRange
  L8_173(L8_173, A2_167)
  L8_173 = A1_166.getWorldPos
  L8_173 = L8_173(A1_166)
  if A5_170 ~= nil then
    L8_173.y = L8_173.y + A5_170
  end
  if Query:checkEyeSightSphere(L8_173, 1) then
    Query:debugDrawEyeSight({
      r = 0,
      g = 1,
      b = 0
    })
    return true
  else
    Query:debugDrawEyeSight({
      r = 1,
      g = 0,
      b = 0
    })
  end
  return false
end
