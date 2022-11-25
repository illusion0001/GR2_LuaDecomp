import("Debug")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CraneShipCommon.lua")
puppets = {}
puppet_task = {}
_sm28_area_03_navi = false
_sm28_area_03_caption = false
_sm28_area_05 = false
_sm28_area_05_out = false
_sm28_area_05_navi = false
_sm28_haze_eff = {}
_sm28_not_found_bed_timer = 0
_sm28_change_end_time = 3600
_sm28_skip_bed_event_falg = false
_sm28_sdemo = nil
_sm28_obj_talk = {
  "sm28_00311k",
  "sm28_00312k",
  "sm28_00313k",
  "sm28_00314k",
  "sm28_00315k",
  "sm28_00316k"
}
_sm28_obj_checked = {}
_sm28_last_obj = nil
_zoom_rate = nil
function Initialize()
  puppets.man73 = Fn_findNpcPuppet("man73")
  Fn_setNpcActive("man73", false)
  _sm28_sdemo = SDemo.create("sm28_sdemo")
  Fn_findAreaHandle("wa_a_04"):setExpandedAabb(true)
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13
  L0_0(L1_1)
  L0_0()
  L0_0()
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0()
  L0_0(L1_1, L2_2)
  L1_1(L2_2)
  L1_1(L2_2, L3_3)
  L2_2(L3_3, L4_4)
  L2_2(L3_3)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  L0_0(L1_1)
  _sm28_obj_checked = L0_0
  for L3_3 = 1, #L1_1 do
    L4_4[L3_3] = L5_5
    if L3_3 ~= 2 then
      L4_4(L5_5, L6_6)
    end
  end
  while not L1_1 do
    while true do
      if L3_3 then
        _sm28_skip_bed_event_falg = true
      end
      L8_8 = "%02d"
      L8_8 = string
      L8_8 = L8_8.format
      L8_8 = L8_8(L9_9, L10_10)
      if L3_3 ~= nil and L4_4 ~= nil then
        if not L5_5 then
          if not L5_5 then
            if L5_5 then
              if L5_5 then
                if L2_2 == 3 then
                  L5_5()
                  L5_5(L6_6, L7_7)
                end
                L8_8 = 0.1
                L5_5(L6_6, L7_7, L8_8)
                if L5_5 then
                  L8_8 = "kit030b"
                  L5_5(L6_6, L7_7)
                  L5_5(L6_6)
                else
                  L8_8 = "kit037a"
                  L5_5(L6_6, L7_7)
                  L5_5(L6_6)
                end
                if L2_2 == 3 then
                  break
                end
                L5_5(L6_6)
              end
            end
          end
      end
      elseif L5_5 then
        L5_5(L6_6)
      end
    end
    L8_8 = true
    L3_3(L4_4)
    if not L3_3 then
      L3_3()
    end
  end
  for L5_5 = 1, #L3_3 do
    if L6_6 then
      L8_8 = L5_5
      L6_6(L7_7, L8_8)
    end
  end
  L2_2(L3_3)
  L0_0()
  L0_0()
  if L0_0 == false then
    L0_0(L1_1)
    L0_0(L1_1, L2_2, L3_3, L4_4)
    L0_0(L1_1)
    while true do
      if L0_0 then
        L0_0()
      end
    end
    L0_0()
    L0_0(L1_1)
    if not L0_0 then
      L0_0(L1_1)
    else
      L0_0(L1_1)
    end
    L0_0(L1_1, L2_2)
    L0_0(L1_1, L2_2)
    L0_0(L1_1, L2_2)
    L0_0()
    L0_0(L1_1)
    L0_0(L1_1)
    _sm28_area_05_navi = false
    while true do
      if L0_0 ~= nil then
        L1_1(L2_2)
      end
      L5_5.near = 1
      L5_5.far = 8
      L6_6.left = -1
      L6_6.right = 1
      L6_6.top = -1
      L6_6.bottom = 1
      L13_13 = L3_3(L4_4, L5_5)
      L1_1(L2_2, L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L3_3(L4_4, L5_5))
      L1_1(L2_2)
      L1_1(L2_2, L3_3)
      while true do
        if L2_2 then
          if L2_2 then
            _zoom_rate = L2_2
          end
          if not L2_2 then
            if L2_2 then
              L2_2(L3_3)
              L13_13 = L3_3(L4_4, L5_5)
              L2_2(L3_3, L4_4, L5_5, L6_6, L7_7, L8_8, L9_9, L10_10, L11_11, L12_12, L13_13, L3_3(L4_4, L5_5))
              _sm28_area_05_navi = true
            end
          elseif L2_2 then
            L2_2()
            _sm28_area_05_navi = false
          end
          if L2_2 then
            break
          end
        end
        L8_8 = true
        L2_2(L3_3)
        L2_2()
      end
      if L1_1 then
        L2_2()
        L2_2(L3_3, L4_4)
        L2_2(L3_3, L4_4)
        L2_2(L3_3)
        L2_2(L3_3)
        L3_3(L4_4, L5_5)
        L2_2(L3_3, L4_4)
        L2_2(L3_3)
        L2_2()
        L3_3(L4_4, L5_5)
        if L3_3 ~= nil then
          L8_8 = L4_4
          L6_6(L7_7, L8_8, L9_9)
          L6_6(L7_7)
        end
        L2_2(L3_3)
        L2_2(L3_3, L4_4)
        L2_2()
        L2_2()
        L2_2(L3_3)
      else
        if L2_2 ~= nil then
          if L5_5 == "number" then
            L5_5(L6_6)
          elseif L5_5 == "table" then
            for L8_8 = 1, #L2_2 do
              L12_12 = L11_11
              L13_13 = L11_11(L12_12)
              L9_9(L10_10, L11_11, L12_12, L13_13, L11_11(L12_12))
              for L12_12, L13_13 in L9_9(L10_10) do
                print(L12_12, L13_13)
              end
              if L10_10 == L11_11 then
                if L10_10 ~= nil then
                  L12_12 = L11_11
                end
              end
              if L10_10 ~= L11_11 and L9_9 == false then
                break
              end
            end
          end
        end
        if L3_3 then
          L5_5()
          L5_5(L6_6)
          break
        end
        L5_5(L6_6, L7_7)
        L5_5(L6_6)
        if L4_4 == L5_5 then
          L8_8 = "kit_823"
          L5_5(L6_6, L7_7)
          L5_5(L6_6)
        elseif L4_4 == L5_5 then
          L8_8 = "kit_822"
          L5_5(L6_6, L7_7)
          L5_5(L6_6)
        else
          L8_8 = "kit_824"
          L5_5(L6_6, L7_7)
          L5_5(L6_6)
        end
      end
    end
    L1_1()
    L1_1()
    L1_1(L2_2)
    L1_1(L2_2)
    L1_1()
  end
  if L0_0 then
    L1_1(L2_2)
    while true do
      if L1_1 < 10 then
        L1_1()
      end
    end
    L1_1(L2_2)
  else
    L1_1(L2_2, L3_3)
    L2_2(L3_3, L4_4)
  end
  L0_0()
  L0_0()
  L0_0()
  L0_0()
