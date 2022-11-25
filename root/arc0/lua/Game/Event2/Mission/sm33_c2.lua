dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Misc/pdemo.lua")
dofile("/Game/Event2/Mission/mv_common.lua")
dofile("/Game/Event2/Mission/sm33_common.lua")
_puppet_tbl = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "sm33_girl_01",
      type = "wom39",
      node = "locator2_girl_01_korue_01",
      active = true
    },
    {
      name = "sm33_girl_02",
      type = "wom40",
      node = "locator2_girl_02_korue_01",
      active = true
    },
    {
      name = "sm33_girl_03",
      type = "wom38",
      node = "locator2_girl_03_start",
      active = true
    },
    {
      name = "sm33_girl_04",
      type = "wom38",
      node = "locator2_girl_04",
      active = false
    },
    {
      name = "sm33_eqo_01",
      type = "eqo01",
      node = "locator2_eqo_01",
      active = false
    }
  }
  Fn_setupNpc(L0_0)
  for _FORV_4_, _FORV_5_ in pairs(L0_0) do
    _puppet_tbl[_FORV_5_.name] = Fn_findNpcPuppet(_FORV_5_.name)
  end
  _sdemo_cut01 = SDemo.create("sm33_c2_cut01")
  _sdemo_cut01:setCameraParam(nil, 0.1, nil)
  _sdemo_cut02 = SDemo.create("sm33_c2_cut02")
  _sdemo_cut02:setCameraParam(nil, 0.1, nil)
  _pdemo = PDemo.create("sm33_a_c01", Fn_findAreaHandle("ed_a_root"), {camera = true, scene_param = false})
