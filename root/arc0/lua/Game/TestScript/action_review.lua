dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/PlayerCommon.lua")
dofile("/Game/Misc/balloon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
import("Camera")
__puppet_tbl = {}
__next_phase = false
_chi_pupp = nil
_balloon = nil
_child_name = "review_child"
_balloon_name = "review_balloon"
_set_pos_node = "locator2_child_01"
_set_balloon_node = "locator2_balloon_01"
__updateTarget = {}
__sensor_handle = {
  run = nil,
  out = nil,
  finish = nil,
  ex_run = nil
}
__view_pos = nil
BEFORE_DISP_NAVI_WAIT = 0.5
__crate_cap_wait = 20
__crate_cnt = 5
__enemy_cnt = 0
__crow_puppet = nil
enmgen2_battle_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_01",
      name = "special01"
    },
    {
      type = "stalker",
      locator = "locator_ene_02",
      name = "special02"
    },
    {
      type = "stalker",
      locator = "locator_ene_03",
      name = "special03"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "gellyfish",
      locator = "locator_ene_04",
      name = "special04"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_05",
      name = "special05"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_06",
      name = "special06"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_07",
      name = "special07"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mosquito",
      locator = "locator_ene_08",
      name = "special08"
    },
    {
      type = "mosquito",
      locator = "locator_ene_09",
      name = "special09"
    },
    {
      type = "mosquito",
      locator = "locator_ene_10",
      name = "special10"
    },
    {
      type = "mosquito",
      locator = "locator_ene_11",
      name = "special11"
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
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "stalker",
      locator = "locator_ene_12",
      name = "special12"
    },
    {
      type = "stalker",
      locator = "locator_ene_13",
      name = "special13"
    },
    {
      type = "stalker",
      locator = "locator_ene_14",
      name = "special14"
    },
    {
      type = "stalker",
      locator = "locator_ene_15",
      name = "special15"
    },
    {
      type = "stalker",
      locator = "locator_ene_16",
      name = "special16"
    },
    {
      type = "stalker",
      locator = "locator_ene_17",
      name = "special17"
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
  onObjectDead = function(A0_30, A1_31)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_18",
      name = "special18"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_19",
      name = "special19"
    },
    {
      type = "mosquito",
      locator = "locator_ene_20",
      name = "special20"
    }
  },
  onUpdate = function(A0_32)
    local L1_33
  end,
  onEnter = function(A0_34)
    local L1_35
  end,
  onLeave = function(A0_36)
    local L1_37
  end,
  onObjectDead = function(A0_38, A1_39)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_21",
      name = "special21"
    },
    {
      type = "guardcore",
      locator = "locator_ene_22",
      name = "special22"
    },
    {
      type = "guardcore",
      locator = "locator_ene_23",
      name = "special23"
    }
  },
  onUpdate = function(A0_40)
    local L1_41
  end,
  onEnter = function(A0_42)
    local L1_43
  end,
  onLeave = function(A0_44)
    local L1_45
  end,
  onObjectDead = function(A0_46, A1_47)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "guardcore",
      locator = "locator_ene_24",
      name = "special24"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_25",
      name = "special25"
    },
    {
      type = "gellyfish",
      locator = "locator_ene_26",
      name = "special26"
    }
  },
  onUpdate = function(A0_48)
    local L1_49
  end,
  onEnter = function(A0_50)
    local L1_51
  end,
  onLeave = function(A0_52)
    local L1_53
  end,
  onObjectDead = function(A0_54, A1_55)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
