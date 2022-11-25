local L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
L0_0 = import
L1_1 = "Mob"
L0_0(L1_1)
L0_0 = import
L1_1 = "GameDatabase"
L0_0(L1_1)
L0_0, L1_1, L2_2, L3_3, L4_4, L5_5 = nil, nil, nil, nil, nil, nil
L6_6 = ""
function L7_7(A0_8)
  local L1_9, L2_10, L3_11, L4_12, L5_13, L6_14, L7_15, L8_16
  L1_9 = {L2_10}
  L2_10 = {
    L3_11,
    L4_12,
    L5_13
  }
  L3_11 = "bundle_default"
  L2_10 = GameDatabase
  L3_11 = L2_10
  L2_10 = L2_10.get
  L2_10 = L2_10(L3_11, L4_12)
  if L2_10 ~= 0 then
    L2_10 = {L3_11, L4_12}
    L3_11 = "eps05"
    L3_11 = true
    for L7_15, L8_16 in L4_12(L5_13) do
      if string.find(GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName), L7_15) or string.find(GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName), L7_15) then
        L3_11 = false
      end
    end
    if L3_11 then
      L7_15 = "bundle_gizoku"
      L8_16 = "po_"
      L4_12(L5_13, L6_14)
      L7_15 = "bundle_gizoku"
      L8_16 = "lo_"
      L4_12(L5_13, L6_14)
    end
  end
  L2_10 = GameDatabase
  L3_11 = L2_10
  L2_10 = L2_10.get
  L2_10 = L2_10(L3_11, L4_12)
  if L2_10 ~= 0 then
    L2_10 = {
      L3_11,
      L4_12,
      L5_13,
      L6_14,
      L7_15,
      L8_16
    }
    L3_11 = "eps0"
    L7_15 = "sm03"
    L8_16 = "sm06"
    L3_11 = true
    for L7_15, L8_16 in L4_12(L5_13) do
      if string.find(GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName), L7_15) or string.find(GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName), L7_15) then
        L3_11 = false
      end
    end
    if L3_11 then
      L7_15 = "bundle_popular_song"
      L8_16 = "po_"
      L4_12(L5_13, L6_14)
    end
  end
  L2_10 = GameDatabase
  L3_11 = L2_10
  L2_10 = L2_10.get
  L2_10 = L2_10(L3_11, L4_12)
  if L2_10 ~= 0 then
    L2_10 = {
      L3_11,
      L4_12,
      L5_13,
      L6_14,
      L7_15,
      L8_16,
      "ep03",
      "ep04",
      "sm01",
      "sm02"
    }
    L3_11 = "eps01"
    L7_15 = "ep01"
    L8_16 = "ep02"
    L3_11 = true
    for L7_15, L8_16 in L4_12(L5_13) do
      if string.find(GameDatabase:get(ggd.Savedata__EventManageFlags__ReadyMissionName), L7_15) or string.find(GameDatabase:get(ggd.Savedata__EventManageFlags__CurrentMissionName), L7_15) then
        L3_11 = false
      end
    end
    if L3_11 then
      L7_15 = "bundle_magichand"
      L8_16 = "bu_"
      L4_12(L5_13, L6_14)
    end
  end
  L2_10 = {}
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep01_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep02_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep02_a2 = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.eps05_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "po_"
  L8_16 = true
  L2_10.ep05_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_a_04_02"
  L8_16 = false
  L2_10.ep06_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_a_04_02"
  L8_16 = false
  L2_10.ep06_a2 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_a_04_02"
  L8_16 = false
  L2_10.ep06_a3 = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep06_d = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep06_e = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep06_f = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L7_15 = {
    L8_16,
    "bu_a_09",
    false
  }
  L8_16 = "bundle_default_roam"
  L2_10.ft07 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_e = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_f = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "po_a_04"
  L8_16 = false
  L7_15 = "bundle_gizoku"
  L8_16 = "po_a_04"
  L2_10.ep07_g = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_default"
  L8_16 = "bu_"
  L2_10.ep07_h = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_default"
  L8_16 = "bu_"
  L2_10.ep07_i = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_default"
  L8_16 = "bu_"
  L2_10.ep07_j = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L2_10.ft08 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L2_10.ep08_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L2_10.ep08_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L2_10.ep08_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L2_10.ep08_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_ep09",
      "bu_",
      true
    }
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "bu_",
    true
  }
  L8_16 = "bundle_patrol_bu"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ft09 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    true
  }
  L8_16 = "bundle_guard_go"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ft10 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    true
  }
  L8_16 = "bundle_guard_go"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ep10_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    true
  }
  L8_16 = "bundle_guard_go"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ep10_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ep10_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ep10_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ep10_e = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = true
  L7_15 = "mi_a_05"
  L8_16 = true
  L7_15 = "bundle_hide_for_agitation"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "go_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "bu_",
    false
  }
  L2_10.ep10_f = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = true
  L7_15 = "up_"
  L8_16 = false
  L2_10.ft11 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_default",
      "lo_",
      false
    },
    {
      "bundle_default",
      "po_a_02",
      false
    },
    {
      "bundle_default",
      "po_a_03",
      false
    },
    {
      "bundle_default",
      "po_a_04",
      false
    },
    {
      "bundle_default",
      "po_a_06",
      false
    },
    {
      "bundle_default",
      "po_a_13",
      false
    }
  }
  L7_15 = true
  L7_15 = "up_"
  L8_16 = true
  L7_15 = "bundle_default"
  L8_16 = "up_"
  L7_15 = {
    L8_16,
    "bu_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "mi_",
    false
  }
  L2_10.ep11_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_default",
      "lo_",
      false
    },
    {
      "bundle_default",
      "po_a_02",
      false
    },
    {
      "bundle_default",
      "po_a_03",
      false
    },
    {
      "bundle_default",
      "po_a_04",
      false
    },
    {
      "bundle_default",
      "po_a_06",
      false
    },
    {
      "bundle_default",
      "po_a_13",
      false
    }
  }
  L7_15 = true
  L7_15 = "up_"
  L8_16 = true
  L7_15 = "bundle_default"
  L8_16 = "up_"
  L7_15 = {
    L8_16,
    "bu_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "mi_",
    false
  }
  L2_10.ep11_a2 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_default",
      "lo_",
      false
    },
    {
      "bundle_default",
      "po_a_02",
      false
    },
    {
      "bundle_default",
      "po_a_03",
      false
    },
    {
      "bundle_default",
      "po_a_04",
      false
    },
    {
      "bundle_default",
      "po_a_06",
      false
    },
    {
      "bundle_default",
      "po_a_13",
      false
    }
  }
  L7_15 = true
  L7_15 = "up_"
  L8_16 = true
  L7_15 = "bundle_default"
  L8_16 = "up_"
  L7_15 = {
    L8_16,
    "bu_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "mi_",
    false
  }
  L2_10.ep11_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_default",
      "lo_",
      false
    },
    {
      "bundle_default",
      "po_a_02",
      false
    },
    {
      "bundle_default",
      "po_a_03",
      false
    },
    {
      "bundle_default",
      "po_a_04",
      false
    },
    {
      "bundle_default",
      "po_a_06",
      false
    },
    {
      "bundle_default",
      "po_a_13",
      false
    }
  }
  L7_15 = true
  L7_15 = "up_"
  L8_16 = true
  L7_15 = "bundle_default"
  L8_16 = "up_"
  L7_15 = {
    L8_16,
    "bu_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "mi_",
    false
  }
  L2_10.ep11_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_default",
      "lo_",
      false
    },
    {
      "bundle_default",
      "po_a_02",
      false
    },
    {
      "bundle_default",
      "po_a_03",
      false
    },
    {
      "bundle_default",
      "po_a_04",
      false
    },
    {
      "bundle_default",
      "po_a_06",
      false
    },
    {
      "bundle_default",
      "po_a_13",
      false
    },
    {
      "bundle_escapeship",
      "up_",
      true
    }
  }
  L7_15 = true
  L7_15 = "up_"
  L8_16 = true
  L7_15 = "bundle_default"
  L8_16 = "up_"
  L7_15 = {
    L8_16,
    "bu_",
    false
  }
  L8_16 = "bundle_default"
  L8_16 = {
    "bundle_default",
    "mi_",
    false
  }
  L2_10.ep11_d = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep12_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep12_b = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.ep13_b = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep14_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_police_school",
      "ed_",
      false
    }
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_drunk"
  L8_16 = "ed_"
  L7_15 = {
    L8_16,
    "ed_",
    true
  }
  L8_16 = "bundle_search_dr"
  L8_16 = {
    "bundle_police_amuse_back",
    "ed_",
    false
  }
  L2_10.ep14_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_police_school",
      "ed_",
      false
    }
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_drunk"
  L8_16 = "ed_"
  L7_15 = {
    L8_16,
    "ed_",
    true
  }
  L8_16 = "bundle_search_dr"
  L8_16 = {
    "bundle_police_amuse_back",
    "ed_",
    false
  }
  L2_10.ep14_e = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_police_school"
  L8_16 = "ed_"
  L2_10.ep14_f = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = true
  L2_10.ft15 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = true
  L2_10.ep15_2a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = true
  L2_10.ep15_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = true
  L2_10.ep15_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = true
  L2_10.ep15_c = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep16_2a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep16_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep16_b = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep16_c = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.ep16_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_drunk",
      "ed_",
      false
    },
    {
      "bundle_search_kat",
      "ed_",
      true
    }
  }
  L7_15 = true
  L7_15 = "cc_"
  L8_16 = false
  L7_15 = "bundle_search_kat"
  L8_16 = "cc_"
  L7_15 = {
    L8_16,
    "ed_",
    false
  }
  L8_16 = "bundle_default_core_amuse"
  L8_16 = {
    "bundle_student_in_amuse",
    "ed_",
    false
  }
  L2_10.ep17_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_drunk",
      "ed_",
      false
    },
    {
      "bundle_search_kat",
      "ed_",
      true
    }
  }
  L7_15 = true
  L7_15 = "cc_"
  L8_16 = false
  L7_15 = "bundle_search_kat"
  L8_16 = "cc_"
  L7_15 = {
    L8_16,
    "ed_",
    false
  }
  L8_16 = "bundle_default_core_amuse"
  L8_16 = {
    "bundle_student_in_amuse",
    "ed_",
    false
  }
  L2_10.ep17_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_default_park_grigo"
  L8_16 = "dt_"
  L7_15 = {
    L8_16,
    "dt_",
    false
  }
  L8_16 = "bundle_default_parkside"
  L8_16 = {
    "bundle_search_durga",
    "dt_",
    true
  }
  L2_10.ep18_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_subway_station_grigo"
  L8_16 = "dt_"
  L2_10.ep18_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_subway_station_grigo"
  L8_16 = "dt_"
  L2_10.ep18_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_subway_station_grigo"
  L8_16 = "dt_"
  L2_10.ep18_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_subway_station_grigo"
  L8_16 = "dt_"
  L2_10.ep18_e = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_subway_station_grigo"
  L8_16 = "dt_"
  L2_10.ep18_f = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "id_"
  L8_16 = false
  L7_15 = "bundle_gull"
  L8_16 = "cc_"
  L7_15 = {
    L8_16,
    "id_",
    true
  }
  L8_16 = "bundle_gull"
  L2_10.ep27_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_subway_station_grigo",
      "dt_",
      false
    }
  }
  L7_15 = false
  L7_15 = "id_"
  L8_16 = false
  L7_15 = "bundle_gull"
  L8_16 = "cc_"
  L7_15 = {
    L8_16,
    "id_",
    true
  }
  L8_16 = "bundle_gull"
  L8_16 = {
    "bundle_subway_station",
    "dt_",
    false
  }
  L2_10.ep27_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "id_"
  L8_16 = false
  L7_15 = "bundle_gull"
  L8_16 = "cc_"
  L7_15 = {
    L8_16,
    "id_",
    true
  }
  L8_16 = "bundle_gull"
  L2_10.ft28 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "bu_a_02"
  L8_16 = false
  L2_10.sm02_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "bu_a_02"
  L8_16 = false
  L2_10.sm02_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "bu_a_15"
  L8_16 = false
  L2_10.sm03_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15,
    L8_16,
    {
      "bundle_sm03_b",
      "po_a_04",
      true
    }
  }
  L7_15 = false
  L7_15 = "bu_a_15"
  L8_16 = false
  L7_15 = "bundle_default"
  L8_16 = "po_a_01"
  L7_15 = {
    L8_16,
    "po_a_01",
    false
  }
  L8_16 = "bundle_gizoku"
  L8_16 = {
    "bundle_popular_song",
    "po_a_01",
    false
  }
  L2_10.sm03_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "bu_a_15"
  L8_16 = false
  L2_10.sm03_c = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "bu_a_15"
  L8_16 = false
  L2_10.sm03_d = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm04 = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm06_a = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm06_b = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm09_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm09_b = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm09_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "mi_"
  L8_16 = false
  L7_15 = "bundle_sm11"
  L8_16 = "po_"
  L7_15 = {
    L8_16,
    "mi_",
    true
  }
  L8_16 = "bundle_sm11"
  L2_10.sm11 = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm12_a = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm12_b = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm12_c = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm15_a = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm15_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_sm15_a"
  L8_16 = "po_a_01"
  L2_10.sm15_c = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm15_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "up_a_00"
  L8_16 = true
  L7_15 = "bundle_sm16_a"
  L8_16 = "up_a_00"
  L2_10.sm16_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "up_a_00"
  L8_16 = true
  L7_15 = "bundle_sm16_a"
  L8_16 = "up_a_00"
  L2_10.sm16_a2 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "up_a_00"
  L8_16 = true
  L7_15 = "bundle_sm16_a"
  L8_16 = "up_a_00"
  L2_10.sm16_ab = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_popular_song"
  L8_16 = "po_a_01"
  L2_10.sm18_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_popular_song"
  L8_16 = "po_a_01"
  L2_10.sm18_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "po_a_01"
  L8_16 = false
  L7_15 = "bundle_popular_song"
  L8_16 = "po_a_01"
  L2_10.sm18_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "bu_"
  L8_16 = false
  L7_15 = "bundle_popular_song"
  L8_16 = "po_a_01"
  L2_10.sm19_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "bu_"
  L8_16 = false
  L7_15 = "bundle_popular_song"
  L8_16 = "po_a_01"
  L2_10.sm19_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "bu_"
  L8_16 = false
  L7_15 = "bundle_popular_song"
  L8_16 = "po_a_01"
  L2_10.sm19_c = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_a_00"
  L8_16 = true
  L2_10.sm20_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_a_00"
  L8_16 = true
  L2_10.sm20_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_a_00"
  L8_16 = true
  L2_10.sm20_c = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = true
  L7_15 = "up_"
  L8_16 = false
  L2_10.sm22_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_"
  L8_16 = false
  L2_10.sm22_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_"
  L8_16 = false
  L2_10.sm22_c = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "up_"
  L8_16 = false
  L2_10.sm22_d = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_drunk"
  L8_16 = "ed_"
  L7_15 = {
    L8_16,
    "ed_",
    true
  }
  L8_16 = "bundle_sm24_a"
  L2_10.sm24_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_drunk"
  L8_16 = "ed_"
  L7_15 = {
    L8_16,
    "ed_",
    true
  }
  L8_16 = "bundle_sm24_a"
  L2_10.sm24_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_drunk"
  L8_16 = "ed_"
  L7_15 = {
    L8_16,
    "ed_",
    true
  }
  L8_16 = "bundle_sm24_a"
  L2_10.sm24_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14,
    L7_15
  }
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_drunk"
  L8_16 = "ed_"
  L7_15 = {
    L8_16,
    "ed_",
    true
  }
  L8_16 = "bundle_sm24_a"
  L2_10.sm24_c2 = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm26 = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm27_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm27_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "cc_"
  L8_16 = true
  L2_10.sm30_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "cc_"
  L8_16 = true
  L2_10.sm30_a2 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "cc_"
  L8_16 = true
  L2_10.sm30_a3 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "cc_"
  L8_16 = true
  L2_10.sm30_a4 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "cc_"
  L8_16 = true
  L2_10.sm30_a5 = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "cc_"
  L8_16 = true
  L2_10.sm30_b = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm32_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm32_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = true
  L2_10.sm33_a = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = true
  L2_10.sm33_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = true
  L2_10.sm33_c = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = false
  L7_15 = "ed_"
  L8_16 = true
  L2_10.sm33_c2 = L3_11
  L3_11 = {L4_12}
  L7_15 = true
  L2_10.sm34 = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm35 = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_sm36_a"
  L8_16 = "dt_"
  L2_10.sm36_a = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_sm36_a"
  L8_16 = "dt_"
  L2_10.sm36_b = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_sm36_a"
  L8_16 = "dt_"
  L2_10.sm36_c = L3_11
  L3_11 = {
    L4_12,
    L5_13,
    L6_14
  }
  L7_15 = false
  L7_15 = "dt_"
  L8_16 = false
  L7_15 = "bundle_sm36_a"
  L8_16 = "dt_"
  L2_10.sm36_d = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm38_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm38_b = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = true
  L7_15 = "cc_"
  L8_16 = false
  L2_10.sm38_c = L3_11
  L3_11 = {L4_12, L5_13}
  L7_15 = true
  L7_15 = "cc_"
  L8_16 = false
  L2_10.sm38_d = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm39_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm39_b = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm39_c = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm39_c2 = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm39_d = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm41_a = L3_11
  L3_11 = {L4_12}
  L7_15 = false
  L2_10.sm41_b = L3_11
  L3_11 = "sm41_c"
  L7_15 = "id_"
  L8_16 = false
  L2_10[L3_11] = L4_12
  L3_11 = "sm43_a"
  L7_15 = "mi_a_02"
  L8_16 = false
  L2_10[L3_11] = L4_12
  L3_11 = "sm43_b"
  L7_15 = "mi_a_02"
  L8_16 = false
  L2_10[L3_11] = L4_12
  L3_11 = "sm44_a"
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_student_in_amuse"
  L8_16 = "ed_"
  L2_10[L3_11] = L4_12
  L3_11 = "sm44_b"
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_student_in_amuse"
  L8_16 = "ed_"
  L2_10[L3_11] = L4_12
  L3_11 = "sm44_c"
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_student_in_amuse"
  L8_16 = "ed_"
  L2_10[L3_11] = L4_12
  L3_11 = "sm44_c2"
  L7_15 = "ed_"
  L8_16 = false
  L7_15 = "bundle_student_in_amuse"
  L8_16 = "ed_"
  L2_10[L3_11] = L4_12
  L3_11 = "sm45"
  L7_15 = "dt_"
  L8_16 = false
  L2_10[L3_11] = L4_12
  L3_11 = "sm46_c2"
  L7_15 = "cc"
  L8_16 = false
  L7_15 = "bundle_sm46_c"
  L8_16 = "cc"
  L2_10[L3_11] = L4_12
  L3_11 = "cm12"
  L7_15 = "dt_"
  L8_16 = true
  L2_10[L3_11] = L4_12
  L3_11 = "cm14"
  L7_15 = "dt_"
  L8_16 = true
  L2_10[L3_11] = L4_12
  L3_11 = "cm17"
  L7_15 = "dt_"
  L8_16 = false
  L2_10[L3_11] = L4_12
  L3_11 = L2_10[A0_8]
  if L3_11 then
    for L7_15, L8_16 in L4_12(L5_13) do
      table.insert(L1_9, L8_16)
    end
  end
  return L1_9
