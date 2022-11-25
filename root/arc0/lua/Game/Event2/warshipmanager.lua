import("Query")
import("EventData")
dofile("/Game/Event2/Common/CommonAll.lua")
dofile("/Game/Event2/Common/HUDCommon.lua")
dofile("/Game/Event2/Common/ScriptCommon.lua")
dofile("/Game/Event2/Common/AreaCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Misc/area_controller.lua")
__move_start = false
__shelling_start = false
__warship_hdl = nil
__warship_hdl2 = true
_task_warship = nil
_pilothouse = false
_ac = nil
gun_kk = {}
enmgen_upper = nil
enmgen_under = nil
enmgen_ep26 = nil
enmbra_upper = {}
enmbra_under = {}
enmbra_ep26 = {}
mechcannon_max = 31
mechcannon_upper_max = 18
mechcannon_under_max = 13
mechcannon_ep26_max = 14
hit_time = 0
hit_place = 0
_shooterName = nil
damege_persent = 10
caution_range = 250
siren_handle = nil
mechcannon_upper_invalid = false
mechcannon_under_invalid = false
intrusion_caution_range = false
_mech_cannon_shot = false
mechcannon_task_stop = false
_eviction_shelling_player = false
enmgen2_mechcannon_upper = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_01",
      name = "mechcannon_01"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_02",
      name = "mechcannon_02"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_03",
      name = "mechcannon_03"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_04",
      name = "mechcannon_04"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_05",
      name = "mechcannon_05"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_06",
      name = "mechcannon_06"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_07",
      name = "mechcannon_07"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_08",
      name = "mechcannon_08"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_09",
      name = "mechcannon_09"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_10",
      name = "mechcannon_10"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_11",
      name = "mechcannon_11"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_12",
      name = "mechcannon_12"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_13",
      name = "mechcannon_13"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_14",
      name = "mechcannon_14"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_15",
      name = "mechcannon_15"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_16",
      name = "mechcannon_16"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_17",
      name = "mechcannon_17"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_18",
      name = "mechcannon_18"
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
  end,
  onObjectDead = function(A0_8, A1_9)
  end,
  onObjectAsh = function(A0_10, A1_11)
  end
}
enmgen2_mechcannon_under = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_19",
      name = "mechcannon_19"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_20",
      name = "mechcannon_20"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_21",
      name = "mechcannon_21"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_22",
      name = "mechcannon_22"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_23",
      name = "mechcannon_23"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_24",
      name = "mechcannon_24"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_25",
      name = "mechcannon_25"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_26",
      name = "mechcannon_26"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_27",
      name = "mechcannon_27"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_28",
      name = "mechcannon_28"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_29",
      name = "mechcannon_29"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_30",
      name = "mechcannon_30"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_31",
      name = "mechcannon_31"
    }
  },
  onUpdate = function(A0_12)
    local L1_13
  end,
  onEnter = function(A0_14)
    local L1_15
  end,
  onLeave = function(A0_16)
    local L1_17
  end,
  onSpawn = function(A0_18, A1_19)
  end,
  onObjectDead = function(A0_20, A1_21)
  end,
  onObjectAsh = function(A0_22, A1_23)
  end
}
enmgen2_mechcannon_ep26 = {
  spawnOnStart = false,
  spawnSet = {
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_01",
      name = "mechcannon_ep26_01"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_02",
      name = "mechcannon_ep26_02"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_03",
      name = "mechcannon_ep26_03"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_04",
      name = "mechcannon_ep26_04"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_05",
      name = "mechcannon_ep26_05"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_06",
      name = "mechcannon_ep26_06"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_07",
      name = "mechcannon_ep26_07"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_08",
      name = "mechcannon_ep26_08"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_09",
      name = "mechcannon_ep26_09"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_10",
      name = "mechcannon_ep26_10"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_11",
      name = "mechcannon_ep26_11"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_12",
      name = "mechcannon_ep26_12"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_13",
      name = "mechcannon_ep26_13"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_14",
      name = "mechcannon_ep26_14"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_15",
      name = "mechcannon_ep26_15"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_16",
      name = "mechcannon_ep26_16"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_17",
      name = "mechcannon_ep26_17"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_18",
      name = "mechcannon_ep26_18"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_19",
      name = "mechcannon_ep26_19"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_20",
      name = "mechcannon_ep26_20"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_21",
      name = "mechcannon_ep26_21"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_22",
      name = "mechcannon_ep26_22"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_23",
      name = "mechcannon_ep26_23"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_24",
      name = "mechcannon_ep26_24"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_25",
      name = "mechcannon_ep26_25"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_26",
      name = "mechcannon_ep26_26"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_27",
      name = "mechcannon_ep26_27"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_28",
      name = "mechcannon_ep26_28"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_29",
      name = "mechcannon_ep26_29"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_30",
      name = "mechcannon_ep26_30"
    },
    {
      type = "mechcannon",
      locator = "locator2_mechcannon_ep26_31",
      name = "mechcannon_ep26_31"
    }
  },
  onUpdate = function(A0_24)
    local L1_25
  end,
  onEnter = function(A0_26)
    local L1_27
  end,
  onLeave = function(A0_28)
    local L1_29
  end,
  onSpawn = function(A0_30, A1_31)
  end,
  onObjectDead = function(A0_32, A1_33)
  end,
  onObjectAsh = function(A0_34, A1_35)
  end
}
function main()
  invokeTask(Ingame)
  invokeTask(changeGimmickBg)
  wait()
