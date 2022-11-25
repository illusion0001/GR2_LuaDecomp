dofile("/Game/Event2/Common/EventCommon.lua")
objs = {}
function Initialize()
  local L0_0
  L0_0 = {
    {
      name = "ep994_wom01_01",
      type = "wom01",
      node = "locator2_wom01_01",
      exmots = {}
    },
    {
      name = "ep994_chi01_01",
      type = "chi01",
      node = "locator2_chi01_01",
      exmots = {}
    }
  }
  Fn_setupChara(L0_0)
  table.insert(objs, create_GimmickBg("woodbox_kk_01_01", "woodbox_kk_01", "locator2_box_01"))
  table.insert(objs, create_GimmickBg("barrel_kk_01_01", "barrel_kk_01", "locator2_barrel_01", true))
end
function Ingame()
  Fn_missionStart()
end
function Finalize()
  local L0_1, L1_2
end
function create_GimmickBg(A0_3, A1_4, A2_5, A3_6)
  local L4_7, L5_8, L6_9, L7_10
  L4_7 = createGameObject2
  L5_8 = "GimmickBg"
  L4_7 = L4_7(L5_8)
  L6_9 = L4_7
  L5_8 = L4_7.setName
  L7_10 = A0_3
  L5_8(L6_9, L7_10)
  L6_9 = L4_7
  L5_8 = L4_7.setDrawModelName
  L7_10 = A1_4
  L5_8(L6_9, L7_10)
  L6_9 = L4_7
  L5_8 = L4_7.setCollisionName
  L7_10 = A1_4
  L5_8(L6_9, L7_10)
  L6_9 = L4_7
  L5_8 = L4_7.setAttributeName
  L7_10 = A1_4
  L5_8(L6_9, L7_10)
  L6_9 = L4_7
  L5_8 = L4_7.try_init
  L5_8(L6_9)
  L6_9 = L4_7
  L5_8 = L4_7.waitForReady
  L5_8(L6_9)
  L6_9 = L4_7
  L5_8 = L4_7.try_start
  L5_8(L6_9)
  L5_8 = findGameObject2
  L6_9 = "Node"
  L7_10 = A2_5
  L5_8 = L5_8(L6_9, L7_10)
  L7_10 = L5_8
  L6_9 = L5_8.getPos
  L6_9 = L6_9(L7_10)
  L7_10 = L5_8.getRot
  L7_10 = L7_10(L5_8)
  L4_7:setPos(L6_9)
  L4_7:setRot(L7_10)
  L4_7:setForceMove()
  if A3_6 ~= nil then
    L4_7:setIgnoreGrab(A3_6)
  end
  return L4_7
end
function restore_GimmickBg()
  for _FORV_3_, _FORV_4_ in ipairs(objs) do
    if _FORV_4_:isBroken() then
      _FORV_4_:requestRestore()
    end
  end
end
g_customDebugMenu = {
  {
    name = "GimmickBg Restore",
    callback = function()
      restore_GimmickBg()
    end
  }
}
