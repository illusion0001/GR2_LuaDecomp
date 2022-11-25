dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
_wom33_event_mot_list = {
  idle = "wom33_et_a_stay_00",
  inform = "wom33_et_a_inform_00"
}
enmgen2_battle_i_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "lunafishowner",
      locator = "locator_i1_01",
      name = "lunashipowner01",
      ai_spawn_option = "LunaFishOwner/owner_ep21"
    },
    {
      type = "lunafishowner",
      locator = "locator_i1_02",
      name = "lunashipowner02",
      ai_spawn_option = "LunaFishOwner/owner_ep21"
    },
    {
      type = "lunafishowner",
      locator = "locator_i1_03",
      name = "lunashipowner03",
      ai_spawn_option = "LunaFishOwner/owner_ep21"
    }
  },
  addMotherShipSpawnSetName = "spawnSetMotherShip",
  spawnSetMotherShip = {
    {
      type = "childship",
      locator = "locator_i1_01",
      name = "childship01"
    },
    {
      type = "childship",
      locator = "locator_i1_02",
      name = "childship02"
    },
    {
      type = "childship",
      locator = "locator_i1_03",
      name = "childship03"
    }
  },
  addLunaFishOwnerSpawnSetName = "spawnSetLunaFishOwner",
  spawnSetLunaFishOwner = {
    {
      type = "lunafish_high",
      locator = "locator_i1_01",
      name = "lunafish01"
    },
    {
      type = "lunafish_high",
      locator = "locator_i1_02",
      name = "lunafish02"
    },
    {
      type = "lunafish_high",
      locator = "locator_i1_03",
      name = "lunafish03"
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
  end
}
enmgen2_battle_i_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "imp_high",
      locator = "locator_i2_01",
      name = "imp01"
    },
    {
      type = "imp_high",
      locator = "locator_i2_02",
      name = "imp02"
    },
    {
      type = "imp_high",
      locator = "locator_i2_03",
      name = "imp03"
    },
    {
      type = "imp_high",
      locator = "locator_i2_04",
      name = "imp04"
    },
    {
      type = "imp_high",
      locator = "locator_i2_05",
      name = "imp05"
    },
    {
      type = "imp_high",
      locator = "locator_i2_06",
      name = "imp06"
    },
    {
      type = "imp_high",
      locator = "locator_i2_07",
      name = "imp07"
    },
    {
      type = "imp_high",
      locator = "locator_i2_08",
      name = "imp08"
    },
    {
      type = "imp_high",
      locator = "locator_i2_09",
      name = "imp09"
    },
    {
      type = "imp_high",
      locator = "locator_i2_10",
      name = "imp10"
    },
    {
      type = "imp_high",
      locator = "locator_i2_11",
      name = "imp11"
    },
    {
      type = "imp_high",
      locator = "locator_i2_12",
      name = "imp12"
    },
    {
      type = "imp_high",
      locator = "locator_i2_13",
      name = "imp13"
    },
    {
      type = "imp_high",
      locator = "locator_i2_14",
      name = "imp14"
    },
    {
      type = "imp_high",
      locator = "locator_i2_15",
      name = "imp15"
    },
    {
      type = "imp_high",
      locator = "locator_i2_16",
      name = "imp16"
    }
  },
  onUpdate = function(A0_8)
    local L1_9
  end,
  onEnter = function(A0_10)
    local L1_11
  end,
  onLeave = function(A0_12)
    local L1_13
  end,
  onObjectDead = function(A0_14, A1_15)
  end
}
enmgen2_battle_i_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mothership_high",
      locator = "locator_i3_01",
      name = "mothership01"
    }
  },
  onUpdate = function(A0_16)
    local L1_17
  end,
  onEnter = function(A0_18)
    local L1_19
  end,
  onLeave = function(A0_20)
    local L1_21
  end,
  onObjectDead = function(A0_22, A1_23)
  end
}
function Initialize()
  shiphandle = mother2:sendEvent("getBackgroundElement2Handle", "ship")
  shiphandle:loadMotionFileAsset("root_loc_top")
  while shiphandle:isMotionLoading() do
    wait()
  end
  Fn_loadNpcEventMotion("npcgen2_wom33_01", _wom33_event_mot_list)