end
function callBackExitSandbox()
  if siren_handle then
    Sound:stopSEHandle(siren_handle)
    siren_handle = nil
  end
end
setExitCallback(callBackExitSandbox)
function Ingame()
  local L0_36, L1_37, L2_38, L3_39, L4_40, L5_41, L6_42, L7_43, L8_44, L9_45
  while true do
    L0_36 = __warship_hdl
    if not L0_36 then
      L0_36 = wait
      L0_36()
    else
      L0_36 = debugPrint
      L1_37 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\140\230\157\165\227\129\159\227\129\174\227\129\167\229\145\168\229\155\158\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\227\129\190\227\129\153"
      L0_36(L1_37)
      L0_36 = GameDatabase
      L1_37 = L0_36
      L0_36 = L0_36.get
      L2_38 = ggd
      L2_38 = L2_38.Savedata__EventManageFlags__CurrentBgSet
      L0_36 = L0_36(L1_37, L2_38)
      L1_37 = "ar_a_root_goto_go"
      L2_38 = string
      L2_38 = L2_38.find
      L3_39 = L0_36
      L4_40 = "bg_world"
      L2_38 = L2_38(L3_39, L4_40)
      if L2_38 ~= nil then
        L1_37 = "ar_a_root_goto_go_world"
      end
      L2_38 = AreaController
      L2_38 = L2_38.create
      L3_39 = __warship_hdl
      L2_38 = L2_38(L3_39)
      _ac = L2_38
      L2_38 = _ac
      L3_39 = L2_38
      L2_38 = L2_38.load
      L4_40 = L1_37
      L2_38(L3_39, L4_40)
      L2_38 = _ac
      L3_39 = L2_38
      L2_38 = L2_38.setPlayParam
      L4_40 = {}
      L4_40.ratio = 0.09
      L4_40.loop = -1
      L4_40.anim_wait = false
      L2_38(L3_39, L4_40)
      L2_38 = _ac
      L3_39 = L2_38
      L2_38 = L2_38.cue
      L2_38(L3_39)
      L2_38 = debugPrint
      L3_39 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\229\145\168\229\155\158\227\131\162\227\131\188\227\130\183\227\131\167\227\131\179\232\168\173\229\174\154\231\181\130\228\186\134"
      L2_38(L3_39)
      __warship_hdl2 = true
      L2_38 = debugPrint
      L3_39 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\227\131\135\227\131\188\227\130\191\227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\227\129\190\227\129\153"
      L2_38(L3_39)
      L2_38 = __warship_hdl
      L3_39 = L2_38
      L2_38 = L2_38.getName
      L2_38 = L2_38(L3_39)
      if L2_38 == "ar_a_root" then
        L2_38 = "evx/ar_object"
      else
        L2_38 = L2_38 or "evx/ar_object_b"
      end
      L3_39 = loadFileAsset
      L4_40 = "evb"
      L5_41 = L2_38
      L3_39 = L3_39(L4_40, L5_41)
      L4_40 = nil
      if L3_39 ~= nil then
        L6_42 = L3_39
        L5_41 = L3_39.wait
        L5_41(L6_42)
        L6_42 = L3_39
        L5_41 = L3_39.getRoot
        L5_41 = L5_41(L6_42)
        L6_42 = EventData
        L7_43 = L6_42
        L6_42 = L6_42.create
        L8_44 = "ar_object"
        L9_45 = nil
        L6_42 = L6_42(L7_43, L8_44, L9_45, L5_41)
        L4_40 = L6_42
        L7_43 = L4_40
        L6_42 = L4_40.try_init
        L6_42(L7_43)
        L7_43 = L4_40
        L6_42 = L4_40.waitForReady
        L6_42(L7_43)
        L7_43 = L4_40
        L6_42 = L4_40.try_start
        L6_42(L7_43)
        L3_39 = nil
      end
      L5_41 = debugPrint
      L6_42 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\227\130\164\227\131\153\227\131\179\227\131\136\227\131\135\227\131\188\227\130\191\227\130\146\232\170\173\227\129\191\232\190\188\227\129\191\231\181\130\228\186\134"
      L5_41(L6_42)
      L5_41 = false
      L6_42 = false
      L7_43 = false
      L8_44 = nil
      while true do
        L9_45 = __warship_hdl2
        if L9_45 then
          L9_45 = GameDatabase
          L9_45 = L9_45.get
          L9_45 = L9_45(L9_45, ggd.Savedata__EventManageFlags__CurrentMissionName)
          if string.find(L9_45, "ep07") then
          end
          if string.find(L9_45, "ep10") then
          end
          if string.find(L9_45, "ep11") then
          end
          if HUD:faderAlpha() < 1 and not true then
            if L8_44 ~= not GameDatabase:get(ggd.Savedata__EventManageFlags__WarShip) then
              _ac:pause(not GameDatabase:get(ggd.Savedata__EventManageFlags__WarShip))
              L8_44 = not GameDatabase:get(ggd.Savedata__EventManageFlags__WarShip)
            end
          elseif L8_44 ~= true then
            _ac:pause(true)
            L8_44 = true
          end
          L5_41 = GameDatabase:get(ggd.Savedata__EventManageFlags__WarShipCannon)
          if L5_41 == true then
            if L6_42 == false then
              _killGimmickCannon()
              _createEnemyCannon()
              Fn_pcSensorOn("pccubesensor2_warship")
              __shelling_start = true
              waitSeconds(3)
              warshipCannonInit()
              L6_42 = true
              L7_43 = false
            end
          elseif L5_41 == false then
            if L7_43 == false then
              _killEnemyCannon()
              _createGimmckCannon()
              Fn_pcSensorOff("pccubesensor2_warship")
              L6_42 = false
              L7_43 = true
            end
          else
            debugPrint("ggd.Savedata__EventManageFlags__WarShipCannon\227\129\140\228\184\141\229\174\154\227\129\174\229\128\164\227\129\167\227\129\153")
          end
          wait()
        end
      end
      L9_45 = debugPrint
      L9_45("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\174\227\131\143\227\131\179\227\131\137\227\131\171\227\129\140\229\164\137\227\130\143\227\129\163\227\129\159\227\129\174\227\129\167\227\129\153\227\129\185\227\129\166\231\160\180\230\163\132\227\129\151\227\129\190\227\129\153")
      _ac = nil
      L9_45 = _killGimmickCannon
      L9_45()
      L9_45 = _killEnemyCannon
      L9_45()
      if L4_40 then
        L9_45 = L4_40.try_term
        L9_45(L4_40)
        L4_40 = nil
      end
      L9_45 = wait
      L9_45()
    end
  end
