local L1_1
L0_0 = import
L1_1 = "math"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "Font"
L0_0(L1_1)
L0_0 = import
L1_1 = "Player"
L0_0(L1_1)
L0_0 = 1.8
L1_1 = {}
function L1_1.switch_visible()
  if HUD:hpgGetVisible() then
    HUD:hpgDispReq_FadeOut()
    HUD:grgDispReq_FadeOut()
    HUD:spgDispReq_FadeOut()
  else
    HUD:hpgDispReq_FadeIn()
    HUD:grgDispReq_FadeIn()
    HUD:spgDispReq_FadeIn()
  end
end
function L1_1.switch_feline()
  HUD:dbgGaugeSwitchFeline()
end
L1_1.is_disable = false
function L1_1.switch_parse_disable()
  if L1_1.is_disable then
    L1_1.is_disable = false
  else
    L1_1.is_disable = true
  end
  HUD:dbgGaugeSetDisableParse(L1_1.is_disable)
end
function L1_1.DEBUG_SettingFileLoad()
  HUD:DEBUG_SettingFileLoad()
end
function L1_1.dmg_slow(A0_2)
  local L1_3, L2_4, L3_5, L4_6
  for L4_6 = 1, A0_2.num do
    HUD:dbghpGauge2Damage(A0_2.dmg)
    wait()
  end
end
function L1_1.bounce(A0_7)
  TextParam = {}
  dbgCommon.get_param(TextParam, L1_1.root)
  if type(TextParam.BounceRate) == "number" then
    HUD:dbgGauge2Bounce(BounceRate)
  end
end
function L1_1.recover(A0_8)
  if type(A0_8.rate) == "number" then
    HUD:dbghpGauge2Damage(A0_8.rate)
    HUD:dbgspGaugeDamage(A0_8.rate)
    HUD:dbggrGauge2Damage(A0_8.rate)
  end
end
function L1_1.dmg(A0_9)
  TextParam = {}
  dbgCommon.get_param(TextParam, L1_1.root)
  if type(TextParam.DamageRate) == "number" then
    HUD:dbghpGauge2Damage(-TextParam.DamageRate)
    HUD:dbgspGaugeDamage(-TextParam.DamageRate)
    HUD:dbggrGauge2Damage(-TextParam.DamageRate)
  end
end
L1_1.root = {
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.recover,
    data_label = "Recover_50",
    rate = 0.5
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.recover,
    data_label = "Recover_20",
    rate = 0.2
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "Threshold",
    data_label = "Threshold",
    step = 0.01,
    min = 0,
    max = 1,
    num = 0.25
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.dmg,
    data_label = "Damage"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "DamageRate",
    data_label = "DamageRate",
    step = 0.02,
    min = 0,
    max = 1,
    num = 0.2
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.bounce,
    data_label = "Bounce"
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "BounceRate",
    data_label = "BounceRate",
    step = 0.02,
    min = 0,
    max = 1,
    num = 1
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.switch_visible,
    data_label = "SwitchVisible"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.switch_feline,
    data_label = "SwitchFeline"
  },
  {
    type = dbgCommon.kTypeFunction,
    data = L1_1.DEBUG_SettingFileLoad,
    data_label = "DEBUG_SettingFileLoad"
  }
}
function test_hp_gauge_walk()
  HUD:spgSetVisibleSphere(true)
  HUD:dbgspGaugeDamage(1)
  HUD:dbghpGauge2Damage(-0.1)
  HUD:dbgGauge2SetDrawLimit(L0_0)
  test_hp_gauge()
end
function L1_1.root.update()
  TextParam = {}
  dbgCommon.get_param(TextParam, L1_1.root)
  if TextParam.Threshold ~= nil then
    HUD:hpgSetCautionThreshold(TextParam.Threshold)
  end
end
function L1_1.root.Execute(A0_10, A1_11)
  if A1_11 ~= nil and A1_11.type == dbgCommon.kTypeFunction then
    dbgCommon.function_execute(A1_11)
  end
end
function test_hp_gauge()
  L1_1.root.pos_y = 300
  dbgCommon.TreeExecute(L1_1.root)
end