end
L1_1 = L7_7
function L7_7(A0_17)
  local L1_18, L2_19, L3_20, L4_21, L5_22, L6_23, L7_24, L8_25
  L1_18 = {}
  L2_19 = GameDatabase
  L3_20 = L2_19
  L2_19 = L2_19.get
  L2_19 = L2_19(L3_20, L4_21)
  if L2_19 ~= 0 then
    L2_19 = table
    L2_19 = L2_19.insert
    L3_20 = L1_18
    L7_24 = "bu_"
    L2_19(L3_20, L4_21)
  end
  L2_19 = {}
  L3_20 = {L4_21}
  L7_24 = ""
  L2_19.ft09 = L3_20
  L3_20 = {L4_21}
  L7_24 = ""
  L2_19.ft10 = L3_20
  L3_20 = L2_19[A0_17]
  if L3_20 then
    for L7_24, L8_25 in L4_21(L5_22) do
      table.insert(L1_18, L8_25)
    end
  end
  return L1_18
end
L2_2 = L7_7
function L7_7(A0_26, A1_27)
  local L2_28
  L2_28 = string
  L2_28 = L2_28.len
  L2_28 = L2_28(A1_27)
  if string.sub(A0_26, 1, L2_28) == A1_27 then
    return true
  end
  return false