enmgen2_battle_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "giant",
      locator = "locator_ene_27",
      name = "special27"
    },
    {
      type = "giant",
      locator = "locator_ene_28",
      name = "special28"
    },
    {
      type = "guardcore",
      locator = "locator_ene_29",
      name = "special29"
    }
  },
  onUpdate = function(A0_56)
    local L1_57
  end,
  onEnter = function(A0_58)
    local L1_59
  end,
  onLeave = function(A0_60)
    local L1_61
  end,
  onObjectDead = function(A0_62, A1_63)
    __enemy_cnt = __enemy_cnt - 1
    print("\230\149\181\227\130\171\227\130\166\227\131\179\227\131\136" .. __enemy_cnt)
  end
}
function Initialize()
  local L0_64, L1_65, L2_66, L3_67, L4_68, L5_69, L6_70, L7_71
  L0_64 = Balloon
  L0_64 = L0_64.create
  L1_65 = "_balloon_name"
  L0_64 = L0_64(L1_65)
  _balloon = L0_64
  L0_64 = _balloon
  L1_65 = L0_64
  L0_64 = L0_64.start
  L0_64(L1_65)
  L0_64 = findGameObject2
  L1_65 = "Node"
  L2_66 = "locator2_balloon_01"
  L0_64 = L0_64(L1_65, L2_66)
  L2_66 = L0_64
  L1_65 = L0_64.getWorldPos
  L1_65 = L1_65(L2_66)
  L2_66 = _balloon
  L2_66 = L2_66.puppet
  L2_66 = L2_66.setWorldPos
  L2_66(L3_67, L4_68)
  L2_66 = _balloon
  L2_66 = L2_66.move
  L2_66(L3_67, L4_68, L5_69)
  L2_66 = {
    L3_67,
    L4_68,
    L5_69,
    L6_70,
    L7_71,
    {
      name = "npc_wom01_04",
      type = "wom16",
      node = "locator2_woman_04"
    },
    {
      name = "npc_man01_03",
      type = "man03",
      node = "locator2_man_03"
    },
    {
      name = "npc_man01_04",
      type = "man02",
      node = "locator2_man_04"
    }
  }
  L3_67.name = "npc_dus01"
  L3_67.type = "dus01"
  L3_67.node = "locator2_dusty_01"
  L4_68.name = "npc_man01_01"
  L4_68.type = "man11"
  L4_68.node = "locator2_man_01"
  L5_69.name = "npc_wom01_01"
  L5_69.type = "wom02"
  L5_69.node = "locator2_woman_01"
  L6_70 = {}
  L6_70.name = "npc_wom01_02"
  L6_70.type = "wom06"
  L6_70.node = "locator2_woman_02"
  L7_71 = {}
  L7_71.name = "npc_wom01_03"
  L7_71.type = "wom11"
  L7_71.node = "locator2_woman_03"
  L3_67(L4_68)
  _chi_pupp = L3_67
  for L6_70, L7_71 in L3_67(L4_68) do
    __puppet_tbl[L7_71.name] = Fn_findChara(L7_71.name):getPuppet()
  end
  L6_70 = navi_on
  L7_71 = true
  L3_67(L4_68, L5_69, L6_70, L7_71)
  L6_70 = navi_on
  L7_71 = true
  L3_67(L4_68, L5_69, L6_70, L7_71)
  L6_70 = navi_on
  L7_71 = true
  L3_67(L4_68, L5_69, L6_70, L7_71)
  L6_70 = navi_on
  L7_71 = true
  L3_67(L4_68, L5_69, L6_70, L7_71)
  L6_70 = navi_on
  L7_71 = true
  L3_67(L4_68, L5_69, L6_70, L7_71)
  L6_70 = navi_on
  L7_71 = true
  L3_67(L4_68, L5_69, L6_70, L7_71)
  for L6_70, L7_71 in L3_67(L4_68) do
    Fn_disableKaiwaDemo(L7_71)
  end
  cam_hdl = L3_67
  L3_67(L4_68, L5_69)
  L3_67(L4_68, L5_69)
  cam_node = L3_67
  L3_67(L4_68, L5_69)
  L3_67(L4_68, L5_69)
  aim_node = L3_67
  L3_67(L4_68, L5_69)
  for L6_70 = 1, 9 do
    L7_71 = GemSetDisp
    L7_71(L6_70, false)
  end
  sim_hdl = L4_68
  L6_70 = "gp_m_bk_testbk_third"
  L4_68(L5_69, L6_70)
  L6_70 = "dummy_haze"
  L4_68(L5_69, L6_70)
  L6_70 = Vector
  L7_71 = 0
  L7_71 = L6_70(L7_71, -6, 0)
  L4_68(L5_69, L6_70, L7_71, L6_70(L7_71, -6, 0))
  L6_70 = false
  L4_68(L5_69, L6_70)
  L6_70 = sim_hdl
  L4_68(L5_69, L6_70)
  __crow_puppet = L4_68
