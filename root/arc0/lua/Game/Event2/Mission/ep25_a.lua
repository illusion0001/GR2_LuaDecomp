dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/fatal_marker.lua")
_boss_gauge = nil
_sdemo = nil
_isInjuredEle = false
_isRespawn = false
_isFatal = false
_deadNameTable = {}
fatal_marker = FatalMarker.create(kFATAL_TYPE_EMP, false, false, false)
_isInSensor = false
_warp_caption_flag = false
enmgen2_elektricity_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_01",
      name = "elektricity_01",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_0, A1_1)
    local L2_2, L3_3
    L2_2 = fatal_marker
    L3_3 = L2_2
    L2_2 = L2_2.set
    L2_2(L3_3, A1_1, "bn_root", false)
    L2_2 = breakLightningRod
    L3_3 = A1_1.getName
    L3_3 = L3_3(A1_1)
    L2_2(L3_3, L3_3(A1_1))
    L2_2 = print
    L3_3 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_2(L3_3, A1_1:getName())
    L2_2 = findGameObject2
    L3_3 = "EnemyBrain"
    L2_2 = L2_2(L3_3, A1_1:getName())
    L3_3 = L2_2.eventMessage
    L3_3 = L3_3(L2_2, "SetEnableChainBlitz", false)
    print(L3_3)
    L2_2:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_4, A1_5)
    fatal_marker:del(A1_5)
    table.insert(_deadNameTable, "elektricity_01")
    print("\226\151\134\230\173\187\228\186\161:elektricity_01")
  end
}
enmgen2_elektricity_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_02",
      name = "elektricity_02",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_6, A1_7)
    local L2_8, L3_9
    L2_8 = fatal_marker
    L3_9 = L2_8
    L2_8 = L2_8.set
    L2_8(L3_9, A1_7, "bn_root", false)
    L2_8 = breakLightningRod
    L3_9 = A1_7.getName
    L3_9 = L3_9(A1_7)
    L2_8(L3_9, L3_9(A1_7))
    L2_8 = print
    L3_9 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_8(L3_9, A1_7:getName())
    L2_8 = findGameObject2
    L3_9 = "EnemyBrain"
    L2_8 = L2_8(L3_9, A1_7:getName())
    L3_9 = L2_8.eventMessage
    L3_9 = L3_9(L2_8, "SetEnableChainBlitz", false)
    print(L3_9)
    L2_8:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_10, A1_11)
    fatal_marker:del(A1_11)
    table.insert(_deadNameTable, "elektricity_02")
    print("\226\151\134\230\173\187\228\186\161:elektricity_02")
  end
}
enmgen2_elektricity_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_03",
      name = "elektricity_03",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_12, A1_13)
    local L2_14, L3_15
    L2_14 = fatal_marker
    L3_15 = L2_14
    L2_14 = L2_14.set
    L2_14(L3_15, A1_13, "bn_root", false)
    L2_14 = breakLightningRod
    L3_15 = A1_13.getName
    L3_15 = L3_15(A1_13)
    L2_14(L3_15, L3_15(A1_13))
    L2_14 = print
    L3_15 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_14(L3_15, A1_13:getName())
    L2_14 = findGameObject2
    L3_15 = "EnemyBrain"
    L2_14 = L2_14(L3_15, A1_13:getName())
    L3_15 = L2_14.eventMessage
    L3_15 = L3_15(L2_14, "SetEnableChainBlitz", false)
    print(L3_15)
    L2_14:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_16, A1_17)
    fatal_marker:del(A1_17)
    table.insert(_deadNameTable, "elektricity_03")
    print("\226\151\134\230\173\187\228\186\161:elektricity_03")
  end
}
enmgen2_elektricity_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_04",
      name = "elektricity_04",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_18, A1_19)
    local L2_20, L3_21
    L2_20 = fatal_marker
    L3_21 = L2_20
    L2_20 = L2_20.set
    L2_20(L3_21, A1_19, "bn_root", false)
    L2_20 = breakLightningRod
    L3_21 = A1_19.getName
    L3_21 = L3_21(A1_19)
    L2_20(L3_21, L3_21(A1_19))
    L2_20 = print
    L3_21 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_20(L3_21, A1_19:getName())
    L2_20 = findGameObject2
    L3_21 = "EnemyBrain"
    L2_20 = L2_20(L3_21, A1_19:getName())
    L3_21 = L2_20.eventMessage
    L3_21 = L3_21(L2_20, "SetEnableChainBlitz", false)
    print(L3_21)
    L2_20:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_22, A1_23)
    fatal_marker:del(A1_23)
    table.insert(_deadNameTable, "elektricity_04")
    print("\226\151\134\230\173\187\228\186\161:elektricity_04")
  end
}
enmgen2_elektricity_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_05",
      name = "elektricity_05",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_24, A1_25)
    local L2_26, L3_27
    L2_26 = fatal_marker
    L3_27 = L2_26
    L2_26 = L2_26.set
    L2_26(L3_27, A1_25, "bn_root", false)
    L2_26 = breakLightningRod
    L3_27 = A1_25.getName
    L3_27 = L3_27(A1_25)
    L2_26(L3_27, L3_27(A1_25))
    L2_26 = print
    L3_27 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_26(L3_27, A1_25:getName())
    L2_26 = findGameObject2
    L3_27 = "EnemyBrain"
    L2_26 = L2_26(L3_27, A1_25:getName())
    L3_27 = L2_26.eventMessage
    L3_27 = L3_27(L2_26, "SetEnableChainBlitz", false)
    print(L3_27)
    L2_26:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_28, A1_29)
    fatal_marker:del(A1_29)
    table.insert(_deadNameTable, "elektricity_05")
    print("\226\151\134\230\173\187\228\186\161:elektricity_05")
  end
}
enmgen2_elektricity_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_06",
      name = "elektricity_06",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_30, A1_31)
    local L2_32, L3_33
    L2_32 = fatal_marker
    L3_33 = L2_32
    L2_32 = L2_32.set
    L2_32(L3_33, A1_31, "bn_root", false)
    L2_32 = breakLightningRod
    L3_33 = A1_31.getName
    L3_33 = L3_33(A1_31)
    L2_32(L3_33, L3_33(A1_31))
    L2_32 = print
    L3_33 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_32(L3_33, A1_31:getName())
    L2_32 = findGameObject2
    L3_33 = "EnemyBrain"
    L2_32 = L2_32(L3_33, A1_31:getName())
    L3_33 = L2_32.eventMessage
    L3_33 = L3_33(L2_32, "SetEnableChainBlitz", false)
    print(L3_33)
    L2_32:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_34, A1_35)
    fatal_marker:del(A1_35)
    table.insert(_deadNameTable, "elektricity_06")
    print("\226\151\134\230\173\187\228\186\161:elektricity_06")
  end
}
enmgen2_elektricity_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_07",
      name = "elektricity_07",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_36, A1_37)
    local L2_38, L3_39
    L2_38 = fatal_marker
    L3_39 = L2_38
    L2_38 = L2_38.set
    L2_38(L3_39, A1_37, "bn_root", false)
    L2_38 = breakLightningRod
    L3_39 = A1_37.getName
    L3_39 = L3_39(A1_37)
    L2_38(L3_39, L3_39(A1_37))
    L2_38 = print
    L3_39 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_38(L3_39, A1_37:getName())
    L2_38 = findGameObject2
    L3_39 = "EnemyBrain"
    L2_38 = L2_38(L3_39, A1_37:getName())
    L3_39 = L2_38.eventMessage
    L3_39 = L3_39(L2_38, "SetEnableChainBlitz", false)
    print(L3_39)
    L2_38:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_40, A1_41)
    fatal_marker:del(A1_41)
    table.insert(_deadNameTable, "elektricity_07")
    print("\226\151\134\230\173\187\228\186\161:elektricity_07")
  end
}
enmgen2_elektricity_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_08",
      name = "elektricity_08",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_42, A1_43)
    local L2_44, L3_45
    L2_44 = fatal_marker
    L3_45 = L2_44
    L2_44 = L2_44.set
    L2_44(L3_45, A1_43, "bn_root", false)
    L2_44 = breakLightningRod
    L3_45 = A1_43.getName
    L3_45 = L3_45(A1_43)
    L2_44(L3_45, L3_45(A1_43))
    L2_44 = print
    L3_45 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_44(L3_45, A1_43:getName())
    L2_44 = findGameObject2
    L3_45 = "EnemyBrain"
    L2_44 = L2_44(L3_45, A1_43:getName())
    L3_45 = L2_44.eventMessage
    L3_45 = L3_45(L2_44, "SetEnableChainBlitz", false)
    print(L3_45)
    L2_44:setVisibleBossMarker(true)
  end,
  onObjectAsh = function(A0_46, A1_47)
    fatal_marker:del(A1_47)
    table.insert(_deadNameTable, "elektricity_08")
    print("\226\151\134\230\173\187\228\186\161:elektricity_08")
  end
}
enmgen2_2_elektricity_01 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_01",
      name = "elektricity_2_01",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_48, A1_49)
    local L2_50, L3_51
    L2_50 = fatal_marker
    L3_51 = L2_50
    L2_50 = L2_50.set
    L2_50(L3_51, A1_49, "bn_root", false)
    L2_50 = breakLightningRod
    L3_51 = A1_49.getName
    L3_51 = L3_51(A1_49)
    L2_50(L3_51, L3_51(A1_49))
    L2_50 = print
    L3_51 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_50(L3_51, A1_49:getName())
    L2_50 = findGameObject2
    L3_51 = "EnemyBrain"
    L2_50 = L2_50(L3_51, A1_49:getName())
    L3_51 = L2_50.eventMessage
    L3_51 = L3_51(L2_50, "SetEnableChainBlitz", false)
    print(L3_51)
    L2_50:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_02 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_02",
      name = "elektricity_2_02",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_52, A1_53)
    local L2_54, L3_55
    L2_54 = fatal_marker
    L3_55 = L2_54
    L2_54 = L2_54.set
    L2_54(L3_55, A1_53, "bn_root", false)
    L2_54 = breakLightningRod
    L3_55 = A1_53.getName
    L3_55 = L3_55(A1_53)
    L2_54(L3_55, L3_55(A1_53))
    L2_54 = print
    L3_55 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_54(L3_55, A1_53:getName())
    L2_54 = findGameObject2
    L3_55 = "EnemyBrain"
    L2_54 = L2_54(L3_55, A1_53:getName())
    L3_55 = L2_54.eventMessage
    L3_55 = L3_55(L2_54, "SetEnableChainBlitz", false)
    print(L3_55)
    L2_54:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_03 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_03",
      name = "elektricity_2_03",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_56, A1_57)
    local L2_58, L3_59
    L2_58 = fatal_marker
    L3_59 = L2_58
    L2_58 = L2_58.set
    L2_58(L3_59, A1_57, "bn_root", false)
    L2_58 = breakLightningRod
    L3_59 = A1_57.getName
    L3_59 = L3_59(A1_57)
    L2_58(L3_59, L3_59(A1_57))
    L2_58 = print
    L3_59 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_58(L3_59, A1_57:getName())
    L2_58 = findGameObject2
    L3_59 = "EnemyBrain"
    L2_58 = L2_58(L3_59, A1_57:getName())
    L3_59 = L2_58.eventMessage
    L3_59 = L3_59(L2_58, "SetEnableChainBlitz", false)
    print(L3_59)
    L2_58:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_04 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_04",
      name = "elektricity_2_04",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_60, A1_61)
    local L2_62, L3_63
    L2_62 = fatal_marker
    L3_63 = L2_62
    L2_62 = L2_62.set
    L2_62(L3_63, A1_61, "bn_root", false)
    L2_62 = breakLightningRod
    L3_63 = A1_61.getName
    L3_63 = L3_63(A1_61)
    L2_62(L3_63, L3_63(A1_61))
    L2_62 = print
    L3_63 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_62(L3_63, A1_61:getName())
    L2_62 = findGameObject2
    L3_63 = "EnemyBrain"
    L2_62 = L2_62(L3_63, A1_61:getName())
    L3_63 = L2_62.eventMessage
    L3_63 = L3_63(L2_62, "SetEnableChainBlitz", false)
    print(L3_63)
    L2_62:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_05 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_05",
      name = "elektricity_2_05",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_64, A1_65)
    local L2_66, L3_67
    L2_66 = fatal_marker
    L3_67 = L2_66
    L2_66 = L2_66.set
    L2_66(L3_67, A1_65, "bn_root", false)
    L2_66 = breakLightningRod
    L3_67 = A1_65.getName
    L3_67 = L3_67(A1_65)
    L2_66(L3_67, L3_67(A1_65))
    L2_66 = print
    L3_67 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_66(L3_67, A1_65:getName())
    L2_66 = findGameObject2
    L3_67 = "EnemyBrain"
    L2_66 = L2_66(L3_67, A1_65:getName())
    L3_67 = L2_66.eventMessage
    L3_67 = L3_67(L2_66, "SetEnableChainBlitz", false)
    print(L3_67)
    L2_66:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_06 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_06",
      name = "elektricity_2_06",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_68, A1_69)
    local L2_70, L3_71
    L2_70 = fatal_marker
    L3_71 = L2_70
    L2_70 = L2_70.set
    L2_70(L3_71, A1_69, "bn_root", false)
    L2_70 = breakLightningRod
    L3_71 = A1_69.getName
    L3_71 = L3_71(A1_69)
    L2_70(L3_71, L3_71(A1_69))
    L2_70 = print
    L3_71 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_70(L3_71, A1_69:getName())
    L2_70 = findGameObject2
    L3_71 = "EnemyBrain"
    L2_70 = L2_70(L3_71, A1_69:getName())
    L3_71 = L2_70.eventMessage
    L3_71 = L3_71(L2_70, "SetEnableChainBlitz", false)
    print(L3_71)
    L2_70:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_07 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_07",
      name = "elektricity_2_07",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_72, A1_73)
    local L2_74, L3_75
    L2_74 = fatal_marker
    L3_75 = L2_74
    L2_74 = L2_74.set
    L2_74(L3_75, A1_73, "bn_root", false)
    L2_74 = breakLightningRod
    L3_75 = A1_73.getName
    L3_75 = L3_75(A1_73)
    L2_74(L3_75, L3_75(A1_73))
    L2_74 = print
    L3_75 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_74(L3_75, A1_73:getName())
    L2_74 = findGameObject2
    L3_75 = "EnemyBrain"
    L2_74 = L2_74(L3_75, A1_73:getName())
    L3_75 = L2_74.eventMessage
    L3_75 = L3_75(L2_74, "SetEnableChainBlitz", false)
    print(L3_75)
    L2_74:setVisibleBossMarker(true)
  end
}
enmgen2_2_elektricity_08 = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "elektricity_8",
      locator = "locator_01_08",
      name = "elektricity_2_08",
      ai_spawn_option = "Elektricity/elektricity_ep25"
    }
  },
  onSpawn = function(A0_76, A1_77)
    local L2_78, L3_79
    L2_78 = fatal_marker
    L3_79 = L2_78
    L2_78 = L2_78.set
    L2_78(L3_79, A1_77, "bn_root", false)
    L2_78 = breakLightningRod
    L3_79 = A1_77.getName
    L3_79 = L3_79(A1_77)
    L2_78(L3_79, L3_79(A1_77))
    L2_78 = print
    L3_79 = "\227\130\168\227\131\172\227\130\175\227\131\136\227\131\170\227\130\183\227\131\134\227\130\163\231\148\159\230\136\144\230\153\130\233\129\191\233\155\183\233\135\157\233\150\162\230\149\176\229\174\159\232\161\140"
    L2_78(L3_79, A1_77:getName())
    L2_78 = findGameObject2
    L3_79 = "EnemyBrain"
    L2_78 = L2_78(L3_79, A1_77:getName())
    L3_79 = L2_78.eventMessage
    L3_79 = L3_79(L2_78, "SetEnableChainBlitz", false)
    print(L3_79)
    L2_78:setVisibleBossMarker(true)
  end
}
function Initialize()
  local L0_80, L1_81
  L0_80 = SDemo
  L0_80 = L0_80.create
  L1_81 = "ep25_a_01"
  L0_80 = L0_80(L1_81)
  _sdemo = L0_80
  L0_80 = Vector
  L1_81 = 25.000252
  L0_80 = L0_80(L1_81, 181.278961, 470.199005)
  L1_81 = Vector
  L1_81 = L1_81(25.958485, 182.550369, 469.111359)
  _sdemo:set(L0_80, L1_81)
  _sdemo:setCameraParam(nil, 0.1, {deg = 55})
  Fn_cityPlaceName(false)
  Player:muteVoice(Player.kVoiceMuteLv_OnlyBreath)
