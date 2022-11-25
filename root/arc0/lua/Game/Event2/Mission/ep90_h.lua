dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/TutorialCommon.lua")
dofile("/Game/Event2/Common/SuppoterCommon.lua")
dofile("/Game/Event2/Mission/ep90_common.lua")
_vogo_task = nil
_enemy_task = nil
_dead_cnt = 10
_ash_cnt = 10
_enmgen_tbl = {
  enmgen2_a = {
    enmgen = nil,
    node_hdl = nil,
    wait = 0
  },
  enmgen2_b = {
    enmgen = nil,
    node_hdl = nil,
    wait = 0
  },
  enmgen2_c = {
    enmgen = nil,
    node_hdl = nil,
    wait = 0
  },
  enmgen2_d = {
    enmgen = nil,
    node_hdl = nil,
    wait = 0
  },
  enmgen2_e = {
    enmgen = nil,
    node_hdl = nil,
    wait = 0
  },
  enmgen2_f = {
    enmgen = nil,
    node_hdl = nil,
    wait = 0
  }
}
enmgen2_a = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_a_01",
      name = "ene_a_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a_02",
      name = "ene_a_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_a_03",
      name = "ene_a_03"
    },
    {
      type = "officer_rifle",
      locator = "locator_a_01",
      name = "enemy_a_04",
      target_vehicle = "ene_a_01"
    }
  },
  onObjectDead = function(A0_0, A1_1)
    _dead_cnt = _dead_cnt - 1
  end,
  onObjectAsh = function(A0_2, A1_3)
    _ash_cnt = _ash_cnt - 1
  end
}
enmgen2_b = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_launcher",
      locator = "locator_b_01",
      name = "ene_b_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_b_02",
      name = "ene_b_02"
    }
  },
  onObjectDead = function(A0_4, A1_5)
    _dead_cnt = _dead_cnt - 1
  end,
  onObjectAsh = function(A0_6, A1_7)
    _ash_cnt = _ash_cnt - 1
  end
}
enmgen2_c = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "soldier_rifle",
      locator = "locator_c_01",
      name = "ene_c_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_c_02",
      name = "ene_c_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_c_03",
      name = "ene_c_03"
    }
  },
  onObjectDead = function(A0_8, A1_9)
    _dead_cnt = _dead_cnt - 1
  end,
  onObjectAsh = function(A0_10, A1_11)
    _ash_cnt = _ash_cnt - 1
  end
}
enmgen2_d = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "mechsmall",
      locator = "locator_d_01",
      name = "ene_d_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d_02",
      name = "ene_d_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_d_03",
      name = "ene_d_03"
    },
    {
      type = "officer_rifle",
      locator = "locator_d_01",
      name = "enemy_d_04",
      target_vehicle = "ene_d_01"
    }
  },
  onObjectDead = function(A0_12, A1_13)
    _dead_cnt = _dead_cnt - 1
  end,
  onObjectAsh = function(A0_14, A1_15)
    _ash_cnt = _ash_cnt - 1
  end
}
enmgen2_e = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_rifle",
      locator = "locator_e_01",
      name = "ene_e_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_e_02",
      name = "ene_e_02"
    }
  },
  onObjectDead = function(A0_16, A1_17)
    _dead_cnt = _dead_cnt - 1
  end,
  onObjectAsh = function(A0_18, A1_19)
    _ash_cnt = _ash_cnt - 1
  end
}
enmgen2_f = {
  spawnOnStart = false,
  autoPrepare = true,
  spawnSet = {
    {
      type = "officer_launcher",
      locator = "locator_f_01",
      name = "ene_f_01"
    },
    {
      type = "soldier_rifle",
      locator = "locator_f_02",
      name = "ene_f_02"
    },
    {
      type = "soldier_rifle",
      locator = "locator_f_03",
      name = "ene_f_03"
    }
  },
  onObjectDead = function(A0_20, A1_21)
    _dead_cnt = _dead_cnt - 1
  end,
  onObjectAsh = function(A0_22, A1_23)
    _ash_cnt = _ash_cnt - 1
  end
}
function get_enm_tbl()
  local L0_24, L1_25
  L0_24 = 1
  L1_25 = {}
  for _FORV_5_, _FORV_6_ in pairs(enmgen2_a.spawnSet) do
    L1_25[L0_24] = _FORV_6_.name
    L0_24 = L0_24 + 1
  end
  for _FORV_5_, _FORV_6_ in pairs(enmgen2_b.spawnSet) do
    L1_25[L0_24] = _FORV_6_.name
    L0_24 = L0_24 + 1
  end
  for _FORV_5_, _FORV_6_ in pairs(enmgen2_c.spawnSet) do
    L1_25[L0_24] = _FORV_6_.name
    L0_24 = L0_24 + 1
  end
  for _FORV_5_, _FORV_6_ in pairs(enmgen2_d.spawnSet) do
    L1_25[L0_24] = _FORV_6_.name
    L0_24 = L0_24 + 1
  end
  for _FORV_5_, _FORV_6_ in pairs(enmgen2_e.spawnSet) do
    L1_25[L0_24] = _FORV_6_.name
    L0_24 = L0_24 + 1
  end
  for _FORV_5_, _FORV_6_ in pairs(enmgen2_f.spawnSet) do
    L1_25[L0_24] = _FORV_6_.name
    L0_24 = L0_24 + 1
  end
  return L1_25
