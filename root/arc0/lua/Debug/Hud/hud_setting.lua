import("math")
import("common")
import("Debug")
import("HUD")
import("Font")
import("Ugc")
import("Net")
import("GameDatabase")
function test_hud_setting_net_service_exit()
  Ugc:serviceStop()
end
function test_hud_setting_net_service()
  Net:checkParentalControl()
  while Net:updateParentalControl() ~= 0 do
    wait()
  end
  Net:checkAvailability()
  while Net:checkAvailabilityUpdate() ~= 0 do
    wait()
  end
  Net:availabilityDialogOpen()
  while Net:checkAvailabilityUpdate() ~= 0 do
    wait()
  end
  Ugc:serviceStart()
  setExitCallback(test_hud_setting_net_service_exit)
  Ugc:downloadOtherDeathGhost()
end
function test_hud_setting()
  GameDatabase:set(ggd.Savedata__EventManageFlags__CurrentMissionType, "free")
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Talisman, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Powerup, true)
  GameDatabase:set(ggd.Savedata__Menu__MenuTutorial__Map, true)
  for _FORV_4_ = 1, #{
    "ep02",
    "ep03",
    "ep04",
    "ep13",
    "sm01",
    "sm28",
    "sm48"
  } do
    GameDatabase:set(ggd["Savedata__EventFinishedFlags__" .. ({
      "ep02",
      "ep03",
      "ep04",
      "ep13",
      "sm01",
      "sm28",
      "sm48"
    })[_FORV_4_]], 1)
  end
  for _FORV_4_ = 1, #{
    "cm01",
    "cm02",
    "cm03",
    "cm04",
    "cm05",
    "cm06",
    "cm07",
    "cm08",
    "cm09",
    "cm10",
    "cm11",
    "cm12",
    "cm13",
    "cm14",
    "cm15",
    "cm16",
    "cm17",
    "cm18",
    "cm19",
    "cm20"
  } do
    GameDatabase:set(ggd["Savedata__Menu__EventStateFlags__" .. ({
      "cm01",
      "cm02",
      "cm03",
      "cm04",
      "cm05",
      "cm06",
      "cm07",
      "cm08",
      "cm09",
      "cm10",
      "cm11",
      "cm12",
      "cm13",
      "cm14",
      "cm15",
      "cm16",
      "cm17",
      "cm18",
      "cm19",
      "cm20"
    })[_FORV_4_]], 1)
  end
  for _FORV_4_ = 1, #{
    "Combat",
    "Dodge",
    "GravityKick",
    "Grab",
    "Slider",
    "SpecialAtk"
  } do
    GameDatabase:set(ggd["Savedata__Player__LevelCap__" .. ({
      "Combat",
      "Dodge",
      "GravityKick",
      "Grab",
      "Slider",
      "SpecialAtk"
    })[_FORV_4_]], 20)
  end
  _FOR_:set(ggd.Savedata__PlayerAbility__Style__Jupiter, true)
  GameDatabase:set(ggd.Savedata__PlayerAbility__Style__Lunar, true)
  for _FORV_3_ = 1, 10 do
    Debug:setSwitch({
      "Development",
      "UI",
      "News",
      "Add"
    })
  end
  _FOR_:dlcNewsCheck()
  HUD:setUserControlLock(false)
  HUD:enablePhotoMode(true)
  HUD:enableGesture(true)
  test_hud_setting_net_service()
end
