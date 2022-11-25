dofile("/Game/Event2/Common/EventCommon.lua")
dofile("/Game/Event2/Common/CommonAll.lua")
function Initialize()
  local L0_0, L1_1
end
function Ingame()
  invokeTask(function()
    function sim_create(A0_2, A1_3, A2_4, A3_5)
      local L4_6, L5_7
      L4_6 = findGameObject2
      L5_7 = "Node"
      L4_6 = L4_6(L5_7, A0_2)
      if L4_6 ~= nil then
        L5_7 = createGameObject2
        L5_7 = L5_7("SimpleModel")
        L5_7:setModelName(A1_3)
        L5_7:setModelScale(A3_5)
        L5_7:setName(A0_2)
        L5_7:setWorldPos(A2_4)
        L5_7:try_init()
        L5_7:waitForReady()
        L5_7:try_start()
        L4_6:appendChild(L5_7)
        L5_7:setActive(true)
      end
    end
    sim_create("locator2_gp_m_bk_testbk", "gp_m_bk_testbk", Vector(0, 0, 0), 1)
    sim_create("locator2_hand_test", "nvpal01_base", Vector(0, 0, 0), 3)
  end)
  Fn_missionStart()
end
function Finalize()
  local L0_8, L1_9
end
