dofile("/Game/Event2/Common/HeaderCommon.lua")
dofile("/Game/Event2/Mission/rac_common.lua")
_vogo_box_task = nil
function Initialize()
  local L0_0
  L0_0 = {
    "evarea2_id_a_root"
  }
  Fn_loadEventData("evx/sm41_common", L0_0, true)
end
function Ingame()
  _vogo_box_task = vogo_crate_broken_demo()
end
function Finalize()
  local L0_1
  L0_1 = Fn_gestureActionCancel
  L0_1()
  L0_1 = _vogo_box_task
  if L0_1 ~= nil then
    L0_1 = _vogo_box_task
    L0_1 = L0_1.abort
    L0_1(L0_1)
    _vogo_box_task = nil
  end
  L0_1 = {
    "sm41_client"
  }
  Fn_finalizeNpcKill("sm41", L0_1)
end
function vogo_crate_broken_demo()
  local L0_2, L1_3, L2_4
  L0_2 = Fn_findNpc
  L1_3 = "sm41_client"
  L0_2 = L0_2(L1_3)
  L2_4 = L0_2
  L1_3 = L0_2.getPuppet
  L1_3 = L1_3(L2_4)
  L2_4 = 1
  while findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_4)) ~= nil do
    findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_4)):setEventListener("broken", function(A0_5)
      if Fn_get_distance(L1_3:getWorldPos(), Fn_getPcPosRot()) < 20 then
        vogo_box_broken = true
      end
    end)
    L2_4 = L2_4 + 1
  end
  return invokeTask(function()
    local L0_6, L1_7, L2_8
    while true do
      L0_6 = vogo_box_broken
      if L0_6 == true then
        L0_6 = Fn_userCtrlAllOff
        L0_6()
        L0_6 = Player
        L1_7 = L0_6
        L0_6 = L0_6.setStay
        L2_8 = true
        L0_6(L1_7, L2_8)
        L0_6 = false
        L1_7 = invokeTask
        function L2_8()
          Fn_turnNpc(L0_2)
          L0_6 = true
        end
        L1_7(L2_8)
        L1_7 = RAC_LookAtObject
        L2_8 = L1_3
        L1_7 = L1_7(L2_8, 1)
        while L0_6 == false do
          L2_8 = wait
          L2_8()
        end
        L2_8 = Fn_playMotionNpc
        L2_8("sm41_client", "angry_00", false)
        L2_8 = Sound
        L2_8 = L2_8.playSE
        L2_8(L2_8, "vog020a", 1, "", L1_3)
        L2_8 = Fn_captionView
        L2_8("sm41_00135")
        while L1_7 ~= nil do
          L2_8 = L1_7.isRunning
          L2_8 = L2_8(L1_7)
          if L2_8 then
            L2_8 = Fn_isInSightTarget
            L2_8 = L2_8(L1_3, 0.5)
          end
          if not L2_8 then
            L2_8 = wait
            L2_8()
          end
        end
        L2_8 = L1_7.abort
        L2_8(L1_7)
        while true do
          L2_8 = Fn_isCaptionView
          L2_8 = L2_8()
          if L2_8 then
            L2_8 = wait
            L2_8()
          end
        end
        L2_8 = Fn_blackout
        L2_8()
        L2_8 = Fn_resetPcPos
        L2_8(findGameObject2("Node", "locator2_pc_start_pos"))
        L2_8 = Fn_warpNpc
        L2_8(L0_2, "locator2_client_reset")
        L2_8 = Fn_playMotionNpc
        L2_8("sm41_client", "confuse_00", false)
        L2_8 = 1
        while findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_8)) ~= nil do
          findGameObject2("GimmickBg", "bg2_vogo_boxset_02" .. string.format("%02d", L2_8)):requestRestoreForce()
          L2_8 = L2_8 + 1
        end
        waitSeconds(1)
        Player:setStay(false)
        Fn_fadein()
        Fn_userCtrlOn()
        vogo_box_broken = false
      else
      end
      L0_6 = wait
      L0_6()
    end
  end)
end
