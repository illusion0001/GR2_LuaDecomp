local L1_1
function L0_0()
  print(" [ sys com ] : " .. g_own:getName() .. " : auto save skip")
  GameDatabase:set(ggd.GlobalSystemFlags__AutoSaveSkip, true)
end
_autoSaveSkip = L0_0
function L0_0()
  print(" [ sys com ] : " .. g_own:getName() .. " : auto save req + 1 : " .. GameDatabase:get(ggd.GlobalSystemFlags__AutoSave))
  GameDatabase:set(ggd.GlobalSystemFlags__AutoSave, GameDatabase:get(ggd.GlobalSystemFlags__AutoSave) + 1)
end
_autoSaveReq = L0_0
function L0_0()
  local L0_2
  L0_2 = GameDatabase
  L0_2 = L0_2.set
  L0_2(L0_2, ggd.GlobalSystemFlags__ActionDialogActive, false)
  L0_2 = HUD
  L0_2 = L0_2.navisSetMaskFromDemo
  L0_2(L0_2, false)
  L0_2 = HUD
  L0_2 = L0_2.info_reset
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.captionEnd
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.missionEnd
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.setMainMenuInfoParam
  L0_2(L0_2, nil, nil)
  L0_2 = HUD
  L0_2 = L0_2.setMainMenuObjectParam
  L0_2(L0_2, nil)
  L0_2 = HUD
  L0_2 = L0_2.inGamePreviewExit
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.setTextCommonCtrlGuide
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.actionDialogCancel
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.countDownEnd
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.placeNameExit
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.timerStop
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.timerIsVisible
  L0_2 = L0_2(L0_2)
  if L0_2 then
    L0_2 = HUD
    L0_2 = L0_2.timerSetVisible
    L0_2(L0_2, false, false)
  end
  L0_2 = HUD
  L0_2 = L0_2.counter99_99IsVisible
  L0_2 = L0_2(L0_2)
  if L0_2 then
    L0_2 = HUD
    L0_2 = L0_2.counter99_99SetVisible
    L0_2(L0_2, false, false)
  end
  L0_2 = HUD
  L0_2 = L0_2.counter999IsVisible
  L0_2 = L0_2(L0_2, 0)
  if L0_2 then
    L0_2 = HUD
    L0_2 = L0_2.counter999SetVisible
    L0_2(L0_2, false, false, 0)
  end
  L0_2 = HUD
  L0_2 = L0_2.counter999IsVisible
  L0_2 = L0_2(L0_2, 1)
  if L0_2 then
    L0_2 = HUD
    L0_2 = L0_2.counter999SetVisible
    L0_2(L0_2, false, false, 1)
  end
  L0_2 = HUD
  L0_2 = L0_2.miniGaugeIsVisible
  L0_2 = L0_2(L0_2)
  if L0_2 then
    L0_2 = HUD
    L0_2 = L0_2.miniGaugeSetVisible
    L0_2(L0_2, false, false)
  end
  L0_2 = HUD
  L0_2 = L0_2.cameraCommonCounter99_99IsVisible
  L0_2 = L0_2(L0_2)
  if L0_2 then
    L0_2 = HUD
    L0_2 = L0_2.cameraCommonCounter99_99SetVisible
    L0_2(L0_2, false, false)
  end
  L0_2 = HUD
  L0_2 = L0_2.scorePopDelete
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.naviSetActivate
  L0_2(L0_2, false, false)
  L0_2 = HUD
  L0_2 = L0_2.naviSetTarget
  L0_2(L0_2)
  L0_2 = HUD
  L0_2 = L0_2.mnaviFind
  L0_2 = L0_2(L0_2)
  while L0_2:isValid() do
    L0_2:del()
    L0_2 = L0_2:findNext()
  end
end
_resetHUD = L0_0