end
function Ingame()
  local L0_72, L1_73, L2_74, L3_75, L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87, L16_88, L17_89, L18_90, L19_91, L20_92, L21_93, L22_94, L23_95, L24_96, L25_97
  L0_72 = Debug
  L0_72 = L0_72.setSwitch
  L5_77 = "Script"
  L0_72(L1_73, L2_74, L3_75)
  L0_72 = invokeTask
  L0_72(L1_73)
  L0_72 = {}
  for L4_76 = 1, 9 do
    L5_77 = findGameObject2
    L9_81 = "%02d"
    L10_82 = L4_76
    L5_77 = L5_77(L6_78, L7_79)
    L0_72[L4_76] = L5_77
  end
  L1_73(L2_74)
  L1_73(L2_74)
  L1_73(L2_74)
  L5_77 = "woodbox_kk_01"
  L9_81 = "woodbox_kk_01"
  L10_82 = "barrel_kk_01"
  L11_83 = "woodbox_kk_01"
  L1_73[1] = L2_74
  for L5_77 = 1, 9 do
    for L9_81 = 0, 1 do
      L10_82 = create_boxset
      L11_83 = "po_a_02"
      L12_84 = "locator2_box_0"
      L13_85 = L5_77
      L12_84 = L12_84 .. L13_85
      L13_85 = L1_73[1]
      L13_85 = L13_85[L5_77]
      L10_82(L11_83, L12_84, L13_85)
    end
  end
  L5_77 = true
  L3_75(L4_76, L5_77)
  L3_75()
  L3_75(L4_76)
  L3_75(L4_76)
  L5_77 = "Node"
  L20_92 = L4_76(L5_77, L6_78)
  L3_75(L4_76, L5_77, L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87, L16_88, L17_89, L18_90, L19_91, L20_92, L21_93, L22_94, L23_95, L24_96, L25_97, L4_76(L5_77, L6_78))
  L3_75()
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = {}
  L5_77.unique = "ui_gaiku_01_16"
  L5_77.section = "ui_gaiku_02_16"
  L5_77.town = "ui_gaiku_03_02"
  L3_75(L4_76, L5_77)
  L3_75()
  L3_75(L4_76)
  L5_77 = 3
  L3_75(L4_76, L5_77, L6_78)
  L3_75()
  cap_flag = true
  L3_75(L4_76)
  L5_77 = 0
  L3_75(L4_76, L5_77)
  L3_75(L4_76)
  L3_75()
  L3_75()
  L5_77 = Camera
  L5_77 = L5_77.kPlayer
  L3_75(L4_76, L5_77, L6_78, L7_79)
  __view_pos = L3_75
  L3_75(L4_76)
  L3_75(L4_76)
  L5_77 = {}
  L5_77.mission_target = "ar_00050"
  L4_76.view = L5_77
  L3_75(L4_76)
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityShift
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityRevert
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityShift
  L3_75(L4_76, L5_77, L6_78)
  L3_75(L4_76)
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityShift
  L3_75(L4_76, L5_77, L6_78)
  L3_75()
  __view_pos = nil
  while true do
    L5_77 = 3
    L3_75(L4_76, L5_77)
    if L3_75 ~= L4_76 then
      L4_76()
    end
  end
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityShift
  L3_75(L4_76, L5_77, L6_78)
  __view_pos = L3_75
  L3_75(L4_76)
  L3_75(L4_76)
  L5_77 = true
  L3_75(L4_76, L5_77)
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = {L6_78, L7_79}
  L3_75(L4_76, L5_77, L6_78)
  if L3_75 == false then
    L5_77 = Player
    L5_77 = L5_77.kAbility_GravityShift
    L3_75(L4_76, L5_77, L6_78)
    L5_77 = Camera
    L5_77 = L5_77.kPlayer
    L3_75(L4_76, L5_77, L6_78, L7_79)
  end
  L5_77 = 1.5
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = {L6_78, L7_79}
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityShift
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = Camera
  L5_77 = L5_77.kPlayer
  L3_75(L4_76, L5_77, L6_78, L7_79)
  __view_pos = L3_75
  L3_75(L4_76)
  L3_75(L4_76)
  L5_77 = {L6_78, L7_79}
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L3_75()
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = 35
  L3_75(L4_76, L5_77)
  L5_77 = 10
  L3_75(L4_76, L5_77)
  L5_77 = 3
  L3_75(L4_76, L5_77)
  __view_pos = nil
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L3_75()
  L3_75(L4_76)
  L3_75(L4_76)
  L3_75(L4_76)
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = 55
  L3_75(L4_76, L5_77)
  L5_77 = 10
  L3_75(L4_76, L5_77)
  L5_77 = 3
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L5_77 = Player
  L5_77 = L5_77.kAbility_GravityShift
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = Camera
  L5_77 = L5_77.kPlayer
  L3_75(L4_76, L5_77, L6_78, L7_79)
  L5_77 = {L6_78, L7_79}
  L3_75(L4_76, L5_77, L6_78)
  L3_75()
  L3_75(L4_76)
  L3_75(L4_76)
  L3_75(L4_76)
  L5_77 = 0
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = 55
  L3_75(L4_76, L5_77)
  L5_77 = 10
  L3_75(L4_76, L5_77)
  L5_77 = 3
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L5_77 = 3
  L3_75(L4_76, L5_77, L6_78)
  L3_75(L4_76)
  L5_77 = 170
  L3_75(L4_76, L5_77, L6_78)
  L5_77 = true
  L3_75(L4_76, L5_77)
  repeat
    L3_75()
    L3_75(L4_76)
    L5_77 = L0_72[6]
    L5_77 = L5_77.getWorldPos
    L20_92 = L5_77(L6_78)
    if L3_75 <= 3 then
      L5_77 = 3
      L3_75(L4_76, L5_77, L6_78)
      L3_75()
      L5_77 = Camera
      L5_77 = L5_77.kPlayer
      L3_75(L4_76, L5_77, L6_78, L7_79)
      L3_75(L4_76)
      L3_75()
      L5_77 = "success"
      L3_75(L4_76, L5_77)
      L3_75(L4_76)
      L5_77 = 0
      L3_75(L4_76, L5_77, L6_78)
      L3_75()
      L5_77 = Camera
      L5_77 = L5_77.kPlayer
      L3_75(L4_76, L5_77, L6_78, L7_79)
      L3_75()
    else
      L5_77 = L0_72[6]
      L5_77 = L5_77.getWorldPos
      L20_92 = L5_77(L6_78)
      if L3_75 < 15 then
        L5_77 = 3
        L3_75(L4_76, L5_77, L6_78)
      end
    end
    L3_75()
  until L3_75 == true
  __next_phase = false
  L5_77 = 3
  L3_75(L4_76, L5_77)
  L3_75()
  L3_75()
  L5_77 = "success"
  L3_75(L4_76, L5_77)
  L3_75()
  L5_77 = Camera
  L5_77 = L5_77.kPlayer
  L3_75(L4_76, L5_77, L6_78, L7_79)
  __view_pos = L3_75
  L3_75(L4_76)
  L3_75(L4_76)
  L3_75()
  L5_77 = Camera
  L5_77 = L5_77.kPlayer
  L3_75(L4_76, L5_77, L6_78, L7_79)
  L5_77 = L4_76
  __view_pos = L4_76
  L5_77 = 1
  L4_76(L5_77)
  L5_77 = "Node"
  L5_77 = cam_node
  L5_77 = L5_77.setWorldPos
  L20_92 = L7_79(L8_80)
  L5_77(L6_78, L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87, L16_88, L17_89, L18_90, L19_91, L20_92, L21_93, L22_94, L23_95, L24_96, L25_97, L7_79(L8_80))
  L5_77 = cam_node
  L5_77 = L5_77.setForceMove
  L5_77(L6_78)
  L5_77 = findGameObject2
  L5_77 = L5_77(L6_78, L7_79)
  L9_81 = L5_77
  L20_92 = L8_80(L9_81)
  L6_78(L7_79, L8_80, L9_81, L10_82, L11_83, L12_84, L13_85, L14_86, L15_87, L16_88, L17_89, L18_90, L19_91, L20_92, L21_93, L22_94, L23_95, L24_96, L25_97, L8_80(L9_81))
  L6_78(L7_79)
  L6_78(L7_79, L8_80)
  L6_78(L7_79, L8_80)
  L6_78(L7_79)
  L9_81 = 1
  L6_78(L7_79, L8_80, L9_81)
  L6_78(L7_79)
  L6_78(L7_79)
  L6_78(L7_79)
  L6_78(L7_79)
  __view_pos = nil
  L6_78()
  L9_81 = Camera
  L9_81 = L9_81.kControl_All
  L10_82 = true
  L6_78(L7_79, L8_80, L9_81, L10_82)
  L9_81 = invokeTask
  function L10_82()
    local L0_98
    L0_98 = __crate_cap_wait
    repeat
      waitSeconds(1)
      L0_98 = L0_98 + 1
      if L0_98 > __crate_cap_wait then
        L8_80[0] = function()
          Fn_captionView("ar_00160")
        end
        L8_80[1] = function()
          Fn_captionView("ar_00170")
        end
        L8_80[2] = function()
          Fn_captionView("ar_00180")
          L7_79 = L7_79 - 3
        end
        L8_80[L7_79]()
        L7_79 = L7_79 + 1
        L0_98 = 0
      end
    until L6_78 == true
  end
  L9_81(L10_82)
  L9_81 = waitPhace
  L9_81()
  L9_81 = waitSeconds
  L10_82 = 3
  L9_81(L10_82)
  L9_81 = Fn_captionView
  L10_82 = "ar_00190"
  L11_83 = 10
  L12_84 = false
  L9_81(L10_82, L11_83, L12_84)
  L9_81 = waitPhace
  L9_81()
  L9_81 = Fn_naviSet
  L10_82 = __puppet_tbl
  L10_82 = L10_82.npc_wom01_02
  L9_81(L10_82)
  L9_81 = waitPhace
  L9_81()
  L9_81 = Fn_naviKill
  L9_81()
  L9_81 = Fn_disableKaiwaDemo
  L10_82 = __puppet_tbl
  L10_82 = L10_82.npc_wom01_02
  L9_81(L10_82)
  L9_81 = Fn_enableKaiwaDemo
  L10_82 = __puppet_tbl
  L10_82 = L10_82.npc_wom01_03
  L9_81(L10_82)
  L9_81 = false
  L10_82 = 0
  L11_83 = {}
  L12_84 = invokeTask
  function L13_85()
    local L0_99
    L0_99 = __crate_cap_wait
    repeat
      waitSeconds(1)
      L0_99 = L0_99 + 1
      if L0_99 > __crate_cap_wait then
        L11_83[0] = function()
          Fn_captionView("ar_00200")
        end
        L11_83[1] = function()
          Fn_captionView("ar_00210")
        end
        L11_83[2] = function()
          Fn_captionView("ar_00220")
          L10_82 = L10_82 - 3
        end
        L11_83[L10_82]()
        L10_82 = L10_82 + 1
        L0_99 = 0
      end
    until L9_81 == true
  end
  L12_84(L13_85)
  L12_84 = waitPhace
  L12_84()
  L9_81 = true
  L12_84 = Fn_naviSet
  L13_85 = __puppet_tbl
  L13_85 = L13_85.npc_wom01_03
  L12_84(L13_85)
  L12_84 = waitPhace
  L12_84()
  L12_84 = Fn_disableKaiwaDemo
  L13_85 = __puppet_tbl
  L13_85 = L13_85.npc_wom01_03
  L12_84(L13_85)
  L12_84 = Fn_naviKill
  L12_84()
  L12_84 = invokeTask
  function L13_85()
    waitSeconds(1)
    sim_hdl:setActive(true)
    waitSeconds(2)
    sim_hdl:setActive(false)
  end
  L12_84(L13_85)
  L12_84 = Fn_changeBgm
  L13_85 = "bgm23"
  L12_84(L13_85)
  L12_84 = findGameObject2
  L13_85 = "EnemyGenerator"
  L14_86 = "enmgen2_01"
  L12_84 = L12_84(L13_85, L14_86)
  if L12_84 ~= nil then
    __enemy_cnt = 3
    L14_86 = L12_84
    L13_85 = L12_84.requestSpawn
    L13_85(L14_86)
  end
  L13_85 = findGameObject2
  L14_86 = "Node"
  L15_87 = "locator2_haze"
  L13_85 = L13_85(L14_86, L15_87)
  L14_86 = create_gem
  L15_87 = L13_85
  L16_88 = 5
  L14_86(L15_87, L16_88)
  L14_86 = Fn_missionView
  L15_87 = "ar_00230"
  L14_86(L15_87)
  L14_86 = Fn_tutorialCaption
  L15_87 = "att&esc"
  L14_86(L15_87)
  while true do
    L14_86 = __enemy_cnt
    if L14_86 > 0 then
      L14_86 = wait
      L14_86()
    end
  end
  L14_86 = Fn_tutorialCaptionKill
  L14_86()
  L14_86 = Fn_kaiwaDemoView
  L15_87 = "action_review_00400k"
  L14_86(L15_87)
  L14_86 = Fn_naviSet
  L15_87 = __puppet_tbl
  L15_87 = L15_87.npc_wom01_04
  L14_86(L15_87)
  L14_86 = Fn_enableKaiwaDemo
  L15_87 = __puppet_tbl
  L15_87 = L15_87.npc_wom01_04
  L14_86(L15_87)
  L14_86 = waitPhace
  L14_86()
  L14_86 = Fn_disableKaiwaDemo
  L15_87 = __puppet_tbl
  L15_87 = L15_87.npc_wom01_04
  L14_86(L15_87)
  L14_86 = Fn_naviKill
  L14_86()
  L14_86 = findGameObject2
  L15_87 = "EnemyGenerator"
  L16_88 = "enmgen2_02"
  L14_86 = L14_86(L15_87, L16_88)
  if L14_86 ~= nil then
    __enemy_cnt = 4
    L16_88 = L14_86
    L15_87 = L14_86.requestSpawn
    L15_87(L16_88)
  end
  L15_87 = Fn_captionView
  L16_88 = "ar_00240"
  L15_87(L16_88)
  L15_87 = HUD
  L16_88 = L15_87
  L15_87 = L15_87.info
  L17_89 = {L18_90}
  L18_90 = {}
  L18_90.T = "ar_00250"
  L18_90.L = "sm92_info_01"
  L15_87(L16_88, L17_89)
  L15_87 = Fn_tutorialCaption
  L16_88 = "gravitykick"
  L15_87(L16_88)
  while true do
    L15_87 = __enemy_cnt
    if L15_87 > 0 then
      L15_87 = wait
      L15_87()
    end
  end
  L15_87 = Fn_tutorialCaptionKill
  L15_87()
  L15_87 = findGameObject2
  L16_88 = "EnemyGenerator"
  L17_89 = "enmgen2_03"
  L15_87 = L15_87(L16_88, L17_89)
  if L15_87 ~= nil then
    __enemy_cnt = 4
    L17_89 = L15_87
    L16_88 = L15_87.requestSpawn
    L16_88(L17_89)
  end
  L16_88 = Fn_captionView
  L17_89 = "ar_00260"
  L18_90 = 3
  L19_91 = true
  L16_88(L17_89, L18_90, L19_91)
  L16_88 = HUD
  L17_89 = L16_88
  L16_88 = L16_88.info
  L18_90 = {L19_91}
  L19_91 = {}
  L19_91.T = "ar_00270"
  L19_91.L = "sm92_info_01"
  L16_88(L17_89, L18_90)
  L16_88 = Fn_tutorialCaption
  L17_89 = "marsgrav_kick"
  L16_88(L17_89)
  while true do
    L16_88 = __enemy_cnt
    if L16_88 > 0 then
      L16_88 = wait
      L16_88()
    end
  end
  L16_88 = Fn_tutorialCaptionKill
  L16_88()
  L16_88 = findGameObject2
  L17_89 = "EnemyGenerator"
  L18_90 = "enmgen2_04"
  L16_88 = L16_88(L17_89, L18_90)
  if L16_88 ~= nil then
    __enemy_cnt = 6
    L18_90 = L16_88
    L17_89 = L16_88.requestSpawn
    L17_89(L18_90)
  end
  L17_89 = Fn_captionView
  L18_90 = "ar_00280"
  L19_91 = 3
  L20_92 = true
  L17_89(L18_90, L19_91, L20_92)
  L17_89 = HUD
  L18_90 = L17_89
  L17_89 = L17_89.info
  L19_91 = {L20_92}
  L20_92 = {}
  L20_92.T = "ar_00290"
  L20_92.L = "sm92_info_01"
  L17_89(L18_90, L19_91)
  L17_89 = Fn_tutorialCaption
  L18_90 = "jupiter"
  L17_89(L18_90)
  while true do
    L17_89 = __enemy_cnt
    if L17_89 > 0 then
      L17_89 = wait
      L17_89()
    end
  end
  L17_89 = Fn_tutorialCaptionKill
  L17_89()
  L17_89 = Fn_naviSet
  L18_90 = __puppet_tbl
  L18_90 = L18_90.npc_man01_03
  L17_89(L18_90)
  L17_89 = Fn_enableKaiwaDemo
  L18_90 = __puppet_tbl
  L18_90 = L18_90.npc_man01_03
  L17_89(L18_90)
  L17_89 = waitPhace
  L17_89()
  L17_89 = Fn_naviKill
  L17_89()
  L17_89 = Fn_disableKaiwaDemo
  L18_90 = __puppet_tbl
  L18_90 = L18_90.npc_man01_03
  L17_89(L18_90)
  L17_89 = findGameObject2
  L18_90 = "EnemyGenerator"
  L19_91 = "enmgen2_05"
  L17_89 = L17_89(L18_90, L19_91)
  if L17_89 ~= nil then
    __enemy_cnt = 3
    L19_91 = L17_89
    L18_90 = L17_89.requestSpawn
    L18_90(L19_91)
  end
  L18_90 = findGameObject2
  L19_91 = "Node"
  L20_92 = "locator2_box_09"
  L18_90 = L18_90(L19_91, L20_92)
  L19_91 = create_gem
  L20_92 = L18_90
  L19_91(L20_92, L21_93)
  L19_91 = Fn_captionView
  L20_92 = "ar_00300"
  L19_91(L20_92, L21_93, L22_94)
  while true do
    L19_91 = __enemy_cnt
    if L19_91 > 0 then
      L19_91 = wait
      L19_91()
    end
  end
  L19_91 = findGameObject2
  L20_92 = "EnemyGenerator"
  L19_91 = L19_91(L20_92, L21_93)
  if L19_91 ~= nil then
    __enemy_cnt = 3
    L20_92 = L19_91.requestSpawn
    L20_92(L21_93)
  end
  L20_92 = findGameObject2
  L20_92 = L20_92(L21_93, L22_94)
  L21_93(L22_94, L23_95)
  L21_93(L22_94, L23_95, L24_96)
  L24_96.T = "ar_00320"
  L24_96.L = "sm92_info_01"
  L21_93(L22_94, L23_95)
  L21_93(L22_94, L23_95, L24_96)
  while true do
    if L21_93 > 0 then
      L21_93(L22_94)
      for L24_96 = 1, 9 do
        for _FORV_28_ = 0, 1 do
          create_boxset("po_a_02", "locator2_box_0" .. L24_96, L1_73[1][L24_96])
        end
      end
    end
  end
  L21_93(L22_94)
  L21_93(L22_94)
  L21_93(L22_94)
  if L21_93 ~= nil then
    __enemy_cnt = 3
    L22_94(L23_95)
  end
  L22_94(L23_95, L24_96, L25_97)
  while true do
    if L22_94 > 0 then
      L22_94(L23_95)
      for L25_97 = 1, 9 do
        for _FORV_29_ = 0, 2 do
          create_boxset("po_a_04", "locator2_box_1" .. L25_97, L1_73[1][L25_97])
        end
      end
    end
  end
  L23_95(L24_96, L25_97)
  if L23_95 ~= nil then
    __enemy_cnt = 3
    L24_96(L25_97)
  end
  L24_96(L25_97, 3, true)
  L24_96(L25_97, {
    {
      T = "ar_00360",
      L = "sm92_info_01"
    }
  })
  L24_96(L25_97, Player.kEnergy_SpAttack, Player:getEnergyMax(Player.kEnergy_SpAttack))
  L24_96(L25_97, 0, false)
  while true do
    if L24_96 > 0 then
      L24_96()
    end
  end
  if L24_96 ~= nil then
    __enemy_cnt = 3
    L25_97(L24_96)
  end
  L25_97("ar_00380", 3, true)
  L25_97("action_review_00510k")
  L25_97(L2_74, false)
  L25_97("ar_00390", 3, false)
  while true do
    if L25_97 > 0 then
      L25_97()
    end
  end
  L25_97(__puppet_tbl.npc_wom01_03)
  L25_97(__puppet_tbl.npc_wom01_03, "action_review_00600k", navi_on, true)
  L25_97(__puppet_tbl.npc_wom01_03)