end
function _createEnemyCannon()
  local L0_46, L1_47, L2_48, L3_49
  L0_46(L1_47)
  enmgen_upper = L0_46
  enmgen_under = L0_46
  if L0_46 ~= nil then
    L0_46(L1_47)
    while true do
      if not L0_46 then
        L0_46()
      end
    end
    L0_46(L1_47, L2_48)
    L0_46(L1_47, L2_48)
  end
  if L0_46 ~= nil then
    L0_46(L1_47)
    while true do
      if not L0_46 then
        L0_46()
      end
    end
    L0_46(L1_47, L2_48)
    L0_46(L1_47, L2_48)
  end
  for L3_49 = 1, mechcannon_upper_max do
    enmbra_upper[L3_49] = findGameObject2("EnemyBrain", string.format("mechcannon_%02d", L3_49))
    if enmbra_upper[L3_49] ~= nil then
      enmbra_upper[L3_49]:setEventListener("enemy_mechcannon_event", mechCannonShoot)
      enmbra_upper[L3_49]:eventMessage("startBlankMode")
      enmbra_upper[L3_49]:setEnableHomingTarget(false)
    end
  end
  for L3_49 = 1, mechcannon_under_max do
    enmbra_under[L3_49] = findGameObject2("EnemyBrain", string.format("mechcannon_%02d", L3_49 + mechcannon_upper_max))
    if enmbra_under[L3_49] ~= nil then
      enmbra_under[L3_49]:setEventListener("enemy_mechcannon_event", mechCannonShoot)
      enmbra_under[L3_49]:eventMessage("startBlankMode")
      enmbra_under[L3_49]:setEnableHomingTarget(false)
    end
  end
end
function _killEnemyCannon()
  debugPrint("\227\130\168\227\131\141\227\131\159\227\131\188\231\160\178\229\143\176\227\130\146\231\160\180\230\163\132\227\129\151\227\129\190\227\129\153\227\128\130")
  if _task_warship ~= nil then
    _task_warship:taskAbort()
    _task_warship = nil
  end
  if enmgen_upper ~= nil then
    enmgen_upper:kill()
    enmgen_upper = nil
  end
  if enmgen_under ~= nil then
    enmgen_under:kill()
    enmgen_under = nil
  end
  if enmgen_ep26 ~= nil then
    enmgen_ep26:kill()
    enmgen_ep26 = nil
  end
end
function _createGimmckCannon()
  local L0_50, L1_51, L2_52, L3_53
  L0_50(L1_51)
  for L3_53 = 1, mechcannon_max do
    if gun_kk[L3_53] == nil then
      gun_kk[L3_53] = putGimmickBgMechcannon(string.format("locator2_mechcannon_%02d", L3_53))
    end
  end
end
function _killGimmickCannon()
  debugPrint("\227\130\174\227\131\159\227\131\131\227\130\175BG\231\160\178\229\143\176\227\130\146\231\160\180\230\163\132\227\129\151\227\129\190\227\129\153")
  for _FORV_3_ = 1, mechcannon_max do
    if gun_kk[_FORV_3_] ~= nil then
      gun_kk[_FORV_3_]:kill()
      gun_kk[_FORV_3_] = nil
    end
  end