end
function Ingame()
  local L0_1, L1_2, L2_3, L3_4, L4_5, L5_6, L6_7, L7_8, L8_9, L9_10, L10_11, L11_12, L12_13, L13_14, L14_15, L15_16, L16_17
  L0_1 = Fn_setCostume
  L0_1(L1_2)
  L0_1 = Fn_disableCostumeChange
  L0_1(L1_2)
  L0_1 = {}
  L0_1.pray_in_00 = "wom01_pray_sm33_in_00"
  L0_1.pray_00 = "wom01_pray_sm33_00"
  L0_1.pray_01 = "wom01_pray_sm33_01"
  L0_1.pray_out_00 = "wom01_pray_sm33_out_00"
  for L4_5 = 1, 4 do
    L5_6 = Fn_loadNpcEventMotion
    L6_7 = "sm33_girl_"
    L7_8 = string
    L7_8 = L7_8.format
    L7_8 = L7_8(L8_9, L9_10)
    L6_7 = L6_7 .. L7_8
    L7_8 = L0_1
    L5_6(L6_7, L7_8)
  end
  L1_2.label01 = "kit01_pray_in_00"
  L1_2.label02 = "kit01_pray_00"
  L1_2.label04 = "kit01_surprise_00"
  L1_2.label05 = "kit01_greeting_00"
  L1_2.label06 = "kit01_stay_00"
  L2_3(L3_4)
  L2_3(L3_4, L4_5)
  for L5_6 = 1, 3 do
    L6_7 = Fn_watchNpc
    L7_8 = "sm33_girl_"
    L7_8 = L7_8 .. L8_9
    L6_7(L7_8, L8_9)
  end
  L2_3(L3_4, L4_5)
  L2_3(L3_4, L4_5)
  L2_3()
  L5_6 = Camera
  L5_6 = L5_6.kControl_All
  L6_7 = false
  L2_3(L3_4, L4_5, L5_6, L6_7)
  L2_3()
  L5_6 = 0
  L5_6 = "locator2_korue_camera_01"
  L6_7 = _puppet_tbl
  L6_7 = L6_7.sm33_girl_03
  L7_8 = L6_7
  L6_7 = L6_7.getWorldPos
  L6_7 = L6_7(L7_8)
  L6_7 = L6_7 + L2_3
  L7_8 = true
  L3_4(L4_5, L5_6, L6_7, L7_8)
  L3_4()
  L3_4(L4_5)
  L3_4(L4_5)
  L5_6 = "talk_03"
  L6_7 = false
  L3_4(L4_5, L5_6, L6_7)
  L3_4(L4_5)
  L5_6 = "w19_916a"
  L3_4(L4_5, L5_6)
  L3_4(L4_5)
  L3_4(L4_5)
  L5_6 = "stay"
  L6_7 = false
  L3_4(L4_5, L5_6, L6_7)
  L3_4(L4_5)
  L5_6 = "locator2_korue_camera_01"
  L3_4(L4_5, L5_6)
  L3_4(L4_5)
  L3_4(L4_5)
  L3_4(L4_5)
  L5_6 = nil
  L6_7 = true
  while true do
    if L3_4 <= 4 then
      L7_8 = 0
      L11_12.NONE = 0
      L11_12.KORUE = 1
      L11_12.KOERU = 2
      L11_12.RUEKO = 3
      L11_12.RUKOE = 4
      L11_12.ERUKO = 5
      L11_12.EKORU = 6
      if L3_4 == 0 then
        L7_8 = 1.6
        L14_15.id = "sm33_02017"
        L14_15.func = L15_16
        L13_14.RR = L14_15
        L14_15.id = "sm33_02018"
        L14_15.func = L15_16
        L13_14.RD = L14_15
      elseif L3_4 == 1 then
        L7_8 = 1.4
        L14_15.id = "sm33_02019"
        L14_15.func = L15_16
        L13_14.RR = L14_15
        L14_15.id = "sm33_02017"
        L14_15.func = L15_16
        L13_14.RD = L14_15
      elseif L3_4 == 2 then
        L7_8 = 1.2
        L14_15.id = "sm33_02020"
        L14_15.func = L15_16
        L13_14.RR = L14_15
        L14_15.id = "sm33_02021"
        L14_15.func = L15_16
        L13_14.RD = L14_15
        L14_15.id = "sm33_02017"
        L14_15.func = L15_16
        L13_14.RU = L14_15
      elseif L3_4 == 3 then
        L7_8 = 1
        L14_15.id = "sm33_02022"
        L14_15.func = L15_16
        L13_14.RR = L14_15
        L14_15.id = "sm33_02023"
        L14_15.func = L15_16
        L13_14.RD = L14_15
        L14_15.id = "sm33_02024"
        L14_15.func = L15_16
        L13_14.RU = L14_15
        L14_15.id = "sm33_02017"
        L14_15.func = L15_16
        L13_14.RL = L14_15
      elseif L3_4 == 4 then
        L7_8 = 0.8
        L14_15.id = "sm33_02025"
        L14_15.func = L15_16
        L13_14.RR = L14_15
        L14_15.id = "sm33_02017"
        L14_15.func = L15_16
        L13_14.RD = L14_15
        L14_15.id = "sm33_02026"
        L14_15.func = L15_16
        L13_14.RU = L14_15
        L14_15.id = "sm33_02027"
        L14_15.func = L15_16
        L13_14.RL = L14_15
      end
      L16_17 = {
        {
          pos = _puppet_tbl.sm33_girl_03:getWorldPos() + L2_3,
          time = L4_5
        }
      }
      L13_14(L14_15, L15_16, L16_17)
      if L6_7 then
        L13_14(L14_15)
      else
        L13_14(L14_15)
      end
      L13_14(L14_15, L15_16)
      if L6_7 == false then
        L13_14(L14_15)
      end
      L13_14(L14_15, L15_16)
      if L6_7 then
        L13_14(L14_15)
      end
      L13_14(L14_15)
      L16_17 = {
        {
          pos = _puppet_tbl.sm33_girl_02:getWorldPos() + L2_3,
          time = L4_5
        }
      }
      L13_14(L14_15, L15_16, L16_17)
      L13_14(L14_15)
      L13_14(L14_15, L15_16)
      if L6_7 == false then
        L13_14(L14_15)
      end
      L13_14(L14_15, L15_16)
      if L6_7 then
        L13_14(L14_15)
      end
      L13_14(L14_15)
      L16_17 = {
        {
          pos = _puppet_tbl.sm33_girl_01:getWorldPos() + L2_3,
          time = L4_5
        }
      }
      L13_14(L14_15, L15_16, L16_17)
      L13_14(L14_15)
      L13_14(L14_15, L15_16)
      if L6_7 == false then
        L13_14(L14_15)
      end
      L13_14(L14_15, L15_16)
      if L3_4 == 3 then
        L13_14(L14_15)
        L16_17 = {
          {
            pos = _puppet_tbl.sm33_girl_04:getWorldPos() + L2_3,
            time = L4_5
          }
        }
        L13_14(L14_15, L15_16, L16_17)
        L13_14(L14_15)
        L13_14(L14_15, L15_16)
        L13_14(L14_15, L15_16)
      end
      if L6_7 then
        L13_14(L14_15)
        L6_7 = false
      end
      L14_15.pos = L15_16
      L14_15.time = L4_5
      L5_6 = L13_14
      L16_17 = L5_6
      L13_14(L14_15, L15_16, L16_17)
      L13_14(L14_15)
      L13_14(L14_15)
      while true do
        if L13_14 == 0 then
          L16_17 = "\230\153\130\233\150\147\229\136\135\227\130\140\227\129\190\227\129\167 %d"
          L13_14(L14_15, L15_16, L16_17, L9_10)
        end
        if L12_13 == L13_14 and not (L9_10 <= 0) then
          L13_14()
        end
      end
      L13_14()
      if L12_13 == L13_14 then
        L13_14(L14_15, L15_16)
        L13_14(L14_15, L15_16)
        L13_14(L14_15, L15_16)
        L13_14(L14_15)
        if L3_4 == 3 then
          for L16_17 = 1, 3 do
            Fn_warpNpc(string.format("sm33_girl_%02d", L16_17), string.format("locator2_girl_%02d_korue_02", L16_17))
            Fn_playNpcEventMotion(string.format("sm33_girl_%02d", L16_17), L0_1.pray_00, true, 0, false)
          end
        elseif L3_4 == 4 then
          for L16_17 = 1, 3 do
            Fn_setNpcActive("sm33_girl_04")
            Fn_warpNpc(string.format("sm33_girl_%02d", L16_17), string.format("locator2_girl_%02d_korue_03", L16_17))
            Fn_playNpcEventMotion(string.format("sm33_girl_%02d", L16_17), L0_1.pray_00, true, 0, false)
          end
        end
      else
        if L12_13 == L13_14 then
          L13_14(L14_15, L15_16)
          L13_14(L14_15, L15_16)
        elseif L12_13 == L13_14 then
          L13_14(L14_15, L15_16)
          L13_14(L14_15, L15_16)
        elseif L12_13 == L13_14 then
          L13_14(L14_15, L15_16)
          L13_14(L14_15, L15_16)
        elseif L12_13 == L13_14 then
          L13_14(L14_15, L15_16)
          L13_14(L14_15, L15_16)
        elseif L12_13 == L13_14 then
          L13_14(L14_15, L15_16)
          L13_14(L14_15, L15_16)
        end
        L13_14(L14_15, L15_16)
        L13_14(L14_15)
        L13_14(L14_15)
        L16_17 = 0.4
        L13_14(L14_15, L15_16, L16_17)
        L13_14(L14_15)
        L6_7 = true
        L13_14()
        L13_14(L14_15, L15_16)
        L13_14(L14_15)
        for L16_17 = 1, 3 do
          Fn_warpNpc(string.format("sm33_girl_%02d", L16_17), string.format("locator2_girl_%02d_korue_01", L16_17))
        end
        L13_14(L14_15)
        L13_14(L14_15)
        L16_17 = _puppet_tbl
        L16_17 = L16_17.sm33_girl_03
        L16_17 = L16_17.getWorldPos
        L16_17 = L16_17(L16_17)
        L16_17 = L16_17 + L2_3
        L13_14(L14_15, L15_16, L16_17, true)
        L13_14(L14_15)
        L13_14()
      end
      L13_14()
    end
  end
  L7_8 = Fn_disappearNpc
  L7_8(L8_9)
  L7_8 = Fn_watchNpc
  L7_8(L8_9, L9_10)
  L7_8 = Fn_watchNpc
  L7_8(L8_9, L9_10)
  L7_8 = Fn_setNpcActive
  L7_8(L8_9, L9_10)
  L7_8 = Fn_setNpcActive
  L7_8(L8_9, L9_10)
  L7_8 = Fn_playMotionNpc
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = _sdemo_cut01
  L7_8 = L7_8.play
  L11_12.pos = L12_13
  L11_12.time = L4_5
  L7_8(L8_9, L9_10, L10_11)
  L7_8 = 0.25
  L8_9(L9_10)
  L8_9(L9_10, L10_11, L11_12)
  L8_9(L9_10)
  L8_9(L9_10, L10_11)
  L8_9(L9_10)
  L8_9(L9_10)
  L8_9(L9_10)
  for L11_12 = 1, 3 do
    L12_13(L13_14)
    break
  end
  L10_11.pos = "locator2_korue_leave_camera_01"
  L10_11.time = L8_9
  L10_11(L11_12, L12_13, L13_14)
  L10_11(L11_12, L12_13, L13_14)
  L10_11(L11_12)
  L10_11(L11_12)
  L10_11(L11_12)
  for L13_14 = 1, 3 do
    L14_15(L15_16)
    break
  end
  L10_11(L11_12)
  L10_11(L11_12, L12_13, L13_14, L14_15)
  L10_11(L11_12)
  L16_17 = "locator2_newt_club_01d"
  L16_17 = L14_15(L15_16)
  L10_11(L11_12, L12_13, L13_14, L14_15, L15_16, L16_17, L14_15(L15_16))
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13, L13_14)
  for L14_15 = 1, 3 do
    L16_17 = RandF
    L16_17 = L16_17(0, 0.2)
    L15_16(L16_17, L16_17(0, 0.2))
    L16_17 = string
    L16_17 = L16_17.format
    L16_17 = L16_17("sm33_girl_%02d", L14_15)
    L15_16(L16_17, L10_11)
  end
  L11_12(L12_13)
  L16_17 = "Node"
  L16_17 = L15_16
  L16_17 = L15_16(L16_17)
  L11_12(L12_13, L13_14, L14_15, L15_16, L16_17, L15_16(L16_17))
  L11_12(L12_13)
  L11_12(L12_13, L13_14, L14_15, L15_16)
  L11_12(L12_13)
  L11_12(L12_13, L13_14, L14_15, L15_16)
  for L14_15 = 1, 3 do
    L16_17 = "sm33_girl_"
    L16_17 = L16_17 .. string.format("%02d", L14_15)
    L15_16(L16_17)
  end
  L11_12(L12_13)
  L11_12(L12_13)
  L11_12(L12_13)
  L12_13(L13_14, L14_15, L15_16)
  L12_13(L13_14)
  L12_13(L13_14)
  L12_13(L13_14)
  repeat
    L12_13()
  until L12_13 >= 150
  L12_13(L13_14)
  repeat
    L12_13()
  until L12_13 >= 240
  L12_13(L13_14)
  repeat
    L12_13()
  until L12_13 >= 310
  L12_13(L13_14)
  L12_13(L13_14)
  repeat
    L12_13()
  until L12_13
  L12_13(L13_14, L14_15)
  L12_13(L13_14)
  L12_13()
  L12_13()
  L12_13()
  L12_13()
end
function Finalize()
  Fn_setKittenAndCatActive(true)
  Fn_disableCostumeChange(false)
end