end
function Ingame()
  local L0_82, L1_83, L2_84, L3_85, L4_86, L5_87, L6_88, L7_89, L8_90, L9_91, L10_92, L11_93, L12_94, L13_95, L14_96, L15_97
  L0_82 = {}
  L0_82 = L1_83
  for L4_86, L5_87 in L1_83(L2_84) do
    L6_88(L7_89, L8_90)
    L6_88(L7_89, L8_90)
  end
  L2_84(L3_85, L4_86)
  L2_84(L3_85, L4_86)
  L3_85(L4_86, L5_87)
  L3_85(L4_86, L5_87)
  for L6_88 = 1, 8 do
    L9_91 = "elektricity_"
    L9_91 = L9_91 .. L10_92
    L9_91 = L7_89
    L8_90(L9_91, L10_92)
    L9_91 = "EnemyGenerator"
    L13_95 = L6_88
    L9_91 = L8_90.requestSpawn
    L9_91(L10_92)
  end
  L3_85(L4_86, L5_87)
  L3_85(L4_86, L5_87, L6_88, L7_89)
  L3_85()
  L3_85()
  L3_85(L4_86)
  L3_85()
  L3_85()
  L3_85(L4_86, L5_87, L6_88)
  L3_85(L4_86)
  L3_85()
  L3_85(L4_86)
  L3_85()
  L3_85(L4_86, L5_87)
  for L6_88 = 1, 8 do
    L9_91 = "elektricity_"
    L9_91 = L9_91 .. L10_92
    L9_91 = L7_89
    L8_90(L9_91, L10_92)
  end
  while true do
    if L3_85 == false then
      L3_85()
    end
  end
  L3_85(L4_86)
  for L8_90, L9_91 in L5_87(L6_88) do
    if L4_86 == true then
      if L11_93 >= 3 then
        L13_95 = "enmgen2_2_"
        L14_96 = _deadNameTable
        L14_96 = L14_96[L8_90]
        L13_95 = L13_95 .. L14_96
      end
    elseif L4_86 == false then
      if L11_93 >= 3 then
        L13_95 = "enmgen2_"
        L14_96 = _deadNameTable
        L14_96 = L14_96[L8_90]
        L13_95 = L13_95 .. L14_96
      end
    else
      L13_95 = "enmgen2_"
      L14_96 = _deadNameTable
      L14_96 = L14_96[L8_90]
      L13_95 = L13_95 .. L14_96
    end
    while true do
      if L11_93 ~= 0 then
        L11_93()
      end
    end
    L11_93(L12_94)
  end
  for L9_91 = 1, 8 do
    L13_95, L14_96 = nil, nil
    for _FORV_18_, _FORV_19_ in L15_97(_deadNameTable) do
      if "elektricity_" .. string.format("%02d", L9_91) == _deadNameTable[_FORV_18_] then
        break
      end
    end
    if L10_92 == true and L4_86 == true then
    else
    end
    while true do
      if L15_97 == 0 then
        L15_97()
      end
    end
    if L10_92 == true and L4_86 == true then
      L13_95 = L15_97
      L15_97("enmgen2_2_elektricity_" .. string.format("%02d", L9_91))
    else
      L13_95 = L15_97
      L15_97("enmgen2_elektricity_" .. string.format("%02d", L9_91))
    end
    if L12_94 ~= nil then
      L15_97(L12_94, true)
      L15_97("\231\132\161\230\149\181")
    end
    if L13_95 ~= nil then
      if L4_86 == true then
        L14_96 = L15_97
      else
        L14_96 = L15_97
      end
      if Fn_getDistanceToPlayer(L14_96) > 31.5 then
      end
      print(Fn_getDistanceToPlayer(L14_96))
    end
  end
  _isRespawn = true
  L7_89()
  L9_91 = Camera
  L9_91 = L9_91.kPlayer
  L7_89(L8_90, L9_91, L10_92, L11_93)
  if L4_86 == true then
    L9_91 = _deadNameTable
    L9_91 = #L9_91
    if L9_91 >= 3 or L5_87 >= 3 then
      L9_91 = print
      L9_91(L10_92, L11_93)
      L9_91 = Fn_lookAtObject
      L9_91 = L9_91(L10_92, L11_93, L12_94)
    end
  elseif L4_86 == false then
    L9_91 = _deadNameTable
    L9_91 = #L9_91
    if L9_91 >= 3 or L5_87 >= 3 then
      L9_91 = print
      L9_91(L10_92, L11_93)
      L9_91 = Fn_lookAtObject
      L9_91 = L9_91(L10_92, L11_93, L12_94)
    end
  else
    L9_91 = print
    L9_91(L10_92, L11_93)
    L9_91 = 0
    for L13_95 = 1, 8 do
      L14_96 = findGameObject2
      L14_96 = L14_96(L15_97, "elektricity_" .. string.format("%02d", L13_95))
      if L14_96 ~= nil then
        if L9_91 < L15_97 then
          L9_91 = L15_97
        end
      end
      if L15_97 ~= nil and L9_91 < Fn_getDistanceToPlayer(L15_97) then
        L9_91 = Fn_getDistanceToPlayer(L15_97)
      end
    end
    L13_95 = 0.2
  end
  L9_91 = invokeTask
  L9_91(L10_92)
  L9_91 = Sound
  L9_91 = L9_91.playSE
  L9_91(L10_92, L11_93)
  L9_91 = Fn_captionView
  L9_91(L10_92)
  L9_91 = wait
  L9_91(L10_92)
  L9_91 = fatal_marker
  L9_91 = L9_91.run
  L9_91(L10_92)
  L9_91 = HUD
  L9_91 = L9_91.enemymarkerSetRangeMin
  L9_91(L10_92, L11_93)
  _isFatal = true
  repeat
    L9_91 = wait
    L9_91()
    L9_91 = fatal_marker
    L9_91 = L9_91.isFatalFinish
    L9_91 = L9_91(L10_92)
  until L9_91
  L9_91 = Player
  L9_91 = L9_91.setNoDamageMode
  L9_91(L10_92, L11_93, L12_94)
  L9_91 = Player
  L9_91 = L9_91.setControl
  L9_91(L10_92, L11_93, L12_94)
  L9_91 = Fn_whiteout
  L9_91(L10_92)
  L9_91 = HUD
  L9_91 = L9_91.enemymarkerSetRangeMin
  L9_91(L10_92)
  L9_91 = _boss_gauge
  L9_91 = L9_91.setActive
  L9_91(L10_92, L11_93)
  L9_91 = fatal_marker
  L9_91 = L9_91.kill
  L9_91(L10_92)
  fatal_marker = nil
  L9_91 = Fn_setNextMissionFlag
  L9_91()
  L9_91 = Fn_nextMission
  L9_91()
  L9_91 = Fn_exitSandbox
  L9_91()
