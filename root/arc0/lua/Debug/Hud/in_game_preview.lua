L0_0 = import
L0_0("math")
L0_0 = import
L0_0("Debug")
L0_0 = import
L0_0("HUD")
L0_0 = import
L0_0("Font")
L0_0 = {}
function L0_0.popup(A0_1)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, L0_0.root)
  L0_0.root.texture_update(TextParam.TextureName)
  HUD:inGamePreviewPopup(TextParam.Timer)
end
function L0_0.getCursor(A0_2)
  return A0_2.cursor - 1
end
L0_0.root = {
  {
    type = dbgCommon.kTypeTable,
    data_name = "TextureName",
    data_label = "TextureName",
    "ingame_pre_01",
    "ingame_pre_02",
    "ingame_pre_03",
    "ingame_pre_04",
    "20150223_1657_04870",
    "outTemporaryFilename"
  },
  {
    type = dbgCommon.kTypeTable,
    data_name = "Type",
    data_label = "Type",
    get_data = L0_0.getCursor,
    "none",
    "Treasure",
    "Mission"
  },
  {
    type = dbgCommon.kTypeNode,
    data_label = "PopUp",
    {
      type = dbgCommon.kTypeFunction,
      data = L0_0.popup,
      data_label = "PopUp"
    },
    {
      type = dbgCommon.kTypeNumber,
      data_name = "Timer",
      data_label = "Timer",
      step = 0.2,
      min = 0,
      max = 20,
      num = 10
    }
  }
}
function L0_0.root.texture_update(A0_3, A1_4)
  if L0_0.current_texture ~= A0_3 then
    HUD:inGamePreviewCreate(A0_3, A1_4.Type)
    while HUD:inGamePreviewIsLoading() do
      wait()
    end
    L0_0.current_texture = A0_3
  end
end
function L0_0.root.Execute(A0_5, A1_6)
  wait(2)
  TextParam = {}
  dbgCommon.get_param(TextParam, A0_5)
  A0_5.texture_update(TextParam.TextureName, TextParam)
  if HUD:inGamePreviewIsIdle() then
    HUD:inGamePreviewFadeOut()
  else
    HUD:inGamePreviewFadeIn()
  end
end
function test_ingame_preview()
  dbgCommon.TreeExecute(L0_0.root)
end