end
function requestWarshipShellingOn()
  invokeTask(function()
    debugPrint("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\166\129\229\161\158\227\129\174\231\160\178\230\146\131\230\156\137\229\138\185\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
    mechcannon_upper_invalid = false
    mechcannon_under_invalid = false
    Fn_pcSensorOn("pccubesensor2_warship")
  end)
end
function requestWarshipShellingOnAutoAlert()
  invokeTask(function()
    debugPrint("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\166\129\229\161\158\227\129\174\231\160\178\230\146\131\230\156\137\229\138\185\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\239\188\136\232\173\166\229\160\177\228\187\152\227\129\141\239\188\137\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
    if Player:getRecentAreaName() == "ar_a_root" then
      intrusion_caution_range = true
    end
    mechcannon_upper_invalid = false
    mechcannon_under_invalid = false
    Fn_pcSensorOn("pccubesensor2_warship")
  end)
end
function requestWarshipShellingOff()
  invokeTask(function()
    debugPrint("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\166\129\229\161\158\227\129\174\231\160\178\230\146\131\231\132\161\229\138\185\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
    repeat
      while GameDatabase:get(ggd.Savedata__EventManageFlags__WarShipCannon) ~= false do
        wait()
      end
    until __shelling_start
    if enmgen_upper ~= nil then
      enmgen_upper:setEnemyMarker(false)
      enmgen_upper:requestIdlingEnemy(true)
    end
    if enmgen_under ~= nil then
      enmgen_under:setEnemyMarker(false)
      enmgen_under:requestIdlingEnemy(true)
    end
    intrusion_caution_range = false
    mechcannon_upper_invalid = true
    mechcannon_under_invalid = true
    Fn_pcSensorOff("pccubesensor2_warship")
  end)
end
function requestMechCannonStartBlankMode(A0_54, A1_55)
  local L2_56, L3_57, L4_58, L5_59, L6_60, L7_61
  L2_56 = debugPrint
  L3_57 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\231\160\178\229\143\176\227\129\174\231\169\186\231\160\178\227\131\162\227\131\188\227\131\137\233\150\139\229\167\139\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130"
  L2_56(L3_57)
  L2_56 = A0_54
  L3_57 = A1_55
  for L7_61 = 1, mechcannon_upper_max do
    enmbra_upper[L7_61] = findGameObject2("EnemyBrain", string.format("mechcannon_%02d", L7_61))
    if enmbra_upper[L7_61] ~= nil then
      enmbra_upper[L7_61]:setEventListener("enemy_mechcannon_event", mechCannonShoot)
      enmbra_upper[L7_61]:eventMessage("startBlankMode", L2_56, L3_57)
    end
  end
  for L7_61 = 1, mechcannon_under_max do
    enmbra_under[L7_61] = findGameObject2("EnemyBrain", string.format("mechcannon_%02d", L7_61 + mechcannon_upper_max))
    if enmbra_under[L7_61] ~= nil then
      enmbra_under[L7_61]:setEventListener("enemy_mechcannon_event", mechCannonShoot)
      enmbra_under[L7_61]:eventMessage("startBlankMode", L2_56, L3_57)
    end
  end
end
function requestMechCannonEndBlankMode()
  local L0_62, L1_63, L2_64, L3_65
  L0_62(L1_63)
  for L3_65 = 1, mechcannon_upper_max do
    enmbra_upper[L3_65] = findGameObject2("EnemyBrain", string.format("mechcannon_%02d", L3_65))
    if enmbra_upper[L3_65] ~= nil then
      enmbra_upper[L3_65]:setEventListener("enemy_mechcannon_event", nil)
      enmbra_upper[L3_65]:eventMessage("endBlankMode")
      enmbra_upper[L3_65]:setEnableHomingTarget(true)
    end
  end
  for L3_65 = 1, mechcannon_under_max do
    enmbra_under[L3_65] = findGameObject2("EnemyBrain", string.format("mechcannon_%02d", L3_65 + mechcannon_upper_max))
    if enmbra_under[L3_65] ~= nil then
      enmbra_under[L3_65]:setEventListener("enemy_mechcannon_event", nil)
      enmbra_under[L3_65]:eventMessage("endBlankMode")
      enmbra_under[L3_65]:setEnableHomingTarget(true)
    end
  end
  if L0_62 ~= nil then
    L0_62(L1_63, L2_64)
  end
  if L0_62 ~= nil then
    L0_62(L1_63, L2_64)
  end
end
function requestMechCannonStartControlMode()
  invokeTask(function()
    local L0_66, L1_67, L2_68, L3_69
    L0_66(L1_67)
    repeat
      L0_66()
    until L0_66
    if L0_66 ~= nil then
      L0_66(L1_67)
      _task_warship = nil
    end
    L0_66(L1_67)
    for L3_69 = 1, mechcannon_max do
      if gun_kk[L3_69] ~= nil then
        gun_kk[L3_69]:kill()
        gun_kk[L3_69] = nil
      end
    end
    if L0_66 ~= nil then
      L0_66(L1_67)
      enmgen_upper = nil
    end
    if L0_66 ~= nil then
      L0_66(L1_67)
      enmgen_under = nil
    end
    enmgen_ep26 = L0_66
    if L0_66 ~= nil then
      L0_66(L1_67)
      repeat
        L0_66()
      until L0_66
      L0_66(L1_67)
      L0_66(L1_67, L2_68)
    end
    for L3_69 = 1, mechcannon_max do
      enmbra_ep26[L3_69] = findGameObject2("EnemyBrain", string.format("mechcannon_ep26_%02d", L3_69))
      if enmbra_ep26[L3_69] ~= nil then
        enmbra_ep26[L3_69]:eventMessage("startScriptControl")
        enmbra_ep26[L3_69]:setEnableHomingTarget(false)
      end
    end
  end)
end
function requestMechCannonBlankShot()
  debugPrint("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\231\160\178\229\143\176\227\129\174\231\169\186\231\160\178\231\153\186\229\176\132\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
  for _FORV_3_ = 1, 3 do
    if enmbra_ep26[RandI(mechcannon_ep26_max)] ~= nil then
      enmbra_ep26[RandI(mechcannon_ep26_max)]:eventMessage("requestAttack")
    end
  end
end
function requestWarshipInvisible()
  invokeTask(function()
    debugPrint("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\232\166\129\229\161\158\227\129\174\230\182\136\229\142\187\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
    for _FORV_3_ = 1, mechcannon_max do
      if gun_kk[_FORV_3_] ~= nil then
        gun_kk[_FORV_3_]:kill()
        gun_kk[_FORV_3_] = nil
      end
    end
    if _FOR_ ~= nil then
      _task_warship:taskAbort()
      _task_warship = nil
    end
    Fn_pcSensorOff("pccubesensor2_warship")
    if enmgen_upper ~= nil then
      enmgen_upper:kill()
      enmgen_upper = nil
    end
    if enmgen_under ~= nil then
      enmgen_under:kill()
      enmgen_under = nil
    end
    if enmgen_ep26 ~= nil then
      enmgen_ep26:kill()
      enmgen_ep26 = nil
    end
    mother2:sendEvent("getBackgroundElement2Handle", "ar"):setEffectiveness(false)
  end)
end
function requestIdlingMechCannon(A0_70)
  debugPrint("\231\160\178\229\143\176AI\227\129\174\230\156\137\229\138\185\227\131\187\231\132\161\229\138\185\227\130\146\232\168\173\229\174\154\227\129\153\227\130\139\227\131\170\227\130\175\227\130\168\227\130\185\227\131\136\227\129\140\231\153\186\232\161\140\227\129\149\227\130\140\227\129\190\227\129\151\227\129\159\227\128\130")
  if enmgen_upper ~= nil then
    enmgen_upper:requestIdlingEnemy(A0_70)
  end
  if enmgen_under ~= nil then
    enmgen_under:requestIdlingEnemy(A0_70)
  end
end
function requestGetMechCannonMax()
  local L0_71, L1_72
  L0_71 = mechcannon_max
  return L0_71
end
function putGimmickBgMechcannon(A0_73)
  local L1_74, L2_75, L3_76
  L1_74 = __warship_hdl
  if L1_74 then
    L1_74 = createGameObject2
    L2_75 = "GimmickBg"
    L1_74 = L1_74(L2_75)
    L2_75 = findGameObject2
    L3_76 = "Node"
    L2_75 = L2_75(L3_76, A0_73)
    L3_76 = L2_75
    L2_75 = L2_75.getTransform
    L3_76 = L2_75(L3_76)
    L1_74:setDrawModelName("gun_kk_01")
    L1_74:setCollisionName("gun_kk_01")
    L1_74:setAttributeName("gun_kk_01")
    L1_74:setName(string.format("gun_kk_01_%s", string.sub(A0_73, 10)))
    __warship_hdl:appendChild(L1_74)
    L1_74:setTransform(L2_75, L3_76)
    L1_74:setForceMove()
    L1_74:setCollidableBlockEnable(false)
    L1_74:setVisibleBlockEnable(false)
    L1_74:setVisible(true)
    L1_74:try_init()
    L1_74:waitForReadyAsync(function()
      L1_74:try_start()
    end)
    return L1_74
  else
  end
  L1_74 = nil
  return L1_74
end
function setWarShip(A0_77)
  __warship_hdl = A0_77
  __warship_hdl2 = false
  debugPrint("war ship handle " .. tostring(__warship_hdl))
end
function mechCannonShoot(A0_78)
  _shooterName = A0_78.name
  debugPrint("shooter name " .. _shooterName)
  A0_78.ret = true
  _mech_cannon_shot = true
  return A0_78
end
function clearMechCannonShot()
  local L0_79, L1_80
  _mech_cannon_shot = false
end
function isMechCannonShot()
  local L0_81, L1_82
  L0_81 = _mech_cannon_shot
  return L0_81
end
function warshipCannonInit()
  if _task_warship ~= nil then
    _task_warship:taskAbort()
    _task_warship = nil
  end
  _task_warship = PerceivableWarship.new()
  _task_warship:action()
end
function warshipCannonClear()
  if _task_warship ~= nil then
    _task_warship:taskAbort()
    _task_warship = nil
  end
end
function warshipCannonBarrageInit()
  if _task_warship ~= nil then
    _task_warship:taskAbort()
    _task_warship = nil
  end
  _task_warship = ep10cannonWarship.new()
  _task_warship:action()
end
PerceivableWarship = {}
function PerceivableWarship.new()
  local L0_83, L1_84
  L0_83 = {}
  L0_83.NORMAL = 1
  L0_83.CANNON_START = 2
  L0_83.SHOT_WAIT = 3
  L0_83.HIT_COUNT = 4
  L0_83.HIT = 5
  WARSHIP_STATUS = L0_83
  COUNT_MIN = 0
  COUNT_MAX = 100
  L0_83 = {}
  L0_83.task = nil
  L1_84 = WARSHIP_STATUS
  L1_84 = L1_84.NORMAL
  L0_83.status = L1_84
  L0_83.cautionCount = 0
  L0_83.hitCount = 0
  L1_84 = COUNT_MIN
  L0_83.countMin = L1_84
  L1_84 = COUNT_MAX
  L0_83.countMax = L1_84
  function L1_84(A0_85, A1_86)
    if A1_86 < 0 then
      A1_86 = 0
    elseif A1_86 > 100 then
      A1_86 = 100
    end
    A0_85.cautionCount = A1_86
  end
  L0_83.setCautionCount = L1_84
  function L1_84(A0_87)
    local L1_88
    L1_88 = A0_87.cautionCount
    return L1_88
  end
  L0_83.getCautionCount = L1_84
  function L1_84(A0_89, A1_90)
    if A1_90 < 0 then
      A1_90 = 0
    elseif A1_90 > 100 then
      A1_90 = 100
    end
    A0_89.hitCount = A1_90
  end
  L0_83.setHitCount = L1_84
  function L1_84(A0_91)
    local L1_92
    L1_92 = A0_91.hitCount
    return L1_92
  end
  L0_83.getHitCount = L1_84
  function L1_84(A0_93)
    A0_93.task:abort()
  end
  L0_83.taskAbort = L1_84
  function L1_84(A0_94)
    A0_94.task = mechCannonTask(A0_94)
  end
  L0_83.action = L1_84
  return L0_83
end
function pccubesensor2_warship_OnEnter(A0_95, A1_96)
  debugPrint("pccubesensor2_warship_OnEnter")
  intrusion_caution_range = true
end
function pccubesensor2_warship_OnLeave(A0_97, A1_98)
  debugPrint("pccubesensor2_warship_OnLeave")
  intrusion_caution_range = false
end
function mechCannonTask(A0_99)
  return invokeTask(function()
    local L0_100, L1_101
    while true do
      L0_100 = __warship_hdl
      if L0_100 then
        L0_100 = HUD
        L1_101 = L0_100
        L0_100 = L0_100.faderAlpha
        L0_100 = L0_100(L1_101)
        if L0_100 >= 1 then
          L0_100 = enmgen_upper
          if L0_100 ~= nil then
            L0_100 = enmgen_upper
            L1_101 = L0_100
            L0_100 = L0_100.setEnemyMarker
            L0_100(L1_101, false)
            L0_100 = enmgen_upper
            L1_101 = L0_100
            L0_100 = L0_100.requestIdlingEnemy
            L0_100(L1_101, true)
          end
          L0_100 = enmgen_under
          if L0_100 ~= nil then
            L0_100 = enmgen_under
            L1_101 = L0_100
            L0_100 = L0_100.setEnemyMarker
            L0_100(L1_101, false)
            L0_100 = enmgen_under
            L1_101 = L0_100
            L0_100 = L0_100.requestIdlingEnemy
            L0_100(L1_101, true)
          end
          intrusion_caution_range = false
          L0_100 = A0_99
          L1_101 = L0_100
          L0_100 = L0_100.setCautionCount
          L0_100(L1_101, 0)
          L0_100 = WARSHIP_STATUS
          L0_100 = L0_100.NORMAL
          A0_99.status = L0_100
          L0_100 = siren_handle
          if L0_100 then
            L0_100 = Sound
            L1_101 = L0_100
            L0_100 = L0_100.stopSEHandle
            L0_100(L1_101, siren_handle)
            siren_handle = nil
          end
        end
        L0_100 = A0_99.status
        L1_101 = WARSHIP_STATUS
        L1_101 = L1_101.NORMAL
        if L0_100 == L1_101 then
          L0_100 = GameDatabase
          L1_101 = L0_100
          L0_100 = L0_100.get
          L0_100 = L0_100(L1_101, ggd.Savedata__EventManageFlags__WarShipCannon)
          if L0_100 then
            L0_100 = intrusion_caution_range
            if L0_100 then
              L0_100 = siren_handle
              if L0_100 == nil then
                L0_100 = Sound
                L1_101 = L0_100
                L0_100 = L0_100.playSEHandle
                L0_100 = L0_100(L1_101, "ep10_siren", 1, "", __warship_hdl)
                siren_handle = L0_100
                L0_100 = Fn_captionView
                L1_101 = "ic_warship_00100"
                L0_100(L1_101)
              end
              L0_100 = 1
              L1_101 = A0_99
              L1_101 = L1_101.setCautionCount
              L1_101(L1_101, A0_99:getCautionCount() + L0_100)
              L1_101 = A0_99
              L1_101 = L1_101.getCautionCount
              L1_101 = L1_101(L1_101)
              if L1_101 >= A0_99.countMax then
                L1_101 = WARSHIP_STATUS
                L1_101 = L1_101.CANNON_START
                A0_99.status = L1_101
              end
            else
              L0_100 = A0_99
              L1_101 = L0_100
              L0_100 = L0_100.getCautionCount
              L0_100 = L0_100(L1_101)
              if L0_100 > 0 then
                L0_100 = -1
                L1_101 = A0_99
                L1_101 = L1_101.setCautionCount
                L1_101(L1_101, A0_99:getCautionCount() + L0_100)
                L1_101 = A0_99
                L1_101 = L1_101.getCautionCount
                L1_101 = L1_101(L1_101)
                if L1_101 <= A0_99.countMin then
                  L1_101 = siren_handle
                  if L1_101 then
                    L1_101 = Sound
                    L1_101 = L1_101.stopSEHandle
                    L1_101(L1_101, siren_handle)
                    siren_handle = nil
                    L1_101 = Fn_captionView
                    L1_101("ic_warship_00101")
                  end
                end
              end
            end
          else
            L0_100 = A0_99
            L1_101 = L0_100
            L0_100 = L0_100.setCautionCount
            L0_100(L1_101, 0)
            L0_100 = siren_handle
            if L0_100 then
              L0_100 = Sound
              L1_101 = L0_100
              L0_100 = L0_100.stopSEHandle
              L0_100(L1_101, siren_handle)
              siren_handle = nil
            end
          end
        else
          L0_100 = A0_99.status
          L1_101 = WARSHIP_STATUS
          L1_101 = L1_101.CANNON_START
          if L0_100 == L1_101 then
            L0_100 = GameDatabase
            L1_101 = L0_100
            L0_100 = L0_100.get
            L0_100 = L0_100(L1_101, ggd.Savedata__EventManageFlags__WarShipCannon)
            if L0_100 then
              L0_100 = mechcannon_upper_invalid
              if L0_100 == false then
                L0_100 = enmgen_upper
                if L0_100 ~= nil then
                  L0_100 = enmgen_upper
                  L1_101 = L0_100
                  L0_100 = L0_100.requestIdlingEnemy
                  L0_100(L1_101, false)
                end
              end
              L0_100 = mechcannon_under_invalid
              if L0_100 == false then
                L0_100 = enmgen_under
                if L0_100 ~= nil then
                  L0_100 = enmgen_under
                  L1_101 = L0_100
                  L0_100 = L0_100.requestIdlingEnemy
                  L0_100(L1_101, false)
                end
              end
              L0_100 = WARSHIP_STATUS
              L0_100 = L0_100.SHOT_WAIT
              A0_99.status = L0_100
            else
              L0_100 = A0_99
              L1_101 = L0_100
              L0_100 = L0_100.setCautionCount
              L0_100(L1_101, 0)
              L0_100 = WARSHIP_STATUS
              L0_100 = L0_100.NORMAL
              A0_99.status = L0_100
            end
          else
            L0_100 = A0_99.status
            L1_101 = WARSHIP_STATUS
            L1_101 = L1_101.SHOT_WAIT
            if L0_100 == L1_101 then
              L0_100 = GameDatabase
              L1_101 = L0_100
              L0_100 = L0_100.get
              L0_100 = L0_100(L1_101, ggd.Savedata__EventManageFlags__WarShipCannon)
              if L0_100 then
                L0_100 = intrusion_caution_range
                if L0_100 then
                  L0_100 = Fn_captionView
                  L1_101 = "ic_warship_00102"
                  L0_100(L1_101)
                  L0_100 = __warship_hdl
                  L1_101 = L0_100
                  L0_100 = L0_100.getWorldPos
                  L0_100 = L0_100(L1_101)
                  L1_101 = Fn_getDistanceToPlayer
                  L1_101 = L1_101(L0_100)
                  debugPrint("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\227\129\168\227\129\174\232\183\157\233\155\162 " .. L1_101)
                  if L1_101 > 300 then
                    hit_time = 1
                  elseif L1_101 > 150 then
                    hit_time = 3
                  else
                    hit_time = 5
                  end
                  A0_99.status = WARSHIP_STATUS.HIT_COUNT
                else
                  L0_100 = mechcannon_upper_invalid
                  if L0_100 then
                    L0_100 = enmgen_upper
                    if L0_100 ~= nil then
                      L0_100 = enmgen_upper
                      L1_101 = L0_100
                      L0_100 = L0_100.requestIdlingEnemy
                      L0_100(L1_101, true)
                    end
                  end
                  L0_100 = mechcannon_under_invalid
                  if L0_100 then
                    L0_100 = enmgen_under
                    if L0_100 ~= nil then
                      L0_100 = enmgen_under
                      L1_101 = L0_100
                      L0_100 = L0_100.requestIdlingEnemy
                      L0_100(L1_101, true)
                    end
                  end
                  L0_100 = WARSHIP_STATUS
                  L0_100 = L0_100.NORMAL
                  A0_99.status = L0_100
                end
              else
                L0_100 = A0_99
                L1_101 = L0_100
                L0_100 = L0_100.setCautionCount
                L0_100(L1_101, 0)
                L0_100 = WARSHIP_STATUS
                L0_100 = L0_100.NORMAL
                A0_99.status = L0_100
              end
            else
              L0_100 = A0_99.status
              L1_101 = WARSHIP_STATUS
              L1_101 = L1_101.HIT_COUNT
              if L0_100 == L1_101 then
                L0_100 = hit_time
                L0_100 = 1 * L0_100
                L1_101 = A0_99
                L1_101 = L1_101.setHitCount
                L1_101(L1_101, A0_99:getHitCount() + L0_100)
                L1_101 = A0_99
                L1_101 = L1_101.getHitCount
                L1_101 = L1_101(L1_101)
                if L1_101 >= A0_99.countMax then
                  L1_101 = WARSHIP_STATUS
                  L1_101 = L1_101.HIT
                  A0_99.status = L1_101
                end
              else
                L0_100 = A0_99.status
                L1_101 = WARSHIP_STATUS
                L1_101 = L1_101.HIT
                if L0_100 == L1_101 then
                  L0_100 = GameDatabase
                  L1_101 = L0_100
                  L0_100 = L0_100.get
                  L0_100 = L0_100(L1_101, ggd.Savedata__EventManageFlags__WarShipCannon)
                  if L0_100 then
                    L0_100 = debugPrint
                    L1_101 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\239\188\154\231\160\178\230\146\131\227\129\140\231\157\128\229\188\190\227\129\151\227\129\190\227\129\151\227\129\159"
                    L0_100(L1_101)
                    L0_100 = Sound
                    L1_101 = L0_100
                    L0_100 = L0_100.playSE
                    L0_100(L1_101, "ef_ev_exp_01", 1, "", Player.getPuppet())
                    L0_100 = Fn_createEffect
                    L1_101 = "bom"
                    L0_100 = L0_100(L1_101, "ef_ev_exp_01", Fn_getPlayerWorldPos(), false)
                    L1_101 = GameDatabase
                    L1_101 = L1_101.get
                    L1_101 = L1_101(L1_101, ggd.GlobalSystemFlags__GameOver)
                    if not L1_101 then
                      L1_101 = GameDatabase
                      L1_101 = L1_101.get
                      L1_101 = L1_101(L1_101, ggd.Savedata__GlobalSystemFlags__GovernmentCatWarp)
                      if not L1_101 then
                        L1_101 = print
                        L1_101("\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\229\129\180\227\129\174\231\160\178\230\146\131\229\135\166\231\144\134\227\130\146\233\150\139\229\167\139\227\128\130\231\183\143\231\157\163\229\186\156\229\129\180\227\130\146\230\142\146\228\187\150\227\129\151\227\129\190\227\129\153")
                        L1_101 = GameDatabase
                        L1_101 = L1_101.set
                        L1_101(L1_101, ggd.GlobalSystemFlags__GovernmentCatWarp, true)
                        L1_101 = Sound
                        L1_101 = L1_101.playSE
                        L1_101(L1_101, "pc1_011", 1, "", Player.getPuppet())
                        L1_101 = Fn_captionView
                        L1_101("ic_warship_00103")
                        L1_101 = Player
                        L1_101 = L1_101.setControl
                        L1_101(L1_101, Player.kControl_All, false)
                        L1_101 = Fn_catWarpIn
                        L1_101()
                        L1_101 = Fn_getCatWarpCheckPoint
                        L1_101 = L1_101()
                        if L1_101 == "None" or L1_101 == "" or L1_101 == nil then
                          Fn_setCatWarpCheckPoint("locator2_warship_catwarp_01")
                        end
                        if GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName) == "ep07_f" then
                          Fn_setCatWarpCheckPoint("locator2_warship_catwarp_ep07_f")
                        end
                        Fn_catWarpCheckPoint()
                        if Player:getRecentAreaName() == "ar_a_root" then
                        else
                          if enmgen_upper ~= nil then
                            enmgen_upper:requestIdlingEnemy(true)
                          end
                          if enmgen_under ~= nil then
                            enmgen_under:requestIdlingEnemy(true)
                          end
                          intrusion_caution_range = false
                        end
                        if L0_100 ~= nil then
                          L0_100:kill()
                          L0_100 = nil
                        end
                        if siren_handle then
                          Sound:stopSEHandle(siren_handle)
                          siren_handle = nil
                        end
                        A0_99:setCautionCount(0)
                        A0_99:setHitCount(0)
                        A0_99.status = WARSHIP_STATUS.NORMAL
                        clearMechCannonShot()
                        hit_time = 0
                        hit_place = 0
                        Fn_catWarpOut()
                        Fn_setCatWarpCheckPoint(L1_101)
                        Fn_captionView("ic_warship_00104")
                        Player:setControl(Player.kControl_All, true)
                        GameDatabase:set(ggd.GlobalSystemFlags__GovernmentCatWarp, false)
                      end
                    else
                      L1_101 = debugPrint
                      L1_101("\227\130\178\227\131\188\227\131\160\227\130\170\227\131\188\227\131\144\227\131\188\227\129\171\227\129\170\227\129\163\227\129\159\227\129\159\227\130\129\227\128\129\227\131\141\227\130\179\227\131\175\227\131\188\227\131\151\227\129\175\232\161\140\227\129\132\227\129\190\227\129\155\227\130\147\227\128\130")
                    end
                  else
                    L0_100 = debugPrint
                    L1_101 = "\227\131\147\227\130\185\227\131\158\227\131\172\227\130\162\239\188\154\231\160\178\230\146\131\227\129\140\229\164\150\227\130\140\227\129\190\227\129\151\227\129\159"
                    L0_100(L1_101)
                    L0_100 = math
                    L0_100 = L0_100.random
                    L1_101 = 4
                    L0_100 = L0_100(L1_101)
                    L1_101 = nil
                    if L0_100 == 1 then
                      L1_101 = Fn_getPlayerWorldPos() + Vector(3, 1.5, 0)
                    elseif L0_100 == 2 then
                      L1_101 = Fn_getPlayerWorldPos() + Vector(-3, 1.5, 0)
                    elseif L0_100 == 3 then
                      L1_101 = Fn_getPlayerWorldPos() + Vector(0, 1.5, 3)
                    elseif L0_100 == 4 then
                      L1_101 = Fn_getPlayerWorldPos() + Vector(0, 1.5, -3)
                    end
                    Sound:playSE("ef_ev_exp_01", 1, "", L1_101)
                    A0_99:setHitCount(0)
                    A0_99.status = WARSHIP_STATUS.SHOT_WAIT
                    clearMechCannonShot()
                    hit_time = 0
                    hit_place = 0
                  end
                else
                  L0_100 = debugPrint
                  L1_101 = "\230\156\170\231\159\165\227\129\174\227\130\185\227\131\134\227\131\188\227\130\191\227\130\185\227\129\167\227\129\153\227\128\130"
                  L0_100(L1_101)
                end
              end
            end
          end
        end
        L0_100 = wait
        L0_100()
      end
    end
  end)
end
function changeGimmickBg()
  local L0_102
  L0_102 = nil
  while true do
    if not __warship_hdl then
      wait()
    else
      if _pilothouse and __warship_hdl then
        if __warship_hdl:getMasterActive() then
          L0_102 = L0_102 or Fn_findGimmickBgInBgset("building_kk_50_01")
          if L0_102 and not L0_102:isBroken() then
            if L0_102:isRunning() then
              L0_102:requestBreak(L0_102:getWorldPos(), 1, 0)
            else
              L0_102:requestBrokenStart(false)
            end
          end
        else
          L0_102 = nil
        end
      end
      wait()
    end
  end
end
function requestWarshipBroken(A0_103)
  local L1_104
  _pilothouse = A0_103
end
function requestWarshipWarp(A0_105)
  invokeTask(function()
    repeat
      wait()
    until __warship_hdl2
    _ac:stop()
    _ac:warp(A0_105)
  end)
end
function debugPrint(A0_106)
  print(" < war mng > " .. tostring(A0_106))
end
