dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2
  L0_2 = {
    {
      npc_name = "sm07_hundred_legs_01",
      motion_tbl = {
        "talk_00",
        "talk_01",
        "talk_03"
      }
    },
    {
      npc_name = "sm07_hundred_legs_02",
      motion_tbl = {
        "talk_00",
        "talk_01",
        "talk_03"
      }
    },
    {
      npc_name = "sm07_hundred_legs_03",
      motion_tbl = {
        "talk_00",
        "talk_01",
        "talk_03"
      }
    },
    {
      npc_name = "sm07_hundred_legs_04",
      motion_tbl = {
        "talk_00",
        "talk_01",
        "talk_03"
      }
    }
  }
  for _FORV_4_, _FORV_5_ in ipairs(L0_2) do
    Fn_waitStartedNpc(_FORV_5_.npc_name)
    Fn_playMotionNpc(_FORV_5_.npc_name, _FORV_5_.motion_tbl, false, {isRandom = true, isRepeat = true})
  end
  GameDatabase:set(ggd.EventFlags__sm07__flag01, 1)
end
function Finalize()
  local L0_3
  L0_3 = {
    "sm07_hundred_legs_01",
    "sm07_hundred_legs_02",
    "sm07_hundred_legs_03",
    "sm07_hundred_legs_04"
  }
  Fn_finalizeNpcKill("sm07", L0_3)
end