end
function Finalize()
  local L0_100, L1_101
end
function pccubesensor2_machi_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_machi_01")
  __next_phase = true
  Fn_captionView("ar_00400", 3, false)
end
function pcspheresensor2_BaRun_01_OnEnter()
  Fn_pcSensorOff("pcspheresensor2_BaRun_01")
end
function pccubesensor2_BalFi_OnEnter()
  local L0_102, L1_103
end
function Outgame()
  if _balloon:isCatch() then
    invokeTask(function()
      _balloon:release()
      Fn_exitSandbox()
    end)
  else
    Fn_exitSandbox()
  end
end
function pccubesensor2_dusty_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_dusty_01")
  Fn_naviKill()
  navi_on()
end
function pccubesensor2_last_01_OnEnter()
  Fn_pcSensorOff("pccubesensor2_last_01")
  Fn_naviKill()
  navi_on()
end
function pc_gravity_control_mode_wait()
  while Player:isGravityControlMode() ~= true or Player:getAction() ~= Player.kAction_Float do
    wait()
  end
end
function pc_jump_wait()
  while Player:getAction() ~= Player.kAction_Jump do
    wait()
  end
end
function pc_target_near_wait(A0_104, A1_105)
  while A1_105 < Fn_get_distance(Fn_getPcPosRot(), A0_104:getWorldPos()) do
    wait()
  end
