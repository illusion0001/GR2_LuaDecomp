dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
dofile("/Game/Misc/sdemo.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4, L3_5, L4_6, L5_7, L6_8
  L0_2 = Fn_userCtrlOff
  L0_2()
  L0_2 = GameDatabase
  L0_2 = L0_2.get
  L0_2 = L0_2(L1_3, L2_4)
  if L0_2 ~= 1 then
    L0_2 = {
      L1_3,
      L2_4,
      L3_5,
      L4_6
    }
    L1_3.npc_name = "sm07_hundred_legs_01"
    L4_6 = "talk_01"
    L5_7 = "talk_03"
    L1_3.motion_tbl = L2_4
    L2_4.npc_name = "sm07_hundred_legs_02"
    L4_6 = "talk_00"
    L5_7 = "talk_01"
    L6_8 = "talk_03"
    L2_4.motion_tbl = L3_5
    L3_5.npc_name = "sm07_hundred_legs_03"
    L4_6 = {
      L5_7,
      L6_8,
      "talk_03"
    }
    L5_7 = "talk_00"
    L6_8 = "talk_01"
    L3_5.motion_tbl = L4_6
    L4_6 = {}
    L4_6.npc_name = "sm07_hundred_legs_04"
    L5_7 = {
      L6_8,
      "talk_01",
      "talk_03"
    }
    L6_8 = "talk_00"
    L4_6.motion_tbl = L5_7
    for L4_6, L5_7 in L1_3(L2_4) do
      L6_8 = Fn_findNpc
      L6_8 = L6_8(L5_7.npc_name)
      while L6_8 == nil do
        wait(2)
        L6_8 = Fn_findNpc(L5_7.npc_name)
      end
      while L6_8:isStarted() == false or L6_8:isReadyNpc() == false do
        wait()
      end
      Fn_playMotionNpc(L5_7.npc_name, L5_7.motion_tbl, false, {isRandom = true, isRepeat = true})
    end
    L4_6 = 1
    L1_3(L2_4, L3_5, L4_6)
  end
  L0_2 = Fn_missionStart
  L0_2()
  L0_2 = Fn_kaiwaDemoView
  L0_2(L1_3)
  L0_2 = Fn_blackout
  L0_2()
  L0_2 = Fn_playMotionNpc
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Fn_playMotionNpc
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Fn_playMotionNpc
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Fn_playMotionNpc
  L0_2(L1_3, L2_4, L3_5)
  L0_2 = Fn_setNextMissionFlag
  L0_2()
  L0_2 = Fn_nextMission
  L0_2()
  L0_2 = Fn_exitSandbox
  L0_2()
end
function Finalize()
  local L0_9, L1_10
end
