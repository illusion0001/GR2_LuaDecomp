L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = {}
function L0_0.cbLabelSightTypeName(A0_1)
  local L1_2
  L1_2 = A0_1.cursor
  return string.format("%2d: %s", L1_2, A0_1[L1_2].label)
end
function L0_0.cbLabelRadiusName(A0_3)
  return string.format("%.4f", A0_3.num)
end
function L0_0.getSightTypeData(A0_4)
  local L3_5
  L3_5 = A0_4.cursor
  return A0_4[L3_5].val
end
L0_0.root = {
  {
    type = dbgCommon.kTypeNode,
    data_label = "RadiusSetting",
    {
      type = dbgCommon.kTypeTable,
      data_name = "tune",
      data_label = "tune",
      "Normal",
      "Mars",
      "Jupiter"
    },
    {
      type = dbgCommon.kTypeNode,
      data_label = "Param",
      {
        type = dbgCommon.kTypeInteger,
        data_name = "RadiusNormal",
        data_label = "Normal",
        label = L0_0.cbLabelRadiusName,
        step = 0.005,
        min = 0.0435,
        max = 0.4,
        num = 0.15
      },
      {
        type = dbgCommon.kTypeInteger,
        data_name = "RadiusMars",
        data_label = "Mars",
        label = L0_0.cbLabelRadiusName,
        step = 0.005,
        min = 0.0435,
        max = 0.4,
        num = 0.2
      },
      {
        type = dbgCommon.kTypeInteger,
        data_name = "RadiusJupiter",
        data_label = "Jupiter",
        label = L0_0.cbLabelRadiusName,
        step = 0.005,
        min = 0.0435,
        max = 0.4,
        num = 0.06
      }
    }
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "sightMarkerTransTime",
    data_label = "width_trans_time",
    step = 0.01,
    min = 0.01,
    max = 2,
    num = 0.2
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "sightMarkerRadiusTransTime",
    data_label = "radius_trans_time",
    step = 0.01,
    min = 0.01,
    max = 2,
    num = 0.25
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "kSightType",
    data_label = "type",
    get_data = L0_0.getSightTypeData,
    label = L0_0.cbLabelSightTypeName,
    {label = "None", val = 0},
    {label = "Aim", val = 1},
    {label = "Lockon", val = 2}
  }
}
function L0_0.root.update()
  TextParam = {}
  dbgCommon.get_param(TextParam, L0_0.root)
  if TextParam.tune == "Normal" then
    TextParam.sightMarkerRadius = TextParam.RadiusNormal
  elseif TextParam.tune == "Mars" then
    TextParam.sightMarkerRadius = TextParam.RadiusMars
  elseif TextParam.tune == "Jupiter" then
    TextParam.sightMarkerRadius = TextParam.RadiusJupiter
  end
  HUD:testSightMaerkerCtrl(TextParam)
end
function test_sight_marker()
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
  dbgCommon.TreeExecute(L0_0.root)
end