end
function pccubesensor2_tut_08_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_08")
  Fn_pcSensorOn("pccubesensor2_tut_09")
  __next_phase = true
  Fn_captionView("ar_00460", 3, false)
end
function pccubesensor2_tut_09_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_09")
  Fn_pcSensorOn("pccubesensor2_tut_10")
  __next_phase = true
  Fn_captionView("ar_00470", 3, false)
end
function pccubesensor2_tut_10_OnEnter()
  Fn_pcSensorOff("pccubesensor2_tut_10")
  __next_phase = true
  Fn_captionView("ar_00480", 3, false)
end
function GemSetDisp(A0_106, A1_107)
  local L2_108, L3_109, L4_110, L5_111, L6_112
  L2_108 = nil
  for L6_112 = 1, 9 do
    L2_108 = findGameObject2("Gem", "gem2_navi_0" .. A0_106 .. "_0" .. L6_112)
    if L2_108 ~= nil then
      L2_108:setVisible(A1_107)
    end
  end
end
function sm93GetVector(A0_113, A1_114)
  return A1_114 - A0_113
end
function sm93GetNormalize(A0_115)
  local L1_116, L2_117
  L1_116 = Vector
  L2_117 = 0
  L1_116 = L1_116(L2_117, 0, 0)
  L2_117 = nil
  L2_117 = (A0_115 - L1_116):Length()
  if L2_117 == 0 then
    return nil
  end
  L1_116.x = A0_115.x / L2_117
  L1_116.y = A0_115.y / L2_117
  L1_116.z = A0_115.z / L2_117
  return L1_116
