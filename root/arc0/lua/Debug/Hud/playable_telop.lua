L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = dofile
L0_0("/Debug/Action/debug_stage.lua")
L0_0 = {}
function L0_0.switch_photo_enable()
  if L0_0.is_photo_enable then
    L0_0.is_photo_enable = false
  else
    L0_0.is_photo_enable = true
  end
  HUD:enablePhotoMode(L0_0.is_photo_enable)
end
function L0_0.switch_menu_lock()
  if L0_0.is_menu_lock then
    L0_0.is_menu_lock = false
  else
    L0_0.is_menu_lock = true
  end
  HUD:setUserControlLock(L0_0.is_menu_lock)
end
function L0_0.getCursor(A0_1)
  return A0_1.cursor - 1
end
function L0_0.delete_list()
  TextParam = {}
  dbgCommon.get_param(TextParam, L0_0.root)
  if TextParam.pos == 9 then
    for _FORV_4_ = 1, #{
      "C",
      "LT",
      "LC",
      "LC2",
      "LB",
      "RT",
      "RC",
      "RC2",
      "RB"
    } do
      HUD:setPlayableTelop(({
        "C",
        "LT",
        "LC",
        "LC2",
        "LB",
        "RT",
        "RC",
        "RC2",
        "RB"
      })[_FORV_4_])
    end
  else
    HUD:setPlayableTelop(({
      "C",
      "LT",
      "LC",
      "LC2",
      "LB",
      "RT",
      "RC",
      "RC2",
      "RB"
    })[TextParam.pos + 1])
  end
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "Staff1",
    data_label = "Staff1",
    cursor = 2,
    "none",
    "ui_name_1",
    "ui_cv_16",
    "ui_cv_10",
    "ui_cv_11",
    "ui_cv_13",
    "ui_cv_14",
    "ui_name_2",
    "ui_name_3",
    "ui_name_4",
    "ui_name_5",
    "ui_name_6",
    "ui_name_7",
    "ui_name_8",
    "ui_name_9",
    "ui_name_10",
    "ui_name_11",
    "ui_name_12",
    "ui_name_13",
    "ui_name_14",
    "ui_name_15",
    "ui_name_16",
    "ui_name_17",
    "ui_name_18",
    "ui_name_19",
    "ui_name_20",
    "ui_name_21",
    "ui_name_22",
    "ui_name_23",
    "ui_name_24",
    "ui_name_25",
    "ui_name_26",
    "ui_name_27",
    "ui_name_28",
    "ui_name_29",
    "ui_name_30",
    "ui_name_31",
    "ui_name_32",
    "ui_name_33",
    "ui_name_34",
    "ui_name_35",
    "ui_name_36",
    "ui_name_37"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Staff2",
    data_label = "Staff2",
    "none",
    "ui_name_1",
    "ui_cv_16",
    "ui_cv_10",
    "ui_cv_11",
    "ui_cv_13",
    "ui_cv_14",
    "ui_name_2",
    "ui_name_3",
    "ui_name_4",
    "ui_name_5",
    "ui_name_6",
    "ui_name_7",
    "ui_name_8",
    "ui_name_9",
    "ui_name_10",
    "ui_name_11",
    "ui_name_12",
    "ui_name_13",
    "ui_name_14",
    "ui_name_15",
    "ui_name_16",
    "ui_name_17",
    "ui_name_18",
    "ui_name_19",
    "ui_name_20",
    "ui_name_21",
    "ui_name_22",
    "ui_name_23",
    "ui_name_24",
    "ui_name_25",
    "ui_name_26",
    "ui_name_27",
    "ui_name_28",
    "ui_name_29",
    "ui_name_30",
    "ui_name_31",
    "ui_name_32",
    "ui_name_33",
    "ui_name_34",
    "ui_name_35",
    "ui_name_36",
    "ui_name_37"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Staff3",
    data_label = "Staff3",
    "none",
    "ui_name_1",
    "ui_cv_16",
    "ui_cv_10",
    "ui_cv_11",
    "ui_cv_13",
    "ui_cv_14",
    "ui_name_2",
    "ui_name_3",
    "ui_name_4",
    "ui_name_5",
    "ui_name_6",
    "ui_name_7",
    "ui_name_8",
    "ui_name_9",
    "ui_name_10",
    "ui_name_11",
    "ui_name_12",
    "ui_name_13",
    "ui_name_14",
    "ui_name_15",
    "ui_name_16",
    "ui_name_17",
    "ui_name_18",
    "ui_name_19",
    "ui_name_20",
    "ui_name_21",
    "ui_name_22",
    "ui_name_23",
    "ui_name_24",
    "ui_name_25",
    "ui_name_26",
    "ui_name_27",
    "ui_name_28",
    "ui_name_29",
    "ui_name_30",
    "ui_name_31",
    "ui_name_32",
    "ui_name_33",
    "ui_name_34",
    "ui_name_35",
    "ui_name_36",
    "ui_name_37"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Job1",
    data_label = "Job1",
    cursor = 2,
    "none",
    "ui_job_1",
    "ui_chara_16",
    "ui_chara_10",
    "ui_chara_11",
    "ui_chara_13",
    "ui_chara_14",
    "ui_job_2",
    "ui_job_3",
    "ui_job_4",
    "ui_job_5",
    "ui_job_6",
    "ui_job_7",
    "ui_job_8",
    "ui_job_9",
    "ui_job_10",
    "ui_job_11",
    "ui_job_12",
    "ui_job_13",
    "ui_job_14",
    "ui_job_15",
    "ui_job_16",
    "ui_job_17",
    "ui_job_18",
    "ui_job_19",
    "ui_job_20",
    "ui_job_21",
    "ui_job_22",
    "ui_job_23",
    "ui_job_24",
    "ui_job_25",
    "ui_job_26",
    "ui_job_27",
    "ui_job_28",
    "ui_job_29",
    "ui_job_30",
    "ui_job_31",
    "ui_job_32",
    "ui_job_33",
    "ui_job_34",
    "ui_job_35",
    "ui_job_36",
    "ui_job_37",
    "ui_job_38",
    "ui_job_39"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Job2",
    data_label = "Job2",
    "none",
    "ui_job_1",
    "ui_chara_16",
    "ui_chara_10",
    "ui_chara_11",
    "ui_chara_13",
    "ui_chara_14",
    "ui_job_2",
    "ui_job_3",
    "ui_job_4",
    "ui_job_5",
    "ui_job_6",
    "ui_job_7",
    "ui_job_8",
    "ui_job_9",
    "ui_job_10",
    "ui_job_11",
    "ui_job_12",
    "ui_job_13",
    "ui_job_14",
    "ui_job_15",
    "ui_job_16",
    "ui_job_17",
    "ui_job_18",
    "ui_job_19",
    "ui_job_20",
    "ui_job_21",
    "ui_job_22",
    "ui_job_23",
    "ui_job_24",
    "ui_job_25",
    "ui_job_26",
    "ui_job_27",
    "ui_job_28",
    "ui_job_29",
    "ui_job_30",
    "ui_job_31",
    "ui_job_32",
    "ui_job_33",
    "ui_job_34",
    "ui_job_35",
    "ui_job_36",
    "ui_job_37",
    "ui_job_38",
    "ui_job_39"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Job3",
    data_label = "Job3",
    "none",
    "ui_job_1",
    "ui_chara_16",
    "ui_chara_10",
    "ui_chara_11",
    "ui_chara_13",
    "ui_chara_14",
    "ui_job_2",
    "ui_job_3",
    "ui_job_4",
    "ui_job_5",
    "ui_job_6",
    "ui_job_7",
    "ui_job_8",
    "ui_job_9",
    "ui_job_10",
    "ui_job_11",
    "ui_job_12",
    "ui_job_13",
    "ui_job_14",
    "ui_job_15",
    "ui_job_16",
    "ui_job_17",
    "ui_job_18",
    "ui_job_19",
    "ui_job_20",
    "ui_job_21",
    "ui_job_22",
    "ui_job_23",
    "ui_job_24",
    "ui_job_25",
    "ui_job_26",
    "ui_job_27",
    "ui_job_28",
    "ui_job_29",
    "ui_job_30",
    "ui_job_31",
    "ui_job_32",
    "ui_job_33",
    "ui_job_34",
    "ui_job_35",
    "ui_job_36",
    "ui_job_37",
    "ui_job_38",
    "ui_job_39"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "pos",
    data_label = "pos",
    get_data = L0_0.getCursor,
    "Center",
    "LeftTop",
    "LeftCenter",
    "LeftCenter2",
    "LeftBottom",
    "RightTop",
    "RightCenter",
    "RightCenter2",
    "RightBottom",
    "All"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 0.05,
    min = -1,
    max = 10,
    num = -1
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.delete_list,
    data_label = "delete"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_menu_lock,
    data_label = "switch_menu_lock"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L0_0.switch_photo_enable,
    data_label = "switch_photo_enable"
  }
}
function L0_0.root.Execute(A0_2)
  local L1_3, L2_4
  L1_3 = {}
  TextParam = L1_3
  L1_3 = dbgCommon
  L1_3 = L1_3.get_param
  L2_4 = TextParam
  L1_3(L2_4, L0_0.root)
  L1_3 = {}
  L2_4 = TextParam
  L2_4 = L2_4.Job1
  if L2_4 ~= "none" then
    L2_4 = table
    L2_4 = L2_4.insert
    L2_4(L1_3, TextParam.Job1)
  end
  L2_4 = TextParam
  L2_4 = L2_4.Job2
  if L2_4 ~= "none" then
    L2_4 = table
    L2_4 = L2_4.insert
    L2_4(L1_3, TextParam.Job2)
  end
  L2_4 = TextParam
  L2_4 = L2_4.Job3
  if L2_4 ~= "none" then
    L2_4 = table
    L2_4 = L2_4.insert
    L2_4(L1_3, TextParam.Job3)
  end
  L2_4 = {}
  if TextParam.Staff1 ~= "none" then
    table.insert(L2_4, TextParam.Staff1)
  end
  if TextParam.Staff2 ~= "none" then
    table.insert(L2_4, TextParam.Staff2)
  end
  if TextParam.Staff3 ~= "none" then
    table.insert(L2_4, TextParam.Staff3)
  end
  if TextParam.pos == 9 then
    for _FORV_7_ = 1, #{
      "C",
      "LT",
      "LC",
      "LC2",
      "LB",
      "RT",
      "RC",
      "RC2",
      "RB"
    } do
      HUD:setPlayableTelop(({
        "C",
        "LT",
        "LC",
        "LC2",
        "LB",
        "RT",
        "RC",
        "RC2",
        "RB"
      })[_FORV_7_], TextParam.time, L1_3, L2_4)
    end
  else
    HUD:setPlayableTelop(({
      "C",
      "LT",
      "LC",
      "LC2",
      "LB",
      "RT",
      "RC",
      "RC2",
      "RB"
    })[TextParam.pos + 1], TextParam.time, L1_3, L2_4)
  end
end
function test_playable_telop()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  L0_0.is_menu_lock = true
  L0_0.is_photo_enable = false
  HUD:setUserControlLock(L0_0.is_menu_lock)
  HUD:enablePhotoMode(L0_0.is_photo_enable)
  Font:openTextSet("Credits")
  dbgCommon.TreeExecute(L0_0.root)
end
