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
L0_0 = {}
L0_0.kFuncType_CaptionBegin = 0 + 1
L0_0.kFuncType_CaptionEnd = 0 + 1 + 1
L0_0.kFuncType_MissionBegin = 0 + 1 + 1 + 1
L0_0.kFuncType_MissionEnd = 0 + 1 + 1 + 1 + 1
L0_0.kFuncType_MissionRestore = 0 + 1 + 1 + 1 + 1 + 1
L0_0.kFuncType_Tutorial = 0 + 1 + 1 + 1 + 1 + 1 + 1
function L0_0.getFuncType(A0_1)
  local L1_2
  L1_2 = A0_1.cursor
  return L1_2
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "text_id",
    data_label = "text_id",
    "ic_pi_monument_obj_00030",
    "ic_pi_monument_obj_00060",
    "ui_tuto_map_01",
    "ui_tuto_map_02",
    "ui_tuto_talisman_01",
    "ui_tuto_talisman_02",
    "ui_tuto_powerup_01",
    "ui_tuto_powerup_02",
    "ui_caption_tutorial",
    "ui_caption_monologue",
    "ui_caption_jimaku",
    "ui_caption_jimaku_3",
    "ic_tutorial_00120",
    "ic_testtext",
    "ep02_00103",
    "ep02_00114",
    "ep90_00819",
    "ui_object_ep90_01",
    "ui_debug_caption_01",
    "ui_debug_caption_02",
    "ui_debug_caption_03",
    "sm93_00009"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 0.1,
    min = 0,
    max = 5,
    num = 0
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "in_time",
    data_label = "in_time",
    step = 0.1,
    min = -1,
    max = 5,
    num = -1
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "out_time",
    data_label = "out_time",
    step = 0.1,
    min = -1,
    max = 5,
    num = -1
  },
  {
    ["type"] = dbgCommon.kTypeTable,
    ["data_name"] = "functype",
    ["data_label"] = "functype",
    ["get_data"] = L0_0.getFuncType,
    [L0_0.kFuncType_CaptionBegin] = "captionBegin",
    [L0_0.kFuncType_CaptionEnd] = "captionEnd",
    [L0_0.kFuncType_MissionBegin] = "missionBegin",
    [L0_0.kFuncType_MissionEnd] = "missionEnd",
    [L0_0.kFuncType_MissionRestore] = "missionRestore",
    [L0_0.kFuncType_Tutorial] = "tutorial"
  }
}
function L0_0.root.Execute(A0_3)
  local L1_4
  L1_4 = {}
  TextParam = L1_4
  L1_4 = dbgCommon
  L1_4 = L1_4.get_param
  L1_4(TextParam, A0_3)
  L1_4 = TextParam
  L1_4 = L1_4.functype
  if L1_4 == L0_0.kFuncType_CaptionBegin then
    L1_4 = HUD
    L1_4 = L1_4.captionBegin
    L1_4(L1_4, TextParam.text_id, TextParam.time, nil, TextParam.in_time, TextParam.out_time)
  else
    L1_4 = TextParam
    L1_4 = L1_4.functype
    if L1_4 == L0_0.kFuncType_CaptionEnd then
      L1_4 = HUD
      L1_4 = L1_4.captionEnd
      L1_4(L1_4)
    else
      L1_4 = TextParam
      L1_4 = L1_4.functype
      if L1_4 == L0_0.kFuncType_MissionBegin then
        L1_4 = HUD
        L1_4 = L1_4.missionBegin
        L1_4(L1_4, TextParam.text_id, TextParam.time)
      else
        L1_4 = TextParam
        L1_4 = L1_4.functype
        if L1_4 == L0_0.kFuncType_MissionEnd then
          L1_4 = HUD
          L1_4 = L1_4.missionEnd
          L1_4(L1_4)
        else
          L1_4 = TextParam
          L1_4 = L1_4.functype
          if L1_4 == L0_0.kFuncType_MissionRestore then
            L1_4 = HUD
            L1_4 = L1_4.missionRestore
            L1_4(L1_4, TextParam.time)
          else
            L1_4 = TextParam
            L1_4 = L1_4.functype
            if L1_4 == L0_0.kFuncType_Tutorial then
              L1_4 = {
                {
                  H = "\227\128\144\230\176\180\227\130\132\227\130\138\227\128\145",
                  T = "\230\176\180\229\160\180\227\129\171\232\191\145\227\129\165\227\129\132\227\129\166\226\151\139\227\131\156\227\130\191\227\131\179\227\130\146\230\138\188\227\129\153\227\129\168\227\128\129\230\176\180\227\130\146\227\130\176\227\131\169\227\131\150\227\129\153\227\130\139\227\129\147\227\129\168\227\129\140\227\129\167\227\129\141\227\129\190\227\129\153\227\128\130\n\227\130\176\227\131\169\227\131\150\227\129\151\227\129\159\230\176\180\227\130\146\230\156\168\227\129\171\227\129\182\227\129\164\227\129\145\227\129\166\230\176\180\227\130\132\227\130\138\227\129\151\227\129\190\227\129\151\227\130\135\227\129\134\227\128\130",
                  L = "*"
                }
              }
              HUD:info(L1_4, true, TextParam.time)
            end
          end
        end
      end
    end
  end
end
function test_caption()
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
  Font:openTextSet("ep02")
  Font:openTextSet("common")
  dbgCommon.TreeExecute(L0_0.root)
end
