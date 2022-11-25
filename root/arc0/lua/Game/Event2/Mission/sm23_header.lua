dofile("/Game/Event2/Common/HeaderCommon.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm23_client"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm23_bird_sdemo"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm23_second_son"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm23_second_son_bird"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm23_third_son"
  L0_2(L1_3)
  L0_2 = Fn_waitStartedNpc
  L1_3 = "sm23_third_son_bird"
  L0_2(L1_3)
  L0_2 = {}
  L0_2.mot = "gull01_idle_ep23_00"
  L1_3 = Fn_loadNpcEventMotion
  L2_4 = "sm23_bird_sdemo"
  L1_3(L2_4, L0_2)
  L1_3 = {}
  L1_3.mot = "chi01_cheer_00"
  L2_4 = Fn_loadNpcEventMotion
  L2_4("sm23_third_son", L1_3)
  L2_4 = {
    {
      npc_name = "sm23_client",
      motion_tbl = {
        "idle_ep23_00"
      }
    },
    {
      npc_name = "sm23_bird_sdemo",
      motion_tbl = L0_2.mot
    },
    {
      npc_name = "sm23_second_son",
      motion_tbl = {
        "idle_ep13_00"
      }
    },
    {
      npc_name = "sm23_second_son_bird",
      motion_tbl = {"quack_00"}
    },
    {
      npc_name = "sm23_third_son",
      motion_tbl = L1_3.mot
    },
    {
      npc_name = "sm23_third_son_bird",
      motion_tbl = {"quack_00"}
    }
  }
  Fn_findNpc("sm23_client"):setPilots({
    {
      pilot = Fn_findNpcPuppet("sm23_bird_sdemo"),
      attach = "loc_r_hand"
    }
  })
  for _FORV_6_, _FORV_7_ in ipairs(L2_4) do
    Fn_playMotionNpc(_FORV_7_.npc_name, _FORV_7_.motion_tbl, false, {isRandom = true, isRepeat = true})
  end
  GameDatabase:set(ggd.EventFlags__sm23__flag01, 1)
end
function Finalize()
  local L0_5
  L0_5 = {
    "sm23_client",
    "sm23_bird_sdemo",
    "sm23_second_son",
    "sm23_second_son_bird",
    "sm23_third_son",
    "sm23_third_son_bird"
  }
  Fn_finalizeNpcKill("sm23", L0_5)
end