end
function Finalize()
  local L0_14, L1_15
end
function ObjectTalk(A0_16)
  local L1_17
  L1_17 = Fn_sendEventComSb
  L1_17 = L1_17("sm28_checkObjectTalk")
  if L1_17 ~= 0 and (A0_16 == nil or A0_16[L1_17]) and Player:getAction() == Player.kAction_Idle then
    Fn_kaiwaDemoView(_sm28_obj_talk[L1_17])
    Fn_sendEventComSb("sm28_setObjectTalked", L1_17)
  end
end
function ObjectTalk2(A0_18)
  local L1_19
  L1_19 = Fn_sendEventComSb
  L1_19 = L1_19("sm28_checkObjectTalk")
  if L1_19 ~= 0 and (A0_18 == nil or A0_18[L1_19]) and Player:getAction() == Player.kAction_Idle then
    if _sm28_obj_checked[L1_19] then
      Player:playVoice({"kit033a"})
      Fn_captionViewWait("sm28_03031")
    else
      Fn_kaiwaDemoView(_sm28_obj_talk[L1_19])
    end
    _sm28_last_obj = Fn_sendEventComSb("sm28_findGameObject2", "Node", "bg2_obj_" .. string.format("%02d", L1_19))
    if _sm28_not_found_bed_timer >= _sm28_change_end_time then
      _sm28_skip_bed_event_falg = true
    end
    _sm28_not_found_bed_timer = 0
    _sm28_obj_checked[L1_19] = true
    Fn_sendEventComSb("sm28_setObjectTalked", L1_19)
  end
end
function pccubesensor2_camera05_OnEnter()
  local L0_20, L1_21
  _sm28_area_05 = true
end
function pccubesensor2_camera05_OnLeave()
  local L0_22, L1_23
  _sm28_area_05 = false
end
function pccubesensor2_camera05_out_OnEnter()
  local L0_24, L1_25
  _sm28_area_05_out = false
end
function pccubesensor2_camera05_out_OnLeave()
  local L0_26, L1_27
  _sm28_area_05_out = true
end