end
function sm93SetGemPutNaviToKity(A0_118, A1_119, A2_120)
  local L3_121, L4_122, L5_123, L6_124
  L3_121 = Fn_getPlayer
  L3_121 = L3_121()
  L5_123 = A0_118
  L4_122 = A0_118.getWorldPos
  L4_122 = L4_122(L5_123)
  L6_124 = L3_121
  L5_123 = L3_121.getWorldPos
  L5_123 = L5_123(L6_124)
  L6_124 = sm93GetVector
  L6_124 = L6_124(L4_122, L5_123)
  if A2_120 == nil then
    A2_120 = 4
  end
  L4_122 = L4_122 + sm93GetNormalize(L6_124) * A2_120
  for _FORV_11_ = 1, A1_119 do
    createGameObject2("Gem"):setGemModelNo(1)
    L6_124 = L4_122 + sm93GetNormalize(L6_124) * (_FORV_11_ * 1.5)
    createGameObject2("Gem"):setWorldPos(L6_124)
  end
  _FOR_()
end
function navi_on()
  local L0_125, L1_126
  __next_phase = true
end
function waitPhace()
  while not __next_phase do
    wait()
  end
  __next_phase = false
end
function NaviSet_Auto(A0_127, A1_128, A2_129)
  Fn_naviSet(A0_127)
  if A1_128 == nil then
    HUD:naviSetPochiDistanceDensity100(0)
    HUD:naviSetPochiDistanceDensity0(0)
  else
    HUD:naviSetPochiDistanceDensity100(A1_128)
    HUD:naviSetPochiDistanceDensity0(A2_129)
  end
  Sound:pulse("navi_set")
