dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm13_client"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm13_bird_sdemo"
  L0_2(L1_3)
  L0_2 = {}
  L0_2.mot = "gull01_idle_ep13_00"
  L1_3 = Fn_loadNpcEventMotion
  L1_3("sm13_bird_sdemo", L0_2)
  L1_3 = {
    {
      npc_name = "sm13_client",
      motion_tbl = {
        "idle_ep13_00"
      }
    },
    {
      npc_name = "sm13_bird_sdemo",
      motion_tbl = L0_2.mot
    }
  }
  Fn_findNpc("sm13_client"):setPilots({
    {
      pilot = Fn_findNpcPuppet("sm13_bird_sdemo"),
      attach = "loc_head"
    }
  })
  for _FORV_5_, _FORV_6_ in ipairs(L1_3) do
    Fn_playMotionNpc(_FORV_6_.npc_name, _FORV_6_.motion_tbl, false, {isRandom = true, isRepeat = true})
  end
  GameDatabase:set(ggd.EventFlags__sm13__flag01, 1)
end
function Finalize()
  local L0_4
  L0_4 = {
    "sm13_client",
    "sm13_bird_sdemo"
  }
  Fn_finalizeNpcKill("sm13", L0_4)
end