end
function Ingame()
  local L0_24, L1_25, L2_26, L3_27, L4_28, L5_29, L6_30, L7_31, L8_32, L9_33, L10_34, L11_35, L12_36, L13_37, L14_38, L15_39, L16_40
  L0_24 = Fn_spawnSuppotCrow
  L1_25 = false
  L2_26 = Supporter
  L2_26 = L2_26.FirstAction
  L2_26 = L2_26.Ground
  L3_27 = "locator2_crow"
  L0_24 = L0_24(L1_25, L2_26, L3_27)
  _crow_pup = L0_24
  L0_24 = _crow_pup
  L1_25 = L0_24
  L0_24 = L0_24.getBrain
  L0_24 = L0_24(L1_25)
  L2_26 = L0_24
  L1_25 = L0_24.setIdling
  L3_27 = true
  L1_25(L2_26, L3_27)
  L2_26 = L0_24
  L1_25 = L0_24.setDetectThreatDistance
  L3_27 = 0
  L1_25(L2_26, L3_27)
  L2_26 = L0_24
  L1_25 = L0_24.lockToWarp
  L3_27 = findGameObject2
  L4_28 = "Node"
  L5_29 = "locator2_crow"
  L3_27 = L3_27(L4_28, L5_29)
  L4_28 = Supporter
  L4_28 = L4_28.FirstAction
  L4_28 = L4_28.Ground
  L1_25(L2_26, L3_27, L4_28)
  L1_25 = Fn_playSupporterEventMotion
  L2_26 = _crow_pup
  L3_27 = "stay"
  L4_28 = -1
  L5_29 = 0.5
  L1_25(L2_26, L3_27, L4_28, L5_29)
  L1_25 = _crow_pup
  L2_26 = L1_25
  L1_25 = L1_25.setVisible
  L3_27 = false
  L1_25(L2_26, L3_27)
  while true do
    L1_25 = _crow_puppet
    if L1_25 == nil then
      L1_25 = Fn_findNpcPuppet
      L2_26 = "npcgen2_crow01_01"
      L1_25 = L1_25(L2_26)
      _crow_puppet = L1_25
      L1_25 = wait
      L1_25()
    end
  end
  L1_25 = Fn_findNpcPuppet
  L2_26 = "npcgen2_wom33_01"
  L1_25 = L1_25(L2_26)
  L2_26 = Fn_getPlayer
  L2_26 = L2_26()
  L3_27 = {}
  L3_27.r_stick = false
  L3_27.l_stick = false
  L3_27.v_infinite = true
  L3_27.g_infinite = false
  L3_27.s_infinite = false
  L4_28 = {}
  L5_29 = Fn_lockPlayerAbility
  L6_30 = L4_28
  L5_29(L6_30, L7_31)
  L5_29 = findGameObject2
  L6_30 = "EnemyGenerator"
  L5_29 = L5_29(L6_30, L7_31)
  if L5_29 ~= nil then
    L6_30 = L5_29.requestSpawn
    L6_30(L7_31)
  end
  L6_30 = L5_29.setEnemyMarker
  L6_30(L7_31, L8_32)
  L6_30 = {}
  for L10_34 = 1, 3 do
    L12_36 = "EnemyBrain"
    L16_40 = L10_34
    L6_30[L10_34] = L11_35
  end
  if L7_31 ~= nil then
    L8_32(L9_33)
  end
  L8_32(L9_33, L10_34)
  for L12_36 = 1, 16 do
    L16_40 = string
    L16_40 = L16_40.format
    L16_40 = L16_40("%02d", L12_36)
    L8_32[L12_36] = L13_37
  end
  if L9_33 ~= nil then
    L10_34(L11_35)
  end
  L12_36 = false
  L10_34(L11_35, L12_36)
  L12_36 = L11_35
  L11_35(L12_36, L13_37)
  L12_36 = L10_34
  L11_35(L12_36, L13_37)
  L12_36 = L10_34
  L11_35(L12_36, L13_37)
  L12_36 = L10_34
  L11_35(L12_36, L13_37)
  L12_36 = L10_34
  L11_35(L12_36, L13_37)
  L12_36 = L10_34
  L11_35(L12_36)
  L12_36 = L10_34
  L11_35(L12_36)
  L12_36 = L10_34
  L11_35(L12_36)
  L12_36 = L11_35
  L11_35(L12_36, L13_37)
  L12_36 = L11_35
  L11_35(L12_36, L13_37)
  L12_36 = L11_35
  L11_35(L12_36, L13_37)
  L12_36 = "npcgen2_wom33_01"
  L16_40 = false
  L11_35(L12_36, L13_37, L14_38, L15_39, L16_40)
  L12_36 = L11_35
  L16_40 = false
  L11_35(L12_36, L13_37, L14_38, L15_39, L16_40, false)
  L12_36 = L11_35
  if L11_35 == true then
    L12_36 = print
    L12_36(L13_37)
  end
  L12_36 = Fn_missionStart
  L12_36()
  L12_36 = Fn_userCtrlOn
  L12_36()
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = Sound
  L12_36 = L12_36.playSE
  L16_40 = ""
  L12_36(L13_37, L14_38, L15_39, L16_40, _crow_puppet)
  L12_36 = Fn_captionView
  L12_36(L13_37)
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = Sound
  L12_36 = L12_36.playSE
  L16_40 = ""
  L12_36(L13_37, L14_38, L15_39, L16_40, _crow_puppet)
  L12_36 = Fn_captionView
  L12_36(L13_37)
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = Fn_captionView
  L12_36(L13_37)
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = Fn_captionView
  L12_36(L13_37)
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = L5_29.requestIdlingEnemy
  L12_36(L13_37, L14_38)
  L12_36 = Sound
  L12_36 = L12_36.playSE
  L16_40 = ""
  L12_36(L13_37, L14_38, L15_39, L16_40, L2_26)
  L12_36 = Fn_captionView
  L12_36(L13_37)
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = Sound
  L12_36 = L12_36.playSE
  L16_40 = ""
  L12_36(L13_37, L14_38, L15_39, L16_40, _crow_puppet)
  L12_36 = Fn_captionView
  L12_36(L13_37)
  L12_36 = waitSeconds
  L12_36(L13_37)
  L12_36 = {}
  L13_37(L14_38, L15_39)
  L16_40 = "locator2_move0_01"
  L13_37(L14_38, L15_39)
  L16_40 = "locator2_move0_02"
  L13_37(L14_38, L15_39)
  L16_40 = "locator2_move0_03"
  L13_37(L14_38, L15_39)
  L16_40 = true
  L13_37(L14_38, L15_39, L16_40, 0.1, true, false)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", L2_26)
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", _crow_puppet)
  L16_40 = "Puppet"
  L16_40 = L15_39(L16_40, "lunafish01")
  L13_37(L14_38, L15_39, L16_40, L15_39(L16_40, "lunafish01"))
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", L2_26)
  L13_37(L14_38)
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", _crow_puppet)
  L13_37(L14_38)
  L13_37(L14_38)
  L16_40 = "Puppet"
  L16_40 = L15_39(L16_40, "imp01")
  L13_37(L14_38, L15_39, L16_40, L15_39(L16_40, "imp01"))
  L16_40 = -1
  L13_37(L14_38, L15_39, L16_40, 0.5)
  L16_40 = true
  L13_37(L14_38, L15_39, L16_40, 0, true, false)
  L13_37(L14_38)
  for L16_40 = 1, 16 do
    L8_32[L16_40]:move({
      "locator2_move_" .. string.format("%02d", L16_40)
    })
  end
  L13_37(L14_38)
  for L16_40 = 1, 16 do
    L8_32[L16_40]:move({
      "locator2_move_e_" .. string.format("%02d", L16_40)
    })
  end
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", L2_26)
  L13_37(L14_38)
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", _crow_puppet)
  L13_37(L14_38)
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", L1_25)
  L13_37(L14_38)
  L13_37(L14_38)
  L16_40 = 1
  L13_37(L14_38, L15_39, L16_40, "", L1_25)
  L13_37(L14_38)
  L13_37(L14_38)
  L13_37(L14_38)
  L16_40 = {
    "locator2_move_20"
  }
  L14_38(L15_39, L16_40)
  L14_38(L15_39)
  L16_40 = "w23_004"
  L14_38(L15_39, L16_40, 1, "", L1_25)
  L14_38(L15_39)
  L16_40 = _wom33_event_mot_list
  L16_40 = L16_40.inform
  L14_38(L15_39, L16_40, -1, 0, true, 0, true)
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38(L15_39)
  L16_40 = "kit040c"
  L14_38(L15_39, L16_40, 1, "", L2_26)
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38(L15_39)
  L16_40 = "w23_005"
  L14_38(L15_39, L16_40, 1, "", L1_25)
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38()
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38(L15_39)
  L16_40 = "kit_552"
  L14_38(L15_39, L16_40, 1, "", L2_26)
  L14_38(L15_39)
  L14_38(L15_39)
  L16_40 = false
  L14_38(L15_39, L16_40)
  L14_38(L15_39)
  L16_40 = "cro_245"
  L14_38(L15_39, L16_40, 1, "", _crow_puppet)
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38(L15_39)
  L16_40 = "w23_006"
  L14_38(L15_39, L16_40, 1, "", L1_25)
  L14_38(L15_39)
  L14_38(L15_39)
  L14_38(L15_39)
  L16_40 = 0
  L14_38(L15_39, L16_40)
  L16_40 = Player
  L16_40 = L16_40.kSituation_Normal
  L14_38(L15_39, L16_40, true, 0.1, true, false)
  L14_38()
  L14_38()
  L14_38()
  L14_38()
end
function Finalize()
  local L0_41, L1_42
  L0_41 = {}
  L0_41.r_stick = false
  L0_41.l_stick = false
  L0_41.v_infinite = true
  L0_41.g_infinite = false
  L0_41.s_infinite = false
  L1_42 = {}
  if Fn_getPlayer() then
    Fn_unLockPlayerAbility(L1_42, L0_41)
  end
end
function navi_on()
  local L0_43, L1_44
  _next_phase = true
end
function waitPhace()
  while not _next_phase do
    wait()
  end
  _next_phase = false
end
function camera_seal()
  local L0_45, L1_46
  L0_45 = {}
  L0_45.r_stick = true
  L0_45.l_stick = false
  L1_46 = {}
  Fn_lockPlayerAbility(L1_46, L0_45)
  print("\227\130\171\227\131\161\227\131\169\230\147\141\228\189\156\229\176\129\229\141\176")
end
function camera_unseal()
  local L0_47
  L0_47 = {}
  L0_47.r_stick = true
  L0_47.l_stick = false
  Fn_unLockPlayerAbility(nil, L0_47)
  print("\227\130\171\227\131\161\227\131\169\230\147\141\228\189\156\229\176\129\229\141\176")
end