end
function Initialize()
  local L0_26
  L0_26 = Fn_userCtrlOff
  L0_26()
  L0_26 = {
    "evarea2_po_a_02_common",
    "evarea2_po_a_04_common",
    "evarea2_po_a_04_crate_after_dummy",
    "evarea2_po_a_04_gem_vital",
    "evarea2_po_a_04_vogo_escape",
    "evarea2_po_a_04_crow"
  }
  Fn_loadEventData("evx/ep90_common", L0_26)
  Fn_loadEventData("evx/ep90", {
    "evarea2_po_a_04"
  }, true)
end
function Ingame()
  local L0_27, L1_28, L2_29, L3_30, L4_31, L5_32, L6_33, L7_34, L8_35, L9_36, L10_37, L11_38, L12_39, L13_40, L14_41, L15_42, L16_43, L17_44
  L0_27 = Fn_findNpc
  L1_28 = "vogo_01"
  L0_27 = L0_27(L1_28)
  L2_29 = L0_27
  L1_28 = L0_27.getPuppet
  L1_28 = L1_28(L2_29)
  L2_29 = L1_28.isPoseAnimPlaying
  L2_29 = L2_29(L3_30, L4_31)
  if L2_29 == false then
    L2_29 = Fn_warpNpc
    L2_29(L3_30, L4_31)
    L2_29 = L0_27.playMotion
    L2_29(L3_30, L4_31)
  end
  L2_29 = Fn_spawnSuppotCrow
  L2_29 = L2_29(L3_30, L4_31)
  for L6_33, L7_34 in L3_30(L4_31) do
    L11_38 = L6_33
    L8_35.enmgen = L9_36
    L11_38 = "locator2_"
    L12_39 = L6_33
    L11_38 = L11_38 .. L12_39
    L8_35.node_hdl = L9_36
    L8_35(L9_36, L10_37)
  end
  L3_30.wait = L4_31
  _enemy_task = L4_31
  L4_31()
  while true do
    if L4_31 == 0 then
      L5_32(L6_33)
      L6_33(L7_34)
      L6_33()
      _vogo_task = L6_33
      for L9_36, L10_37 in L6_33(L7_34) do
        L11_38 = _enmgen_tbl
        L11_38 = L11_38[L9_36]
        L11_38 = L11_38.enmgen
        L12_39 = L11_38
        L11_38 = L11_38.setEnemyMarker
        L11_38(L12_39, L13_40)
      end
      L6_33(L7_34)
      while true do
        if L6_33 > 7 then
          L6_33()
        end
      end
      L6_33(L7_34)
      L6_33(L7_34, L8_35, L9_36, L10_37)
      while true do
        if L6_33 > 0 then
          L6_33()
        end
      end
      L6_33()
      if L6_33 ~= nil then
        if L6_33 == true then
          L6_33(L7_34)
        end
      end
      _enemy_task = nil
      for L10_37, L11_38 in L7_34(L8_35) do
        L12_39 = L11_38.enmgen
        L12_39 = L12_39.getEnemyCount
        L12_39 = L12_39(L13_40)
        if L12_39 == 0 then
          L12_39 = L11_38.node_hdl
          L12_39 = L12_39.getWorldPos
          L12_39 = L12_39(L13_40)
          L12_39 = L6_33 - L12_39
          L12_39 = L12_39.Length
          L12_39 = L12_39(L13_40)
          L12_39 = L12_39 > 5
          if L12_39 == true then
            L12_39 = is_check_eye_node
            L12_39 = L12_39(L13_40, L14_41)
            if L12_39 == false then
              L12_39 = L11_38.enmgen
              L12_39 = L12_39.requestSpawn
              L12_39(L13_40)
            end
          end
        end
      end
      L7_34(L8_35)
      L7_34(L8_35, L9_36)
      L7_34(L8_35)
      L7_34(L8_35)
      L7_34(L8_35)
      L7_34(L8_35)
      while true do
        for L11_38, L12_39 in L8_35(L9_36) do
          if L13_40 > 0 then
            for L16_43, L17_44 in L13_40(L14_41) do
              if findGameObject2("EnemyBrain", L17_44) ~= nil and 0 < findGameObject2("EnemyBrain", L17_44):getHealth() then
                break
              end
            end
          end
        end
        if L7_34 ~= true then
          L8_35()
        end
      end
      L7_34(L8_35, L9_36)
      L7_34()
      if L7_34 ~= nil then
        if L7_34 == true then
          L7_34(L8_35)
        end
      end
      _vogo_task = nil
      L7_34(L8_35)
      break
    end
    L5_32()
  end
  L5_32(L6_33)
  L5_32(L6_33)
  L5_32()
  L5_32()
  L5_32()
  L5_32()
end
function Finalize()
  if _vogo_task ~= nil and _vogo_task:isRunning() == true then
    _vogo_task:abort()
  end
  _vogo_task = nil
  if _enemy_task ~= nil and _enemy_task:isRunning() == true then
    _enemy_task:abort()
  end
  _enemy_task = nil
end
