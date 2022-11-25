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
L0_0.root = {
  {
    type = dbgCommon.kTypeInteger,
    data_name = "firstpage_screen_num",
    data_label = "firstpage_screen_num",
    step = 1,
    min = 0,
    max = 2,
    num = 1
  },
  {
    type = dbgCommon.kTypeInteger,
    data_name = "page_num",
    data_label = "page_num",
    step = 1,
    min = 1,
    max = 10,
    num = 2
  },
  {
    type = dbgCommon.kTypeBoolean,
    data_name = "is_telop",
    data_label = "is_telop",
    data = true
  },
  {
    type = dbgCommon.kTypeNumber,
    data_name = "time",
    data_label = "time",
    step = 0.1,
    min = -1,
    max = 20,
    num = 10
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "file",
    data_label = "file",
    "none",
    "epNN_AAAAAA",
    "dm04_info_01",
    "dm04_info_02",
    "dm04_info_03",
    "ep01_info_01",
    "ep02_info_02",
    "ep02_info_03",
    "ep02_info_04",
    "ep02_info_05",
    "ep02_info_06",
    "ep02_info_07",
    "ep02_info_08",
    "ep02_info_08_as",
    "ep02_info_09",
    "ep02_info_11",
    "ep02_info_12",
    "ep02_info_13",
    "ep03_info_01",
    "ep03_info_02",
    "ep03_info_03",
    "ep03_info_04",
    "ep03_info_05",
    "ep03_info_06",
    "ep03_info_06_as",
    "ep03_info_07",
    "ep04_info_01",
    "ep04_info_02",
    "ep05_info_02",
    "ep06_info_01",
    "ep06_info_02",
    "ep08_info_01",
    "ep09_info_01",
    "ep09_info_02",
    "ep09_info_02_as",
    "ep09_info_03",
    "ep09_info_04",
    "ep09_info_05",
    "ep09_info_06",
    "ep09_info_07",
    "ep10_info_02",
    "ep10_info_03",
    "ep11_info_01",
    "ep12_info_01",
    "ep12_info_02",
    "ep12_info_03",
    "ep12_info_04",
    "ep12_info_05",
    "ep13_info_01",
    "ep13_info_02",
    "ep15_info_04",
    "ep16_info_01",
    "ep17_info_01",
    "ep19_info_01",
    "ep19_info_01_as",
    "ep19_info_02",
    "ep19_info_03",
    "ep21_info_01",
    "ep24_info_01",
    "ep80_info_01",
    "ep80_info_02",
    "ep80_info_03",
    "ep80_info_04",
    "eps03_info_01",
    "eps03_info_02",
    "eps03_info_03",
    "eps04_info_01",
    "eps05_info_01",
    "eps10_info_01",
    "eps15_info_01",
    "eps80_info_01",
    "ft90_info_01",
    "sm02_info_01",
    "sm03_info_01",
    "sm04_info_01",
    "sm04_info_02",
    "sm05_info_01",
    "sm07_info_01",
    "sm08_info_01",
    "sm09_info_01",
    "sm10_info_01",
    "sm11_info_01",
    "sm11_info_02",
    "sm15_info_01",
    "sm17_info_01",
    "sm18_info_01",
    "sm18_info_02",
    "sm18_info_03",
    "sm18_info_04",
    "sm20_info_01",
    "sm20_info_02",
    "sm22_info_01",
    "sm24_info_01",
    "sm24_info_02",
    "sm26_info_01",
    "sm27_info_01",
    "sm29_info_01",
    "sm30_info_01",
    "sm30_info_02",
    "sm30_info_03",
    "sm30_info_04",
    "sm30_info_05",
    "sm31_info_01",
    "sm34_info_01",
    "sm35_info_01",
    "sm39_info_01",
    "sm39_info_02",
    "sm39_info_03",
    "sm43_info_01",
    "sm44_info_01",
    "sm45_info_01",
    "sm47_info_01",
    "sm50_info_01",
    "sm51_info_01",
    "th01_info_01"
  }
}
L0_0.root.textid = {
  {
    id = "ui_debug_text_01"
  },
  {
    id = "ui_debug_text_02"
  },
  {
    id = "ep90_info_05_1",
    TxtSet = "ep90"
  },
  {
    id = "cm90_info_01",
    TxtSet = "cm90"
  },
  {
    id = "sm90_info_01",
    TxtSet = "sm90"
  },
  {
    id = "sm91_info_01",
    TxtSet = "sm91"
  },
  {
    id = "sm92_info_02",
    TxtSet = "sm92"
  },
  {id = "ft90_00280", TxtSet = "ft90"}
}
L0_0.root.image = {
  "action_review_01",
  "action_review_02",
  "action_review_03",
  "action_review_04",
  "cm90_info_01",
  "cm90_info_02",
  "eps90_info_01",
  "sm90_info_01",
  "sm90_info_02",
  "sm91_info_01",
  "sm92_info_01",
  "sm92_info_02",
  "sm92_info_03"
}
L0_0.root.movie = {
  "mp4/ep00_00100m",
  "mp4/ep00_00200m",
  "mp4/ep01_00200m",
  "mp4/ep01_00300m",
  "mp4/ep02_00200m"
}
function L0_0.root.Generate(A0_1, A1_2, A2_3)
  if L0_0.root.text == nil then
    L0_0.root.text = {}
  end
  if L0_0.root.textid[RandI(1, #L0_0.root.textid)].TxtSet ~= nil then
    L0_0.root.text[#L0_0.root.text + 1] = L0_0.root.textid[RandI(1, #L0_0.root.textid)].TxtSet
  end
  A0_1[A1_2].T = L0_0.root.textid[RandI(1, #L0_0.root.textid)].id
  A0_1[A1_2].H = L0_0.root.textid[RandI(1, #L0_0.root.textid)].title
  A0_1[A1_2].L = L0_0.root.image[RandI(1, #L0_0.root.image)]
  if A2_3.firstpage_screen_num == 2 then
    A0_1[A1_2].R = L0_0.root.image[RandI(1, #L0_0.root.image)]
  end
  if RandI(1, 4) == 1 then
    if A2_3.firstpage_screen_num == 2 and RandI(1, 2) == 1 then
      A0_1[A1_2].R = L0_0.root.movie[RandI(1, #L0_0.root.movie)]
    else
      A0_1[A1_2].L = L0_0.root.movie[RandI(1, #L0_0.root.movie)]
    end
  end
  if A1_2 ~= 1 then
    if RandI(1, 5) == 1 and A0_1[A1_2].R ~= nil then
      for _FORV_8_ = 1, A1_2 - 1 do
        if A0_1[_FORV_8_].R ~= nil and A0_1[_FORV_8_].R ~= "*" then
          A0_1.R = "*"
          break
        end
      end
    end
    if RandI(1, 5) == 1 and A0_1[A1_2].R ~= "*" then
      A0_1[A1_2].L = "*"
    end
    if RandI(1, 5) == 1 and A0_1[A1_2].L ~= "*" then
      A0_1[A1_2].T = "*"
    end
  end
end
function L0_0.root.Execute(A0_4, A1_5)
  local L2_6, L3_7, L4_8, L5_9, L6_10, L7_11
  L2_6 = A0_4.manual_setting
  if L2_6 then
    L2_6 = HUD
    L3_7 = L2_6
    L2_6 = L2_6.info
    L2_6(L3_7, L4_8)
  else
    L2_6 = {}
    TextParam = L2_6
    L2_6 = dbgCommon
    L2_6 = L2_6.get_param
    L3_7 = TextParam
    L2_6(L3_7, L4_8)
    L2_6 = {}
    L3_7 = TextParam
    L3_7 = L3_7.page_num
    L3_7 = L3_7 or 1
    for L7_11 = 1, L3_7 do
      L2_6[L7_11] = {}
      A0_4.Generate(L2_6, L7_11, TextParam)
    end
    if L4_8 ~= nil then
      for L7_11 = 1, #L5_9 do
        Font:openTextSet(A0_4.text[L7_11])
      end
    end
    L4_8()
    if L4_8 == "none" then
      L7_11 = TextParam
      L7_11 = L7_11.is_telop
      L4_8(L5_9, L6_10, L7_11, TextParam.time)
    else
      L7_11 = TextParam
      L7_11 = L7_11.is_telop
      L4_8(L5_9, L6_10, L7_11, TextParam.time)
    end
    L4_8()
    if L4_8 ~= nil then
      for L7_11 = 1, #L5_9 do
        Font:closeTextSet(A0_4.text[L7_11])
      end
    end
    A0_4.text = nil
  end
end
function test_infomation()
  Font:openTextSet("common")
  Font:openTextSet("eps05")
  dbgCommon.TreeExecute(L0_0.root)
end
function test_infomation_direct()
  HUD:info("ep02_info_06", true, 5)
end
