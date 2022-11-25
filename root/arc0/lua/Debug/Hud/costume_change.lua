import("math")
import("Debug")
import("HUD")
import("Font")
import("Player")
import("GameDatabase")
dofile("/Debug/Hud/debugCommon.lua")
_player_costume = "None"
function _setCostume(A0_0)
  Player:setCostume(A0_0)
  _player_costume = A0_0
  GameDatabase:set(ggd.Savedata__Player__Costume, _player_costume)
end
function test_costume_change()
  local L0_1
  L0_1 = HUD
  L0_1 = L0_1.enablePhotoMode
  L0_1(L0_1, true)
  function L0_1(A0_2)
    invokeSystemTask(function()
      _setCostume(A0_2)
      wait()
      if not Player:getPuppet():isLoading() then
        wait()
      end
      HUD:costumeChangeEnd()
    end)
  end
  HUD:menuSetCallback(HUD.kCallback_CostumeChange, L0_1)
  for _FORV_5_ = 1, #{
    "item_02",
    "item_03",
    "item_04",
    "item_05",
    "item_06",
    "item_07",
    "item_08",
    "item_09",
    "item_10",
    "item_11",
    "item_12"
  } do
    if RandI(1, 4) == 1 then
      GameDatabase:set(ggd["Savedata__CostumeUnlock__" .. ({
        "item_02",
        "item_03",
        "item_04",
        "item_05",
        "item_06",
        "item_07",
        "item_08",
        "item_09",
        "item_10",
        "item_11",
        "item_12"
      })[_FORV_5_]], false)
    else
      GameDatabase:set(ggd["Savedata__CostumeUnlock__" .. ({
        "item_02",
        "item_03",
        "item_04",
        "item_05",
        "item_06",
        "item_07",
        "item_08",
        "item_09",
        "item_10",
        "item_11",
        "item_12"
      })[_FORV_5_]], true)
    end
  end
end
