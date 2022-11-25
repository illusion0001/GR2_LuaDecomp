dofile("/Game/Event2/Common/HeaderCommon.lua")
_disp_marker = false
_kaiwa_id = 1
_kaiwa_table = {
  "ep21_00010k",
  "ep21_00020k",
  "ep21_00030k",
  "ep21_00040k"
}
function Initialize()
  if GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag01) <= 0 then
    setKaiwaDemo("npcgen2_ele_01")
    lightgial_01 = Fn_createEffect("ef_hs_lgt_01", "ef_hs_lgt_01", {
      obj = Fn_findNpcPuppet("npcgen2_ele_01"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial2_01 = Fn_createEffect("ef_hs_lgt2_01", "ef_hs_lgt_00", {
      obj = Fn_findNpcPuppet("npcgen2_ele_01"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial_01:setAlpha(0.65)
    lightgial2_01:setAlpha(0.65)
  else
    _kaiwa_id = _kaiwa_id + 1
    Fn_setNpcAlpha("npcgen2_ele_01", false)
    Fn_setNpcActive("npcgen2_ele_01", false)
  end
  if 0 >= GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag02) then
    setKaiwaDemo("npcgen2_ele_02")
    lightgial_02 = Fn_createEffect("ef_hs_lgt_02", "ef_hs_lgt_01", {
      obj = Fn_findNpcPuppet("npcgen2_ele_02"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial2_02 = Fn_createEffect("ef_hs_lgt2_02", "ef_hs_lgt_00", {
      obj = Fn_findNpcPuppet("npcgen2_ele_02"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial_02:setAlpha(0.7)
    lightgial2_02:setAlpha(0.7)
  else
    _kaiwa_id = _kaiwa_id + 1
    Fn_setNpcAlpha("npcgen2_ele_02", false)
    Fn_setNpcActive("npcgen2_ele_02", false)
  end
  if 0 >= GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag03) then
    setKaiwaDemo("npcgen2_ele_03")
    lightgial_03 = Fn_createEffect("ef_hs_lgt_03", "ef_hs_lgt_01", {
      obj = Fn_findNpcPuppet("npcgen2_ele_03"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial2_03 = Fn_createEffect("ef_hs_lgt2_03", "ef_hs_lgt_00", {
      obj = Fn_findNpcPuppet("npcgen2_ele_03"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial_03:setAlpha(0.8)
    lightgial2_03:setAlpha(0.8)
  else
    _kaiwa_id = _kaiwa_id + 1
    Fn_setNpcAlpha("npcgen2_ele_03", false)
    Fn_setNpcActive("npcgen2_ele_03", false)
  end
  if 0 >= GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag04) then
    setKaiwaDemo("npcgen2_ele_04")
    lightgial_04 = Fn_createEffect("ef_hs_lgt_04", "ef_hs_lgt_01", {
      obj = Fn_findNpcPuppet("npcgen2_ele_04"),
      joint = "loc_ef_point_00"
    }, false)
    lightgial2_04 = Fn_createEffect("ef_hs_lgt2_04", "ef_hs_lgt_00", {
      obj = Fn_findNpcPuppet("npcgen2_ele_04"),
      joint = "loc_ef_point_00"
    }, false)
  else
    _kaiwa_id = _kaiwa_id + 1
    Fn_setNpcAlpha("npcgen2_ele_04", false)
    Fn_setNpcActive("npcgen2_ele_04", false)
  end
  if GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag01) >= 1 and 1 <= GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag02) and 1 <= GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag03) and 1 <= GameDatabase:get(ggd.Savedata__EventFlags__eps21__flag04) then
    GameDatabase:set(ggd.Savedata__Menu__EventStateFlags__ep21, 1)
    g_own:getSandbox2():sendEvent("Fn_enableKaiwaDemo", "marker_node_ep21")
    Fn_setNpcActive("ep21_ele_02", true)
    Fn_createEffect("ef_hs_lgt01_05", "ef_hs_lgt_01", {
      obj = Fn_findNpcPuppet("ep21_ele_02"),
      joint = "loc_ef_point_00"
    }, true)
    Fn_createEffect("ef_hs_lgt00_05", "ef_hs_lgt_00", {
      obj = Fn_findNpcPuppet("ep21_ele_02"),
      joint = "loc_ef_point_00"
    }, true)
    _disp_marker = true
  else
    GameDatabase:set(ggd.Savedata__Menu__EventStateFlags__ep21, 0)
  end
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5
  L0_0 = {
    L1_1,
    L2_2,
    L3_3,
    L4_4,
    L5_5
  }
  L4_4 = "npcgen2_ele_04"
  L5_5 = "ep21_ele_02"
  for L4_4, L5_5 in L1_1(L2_2) do
    Fn_waitStartedNpc(L5_5)
    if Fn_findNpc(L5_5) then
      Fn_findNpc(L5_5):ignoreStoop()
    end
  end
end
function Finalize()
  local L0_6
  L0_6 = {
    "ep21_ele_02"
  }
  Fn_finalizeNpcKill("ep21", L0_6)
end
function setKaiwaDemo(A0_7)
  local L1_8, L2_9, L3_10, L4_11
  L1_8 = findGameObject2
  L2_9 = "Puppet"
  L3_10 = A0_7
  L1_8 = L1_8(L2_9, L3_10)
  function L2_9()
    Fn_kaiwaDemoView(_kaiwa_table[_kaiwa_id])
    _kaiwa_id = _kaiwa_id + 1
    if _disp_marker == false and _kaiwa_id >= 5 then
      g_own:getSandbox2():sendEvent("Fn_enableKaiwaDemo", "marker_node_ep21")
      Fn_setNpcActive("ep21_ele_02", true)
      Fn_createEffect("ef_hs_lgt01_05", "ef_hs_lgt_01", {
        obj = Fn_findNpcPuppet("ep21_ele_02"),
        joint = "loc_ef_point_00"
      }, true)
      Fn_createEffect("ef_hs_lgt00_05", "ef_hs_lgt_00", {
        obj = Fn_findNpcPuppet("ep21_ele_02"),
        joint = "loc_ef_point_00"
      }, true)
      _disp_marker = true
    end
    invokeTask(function()
      local L0_12
      L0_12 = string
      L0_12 = L0_12.match
      L0_12 = L0_12(L1_8:getName(), "01")
      if L0_12 then
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial_01, 0)
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial2_01, 0)
        L0_12 = GameDatabase
        L0_12 = L0_12.set
        L0_12(L0_12, ggd.Savedata__EventFlags__eps21__flag01, 1)
      end
      L0_12 = string
      L0_12 = L0_12.match
      L0_12 = L0_12(L1_8:getName(), "02")
      if L0_12 then
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial_02, 0)
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial2_02, 0)
        L0_12 = GameDatabase
        L0_12 = L0_12.set
        L0_12(L0_12, ggd.Savedata__EventFlags__eps21__flag02, 1)
      end
      L0_12 = string
      L0_12 = L0_12.match
      L0_12 = L0_12(L1_8:getName(), "03")
      if L0_12 then
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial_03, 0)
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial2_03, 0)
        L0_12 = GameDatabase
        L0_12 = L0_12.set
        L0_12(L0_12, ggd.Savedata__EventFlags__eps21__flag03, 1)
      end
      L0_12 = string
      L0_12 = L0_12.match
      L0_12 = L0_12(L1_8:getName(), "04")
      if L0_12 then
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial_04, 0)
        L0_12 = Fn_finishedTremEffect
        L0_12(lightgial2_04, 0)
        L0_12 = GameDatabase
        L0_12 = L0_12.set
        L0_12(L0_12, ggd.Savedata__EventFlags__eps21__flag04, 1)
      end
      L0_12 = Sound
      L0_12 = L0_12.playSE
      L0_12(L0_12, "ep21_elec_vanish", 1, "", L1_8)
      L0_12 = L1_8
      L0_12 = L0_12.getWorldPos
      L0_12 = L0_12(L0_12)
      L0_12.y = L0_12.y + 1.4
      if _kaiwa_id >= 4 then
        GameDatabase:set(ggd.Savedata__Menu__EventStateFlags__ep21, 1)
      end
      Fn_setNpcAlpha(A0_7, false)
      Fn_setNpcActive(A0_7, false)
    end)
    Fn_disableKaiwaDemo(L1_8)
  end
  L3_10 = {}
  L3_10.target = L1_8
  L3_10.find_type = "Puppet"
  L4_11 = {}
  L4_11.name = "gui_marker_07"
  L4_11.ad_title_id = "ui_acdialog_main_ep21_00010k"
  L4_11.ad_sub_id = "ui_acdialog_sub_03"
  L4_11.map_title_id = "ui_map_msinfo_main_ep21_00010k"
  L4_11.map_sub_id = "ui_map_msinfo_header_03"
  L4_11.giude_id = "ui_keyguide_ac_02"
  L4_11.map_disp = true
  L4_11.pattern = "A"
  setupMarkerBase(L3_10, L4_11, L2_9):setPos(Vector(0, 0.8, 0))
end