end
L0_0 = L7_7
function L7_7(A0_29, A1_30)
  local L2_31, L3_32, L4_33, L5_34, L6_35, L7_36, L8_37, L9_38, L10_39
  L2_31 = Mob
  L2_31 = L2_31.clearHatBundleAll
  L2_31(L3_32, L4_33)
  L2_31 = {}
  for L6_35, L7_36 in L3_32(L4_33) do
    L8_37 = unpack
    L9_38 = L7_36
    L10_39 = L8_37(L9_38)
    if L9_38 == true or L0_0(Mob:getPartitionName(A0_29), L9_38) then
      table.insert(L2_31, {L8_37, L10_39})
    end
  end
  L6_35 = L2_31
  L3_32(L4_33, L5_34, L6_35)
end
L3_3 = L7_7
function L7_7(A0_40, A1_41)
  local L2_42, L3_43, L4_44, L5_45, L6_46, L7_47
  L2_42 = L1_1
  L2_42 = L2_42(L3_43)
  for L6_46, L7_47 in L3_43(L4_44) do
    L3_3(L7_47, L2_42)
  end
end
L4_4 = L7_7
function L7_7(A0_48)
  local L1_49
  L1_49 = L2_2
  L1_49 = L1_49(A0_48)
  Mob:setAccessoryReplacer()
  Mob:setAccessoryReplacer(L1_49)