end
function Fn_setUpdataPosition(A0_130, A1_131)
  local L2_132
  L2_132 = {}
  if Fn_getCharaHandle(A0_130) ~= nil then
    L2_132.chara = Fn_getCharaHandle(A0_130)
  else
    L2_132.chara = findGameObject2("Node", A0_130)
  end
  L2_132.node = A1_131
  __updateTarget[A0_130] = L2_132
end
function Fn_setFinishSenser(A0_133, A1_134)
  local L2_135, L3_136, L4_137
  L2_135 = Vector
  L3_136 = 3
  L4_137 = 3
  L2_135 = L2_135(L3_136, L4_137, 3)
  L3_136 = nil
  if A0_133 ~= nil then
    if A1_134 ~= nil then
      L2_135 = A1_134
    end
    L4_137 = "pccubesensor2_le_finish_OnEnter"
    _G[L4_137] = function()
      Finishgame(L3_136)
    end
    L3_136 = createGameObject2("PlayerSensor")
    L3_136:setName("pccubesensor2_le_finish")
    L3_136:setDetectBehavior(1)
    L3_136:addBox(L2_135)
    L3_136:setPos(Vector(0, L2_135.y / 2, 0))
    L3_136:setOnEnter(L4_137)
    L3_136:setActive(false)
    __sensor_handle.finish = L3_136
    A0_133:appendChild(L3_136)
  end
  return L3_136
end
function Fn_setOutSenser(A0_138, A1_139)
  local L2_140, L3_141, L4_142
  L2_140 = Vector
  L3_141 = 50
  L4_142 = 50
  L2_140 = L2_140(L3_141, L4_142, 50)
  L3_141 = nil
  if A0_138 ~= nil then
    if A1_139 ~= nil then
      L2_140 = A1_139
    end
    L4_142 = "pccubesensor2_le_out_OnLeave"
    _G[L4_142] = function()
      Outgame()
      L3_141:setActive(false)
    end
    L3_141 = createGameObject2("PlayerSensor")
    L3_141:setName("pccubesensor2_le_out")
    L3_141:setDetectBehavior(1)
    L3_141:addBox(L2_140)
    L3_141:setOnLeave(L4_142)
    L3_141:setActive(false)
    __sensor_handle.out = L3_141
    A0_138:appendChild(L3_141)
  end
  return L3_141