end
function HPgauge()
  invokeTask(function()
    _boss_gauge = HUD:createBossHpGauge({
      obj = Fn_getPlayer()
    })
    _boss_gauge:setActive(true)
    while _isFatal == false do
      if _isRespawn == false then
        _boss_gauge:setHp((findGameObject2("EnemyBrain", "elektricity_01"):getHealth() + findGameObject2("EnemyBrain", "elektricity_02"):getHealth() + findGameObject2("EnemyBrain", "elektricity_03"):getHealth() + findGameObject2("EnemyBrain", "elektricity_04"):getHealth() + findGameObject2("EnemyBrain", "elektricity_05"):getHealth() + findGameObject2("EnemyBrain", "elektricity_06"):getHealth() + findGameObject2("EnemyBrain", "elektricity_07"):getHealth() + findGameObject2("EnemyBrain", "elektricity_08"):getHealth()) / (findGameObject2("EnemyBrain", "elektricity_01"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_02"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_03"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_04"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_05"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_06"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_07"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_08"):getMaxHealth()))
      else
        _boss_gauge:setHp(1)
      end
      if (findGameObject2("EnemyBrain", "elektricity_01"):getHealth() + findGameObject2("EnemyBrain", "elektricity_02"):getHealth() + findGameObject2("EnemyBrain", "elektricity_03"):getHealth() + findGameObject2("EnemyBrain", "elektricity_04"):getHealth() + findGameObject2("EnemyBrain", "elektricity_05"):getHealth() + findGameObject2("EnemyBrain", "elektricity_06"):getHealth() + findGameObject2("EnemyBrain", "elektricity_07"):getHealth() + findGameObject2("EnemyBrain", "elektricity_08"):getHealth()) / (findGameObject2("EnemyBrain", "elektricity_01"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_02"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_03"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_04"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_05"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_06"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_07"):getMaxHealth() + findGameObject2("EnemyBrain", "elektricity_08"):getMaxHealth()) <= 0.375 then
        _isInjuredEle = true
      end
      wait()
    end
    _boss_gauge:setActive(false)
  end)
end
function breakLightningRod(A0_98)
  local L1_99
  function L1_99(A0_100)
    local L1_101, L2_102
    L1_101 = A0_100.lightningRodName
    L2_102 = A0_100.gameObject
    Fn_sendEventComSb("breakLightningRod_com", L1_101, L2_102)
  end
  findGameObject2("EnemyBrain", A0_98):setEventListener("boss_eleReport", L1_99)
end
function sendSetElekPupTbl()
  local L0_103, L1_104
  L0_103 = {}
  L1_104 = {}
  invokeTask(function()
    local L0_105, L1_106, L2_107, L3_108
    while true do
      for L3_108 = 1, 8 do
        L0_103[L3_108] = findGameObject2("Puppet", "elektricity_" .. string.format("%02d", L3_108))
        L1_104[L3_108] = findGameObject2("EnemyBrain", "elektricity_" .. string.format("%02d", L3_108))
        L0_103[L3_108 + 8] = findGameObject2("Puppet", "elektricity_2_" .. string.format("%02d", L3_108))
        L1_104[L3_108 + 8] = findGameObject2("EnemyBrain", "elektricity_2_" .. string.format("%02d", L3_108))
      end
      L3_108 = L1_104
      L0_105(L1_106, L2_107, L3_108)
      L0_105()
    end
  end)
end
function pccubesensor2_CatWarp_in_OnEnter()
  local L1_109
  L1_109 = _warp_caption_flag
  if L1_109 == true then
    _warp_caption_flag = false
  end
end
function pccubesensor2_CatWarp_mid_OnLeave()
  if _warp_caption_flag == false then
    Fn_captionView("ep25_00105")
    if Player:getAction() == Player.kAction_Jump then
      Player:setAction(Player.kAction_Float)
    end
    _warp_caption_flag = true
  end
end
function pccubesensor2_CatWarp_out_OnLeave()
  invokeTask(function()
    Fn_catWarp()
  end)
end
function Finalize()
  if Fn_getPlayer() then
    Fn_setFeline(false, false, false, true)
    Player:setNoDamageMode(Player.kNoDamage_All, false)
    Player:setControl(Player.kControl_All, true)
    Player:muteVoice(Player.kVoiceMuteLv_NoMute)
  end
  _boss_gauge:setActive(false)
end