end
;({}).taskManagement = function()
  local L0_50, L1_51, L2_52, L3_53, L4_54, L5_55, L6_56, L7_57
  L0_50 = {}
  while true do
    L1_51 = Mob
    L2_52 = L1_51
    L1_51 = L1_51.getAllPartitionIds
    L1_51 = L1_51(L2_52)
    L2_52 = {}
    if L3_53 ~= L4_54 then
      for L6_56, L7_57 in L3_53(L4_54) do
        if not L0_50[L7_57] then
          L0_50[L7_57] = true
          table.insert(L2_52, L7_57)
        end
      end
    end
    if L4_54 ~= L3_53 then
      L6_6 = L3_53
      L4_54(L5_55)
      L6_56 = Mob
      L6_56 = L6_56.StateMode
      L6_56 = L6_56.kBlueSoldier
      L7_57 = GameDatabase
      L7_57 = L7_57.get
      L7_57 = L7_57(L7_57, ggd.Savedata__EventFinishedFlags__ep10)
      L7_57 = L7_57 ~= 0
      L4_54(L5_55, L6_56, L7_57)
      L6_56 = L1_51
      L4_54(L5_55, L6_56)
      L2_52 = L4_54
    end
    if L4_54 ~= 0 then
      L6_56 = L2_52
      L4_54(L5_55, L6_56)
    end
    L4_54()
  end
end
return {}