end
function create_boxset(A0_143, A1_144, A2_145)
  local L3_146, L4_147, L5_148, L6_149, L7_150, L8_151
  L3_146 = Fn_getSubAreaHandle
  L4_147 = "jilga"
  L5_148 = A0_143
  L3_146 = L3_146(L4_147, L5_148)
  if L3_146 == nil then
    L4_147 = nil
    return L4_147
  end
  L4_147 = A2_145
  L5_148 = createGameObject2
  L6_149 = "GimmickBg"
  L5_148 = L5_148(L6_149)
  L7_150 = L5_148
  L6_149 = L5_148.setName
  L8_151 = L4_147
  L6_149(L7_150, L8_151)
  L7_150 = L5_148
  L6_149 = L5_148.setDrawModelName
  L8_151 = L4_147
  L6_149(L7_150, L8_151)
  L7_150 = L5_148
  L6_149 = L5_148.setCollisionName
  L8_151 = L4_147
  L6_149(L7_150, L8_151)
  L7_150 = L5_148
  L6_149 = L5_148.setAttributeName
  L8_151 = L4_147
  L6_149(L7_150, L8_151)
  L7_150 = L5_148
  L6_149 = L5_148.setPos
  L8_151 = Vector
  L8_151 = L8_151(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5))
  L6_149(L7_150, L8_151, L8_151(RandF(-0.5, 0.5), RandF(1, 1.5), RandF(-0.5, 0.5)))
  L7_150 = L5_148
  L6_149 = L5_148.try_init
  L6_149(L7_150)
  L7_150 = L5_148
  L6_149 = L5_148.waitForReady
  L6_149(L7_150)
  L6_149 = findGameObject2
  L7_150 = "Node"
  L8_151 = A1_144
  L6_149 = L6_149(L7_150, L8_151)
  L8_151 = L6_149
  L7_150 = L6_149.getWorldPos
  L7_150 = L7_150(L8_151)
  L8_151 = L6_149.getWorldRot
  L8_151 = L8_151(L6_149)
  L3_146:appendChild(L5_148)
  L7_150.x = L7_150.x + (3 - RandF(0, 6))
  L7_150.z = L7_150.z + (3 - RandF(0, 6))
  L7_150.x = L7_150.x + (8 - RandF(0, 16))
  L7_150.z = L7_150.z + (8 - RandF(0, 16))
  L5_148:setWorldPos(L7_150)
  L5_148:setWorldRot(L8_151)
  L5_148:setForceMove()
  L5_148:try_start()
  return L5_148
end
tutorialCaptionHandle = nil
function Fn_tutorialCaption(A0_152)
  if tutorialCaptionHandle ~= nil then
    return
  end
  tutorialCaptionHandle = invokeTask(function()
    local L0_153, L2_154
    L0_153, L2_154 = nil, nil
    while true do
      if A0_152 == "gravity" then
        if Player:isGravityControlMode() then
          L0_153 = "ar_00490"
        else
          L0_153 = "ar_00500"
        end
      elseif A0_152 == "attack" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_153 = "ar_00510"
          else
            L0_153 = "ar_00520"
          end
        end
      elseif A0_152 == "att&esc" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_153 = "ar_00510"
          else
            L0_153 = "ar_00525"
          end
        end
      elseif A0_152 == "gravitykick" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:isGravityControlMode() then
            L0_153 = "ar_00510"
          else
            L0_153 = "ar_00500"
          end
        end
      elseif A0_152 == "mars" then
        if Player:getAttrTune() ~= Player.kAttrTune_Mars then
          L0_153 = "ar_00530"
        else
          L0_153 = "ar_00540"
        end
      elseif A0_152 == "marsgrav_kick" then
        if Player:getAction() ~= Player.kAction_KickCombo then
          if Player:getAttrTune() == Player.kAttrTune_Mars and Player:isGravityControlMode() then
            L0_153 = "ar_00545"
          elseif Player:getAttrTune() == Player.kAttrTune_Mars then
            L0_153 = "ar_00500"
          elseif Player:isGravityControlMode() then
            L0_153 = "ar_00530"
          else
            L0_153 = "ar_00547"
          end
        end
      elseif A0_152 == "jupiter" then
        if Player:getAttrTune() ~= Player.kAttrTune_Jupiter then
          L0_153 = "ar_00550"
        else
          L0_153 = "ar_00555"
        end
      end
      if L0_153 ~= L2_154 then
        if L0_153 ~= nil then
          Fn_captionView(L0_153, 0)
        else
          HUD:captionEnd()
        end
        L2_154 = L0_153
      end
      wait()
    end
  end)
end
function Fn_tutorialCaptionKill()
  if tutorialCaptionHandle ~= nil then
    tutorialCaptionHandle:abort()
    tutorialCaptionHandle = nil
    wait(3)
    HUD:captionEnd()
  end
end
function create_gem(A0_155, A1_156)
  local L2_157, L3_158, L4_159
  L3_158 = A0_155
  L2_157 = A0_155.getName
  L2_157 = L2_157(L3_158)
  L3_158 = createGameObject2
  L4_159 = "Gem"
  L3_158 = L3_158(L4_159)
  L4_159 = L3_158.setGemModelNo
  L4_159(L3_158, A1_156)
  L4_159 = A0_155.getWorldPos
  L4_159 = L4_159(A0_155)
  L4_159 = L4_159 + Vector(0, 3, 0)
  L3_158:setWorldPos(L4_159)
  L3_158:setForceMove()
  L3_158:setVisible(true)
  L3_158:try_init()
  L3_158:waitForReadyAsync(function()
    L3_158:try_start()
  end)
  return L3_158
end
function delete_gem(A0_160)
  flag_tbl[PHASE][A0_160].gem:try_term()
  flag_tbl[PHASE][A0_160].gem = nil
end
