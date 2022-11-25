dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm10_client"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm10_dove"
  L0_2(L1_3)
  L0_2 = {}
  L0_2.mot = "gull01_idle_ep10_00"
  L1_3 = {
    {
      npc_name = "sm10_client",
      motion_tbl = {
        "idle_ep10_00"
      }
    },
    {
      npc_name = "sm10_dove",
      motion_tbl = L0_2.mot
    }
  }
  Fn_loadNpcEventMotion("sm10_dove", L0_2)
  Fn_findNpc("sm10_client"):setPilots({
    {
      pilot = Fn_findNpcPuppet("sm10_dove"),
      attach = "loc_head"
    }
  })
  for _FORV_5_, _FORV_6_ in ipairs(L1_3) do
    Fn_playMotionNpc(_FORV_6_.npc_name, _FORV_6_.motion_tbl, false, {isRandom = true, isRepeat = true})
  end
  GameDatabase:set(ggd.EventFlags__sm10__flag01, 1)
end
function Finalize()
  local L0_4
  L0_4 = {
    "sm10_client",
    "sm10_dove"
  }
  Fn_finalizeNpcKill("sm10", L0_4)
end
