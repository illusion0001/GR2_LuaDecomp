local L1_1
L0_0 = import
L1_1 = "math"
L0_0(L1_1)
L0_0 = import
L1_1 = "Debug"
L0_0(L1_1)
L0_0 = import
L1_1 = "HUD"
L0_0(L1_1)
L0_0 = import
L1_1 = "Font"
L0_0(L1_1)
L0_0 = import
L1_1 = "Player"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Action/debug_stage.lua"
L0_0(L1_1)
L0_0 = dofile
L1_1 = "/Debug/Hud/debugCommon.lua"
L0_0(L1_1)
L0_0 = {}
function L1_1(A0_2)
  return A0_2.cursor - 1
end
L0_0.getCursor = L1_1
L1_1 = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "mode",
    data_label = "mode",
    get_data = L0_0.getCursor,
    "save_photo",
    "system_photo",
    "avatar(ps4_only)"
  }
}
L0_0.root = L1_1
L1_1 = L0_0.root
function L1_1.Execute(A0_3)
  wait(2)
  HUD:testPhotoExit()
  wait(3)
  TextParam = {}
  dbgCommon.get_param(TextParam, L0_0.root)
  HUD:testPhotoCreate(TextParam)
end
function L1_1()
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
  dbgCommon.TreeExecute(L0_0.root)
end
test_photo = L1_1
function L1_1()
  invokeTask(function()
    local L0_4
    while true do
      L0_4 = HUD
      L0_4 = L0_4.isPhotoMode
      L0_4 = L0_4(L0_4)
      if L0_4 then
        L0_4 = HUD
        L0_4 = L0_4.getPhotoZoomRate
        L0_4 = L0_4(L0_4)
        Debug:screenPrint(100, 100, string.format("%-12s :<%s>", "zoom", L0_4))
      end
      L0_4 = wait
      L0_4()
    end
  end)
end
test_photo_camera = L1_1
L1_1 = {}
function L1_1.enter(A0_5)
  initializeAllGameObjects()
  waitForReadyAllGameObjects()
  startAllGameObjects()
end
function callFilmPhoto()
  print("callFilmPhoto")
  HUD:photoUploadTreasure("root_area_name", "area_name", ({
    "locator2_po_a_01_tb_01",
    "locator2_po_a_01_tb_02",
    "locator2_po_a_01_tb_03",
    "locator2_po_a_01_tb_04",
    "locator2_po_a_02_tb_01",
    "locator2_po_a_02_tb_02",
    "locator2_po_a_02_tb_03",
    "locator2_po_a_04_tb_01"
  })[RandI(1, #{
    "locator2_po_a_01_tb_01",
    "locator2_po_a_01_tb_02",
    "locator2_po_a_01_tb_03",
    "locator2_po_a_01_tb_04",
    "locator2_po_a_02_tb_01",
    "locator2_po_a_02_tb_02",
    "locator2_po_a_02_tb_03",
    "locator2_po_a_04_tb_01"
  })])
  HUD:captionBegin("Photo_Uploading")
  L0_0.upload_step = L0_0.upload_step + 1
end
function test_photo_upload_init()
  Debug:setSwitch({
    "Development",
    "Console",
    "Script"
  }, true)
  L1_1:enter()
  test_photo_upload()
end
function test_photo_upload()
  local L0_6
  L0_0.upload_step = 0
  L0_6 = nil
  invokeTask(function()
    while true do
      if L0_0.upload_step == 0 then
        if HUD:isPhotoMode() then
          L0_0.upload_step = L0_0.upload_step + 1
          HUD:setFilmedPhotoCallback("callFilmPhoto")
        end
      elseif L0_0.upload_step == 1 then
        if HUD:isPhotoMode() == false then
          L0_0.upload_step = L0_0.upload_step - 1
        end
      elseif L0_0.upload_step == 2 then
        L0_6 = HUD:getPhotoUploadResult()
        if L0_6 == HUD.kPhotoUpload_Success then
          HUD:captionBegin("Photo_UploadSuccess", 3)
          L0_0.upload_step = 0
        elseif L0_6 == HUD.kPhotoUpload_Failed then
          HUD:captionBegin("Photo_UploadFailed", 3)
          L0_0.upload_step = 0
        end
      end
      wait()
    end
  end)
end
