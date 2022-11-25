dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
import("Vehicle")
_puppet_tbl = {}
_vehicle_tbl = {}
_sdemo = nil
function Initialize()
  _puppet_tbl.sm07_client = Fn_findNpcPuppet("sm07_client")
  _puppet_tbl.sm07_hundred_legs_01 = Fn_findNpcPuppet("sm07_hundred_legs_01")
  _puppet_tbl.sm07_hundred_legs_02 = Fn_findNpcPuppet("sm07_hundred_legs_02")
  _puppet_tbl.sm07_hundred_legs_03 = Fn_findNpcPuppet("sm07_hundred_legs_03")
  _puppet_tbl.sm07_hundred_legs_04 = Fn_findNpcPuppet("sm07_hundred_legs_04")
  _sdemo = SDemo.create("sm07_sdemo")
end
function Ingame()
  local L0_0, L1_1, L2_2, L3_3, L4_4, L5_5, L6_6, L7_7
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  while true do
    L4_4 = string
    L4_4 = L4_4.format
    L5_5 = "%02d"
    L6_6 = L0_0
    L4_4 = L4_4(L5_5, L6_6)
    if L1_1 ~= nil then
      L4_4 = Vehicle
      L5_5 = L4_4
      L4_4 = L4_4.spawnVehicle
      L6_6 = "TruckPoorM02"
      L7_7 = g_own
      L4_4 = L4_4(L5_5, L6_6, L7_7)
      L5_5 = "sm07_car_"
      L6_6 = string
      L6_6 = L6_6.format
      L7_7 = "%02d"
      L6_6 = L6_6(L7_7, L0_0)
      L5_5 = L5_5 .. L6_6
      L7_7 = L4_4
      L6_6 = L4_4.setName
      L6_6(L7_7, L5_5)
      L7_7 = L4_4
      L6_6 = L4_4.setWorldTransform
      L6_6(L7_7, L2_2, L3_3)
      L7_7 = L4_4
      L6_6 = L4_4.setBaseSpeed
      L6_6(L7_7, 0)
      L7_7 = L4_4
      L6_6 = L4_4.procHorn
      L6_6(L7_7, false)
      L7_7 = L4_4
      L6_6 = L4_4.procFloat
      L6_6(L7_7, true)
      L6_6 = {
        L7_7,
        L2_2 + Vector(0, 0, 1)
      }
      L7_7 = L2_2
      L7_7 = Vehicle
      L7_7 = L7_7.spawnRoute
      L7_7 = L7_7(L7_7, L6_6, g_own)
      L4_4:attach(L7_7)
      _vehicle_tbl[L5_5] = L4_4
    else
      break
    end
  end
  L0_0(L1_1)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0.sm07_hundred_legs_01 = L1_1
  L0_0.sm07_hundred_legs_02 = L1_1
  L0_0.sm07_hundred_legs_03 = L1_1
  L0_0.sm07_hundred_legs_04 = L1_1
  L0_0.sm07_client = L1_1
  L4_4 = "sm07_hundred_legs_01"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "sm07_hundred_legs_02"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "sm07_hundred_legs_03"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "sm07_hundred_legs_04"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L4_4 = "sm07_client"
  L4_4 = true
  L1_1(L2_2, L3_3, L4_4)
  L1_1()
  for L4_4, L5_5 in L1_1(L2_2) do
    L6_6 = L0_0[L4_4]
    L7_7 = L6_6
    L6_6 = L6_6.appendChild
    L6_6(L7_7, Fn_findNpc(L4_4), true)
  end
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  for L3_3, L4_4 in L0_0(L1_1) do
    L5_5 = _vehicle_tbl
    L5_5 = L5_5[L3_3]
    L6_6 = L5_5
    L5_5 = L5_5.try_term
    L5_5(L6_6)
  end
  _vehicle_tbl = L0_0
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L0_0()
  L0_0(L1_1, L2_2)
  L0_0(L1_1, L2_2)
  L4_4 = true
  L0_0(L1_1, L2_2, L3_3, L4_4)
  L0_0()
  L0_0()
  L0_0()
  L0_0()
end
function Finalize()
  _puppet_tbl.sm07_client = nil
  _puppet_tbl.sm07_hundred_legs_01 = nil
  _puppet_tbl.sm07_hundred_legs_02 = nil
  _puppet_tbl.sm07_hundred_legs_03 = nil
  _puppet_tbl.sm07_hundred_legs_04 = nil
  if seHandle then
    Sound:stopSEHandle(seHandle)
    seHandle = nil
  end
end
function playSdemo01()
  local L0_8, L1_9, L2_10, L3_11, L4_12, L5_13, L6_14
  L0_8 = Area
  L0_8 = L0_8.setAnimMoveDriftEnable
  L0_8(L1_9, L2_10, L3_11, L4_12)
  L0_8 = Fn_playMotionNpc
  L0_8(L1_9, L2_10, L3_11)
  L0_8 = Fn_playMotionNpc
  L0_8(L1_9, L2_10, L3_11)
  L0_8 = Fn_playMotionNpc
  L0_8(L1_9, L2_10, L3_11)
  L0_8 = {L1_9, L2_10}
  for L5_13, L6_14 in L2_10(L3_11) do
    Fn_findNpc(L6_14):setSightParam({
      degree_h = 180,
      degree_v = 180,
      in_length = Fn_get_distance(Fn_findNpcPuppet(L6_14):getWorldPos() + Vector(0, 1.5, 0), L1_9:getWorldPos()) + 10,
      out_length = Fn_get_distance(Fn_findNpcPuppet(L6_14):getWorldPos() + Vector(0, 1.5, 0), L1_9:getWorldPos()) + 20,
      valid = true,
      target = L1_9,
      watchTarget = true
    })
  end
  L1_9(L2_10)
  L1_9(L2_10, L3_11, L4_12)
  L1_9(L2_10)
  L1_9()
  L1_9()
  seHandle = L1_9
  L4_12.pos = "locator2_sdemo_01_cam_02"
  L4_12.time = 4
  L4_12.hashfunc = "EaseInOut"
  L1_9(L2_10, L3_11, L4_12)
  while true do
    if L1_9 then
      L1_9()
    end
  end
  L1_9(L2_10)
  L1_9()
  L1_9(L2_10, L3_11)
  seHandle = nil
  L1_9(L2_10, L3_11)
  L1_9(L2_10, L3_11, L4_12)
  L1_9(L2_10, L3_11, L4_12)
  L1_9(L2_10, L3_11, L4_12)
  for L4_12, L5_13 in L1_9(L2_10) do
    L6_14 = Fn_findNpc
    L6_14 = L6_14(L5_13)
    L6_14:resetSightParam()
  end
  if L1_9 == true then
    if L1_9 == true then
      L5_13 = true
      L1_9(L2_10, L3_11, L4_12, L5_13)
    end
  end
end
function playSdemo02()
  Fn_resetPcPos("warppoint2_pc_01")
  _sdemo:reset()
  _sdemo:set("locator2_sdemo_02_cam_01", "locator2_sdemo_02_aim_01")
  _sdemo:play()
  Fn_fadein()
  waitSeconds(1.5)
  _sdemo:stop(3)
  waitSeconds(3)
end
