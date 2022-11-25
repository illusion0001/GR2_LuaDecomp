dofile("/Game/Event2/Common/HeaderCommon.lua")
_ve_a_warp_task = nil
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  local L0_2, L1_3, L2_4
  L0_2 = Fn_loadEventData
  L1_3 = "evx/sm47_setup"
  L2_4 = {
    "evarea2_up_a_05"
  }
  L0_2(L1_3, L2_4, true)
  L0_2 = createGameObject2
  L1_3 = "Area"
  L0_2 = L0_2(L1_3)
  L2_4 = L0_2
  L1_3 = L0_2.setName
  L1_3(L2_4, "ve_a")
  L2_4 = L0_2
  L1_3 = L0_2.try_init
  L1_3(L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.waitForReady
  L1_3(L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.try_start
  L1_3(L2_4)
  L2_4 = L0_2
  L1_3 = L0_2.setWorldTransform
  L1_3(L2_4, findGameObject2("Node", "locator2_ve_a"):getWorldTransform())
  L2_4 = L0_2
  L1_3 = L0_2.setActive
  L1_3(L2_4, true)
  L1_3 = {}
  L2_4 = {}
  L2_4.rand = 1
  L2_4.sign = 1
  L2_4.max_a = 1
  L2_4.min_a = 0.5
  L2_4.max_t = 50
  L2_4.min_t = 40
  L1_3.xz = L2_4
  L2_4 = {}
  L2_4.rand = 0.5
  L2_4.sign = 1
  L2_4.max_a = 0.2
  L2_4.min_a = 0.1
  L2_4.max_t = 5
  L2_4.min_t = 3
  L1_3.y = L2_4
  L2_4 = {}
  L2_4.rand = 1
  L2_4.sign = 1
  L2_4.max_a = 10
  L2_4.min_a = 5
  L2_4.max_t = 60
  L2_4.min_t = 50
  L1_3.angle = L2_4
  L2_4 = L0_2.setDriftParams
  L2_4(L0_2, L1_3)
  L2_4 = start_game_obj
  L2_4()
  L2_4 = Fn_waitStartedNpc
  L2_4("sm47_client")
  L2_4 = Fn_waitStartedNpc
  L2_4("sm47_mad_01")
  L2_4 = {
    {
      name = "sm47_client",
      motion_tbl = {"talk_00"}
    },
    {
      name = "sm47_mad_01",
      motion_tbl = {
        "talk_03",
        "talk_00",
        "stay"
      }
    }
  }
  Fn_setupNpc(L2_4)
  for _FORV_6_, _FORV_7_ in pairs(L2_4) do
    Fn_playMotionNpc(_FORV_7_.name, _FORV_7_.motion_tbl, false, {
      isRandom = true,
      isRepeat = true,
      animBlendDuration = 1.5
    })
  end
  _ve_a_warp_task = invokeTask(function()
    local L0_5, L1_6, L2_7
    L0_5 = false
    L1_6 = Fn_getGameObject
    L2_7 = "bgManager"
    L1_6 = L1_6(L2_7)
    if not L1_6 then
      L2_7 = nil
      return L2_7
    end
    L2_7 = nil
    repeat
      L2_7 = L1_6:sendEvent("getBgsetHandle")
      wait()
    until L2_7 ~= nil
    while true do
      if HUD:faderAlpha() >= 1 then
        if L2_7:sendEvent("isConnectingFinish") then
          if L0_5 then
            print("sm47_header ve_a\227\129\174\229\134\141\233\133\141\231\189\174\227\130\146\232\161\140\227\129\132\227\129\190\227\129\153")
            if findGameObject2("Node", "locator2_ve_a") then
              L0_2:setWorldTransform(findGameObject2("Node", "locator2_ve_a"):getWorldTransform())
              L0_2:setForceMove()
              L0_5 = false
            end
          end
        else
          L0_5 = true
        end
      end
      wait()
    end
  end)
end
function Finalize()
  local L0_8
  L0_8 = _ve_a_warp_task
  if L0_8 then
    L0_8 = _ve_a_warp_task
    L0_8 = L0_8.isRunning
    L0_8 = L0_8(L0_8)
    if L0_8 then
      L0_8 = _ve_a_warp_task
      L0_8 = L0_8.abort
      L0_8(L0_8)
    end
  end
  L0_8 = {
    "sm47_client",
    "sm47_mad_01"
  }
  Fn_finalizeNpcKill("sm47", L0_8)
end
