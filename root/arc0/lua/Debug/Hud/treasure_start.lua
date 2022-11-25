L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = dofile
L0_0("/Debug/Hud/debugCommon.lua")
L0_0 = {}
function L0_0.getCursor(A0_1)
  local L1_2
  L1_2 = A0_1.cursor
  return L1_2
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "onlineId",
    data_label = "onlineId",
    "q-c4a58f9f-JP-ja",
    "q-56f4249e-JP-ja",
    "hiropong"
  },
  {
    type = dbgCommon.kTypeBoolean,
    data_label = "is_friend",
    data_name = "is_friend",
    data = true
  },
  {
    type = dbgCommon.kTypeInteger,
    data_label = "limit_hour",
    data_name = "limit_hour",
    step = 1,
    min = 0,
    max = 999,
    num = 12
  },
  {
    type = dbgCommon.kTypeInteger,
    data_label = "limit_minute",
    data_name = "limit_minute",
    step = 1,
    min = 0,
    max = 59,
    num = 1
  },
  {
    type = dbgCommon.kTypeInteger,
    data_label = "limit_second",
    data_name = "limit_second",
    step = 1,
    min = 0,
    max = 59,
    num = 57
  }
}
function L0_0.root.Execute(A0_3, A1_4)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_3)
  HUD:treasureStartOpen(1, TextParam)
end
function test_treasure_start()
  Debug:setSwitch({"Display", "Debug Draw"}, true)
  Debug:setSwitch({
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  Debug:setSwitch({
    "Display",
    "File Asset Status"
  }, false)
  HUD:enablePhotoMode(true)
  dbgCommon.TreeExecute(L0_0.root)
end
function test_treasure_send()
  local L0_5
  L0_5 = HUD
  L0_5 = L0_5.enablePhotoMode
  L0_5(L0_5, true)
  L0_5 = Debug
  L0_5 = L0_5.setSwitch
  L0_5(L0_5, {
    "Development",
    "Console",
    "Script"
  }, true)
  L0_5 = Debug
  L0_5 = L0_5.setSwitch
  L0_5(L0_5, {"Display", "Debug Draw"}, true)
  L0_5 = Debug
  L0_5 = L0_5.setSwitch
  L0_5(L0_5, {
    "Display",
    "DebugDrawGroup",
    "Default"
  }, true)
  L0_5 = Debug
  L0_5 = L0_5.setSwitch
  L0_5(L0_5, {
    "Display",
    "File Asset Status"
  }, false)
  function L0_5()
    invokeTask(function()
      local L0_6, L1_7, L2_8
      L0_6 = HUD
      L1_7 = L0_6
      L0_6 = L0_6.setPhotoMode
      L2_8 = false
      L0_6(L1_7, L2_8)
      L0_6 = 1
      L1_7 = "po_a_root"
      L2_8 = "locator2_po_a_01_tb_02"
      HUD:treasureSendOpen(1, L1_7, L2_8)
      wait()
      if HUD:treasureSendSelected() == HUD.kTreasureSendButton_Send then
        print("SelectButton:Send")
      elseif HUD:treasureSendSelected() == HUD.kTreasureSendButton_Retry then
        print("SelectButton:Retry")
      end
      wait()
    end)
  end
  HUD:setFilmedPhotoCallback(L0_5)
  HUD:captionBegin("\227\131\149\227\130\169\227\131\136\227\131\162\227\131\188\227\131\137\227\129\167\230\146\174\229\189\177\227\129\153\227\130\139\227\129\168\233\128\129\228\191\161\231\162\186\232\170\141\231\148\187\233\157\162\227\129\140\231\171\139\227\129\161\228\184\138\227\129\140_\227\130\138\227\129\190\227\129\153", 5)
end
function test_photo_review()
  HUD:enablePhotoMode(true)
  invokeTask(function()
    local L0_9
    while true do
      L0_9 = HUD
      L0_9 = L0_9.getPhotoGhostInfo
      L0_9 = L0_9(L0_9, 1, HUD.kPhotoReviewSlot_Manual)
      while L0_9 == nil do
        L0_9 = HUD:getPhotoGhostInfo(1, HUD.kPhotoReviewSlot_Manual)
        wait()
      end
      if findGameObject2("Area", L0_9.area) ~= nil then
        ght_obj = createGameObject2("GhostPuppet")
        ght_obj:setName(L0_9.onlineId)
        ght_obj:setAssetName("ghost01")
        ght_obj:setGhostType(GhostPuppet.kGhostType_RandomAnim)
        ght_obj:try_init()
        ght_obj:waitForReady()
        ght_obj:try_start()
        findGameObject2("Area", L0_9.area):appendChild(ght_obj)
        ght_obj:getPuppet():setTransform(L0_9.pos, L0_9.rot)
        ght_obj:getPuppet():setForceMove()
        random_anim = {
          {anim_name = "stay"},
          {
            anim_name = "stay_fighting"
          },
          {anim_name = ""},
          {}
        }
        ght_obj:addRandomAnimNameTbl(random_anim)
        ght_obj:play()
        if L0_9.pose == HUD.kPhotoPose_Stand then
          print("Stand")
        elseif L0_9.pose == HUD.kPhotoPose_Sit then
          print("Sit")
        elseif L0_9.pose == HUD.kPhotoPose_Float then
          print("Float")
        end
        wait(15)
        wait(60)
        HUD:photoReviewOpen(1, HUD.kPhotoReviewSlot_Manual)
        if HUD:photoReviewSelected() == HUD.kPhotoReviewButton_Good then
          print("select Good")
        elseif HUD:photoReviewSelected() == HUD.kPhotoReviewButton_Bad then
          print("select Bad")
        else
          print("select is none")
        end
        ght_obj:try_term()
        ght_obj = nil
      else
        print("area " .. L0_9.area .. " is none")
      end
      wait(30)
    end
  end)
end
function test_photo_save_collect()
  local L0_10, L1_11
  L0_10 = HUD
  L1_11 = L0_10
  L0_10 = L0_10.enablePhotoMode
  L0_10(L1_11, true)
  L0_10 = {}
  L1_11 = {
    {
      type = dbgCommon.kTypeInteger,
      data_label = "category",
      data_name = "category",
      step = 1,
      min = 0,
      max = 7,
      num = 1
    },
    {
      type = dbgCommon.kTypeInteger,
      data_label = "slot",
      data_name = "slot",
      step = 1,
      min = 0,
      max = 11,
      num = 1
    }
  }
  L0_10.root = L1_11
  L1_11 = dbgCommon
  L1_11 = L1_11.TreeExecute
  L1_11(L0_10.root)
  function L1_11()
    TextParam = {}
    dbgCommon.get_param(TextParam, L0_10.root)
    HUD:collectSaveOpen(TextParam.category, TextParam.slot)
  end
  HUD:menuSetCallback(HUD.kCallback_ShutterCollection, L1_11)
end
